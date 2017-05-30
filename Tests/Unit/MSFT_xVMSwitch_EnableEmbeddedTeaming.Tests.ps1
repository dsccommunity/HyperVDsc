[CmdletBinding()]
Param (

)

if (!$PSScriptRoot) {
$PSScriptRoot = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path)
}

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version latest

$RepoRoot = (Resolve-Path $PSScriptRoot\..\..).Path

$ModuleName = 'MSFT_xVMSwitch'
Import-Module (Join-Path $RepoRoot "DSCResources\$ModuleName\$ModuleName.psm1") -Force;

Describe 'xVMSwitch' {
    InModuleScope $ModuleName {
        # A helper function to mock a VMSwitch
        function New-MockedVMSwitch {
            Param (
                [Parameter(Mandatory = $true)]
                [string]$Name,
                [Parameter(Mandatory = $true)]
                [ValidateSet('Default', 'Weight', 'Absolute', 'None', 'NA')]
                [string]$BandwidthReservationMode,
                [bool]$AllowManagementOS = $false
            )

            $mockedVMSwitch = @{
                Name                           = $Name
                SwitchType                     = 'External'
                AllowManagementOS              = $AllowManagementOS
                NetAdapterInterfaceDescription = 'Microsoft Network Adapter Multiplexor Driver'
            }

            if ($BandwidthReservationMode -ne 'NA') {
                $mockedVMSwitch['BandwidthReservationMode'] = $BandwidthReservationMode
            }

            return [PsObject]$mockedVMSwitch
        }

        # Create an empty function to be able to mock the missing Hyper-V cmdlet
        function Get-VMSwitch {
            [CmdletBinding()]
            Param(
                [string]$Name,
                [string]$SwitchType
            )
        }

        # Create an empty function to be able to mock the missing Hyper-V cmdlet
        function New-VMSwitch {
            [CmdletBinding()]
            Param(
                [string]$Name,
                [string]$MinimumBandwidthMode,
                [string[]]$NetAdapterName,
                [bool]$EnableEmbeddedTeaming,
                [bool]$AllowManagementOS = $false
            )
        }

        # Create an empty function to be able to mock the missing Hyper-V cmdlet
        function Remove-VMSwitch {
        
        }

        # Create an empty function to be able to mock the missing Hyper-V cmdlet
        function Set-VMSwitch {
            [CmdletBinding()]
            Param (
                [bool]$AllowManagementOS
            )
        }



        # Mocks Get-VMSwitch and will return $global:mockedVMSwitch which is
        # a variable that is created during most It statements to mock a VMSwitch
        Mock -CommandName Get-VMSwitch -MockWith {
            Param (
                [string]$ErrorAction
            )

            if ($ErrorAction -eq 'Stop' -and $global:mockedVMSwitch -eq $null) {
                throw [System.Management.Automation.ActionPreferenceStopException]'No switch can be found by given criteria.'
            }

            return $global:mockedVMSwitch
        }

        # Mocks New-VMSwitch and will assign a mocked switch to $global:mockedVMSwitch. This returns $global:mockedVMSwitch
        # which is a variable that is created during most It statements to mock a VMSwitch
        Mock -CommandName New-VMSwitch -MockWith {
            Param (
                [string]$Name,
                [string]$NetAdapterName,
                [string]$MinimumBandwidthMode = 'NA',
                [bool]$AllowManagementOS
            )
            
            $global:mockedVMSwitch = New-MockedVMSwitch -Name $Name -BandwidthReservationMode $MinimumBandwidthMode -AllowManagementOS $AllowManagementOS
            return $global:mockedVMSwitch
        }

        # Mocks Set-VMSwitch and will modify $global:mockedVMSwitch which is
        # a variable that is created during most It statements to mock a VMSwitch
        Mock -CommandName Set-VMSwitch -MockWith {
            Param (
                [bool]$AllowManagementOS
            )
            
            if ($AllowManagementOS) {
                $global:mockedVMSwitch['AllowManagementOS'] = $AllowManagementOS
            }
        }

        # Mocks Remove-VMSwitch and will remove the variable $global:mockedVMSwitch which is
        # a variable that is created during most It statements to mock a VMSwitch
        Mock -CommandName Remove-VMSwitch -MockWith {
            $global:mockedVMSwitch = $null
        }

        # Mocks Get-NetAdapter which returns a simplified network adapter
        Mock -CommandName Get-NetAdapter -MockWith {
            return @(
                [PSCustomObject]@{
                    Name                 = 'NIC1'
                    InterfaceDescription = 'Microsoft Network Adapter Multiplexor Driver #1'
                }
                [PSCustomObject]@{
                    Name                 = 'NIC2'
                    InterfaceDescription = 'Microsoft Network Adapter Multiplexor Driver #2'
                }
            )
        }

        # Mocks "Get-Module -Name Hyper-V" so that the DSC resource thinks the Hyper-V module is on the test system
        Mock -CommandName Get-Module -ParameterFilter { ($Name -eq 'Hyper-V') -and ($ListAvailable -eq $true) } -MockWith {
            return $true
        }

        # Mock "Get-WmiObject -Class -eq 'Win32_OperatingSystem'" to output a valid Windows version that supports BandwidthReservationMode
        Mock -CommandName Get-WmiObject -ParameterFilter { $Class -eq 'Win32_OperatingSystem' } -MockWith {
            return [PSCustomObject]@{
                Version = '6.3.9600'
            }
        }

        Context "A virtual switch with embedded teaming does not exist but should" {
            $global:mockedVMSwitch = $null

            $testParams = @{
                Name = "TestSwitch"
                Type = "External"
                NetAdapterName = @("NIC1", "NIC2")
                AllowManagementOS = $true
                EnableEmbeddedTeaming = $true
                BandwidthReservationMode = "NA"
                Ensure = "Present"
            }

            it "Should return absent in the get method" {
                (Get-TargetResource -Name $testParams.Name -Type $testParams.Type).Ensure | Should Be "Absent"
            }

            it "Should return false in the test method" {
                Test-TargetResource @testParams | Should Be $false
            }

            it "Should run the set method without exceptions" {
                Set-TargetResource @testParams
            }
        }

        Context "A virtual switch with embedded teaming exists and should" {
            $global:mockedVMSwitch = @{
                Name                            = "TestSwitch"
                SwitchType                      = "External"
                AllowManagementOS               = $true
                EmbeddedTeamingEnabled          = $true
                Id                              = [Guid]::NewGuid()
                NetAdapterInterfaceDescriptions = @("Microsoft Network Adapter Multiplexor Driver #1", "Microsoft Network Adapter Multiplexor Driver #2")
            }

            $testParams = @{
                Name = "TestSwitch"
                Type = "External"
                NetAdapterName = @("NIC1", "NIC2")
                AllowManagementOS = $true
                EnableEmbeddedTeaming = $true
                BandwidthReservationMode = "NA"
                Ensure = "Present"
            }

            it "Should return present in the get method" {
                (Get-TargetResource -Name $testParams.Name -Type $testParams.Type).Ensure | Should Be "Present"
            }

            it "Should return true in the test method" {
                Test-TargetResource @testParams | Should Be $true
            }
        }

        Context "A virtual switch with embedded teaming exists but does not refer to the correct adapters" {
            $global:mockedVMSwitch = @{
                Name                            = "TestSwitch"
                SwitchType                      = "External"
                AllowManagementOS               = $true
                EmbeddedTeamingEnabled          = $true
                Id                              = [Guid]::NewGuid()
                NetAdapterInterfaceDescriptions = @("Wrong adapter", "Microsoft Network Adapter Multiplexor Driver #2")
            }

            Mock -CommandName Get-NetAdapter -MockWith {
                return @(
                    [PSCustomObject]@{
                        Name                 = 'WrongNic'
                        InterfaceDescription = 'Wrong adapter'
                    }
                    [PSCustomObject]@{
                        Name                 = 'NIC2'
                        InterfaceDescription = 'Microsoft Network Adapter Multiplexor Driver #2'
                    }
                )
            }

            $testParams = @{
                Name = "TestSwitch"
                Type = "External"
                NetAdapterName = @("NIC1", "NIC2")
                AllowManagementOS = $true
                EnableEmbeddedTeaming = $true
                BandwidthReservationMode = "NA"
                Ensure = "Present"
            }

            it "Should return present in the get method" {
                (Get-TargetResource -Name $testParams.Name -Type $testParams.Type).Ensure | Should Be "Present"
            }

            it "Should return false in the test method" {
                Test-TargetResource @testParams | Should Be $false
            }

            it "Should run the set method without exceptions" {
                Set-TargetResource @testParams
            }
        }

        Context "A virtual switch without embedded teaming exists but should use embedded teaming" {
            $global:mockedVMSwitch = @{
                Name                           = "TestSwitch"
                SwitchType                     = "External"
                AllowManagementOS              = $true
                EmbeddedTeamingEnabled         = $false
                Id                             = [Guid]::NewGuid()
                NetAdapterInterfaceDescription = "Microsoft Network Adapter Multiplexor Driver #1"
            }

            $testParams = @{
                Name = "TestSwitch"
                Type = "External"
                NetAdapterName = @("NIC1", "NIC2")
                AllowManagementOS = $true
                EnableEmbeddedTeaming = $true
                BandwidthReservationMode = "NA"
                Ensure = "Present"
            }

            it "Should return present in the get method" {
                (Get-TargetResource -Name $testParams.Name -Type $testParams.Type).Ensure | Should Be "Present"
            }

            it "Should return false in the test method" {
                Test-TargetResource @testParams | Should Be $false
            }

            it "Should run the set method without exceptions" {
                Set-TargetResource @testParams
            }
        }

        Context "A virtual switch with embedded teaming exists but shouldn't" {
            $global:mockedVMSwitch = @{
                Name                            = "TestSwitch"
                SwitchType                      = "External"
                AllowManagementOS               = $true
                EmbeddedTeamingEnabled          = $true
                Id                              = [Guid]::NewGuid()
                NetAdapterInterfaceDescriptions = @("Microsoft Network Adapter Multiplexor Driver #1", "Microsoft Network Adapter Multiplexor Driver #2")
            }

            $testParams = @{
                Name = "TestSwitch"
                Type = "Internal"
                Ensure = "Absent"
            }

            it "Should return present in the get method" {
                (Get-TargetResource -Name $testParams.Name -Type $testParams.Type).Ensure | Should Be "Present"
            }

            it "Should return false in the test method" {
                Test-TargetResource @testParams | Should Be $false
            }

            it "Should run the set method without exceptions" {
                Set-TargetResource @testParams
            }
        }

        Context "A virtual switch with embedded teaming does not exist and shouldn't" {
            $global:mockedVMSwitch = $null

            $testParams = @{
                Name = "TestSwitch"
                Type = "Internal"
                Ensure = "Absent"
            }

            it "Should return absent in the get method" {
                (Get-TargetResource -Name $testParams.Name -Type $testParams.Type).Ensure | Should Be "Absent"
            }

            it "Should return true in the test method" {
                Test-TargetResource @testParams | Should Be $true
            }
        }
    }
}