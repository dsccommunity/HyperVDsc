$script:dscModuleName = 'HyperVDsc'
$script:dscResourceName = 'DSC_VMNetworkAdapter'

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
        # Create the Mock -CommandName Objects that will be used for running tests
        $MockHostAdapter = [PSCustomObject] @{
            Id         = 'HostManagement1'
            Name       = 'Management'
            SwitchName = 'HostSwitch'
            VMName     = 'ManagementOS'
        }

        $propertiesStatic = @{
            IpAddress = "192.168.0.1"
            Subnet    = "255.255.255.0"
        }

        $networkSettingsStatic = New-CimInstance -ClassName NetworkSettings -Property $properties -Namespace root/microsoft/windows/desiredstateconfiguration -ClientOnly

        $TestAdapter = [PSObject]@{
            Id         = $MockHostAdapter.Id
            Name       = $MockHostAdapter.Name
            SwitchName = $MockHostAdapter.SwitchName
            VMName     = $MockHostAdapter.VMName
        }

        $MockAdapter = [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase]::CreateTypeInstance()
        $MockAdapter.Name = $MockHostAdapter.Name
        $MockAdapter.SwitchName = $MockHostAdapter.SwitchName
        $MockAdapter.VMName = $MockHostAdapter.VMName
        $MockAdapter.IsManagementOs = $true
        $MockAdapter.MacAddress = '14FEB5C6CE98'

        $MockAdapterVlanUntagged = [PSObject]@{
            OperationMode = 'Untagged'
        }

        $MockAdapterVlanTagged = [PSObject]@{
            OperationMode = 'Access'
            AccessVlanId  = '1'
        }

        Describe 'DSC_VMNetworkAdapter\Get-TargetResource' {
            Context 'NetAdapter does not exist' {
                Mock -CommandName Get-VMNetworkAdapter
                Mock -CommandName Get-VMNetworkAdapterVlan
                It 'should return ensure as absent' {
                    $Result = Get-TargetResource `
                        @TestAdapter
                    $Result.Ensure | Should -Be 'Absent'
                }
                It 'should call the expected mocks' {
                    Assert-MockCalled -commandName Get-VMNetworkAdapter -Exactly 1
                    Assert-MockCalled -commandName Get-VMNetworkAdapterVlan -Exactly 0
                }
            }

            Context 'NetAdapter with untagged VLAN exists' {
                Mock -CommandName Get-VMNetworkAdapter -MockWith {
                    $MockAdapter
                }

                Mock -CommandName Get-VMNetworkAdapterVlan -MockWith {
                    $MockAdapterVlanUntagged
                }
                Mock -CommandName Get-NetworkInformation -MockWith {
                    return @{
                        IpAddress      = '10.10.10.10'
                        Subnet         = '255.255.255.0'
                        DefaultGateway = '10.10.10.1'
                        DnsServers     = @( '10.10.10.1' )
                    }
                }

                It 'should return adapter properties' {
                    $Result = Get-TargetResource @TestAdapter
                    $Result.Ensure | Should -Be 'Present'
                    $Result.Name | Should -Be $TestAdapter.Name
                    $Result.SwitchName | Should -Be $TestAdapter.SwitchName
                    $Result.VMName | Should -Be 'ManagementOS'
                    $Result.Id | Should -Be $TestAdapter.Id
                    $Result.VlanId | Should -BeNullOrEmpty
                    $Result.NetworkSetting | Should -Not -BeNullOrEmpty
                }
                It 'should call the expected mocks' {
                    Assert-MockCalled -commandName Get-VMNetworkAdapter -Exactly 1
                    Assert-MockCalled -commandName Get-VMNetworkAdapterVlan -Exactly 1
                }
            }

            Context 'NetAdapter with tagged VLAN exists' {
                Mock -CommandName Get-VMNetworkAdapter -MockWith {
                    $MockAdapter
                }

                Mock -CommandName Get-VMNetworkAdapterVlan -MockWith {
                    $MockAdapterVlanTagged
                }

                Mock -CommandName Get-NetworkInformation -MockWith {
                    return @{
                        IpAddress      = '10.10.10.10'
                        Subnet         = '255.255.255.0'
                        DefaultGateway = '10.10.10.1'
                        DnsServers     = @( '10.10.10.1', '10.10.10.2' )
                    }
                }

                It 'should return adapter properties' {
                    $Result = Get-TargetResource @TestAdapter
                    $Result.Ensure | Should -Be 'Present'
                    $Result.Name | Should -Be $TestAdapter.Name
                    $Result.SwitchName | Should -Be $TestAdapter.SwitchName
                    $Result.VMName | Should -Be 'ManagementOS'
                    $Result.Id | Should -Be $TestAdapter.Id
                    $Result.VlanId | Should -Be '1'
                }
                It 'should call the expected mocks' {
                    Assert-MockCalled -commandName Get-VMNetworkAdapter -Exactly 1
                    Assert-MockCalled -commandName Get-VMNetworkAdapterVlan -Exactly 1
                }
            }
        }

        Describe 'DSC_VMNetworkAdapter\Set-TargetResource' {
            $newAdapter = [PSObject]@{
                Id             = 'UniqueString'
                Name           = $TestAdapter.Name
                SwitchName     = $TestAdapter.SwitchName
                VMName         = 'VMName'
                NetworkSetting = $networkSettingsStatic
                Ensure         = 'Present'
            }

            Context 'Adapter does not exist but should' {
                Mock -CommandName Get-VMNetworkAdapter
                Mock -CommandName Get-VMNetworkAdapterVlan
                Mock -CommandName Add-VMNetworkAdapter -MockWith {
                    $MockAdapter
                }
                Mock -CommandName Remove-VMNetworkAdapter
                Mock -CommandName Set-VMNetworkAdapterVlan
                Mock -CommandName Get-NetworkInformation
                Mock -CommandName Set-NetworkInformation

                It 'should not throw error' {
                    {
                        Set-TargetResource @newAdapter
                    } | Should -Not -throw
                }

                It 'should call expected Mocks' {
                    Assert-MockCalled -commandName Get-VMNetworkAdapter -Exactly 1
                    Assert-MockCalled -CommandName Set-VMNetworkAdapterVlan -Exactly 0
                    Assert-MockCalled -commandName Add-VMNetworkAdapter -Exactly 1
                    Assert-MockCalled -commandName Remove-VMNetworkAdapter -Exactly 0
                    Assert-MockCalled -CommandName Get-NetworkInformation -Exactly 1
                    Assert-MockCalled -CommandName Set-NetworkInformation -Exactly 1
                }
            }

            Context 'Adapter exists but should not exist' {
                Mock -CommandName Get-VMNetworkAdapter
                Mock -CommandName Add-VMNetworkAdapter
                Mock -CommandName Remove-VMNetworkAdapter
                Mock -CommandName Set-VMNetworkAdapterVlan

                It 'should not throw error' {
                    {
                        $updateAdapter = $newAdapter.Clone()
                        $updateAdapter.Ensure = 'Absent'
                        Set-TargetResource @updateAdapter
                    } | Should -Not -throw
                }
                It 'should call expected Mocks' {
                    Assert-MockCalled -commandName Get-VMNetworkAdapter -Exactly 1
                    Assert-MockCalled -commandName Add-VMNetworkAdapter -Exactly 0
                    Assert-MockCalled -commandName Remove-VMNetworkAdapter -Exactly 1
                    Assert-MockCalled -CommandName Set-VMNetworkAdapterVlan -Exactly 0
                }
            }
        }

        Describe 'DSC_VMNetworkAdapter\Test-TargetResource' {
            $newAdapter = [PSObject]@{
                Id         = 'UniqueString'
                Name       = $TestAdapter.Name
                SwitchName = $TestAdapter.SwitchName
                VMName     = 'ManagementOS'
                Ensure     = 'Present'
            }

            Context 'Adapter does not exist but should' {
                Mock -CommandName Get-VMNetworkAdapter
                Mock -CommandName Get-VMNetworkAdapterVlan

                It 'should return false' {
                    Test-TargetResource @newAdapter | Should -Be $false
                }
                It 'should call expected Mocks' {
                    Assert-MockCalled -commandName Get-VMNetworkAdapter -Exactly 1
                }
            }

            Context 'Adapter exists but should not exist' {
                Mock -CommandName Get-VMNetworkAdapter -MockWith { $MockAdapter }

                It 'should return $false' {
                    $updateAdapter = $newAdapter.Clone()
                    $updateAdapter.Ensure = 'Absent'
                    Test-TargetResource @updateAdapter | Should -Be $false
                }
                It 'should call expected Mocks' {
                    Assert-MockCalled -commandName Get-VMNetworkAdapter -Exactly 1
                }
            }

            Context 'Adapter exists and no action needed without Vlan tag' {
                Mock -CommandName Get-VMNetworkAdapter -MockWith { $MockAdapter }

                It 'should return true' {
                    $updateAdapter = $newAdapter.Clone()
                    Test-TargetResource @updateAdapter | Should -Be $true
                }
                It 'should call expected Mocks' {
                    Assert-MockCalled -commandName Get-VMNetworkAdapter -Exactly 1
                }
            }

            Context 'Adapter exists and no action needed with Vlan tag' {
                Mock -CommandName Get-VMNetworkAdapter -MockWith { $MockAdapter }
                Mock -CommandName Get-VMNetworkAdapterVlan -MockWith { $MockAdapterVlanTagged }
                Mock -CommandName Get-NetworkInformation

                It 'should return true' {
                    $updateAdapter = $newAdapter.Clone()
                    $updateAdapter.VMName = "VMName"
                    $updateAdapter.MacAddress = '14FEB5C6CE98'
                    $updateAdapter.VlanId = '1'
                    Test-TargetResource @updateAdapter | Should -Be $true
                }
                It 'should call expected Mocks' {
                    Assert-MockCalled -commandName Get-VMNetworkAdapter -Exactly 1
                    Assert-MockCalled -commandName Get-VMNetworkAdapterVlan -Exactly 1
                }
            }

            Context 'Adapter exists but Vlan is not tagged' {
                Mock -CommandName Get-VMNetworkAdapter -MockWith { $MockAdapter }
                Mock -CommandName Get-VMNetworkAdapterVlan
                Mock -CommandName Get-NetworkInformation

                It 'should return false' {
                    $updateAdapter = $newAdapter.Clone()
                    $updateAdapter.VMName = "VMName"
                    $updateAdapter.MacAddress = '14FEB5C6CE98'
                    $updateAdapter.VlanId = '1'
                    Test-TargetResource @updateAdapter | Should -Be $false
                }
                It 'should call expected Mocks' {
                    Assert-MockCalled -commandName Get-VMNetworkAdapter -Exactly 1
                    Assert-MockCalled -commandName Get-VMNetworkAdapterVlan -Exactly 1
                }
            }

            Context 'Adapter exists but Vlan tag is wrong' {
                Mock -CommandName Get-VMNetworkAdapter -MockWith { $MockAdapter }
                Mock -CommandName Get-VMNetworkAdapterVlan -MockWith { $MockAdapterVlanTagged }
                Mock -CommandName Get-NetworkInformation

                It 'should return false' {
                    $updateAdapter = $newAdapter.Clone()
                    $updateAdapter.VMName = "VMName"
                    $updateAdapter.MacAddress = '14FEB5C6CE98'
                    $updateAdapter.VlanId = '2'
                    Test-TargetResource @updateAdapter | Should -Be $false
                }
                It 'should call expected Mocks' {
                    Assert-MockCalled -commandName Get-VMNetworkAdapter -Exactly 1
                    Assert-MockCalled -commandName Get-VMNetworkAdapterVlan -Exactly 1
                }
            }

            Context 'Adapter does not exist and no action needed' {
                Mock -CommandName Get-VMNetworkAdapter

                It 'should return true' {
                    $updateAdapter = $newAdapter.Clone()
                    $updateAdapter.Ensure = 'Absent'
                    Test-TargetResource @updateAdapter | Should -Be $true
                }
                It 'should call expected Mocks' {
                    Assert-MockCalled -commandName Get-VMNetworkAdapter -Exactly 1
                }
            }

            Context 'Adapter exists but network settings are not correct' {
                Mock -CommandName Get-VMNetworkAdapter -MockWith { $MockAdapter }
                Mock -CommandName Get-VMNetworkAdapterVlan -MockWith { $MockAdapterVlanTagged }
                Mock -CommandName Get-NetworkInformation -MockWith {
                    @{ Dhcp = $false }
                }

                It 'should return false' {
                    $updateAdapter = $newAdapter.Clone()
                    $updateAdapter.VMName = "VMName"
                    $updateAdapter.MacAddress = '14FEB5C6CE98'
                    Test-TargetResource @updateAdapter | Should -Be $false
                }
                It 'should call expected Mocks' {
                    Assert-MockCalled -commandName Get-VMNetworkAdapter -Exactly 1
                    Assert-MockCalled -commandName Get-NetworkInformation -Exactly 1
                }
            }
        }

    }
    #endregion
}
finally
{
    Invoke-TestCleanup
}
