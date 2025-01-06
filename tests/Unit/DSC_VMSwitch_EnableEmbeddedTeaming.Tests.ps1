$script:dscModuleName = 'HyperVDsc'
$script:dscResourceName = 'DSC_VMSwitch'

function Invoke-TestSetup
{
    try
    {
        Import-Module -Name DscResource.Test -Force -ErrorAction 'Stop'
    }
    catch [System.IO.FileNotFoundException]
    {
        throw 'DscResource.Test module dependency not found. Please run ".\build.ps1 -Tasks build" first.'
    }

    $script:testEnvironment = Initialize-TestEnvironment `
        -DSCModuleName $script:dscModuleName `
        -DSCResourceName $script:dscResourceName `
        -ResourceType 'Mof' `
        -TestType 'Unit'

    # Import the stub functions.
    Import-Module -Name "$PSScriptRoot/../TestHelpers/Stubs/Hyper-V.stubs.psm1" -Force
}

function Invoke-TestCleanup
{
    Restore-TestEnvironment -TestEnvironment $script:testEnvironment
}

Invoke-TestSetup

try
{
    InModuleScope $script:dscResourceName {
        # A helper function to mock a VMSwitch
        function New-MockedVMSwitch
        {
            param
            (
                [Parameter(Mandatory = $true)]
                [System.String]
                $Name,

                [Parameter(Mandatory = $true)]
                [ValidateSet('Default', 'Weight', 'Absolute', 'None', 'NA')]
                [System.String]
                $BandwidthReservationMode,

                [Parameter()]
                [ValidateSet('Dynamic','HyperVPort')]
                [System.String]
                $LoadBalancingAlgorithm,

                [Parameter()]
                [System.Boolean]
                $AllowManagementOS = $false
            )

            $mockedVMSwitch = [Microsoft.HyperV.PowerShell.VMSwitch]::CreateTypeInstance()
            $mockedVMSwitch.Name = $Name
            $mockedVMSwitch.SwitchType = 'External'
            $mockedVMSwitch.AllowManagementOS = $AllowManagementOS
            $mockedVMSwitch.NetAdapterInterfaceDescriptions = 'Microsoft Network Adapter Multiplexor Driver'

            if ($BandwidthReservationMode -ne 'NA')
            {
                $mockedVMSwitch.BandwidthReservationMode = $BandwidthReservationMode
            }

            if ($PSBoundParameters.ContainsKey('LoadBalancingAlgorithm'))
            {
                $mockedVMSwitch.LoadBalancingAlgorithm = $LoadBalancingAlgorithm
            }

            return $mockedVMSwitch
        }

        Describe "DSC_VMSwitch" {
            <#
                Mocks Get-VMSwitch and will return $script:mockedVMSwitch which is
                a variable that is created during most It statements to mock a VMSwitch
            #>
            Mock -CommandName Get-VMSwitch -MockWith {
                if ($ErrorAction -eq 'Stop' -and $script:mockedVMSwitch -eq $null)
                {
                    throw [System.Management.Automation.ActionPreferenceStopException]'No switch can be found by given criteria.'
                }

                return $script:mockedVMSwitch
            }

            <#
                Mocks New-VMSwitch and will assign a mocked switch to $script:mockedVMSwitch. This returns $script:mockedVMSwitch
                which is a variable that is created during most It statements to mock a VMSwitch
            #>
            Mock -CommandName New-VMSwitch -MockWith {
                param
                (
                    [Parameter()]
                    [System.String]
                    $Name,

                    [Parameter()]
                    [System.String[]]
                    $NetAdapterName,

                    [Parameter()]
                    [System.String]
                    $MinimumBandwidthMode = 'NA',

                    [Parameter()]
                    [System.Boolean]
                    $EnableEmbeddedTeaming,

                    [Parameter()]
                    [System.Boolean]
                    $AllowManagementOS
                )

                $script:mockedVMSwitch = New-MockedVMSwitch -Name $Name -BandwidthReservationMode $MinimumBandwidthMode -AllowManagementOS $AllowManagementOS
                #is SET is enabled mok a VMSwitchTeam
                if ($EnableEmbeddedTeaming)
                {
                    $script:mockedVMSwitchTeam = [PSCustomObject]@{
                        Name = "TestSwitch"
                        Id = [Guid]::NewGuid()
                        TeamingMode = 'SwitchIndependent'
                        LoadBalancingAlgorithm = 'Dynamic'
                    }
                }
                return $script:mockedVMSwitch
            }

            Mock -CommandName Get-OSVersion -MockWith {
                return @{
                    Major = 10
                }
            }

            <#
                Mocks Remove-VMSwitch and will remove the variable $script:mockedVMSwitch which is
                a variable that is created during most It statements to mock a VMSwitch
            #>
            Mock -CommandName Remove-VMSwitch -MockWith {
                $script:mockedVMSwitch = $null
            }

            <#
                Mocks Get-VMSwitchTeam and will return a moked VMSwitchTeam
            #>
            Mock -CommandName Get-VMSwitchTeam -MockWith {
                return $script:mockedVMSwitchTeam
            }

            Mock -CommandName Set-VMSwitchTeam

            # Mocks Get-NetAdapter which returns a simplified network adapter
            Mock -CommandName Get-NetAdapter -MockWith {
                return @(
                    [PSCustomObject]@{
                        Name = 'NIC1'
                        InterfaceDescription = 'Microsoft Network Adapter Multiplexor Driver #1'
                    }
                    [PSCustomObject]@{
                        Name = 'NIC2'
                        InterfaceDescription = 'Microsoft Network Adapter Multiplexor Driver #2'
                    }
                )
            }

            # Mocks "Get-Module -Name Hyper-V" so that the DSC resource thinks the Hyper-V module is on the test system
            Mock -CommandName Get-Module -ParameterFilter { ($Name -eq 'Hyper-V') -and ($ListAvailable -eq $true) } -MockWith {
                return $true
            }

            Context "A virtual switch with embedded teaming does not exist but should" {
                $script:mockedVMSwitch = $null

                $testParams = @{
                    Name = "TestSwitch"
                    Type = "External"
                    NetAdapterName = @("NIC1", "NIC2")
                    AllowManagementOS = $true
                    EnableEmbeddedTeaming = $true
                    BandwidthReservationMode = "NA"
                    Ensure = "Present"
                }

                It "Should return absent in the get method" {
                    (Get-TargetResource -Name $testParams.Name -Type $testParams.Type).Ensure | Should -Be "Absent"
                }

                It "Should return false in the test method" {
                    Test-TargetResource @testParams | Should -Be $false
                }

                It "Should run the set method without exceptions" {
                    Set-TargetResource @testParams
                    Assert-MockCalled -CommandName "New-VMSwitch" -Times 1
                }
            }

            Context "A virtual switch with embedded teaming exists and should" {
                $mockVMSwitch = [Microsoft.HyperV.PowerShell.VMSwitch]::CreateTypeInstance()
                $mockVMSwitch.Name = 'NewSwitch'
                $mockVMSwitch.SwitchType = 'External'
                $mockVMSwitch.AllowManagementOS = $true
                $mockVMSwitch.EmbeddedTeamingEnabled = $true
                $mockVMSwitch.Id = [Guid]::NewGuid()
                $mockVMSwitch.NetAdapterInterfaceDescriptions = @(
                    'Microsoft Network Adapter Multiplexor Driver #1',
                    'Microsoft Network Adapter Multiplexor Driver #2'
                )

                Mock -CommandName Get-VMSwitch -MockWith {
                    return $mockVMSwitch
                } -ParameterFilter {
                    $Name -eq 'NewSwitch'
                }

                $testParams = @{
                    Name = "NewSwitch"
                    Type = "External"
                    NetAdapterName = @("NIC1", "NIC2")
                    AllowManagementOS = $true
                    EnableEmbeddedTeaming = $true
                    Ensure = "Present"
                }

                It "Should return present in the get method" {
                    (Get-TargetResource -Name $testParams.Name -Type $testParams.Type).Ensure | Should -Be "Present"
                }

                It "Should return true in the test method" {
                    Test-TargetResource @testParams | Should -Be $true
                }
            }

            Context "A virtual switch with embedded teaming exists but does not refer to the correct adapters" {
                $mockVMSwitch = [Microsoft.HyperV.PowerShell.VMSwitch]::CreateTypeInstance()
                $mockVMSwitch.Name = 'NewSwitch'
                $mockVMSwitch.SwitchType = 'External'
                $mockVMSwitch.AllowManagementOS = $true
                $mockVMSwitch.EmbeddedTeamingEnabled = $true
                $mockVMSwitch.Id = [Guid]::NewGuid()
                $mockVMSwitch.NetAdapterInterfaceDescriptions = @(
                    'Wrong adapter',
                    'Microsoft Network Adapter Multiplexor Driver #2'
                )

                Mock -CommandName Get-VMSwitch -MockWith {
                    return $mockVMSwitch
                } -ParameterFilter {
                    $Name -eq 'NewSwitch'
                }

                Mock -CommandName Get-NetAdapter -MockWith {
                    return @(
                        [PSCustomObject]@{
                            Name = 'WrongNic'
                            InterfaceDescription = 'Wrong adapter'
                        }
                        [PSCustomObject]@{
                            Name = 'NIC2'
                            InterfaceDescription = 'Microsoft Network Adapter Multiplexor Driver #2'
                        }
                    )
                }

                $testParams = @{
                    Name = "NewSwitch"
                    Type = "External"
                    NetAdapterName = @("NIC1", "NIC2")
                    AllowManagementOS = $true
                    EnableEmbeddedTeaming = $true
                    Ensure = "Present"
                }

                It "Should return present in the get method" {
                    (Get-TargetResource -Name $testParams.Name -Type $testParams.Type).Ensure | Should -Be "Present"
                }

                It "Should return false in the test method" {
                    Test-TargetResource @testParams | Should -Be $false
                }

                It "Should run the set method without exceptions" {
                    Set-TargetResource @testParams
                    Assert-MockCalled -CommandName "Remove-VMSwitch" -Times 1
                    Assert-MockCalled -CommandName "New-VMSwitch" -Times 1
                }
            }

            Context "A virtual switch with embedded teaming exists but does not use the correct LB algorithm" {
                $mockVMSwitch = [Microsoft.HyperV.PowerShell.VMSwitch]::CreateTypeInstance()
                $mockVMSwitch.Name = 'NewSwitch'
                $mockVMSwitch.SwitchType = 'External'
                $mockVMSwitch.AllowManagementOS = $true
                $mockVMSwitch.EmbeddedTeamingEnabled = $true
                $mockVMSwitch.Id = [Guid]::NewGuid()
                $mockVMSwitch.NetAdapterInterfaceDescriptions = @(
                    'Microsoft Network Adapter Multiplexor Driver #1',
                    'Microsoft Network Adapter Multiplexor Driver #2'
                )

                Mock -CommandName Get-VMSwitch -MockWith {
                    return $mockVMSwitch
                } -ParameterFilter {
                    $Name -eq 'NewSwitch'
                }

                $mockVMSwitchTeam = [Microsoft.HyperV.PowerShell.VMSwitchTeam]::CreateTypeInstance()
                $mockVMSwitchTeam.Name = 'SwitchTeam'
                $mockVMSwitchTeam.LoadBalancingAlgorithm = 'Dynamic'
                $mockVMSwitchTeam.Id = [Guid]::NewGuid()

                Mock -CommandName Get-VMSwitchTeam -MockWith {
                    return $mockVMSwitchTeam
                }

                Mock -CommandName Get-NetAdapter -MockWith {
                    return @(
                        [PSCustomObject]@{
                            Name = 'NIC01'
                            InterfaceDescription = "Microsoft Network Adapter Multiplexor Driver #1"
                        }
                        [PSCustomObject]@{
                            Name = 'NIC2'
                            InterfaceDescription = 'Microsoft Network Adapter Multiplexor Driver #2'
                        }
                    )
                }

                $testParams = @{
                    Name = "NewSwitch"
                    Type = "External"
                    NetAdapterName = @("NIC1", "NIC2")
                    AllowManagementOS = $true
                    EnableEmbeddedTeaming = $true
                    LoadBalancingAlgorithm = 'HyperVPort'
                    Ensure = "Present"
                }

                It "Should return present in the get method" {
                    (Get-TargetResource -Name $testParams.Name -Type $testParams.Type).Ensure | Should -Be "Present"
                }

                It "Should return false in the test method" {
                    Test-TargetResource @testParams | Should -Be $false
                }

                It "Should run the set method without exceptions" {
                    Set-TargetResource @testParams
                    Assert-MockCalled -CommandName "Remove-VMSwitch" -Times 1
                    Assert-MockCalled -CommandName "New-VMSwitch" -Times 1
                }
            }

            Context "A virtual switch without embedded teaming exists but should use embedded teaming" {
                $mockVMSwitch = [Microsoft.HyperV.PowerShell.VMSwitch]::CreateTypeInstance()
                $mockVMSwitch.Name = 'NewSwitch'
                $mockVMSwitch.SwitchType = 'External'
                $mockVMSwitch.AllowManagementOS = $true
                $mockVMSwitch.EmbeddedTeamingEnabled = $false
                $mockVMSwitch.Id = [Guid]::NewGuid()
                $mockVMSwitch.NetAdapterInterfaceDescription = 'Microsoft Network Adapter Multiplexor Driver #1'

                Mock -CommandName Get-VMSwitch -MockWith {
                    return $mockVMSwitch
                } -ParameterFilter {
                    $Name -eq 'NewSwitch'
                }

                $testParams = @{
                    Name = "NewSwitch"
                    Type = "External"
                    NetAdapterName = @("NIC1", "NIC2")
                    AllowManagementOS = $true
                    EnableEmbeddedTeaming = $true
                    BandwidthReservationMode = "NA"
                    Ensure = "Present"
                }

                It "Should return present in the get method" {
                    (Get-TargetResource -Name $testParams.Name -Type $testParams.Type).Ensure | Should -Be "Present"
                }

                It "Should return false in the test method" {
                    Test-TargetResource @testParams | Should -Be $false
                }

                It "Should run the set method without exceptions" {
                    Set-TargetResource @testParams
                    Assert-MockCalled -CommandName "Remove-VMSwitch" -Times 1
                    Assert-MockCalled -CommandName "New-VMSwitch" -Times 1
                }
            }

            Context "A virtual switch with embedded teaming exists but shouldn't" {
                $mockVMSwitch = [Microsoft.HyperV.PowerShell.VMSwitch]::CreateTypeInstance()
                $mockVMSwitch.Name = 'NewSwitch'
                $mockVMSwitch.SwitchType = 'External'
                $mockVMSwitch.AllowManagementOS = $true
                $mockVMSwitch.EmbeddedTeamingEnabled = $true
                $mockVMSwitch.Id = [Guid]::NewGuid()
                $mockVMSwitch.NetAdapterInterfaceDescriptions = @(
                    'Microsoft Network Adapter Multiplexor Driver #1',
                    'Microsoft Network Adapter Multiplexor Driver #2'
                )

                Mock -CommandName Get-VMSwitch -MockWith {
                    return $mockVMSwitch
                } -ParameterFilter {
                    $Name -eq 'NewSwitch'
                }

                $testParams = @{
                    Name = "NewSwitch"
                    Type = "Internal"
                    Ensure = "Absent"
                }

                It "Should return present in the get method" {
                    (Get-TargetResource -Name $testParams.Name -Type $testParams.Type).Ensure | Should -Be "Present"
                }

                It "Should return false in the test method" {
                    Test-TargetResource @testParams | Should -Be $false
                }

                It "Should run the set method without exceptions" {
                    Set-TargetResource @testParams
                    Assert-MockCalled -CommandName "Remove-VMSwitch" -Times 1
                }
            }

            Context "A virtual switch with embedded teaming does not exist and shouldn't" {
                $script:mockedVMSwitch = $null

                $testParams = @{
                    Name = "TestSwitch"
                    Type = "Internal"
                    Ensure = "Absent"
                }

                It "Should return absent in the get method" {
                    (Get-TargetResource -Name $testParams.Name -Type $testParams.Type).Ensure | Should -Be "Absent"
                }

                It "Should return true in the test method" {
                    Test-TargetResource @testParams | Should -Be $true
                }
            }

            Context "A server is not running Server 2016 and attempts to use embedded teaming" {
                $script:mockedVMSwitch = $null

                $testParams = @{
                    Name = "TestSwitch"
                    Type = "External"
                    NetAdapterName = @("NIC1", "NIC2")
                    AllowManagementOS = $true
                    EnableEmbeddedTeaming = $true
                    BandwidthReservationMode = "NA"
                    Ensure = "Present"
                }

                Mock -CommandName Get-OSVersion -MockWith {
                    return [Version]::Parse('6.3.9600')
                }

                It "Should return absent in the get method" {
                    (Get-TargetResource -Name $testParams.Name -Type $testParams.Type).Ensure | Should -Be "Absent"
                }

                It "Should throw an error in the test method" {
                    $errorMessage = $script:localizedData.SETServer2016Error

                    {Test-TargetResource @testParams} | Should -Throw $errorMessage
                }

                It "Should throw an error in the set method" {
                    $errorMessage = $script:localizedData.SETServer2016Error

                    {Set-TargetResource @testParams} | Should -Throw $errorMessage
                }
            }
        }
    }
}
finally
{
    Invoke-TestCleanup
}
