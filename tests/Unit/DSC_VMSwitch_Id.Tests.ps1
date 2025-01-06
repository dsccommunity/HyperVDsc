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
    Import-Module -Name "$PSScriptRoot/Stubs/Hyper-V.stubs.psm1" -Force
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
            param (
                [Parameter(Mandatory = $true)]
                [System.String]
                $Name,

                [Parameter()]
                [ValidateNotNullOrEmpty()]
                [Guid]
                $Id
            )

            $mockedVMSwitch = [Microsoft.HyperV.PowerShell.VMSwitch]::CreateTypeInstance()
            $mockedVMSwitch.Name = $Name
            $mockedVMSwitch.SwitchType = 'External'
            $mockedVMSwitch.AllowManagementOS = $true
            $mockedVMSwitch.EmbeddedTeamingEnabled = $true
            $mockedVMSwitch.BandwidthReservationMode = 'Default'
            $mockedVMSwitch.NetAdapterInterfaceDescriptions = @(
                'Microsoft Network Adapter Multiplexor Driver #1',
                'Microsoft Network Adapter Multiplexor Driver #2'
            )

            if ($PSBoundParameters.ContainsKey('Id'))
            {
                $mockedVMSwitch.Id = $Id
            }
            else
            {
                $mockedVMSwitch.Id = New-Guid
            }

            return $mockedVMSwitch
        }

        # Mocks "Get-Module -Name Hyper-V" so that the DSC resource thinks the Hyper-V module is on the test system
        Mock -CommandName Get-Module -ParameterFilter { ($Name -eq 'Hyper-V') -and ($ListAvailable -eq $true) } -MockWith {
            return $true
        }

        Mock -CommandName Get-VMSwitch -MockWith {
            return $script:MockedVMSwitch
        }

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

        Mock -CommandName Get-VMSwitchTeam -MockWith {
            return [PSCustomObject]@{
                Name                           = 'TestTeam'
                Id                             = New-Guid
                NetAdapterInterfaceDescription = @("Microsoft Network Adapter Multiplexor Driver #1", "Microsoft Network Adapter Multiplexor Driver #2")
                TeamingMode                    = 'SwitchIndependent'
                LoadBalancingAlgorithm         = 'HyperVPort'
            }
        }

        Mock -CommandName Remove-VMSwitch -MockWith {
            $script:mockedVMSwitch = $null
        }

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
                $MinimumBandwidthMode,

                [Parameter()]
                [System.Boolean]
                $AllowManagementOS,

                [Parameter()]
                [System.String]
                $SwitchType,

                [Parameter()]
                [System.Boolean]
                $EnableEmbeddedTeaming,

                [Parameter()]
                [Guid]
                $Id
            )

            if ($PSBoundParameters.ContainsKey('Id'))
            {
                $script:MockedVMSwitch = New-MockedVMSwitch -Name $Name -Id $id
            }
            else
            {
                $script:MockedVMSwitch = New-MockedVMSwitch -Name $Name
            }
        }

        Mock -CommandName Get-OSVersion -MockWith {
            [PSCustomObject]@{
                Major         = 10
                Minor         = 0
                Build         = 14393
                Revision      = 0
                MajorRevision = 0
                MinorRevision = 0
            }
        }

        Describe 'DSC_VMSwitch\Get-TargetResource' -Tag 'Get' {

            Context 'When the system is in the desired state (VMSwitch has the desired Id)' {
                $script:MockedVMSwitch = New-MockedVMSwitch -Name 'TestSwitch'

                It 'Should return "present"' {
                    (Get-TargetResource -Name 'TestSwitch' -Type 'External').Ensure | Should -Be 'Present'
                    Assert-MockCalled -CommandName "Get-VMSwitch" -Times 1
                    Assert-MockCalled -CommandName "Get-VMSwitchTeam" -Times 1
                }
            }

            Context 'When the system is not in the desired state (VMSwitch has not the desired Id)' {

                $script:mockedVMSwitch = $null

                It 'Should return "absent"' {
                    (Get-TargetResource -Name 'TestSwitch' -Type 'External').Ensure | Should -Be 'Absent'
                    Assert-MockCalled -CommandName "Get-VMSwitch" -Times 1
                    Assert-MockCalled -CommandName "Get-VMSwitchTeam" -Times 0
                }
            }
        }

        Describe 'DSC_VMSwitch\Set-TargetResource' -Tag 'Set' {

            Context 'When the system is in the desired state (VMSwitch has the desired Id)' {
                $desiredVMSwitchID = New-Guid

                $script:mockedVMSwitch = New-MockedVMSwitch -Name 'TestSwitch' -Id $desiredVMSwitchID

                $testParams = @{
                    Name                     = 'TestSwitch'
                    Type                     = 'External'
                    NetAdapterName           = @('NIC1', 'NIC2')
                    AllowManagementOS        = $true
                    EnableEmbeddedTeaming    = $true
                    Ensure                   = 'Present'
                    Id                       = $desiredVMSwitchID
                }

                It 'Should run without without exceptions' {
                    {Set-TargetResource @testParams} | Should -Not -throw
                    Assert-MockCalled -CommandName "Get-VMSwitch" -Times 1
                    Assert-MockCalled -CommandName 'Get-NetAdapter' -Times 1
                }
            }

            Context 'When the system is not in the desired state (VMSwitch has not the desired Id)' {

                $script:mockedVMSwitch = New-MockedVMSwitch -Name 'TestSwitch'

                $testParams = @{
                    Name                     = 'TestSwitch'
                    Type                     = 'External'
                    NetAdapterName           = @('NIC1', 'NIC2')
                    AllowManagementOS        = $true
                    EnableEmbeddedTeaming    = $true
                    Ensure                   = 'Present'
                    Id                       = New-Guid
                }

                It 'Should run without exception while re-creating the VMSwitch' {
                    {Set-TargetResource @testParams} | Should -Not -throw
                    Assert-MockCalled -CommandName "Get-VMSwitch" -Times 1
                    Assert-MockCalled -CommandName 'Get-NetAdapter' -Times 1
                    Assert-MockCalled -CommandName 'Remove-VMSwitch' -Times 1
                    Assert-MockCalled -CommandName 'New-VMSwitch' -Times 1
                }
            }

            Context 'When the specified value for Id parameter is not a GUID' {

                $script:mockedVMSwitch = New-MockedVMSwitch -Name 'TestSwitch'

                $testParams = @{
                    Name                     = 'TestSwitch'
                    Type                     = 'External'
                    NetAdapterName           = @('NIC1', 'NIC2')
                    AllowManagementOS        = $true
                    EnableEmbeddedTeaming    = $true
                    Ensure                   = 'Present'
                    Id                       = '123'
                }

                It 'Should throw "The VMSwitch Id must be in GUID format!"' {
                    {Set-TargetResource @testParams} | Should -Throw 'The VMSwitch Id must be in GUID format!'
                }
            }

            Context 'When the system is not running Server 2016' {

                $desiredVMSwitchID = New-Guid

                $script:mockedVMSwitch = New-MockedVMSwitch -Name 'TestSwitch' -Id $desiredVMSwitchID

                $testParams = @{
                    Name                     = 'TestSwitch'
                    Type                     = 'External'
                    NetAdapterName           = 'NIC1'
                    AllowManagementOS        = $true
                    EnableEmbeddedTeaming    = $false
                    Ensure                   = 'Present'
                    Id                       = $desiredVMSwitchID
                }

                Mock -CommandName Get-OSVersion -MockWith {
                    return [Version]::Parse('6.3.9600')
                }

                $errorMessage = $script:localizedData.VMSwitchIDServer2016Error

                It 'Should throw "VMSwitchIDServer2016Error"' {
                    {Set-TargetResource @testParams} | Should -Throw $errorMessage
                }
            }
        }

        Describe 'DSC_VMSwitch\Test-TargetResource' -Tag 'Test' {
            Context 'When the system is in the desired state (VMSwitch has the desired Id)' {

                $desiredVMSwitchID = New-Guid

                $script:mockedVMSwitch = New-MockedVMSwitch -Name 'TestSwitch' -Id $desiredVMSwitchID

                $testParams = @{
                    Name                  = 'TestSwitch'
                    Type                  = 'External'
                    NetAdapterName        = @('NIC1', 'NIC2')
                    AllowManagementOS     = $true
                    EnableEmbeddedTeaming = $true
                    Ensure                = 'Present'
                    Id                    = $desiredVMSwitchID
                }

                It 'Should return $true' {
                    {Test-TargetResource @testParams} | Should -Not -throw
                    Assert-MockCalled -CommandName "Get-VMSwitch" -Times 1
                    Assert-MockCalled -CommandName 'Get-NetAdapter' -Times 1
                }
            }

            Context 'When the system is not in the desired state (VMSwitch has not the desired Id)' {

                $script:mockedVMSwitch = New-MockedVMSwitch -Name 'TestSwitch'

                $testParams = @{
                    Name                  = 'TestSwitch'
                    Type                  = 'External'
                    NetAdapterName        = @('NIC1', 'NIC2')
                    AllowManagementOS     = $true
                    EnableEmbeddedTeaming = $true
                    Ensure                = 'Present'
                    Id                    = New-Guid
                }

                It 'Should return $false' {
                    {Test-TargetResource @testParams} | Should -Not -throw
                    Assert-MockCalled -CommandName "Get-VMSwitch" -Times 1
                    Assert-MockCalled -CommandName 'Get-NetAdapter' -Times 1
                }
            }

            Context 'When the specified value for Id parameter is not a GUID' {

                $script:mockedVMSwitch = New-MockedVMSwitch -Name 'TestSwitch'

                $testParams = @{
                    Name                     = 'TestSwitch'
                    Type                     = 'External'
                    NetAdapterName           = @('NIC1', 'NIC2')
                    AllowManagementOS        = $true
                    EnableEmbeddedTeaming    = $true
                    Ensure                   = 'Present'
                    Id                       = '123'
                }

                It 'Should throw "The VMSwitch Id must be in GUID format!"' {
                    {Test-TargetResource @testParams} | Should -Throw 'The VMSwitch Id must be in GUID format!'
                }
            }

            Context 'When the system is not running Server 2016' {

                $desiredVMSwitchID = New-Guid

                $script:mockedVMSwitch = New-MockedVMSwitch -Name 'TestSwitch' -Id $desiredVMSwitchID

                $testParams = @{
                    Name                     = 'TestSwitch'
                    Type                     = 'External'
                    NetAdapterName           = 'NIC1'
                    AllowManagementOS        = $true
                    EnableEmbeddedTeaming    = $false
                    Ensure                   = 'Present'
                    Id                       = $desiredVMSwitchID
                }

                Mock -CommandName Get-OSVersion -MockWith {
                    return [Version]::Parse('6.3.9600')
                }

                $errorMessage = $script:localizedData.VMSwitchIDServer2016Error

                It 'Should throw "VMSwitchIDServer2016Error"' {
                    {Test-TargetResource @testParams} | Should -Throw $errorMessage
                }
            }

        }
    }
}
finally
{
    Invoke-TestCleanup
}
