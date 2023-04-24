#region HEADER
$script:projectPath = "$PSScriptRoot\..\.." | Convert-Path
$script:projectName = (Get-ChildItem -Path "$script:projectPath\*\*.psd1" | Where-Object -FilterScript {
        ($_.Directory.Name -match 'source|src' -or $_.Directory.Name -eq $_.BaseName) -and
        $(try
            {
                Test-ModuleManifest -Path $_.FullName -ErrorAction Stop
            }
            catch
            {
                $false
            })
    }).BaseName

$script:parentModule = Get-Module -Name $script:projectName -ListAvailable | Select-Object -First 1
$script:subModulesFolder = Join-Path -Path $script:parentModule.ModuleBase -ChildPath 'Modules'
Remove-Module -Name $script:parentModule -Force -ErrorAction 'SilentlyContinue'

$script:subModuleName = (Split-Path -Path $PSCommandPath -Leaf) -replace '\.Tests.ps1'
$script:subModuleFile = Join-Path -Path $script:subModulesFolder -ChildPath "$($script:subModuleName)"

Import-Module $script:subModuleFile -Force -ErrorAction 'Stop'
#endregion HEADER

# Import the stub functions.
#Get-Module -Name 'Hyper-V' -All | Remove-Module -Force
Import-Module -Name "$PSScriptRoot/Stubs/Hyper-V.stubs.psm1" -Force
Import-Module -Name "$PSScriptRoot/Stubs/FailoverClusters.stubs.psm1" -Force

InModuleScope $script:subModuleName {
    Describe 'HyperVDsc.Common\Set-VMProperty' {
        It "Should throw if VM is running and 'RestartIfNeeded' is False" {
            $mockVMName = 'Test'

            Mock -CommandName Get-VMHyperV -MockWith {
                $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM.State = 'Running'
                return $stubVM
            }

            $setVMPropertyParams = @{
                VMName         = $mockVMName
                VMCommand      = 'Set-VMProcessor'
                ChangeProperty = @{
                    ResourcePoolName = 'Dummy'
                }
            }

            { Set-VMProperty @setVMPropertyParams } | Should -Throw (
                $script:localizedData.CannotUpdatePropertiesOnlineError -f $mockVMName, 'Running'
            )
        }

        It "Should stop and restart VM when running and 'RestartIfNeeded' is True" {
            Mock -CommandName Stop-VM
            Mock -CommandName Set-VMProcessor
            Mock -CommandName Set-VMState
            Mock -CommandName Get-VMHyperV -MockWith {
                $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM.State = 'Running'
                return $stubVM
            }

            $setVMPropertyParams = @{
                VMName          = 'Test'
                VMCommand       = 'Set-VMProcessor'
                ChangeProperty  = @{
                    ResourcePoolName = 'Dummy'
                }
                RestartIfNeeded = $true
            }
            Set-VMProperty @setVMPropertyParams

            Assert-MockCalled -CommandName Set-VMState -ParameterFilter {
                $State -eq 'Off'
            } -Scope It

            Assert-MockCalled -CommandName Set-VMState -ParameterFilter {
                $State -eq 'Running'
            } -Scope It
        }

    }

    Describe 'HyperVDsc.Common\Set-VMState' {
        It 'Should resume VM when current "State" is "Paused" and target state is "Running"' {
            Mock -CommandName Resume-VM
            Mock -CommandName Wait-VMIPAddress
            Mock -CommandName Get-VMHyperV -MockWith {
                $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM.State = 'Paused'
                return $stubVM
            }

            Set-VMState -Name 'TestVM' -State 'Running'

            Assert-MockCalled -CommandName Resume-VM -Scope It
            Assert-MockCalled -CommandName Wait-VMIPAddress -Scope It -Exactly 0
        }

        It 'Should resume VM and wait when current "State" is "Paused" and target state is "Running"' {
            Mock -CommandName Resume-VM
            Mock -CommandName Wait-VMIPAddress
            Mock -CommandName Get-VMHyperV -MockWith {
                $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM.State = 'Paused'
                return $stubVM
            }

            Set-VMState -Name 'TestVM' -State 'Running' -WaitForIP $true

            Assert-MockCalled -CommandName Resume-VM -Scope It
            Assert-MockCalled -CommandName Wait-VMIPAddress -Scope It
        }

        It 'Should start VM when current "State" is "Off" and target state is "Running"' {
            Mock -CommandName Start-VM
            Mock -CommandName Wait-VMIPAddress
            Mock -CommandName Get-VMHyperV -MockWith {
                $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM.State = 'Off'
                return $stubVM
            }

            Set-VMState -Name 'TestVM' -State 'Running'

            Assert-MockCalled -CommandName Start-VM -Scope It
            Assert-MockCalled -CommandName Wait-VMIPAddress -Scope It -Exactly 0
        }

        It 'Should start VM and wait when current "State" is "Off" and target state is "Running"' {
            Mock -CommandName Start-VM
            Mock -CommandName Wait-VMIPAddress
            Mock -CommandName Get-VMHyperV -MockWith {
                $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM.State = 'Off'
                return $stubVM
            }

            Set-VMState -Name 'TestVM' -State 'Running' -WaitForIP $true

            Assert-MockCalled -CommandName Start-VM -Scope It
            Assert-MockCalled -CommandName Wait-VMIPAddress -Scope It
        }

        It 'Should suspend VM when current "State" is "Running" and target state is "Paused"' {
            Mock -CommandName Suspend-VM
            Mock -CommandName Get-VMHyperV -MockWith {
                $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM.State = 'Running'
                return $stubVM
            }

            Set-VMState -Name 'TestVM' -State 'Paused'

            Assert-MockCalled -CommandName Suspend-VM -Scope It
        }

        It 'Should stop VM when current "State" is "Running" and target state is "Off"' {
            Mock -CommandName Stop-VM
            Mock -CommandName Get-VMHyperV -MockWith {
                $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM.State = 'Running'
                return $stubVM
            }

            Set-VMState -Name 'TestVM' -State 'Off'

            Assert-MockCalled -CommandName Stop-VM -Scope It
        }

        It 'Should stop VM when current "State" is "Paused" and target state is "Off"' {
            Mock -CommandName Stop-VM
            Mock -CommandName Get-VMHyperV -MockWith {
                $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM.State = 'Paused'
                return $stubVM
            }

            Set-VMState -Name 'TestVM' -State 'Off'

            Assert-MockCalled -CommandName Stop-VM -Scope It
        }
    } # describe HyperVDsc.Common\Set-VMState
}

Describe 'HyperVDsc.Common\Wait-VMIPAddress' {
    Context 'When VM network adapter reports 2 IP addresses'{
        BeforeAll {
            Mock -CommandName Get-VMNetworkAdapter -ModuleName 'HyperVDsc.Common' -MockWith {
                return @{
                    IpAddresses = @('192.168.0.1', '172.16.0.1')
                }
            }
            Mock -CommandName Get-VMHyperV -MockWith {
                $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM.State = 'Paused'
                return $stubVM
            } -ModuleName 'HyperVDsc.Common'
            Mock -CommandName Get-Command -ParameterFilter {$Name -eq 'Get-Cluster'} -ModuleName 'HyperVDsc.Common'
        }

        It 'Should return without throwing an exception' {
            $result = Wait-VMIPAddress -Name 'Test' -Verbose

            $result | Should -BeNullOrEmpty
        }
    }

    Context 'When VM network adapter reports 2 IP addresses'{
        BeforeAll {
            Mock -CommandName Start-Sleep -ModuleName 'HyperVDsc.Common'
            Mock -CommandName Get-VMNetworkAdapter -ModuleName 'HyperVDsc.Common' -MockWith {
                return $null
            }
        }

        It 'Should throw the correct exception' {
            { Wait-VMIPAddress -Name 'Test' -Timeout 2 -Verbose } | Should -Throw (
                $script:localizedData.WaitForVMIPAddressTimeoutError -f 'Test', '2'
            )
        }
    }
} # describe HyperVDsc.Common\WaitVMIPAddress

Describe 'HyperVDsc.Common\ConvertTo-TimeSpan' {
    It 'Should convert 60 seconds to "System.TimeSpan" of 1 minute' {
        $testSeconds = 60

        $result = ConvertTo-TimeSpan -TimeInterval $testSeconds -TimeIntervalType Seconds

        $result.TotalMinutes | Should -Be 1
    }

    It 'Should convert 60 minutes to "System.TimeSpan" of 60 minutes' {
        $testMinutes = 60

        $result = ConvertTo-TimeSpan -TimeInterval $testMinutes -TimeIntervalType Minutes

        $result.TotalHours | Should -Be 1
    }

    It 'Should convert 48 hours to "System.TimeSpan" of 2 days' {
        $testHours = 48

        $result = ConvertTo-TimeSpan -TimeInterval $testHours -TimeIntervalType Hours

        $result.TotalDays | Should -Be 2
    }

} # describe HyperVDsc.Common\ConvertTo-TimeSpan

Describe 'HyperVDsc.Common\ConvertFrom-TimeSpan' {
    It 'Should convert a "System.TimeSpan" of 1 minute to 60 seconds' {
        $testTimeSpan = New-TimeSpan -Minutes 1

        $result = ConvertFrom-TimeSpan -TimeSpan $testTimeSpan -TimeSpanType Seconds

        $result | Should -Be 60
    }

    It 'Should convert a "System.TimeSpan" of 1 hour to 60 minutes' {
        $testTimeSpan = New-TimeSpan -Hours 1

        $result = ConvertFrom-TimeSpan -TimeSpan $testTimeSpan -TimeSpanType Minutes

        $result | Should -Be 60
    }

    It 'Should convert a "System.TimeSpan" of 2 dayes to 48 hours' {
        $testTimeSpan = New-TimeSpan -Days 2

        $result = ConvertFrom-TimeSpan -TimeSpan $testTimeSpan -TimeSpanType Hours

        $result | Should -Be 48
    }

} # describe HyperVDsc.Common\ConvertFrom-TimeSpan

Describe 'HyperVDsc.Common\Get-VMHyperV' {
    BeforeAll {
        $mockVMName = 'TestVM'
    }

    Mock -CommandName Get-Command -ParameterFilter {$Name -eq 'Get-Cluster'} -ModuleName 'HyperVDsc.Common'

    # Guard mocks
    It 'Should not throw when no VM is found' {
        Mock -CommandName Get-VM -ModuleName 'HyperVDsc.Common'

        $result = Get-VMHyperV -VMName $mockVMName

        $result | Should -BeNullOrEmpty
    }
    It 'Should throw when no VM is found and caller wants it to' {
        Mock -CommandName Get-VM -ModuleName 'HyperVDsc.Common'

        { Get-VMHyperV -VMName $mockVMName -ThrowOnEmpty -ErrorAction Stop} | Should -Throw -ExpectedMessage "No VM with the name '$mockVMName' exists."
    }

    It 'Should not throw when one VM is found' {
        Mock -CommandName Get-VM -ModuleName 'HyperVDsc.Common' -MockWith {
            $mockVm = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
            $mockVm.Name = $VMName
            $mockVm
        }

        $result = Get-VMHyperV -VMName $mockVMName

        $result.Name | Should -Be $mockVMName
    }

    It 'Should throw when more than one VM is found' {
        Mock -CommandName Get-VM -ModuleName 'HyperVDsc.Common' -MockWith {
            @(
                $mockVm = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $mockVm.Name = $VMName
                @($mockVm, $mockVm)
            )
        }

        { Get-VMHyperV -VMName $mockVMName } | Should -Throw (
            $script:localizedData.MoreThanOneVMExistsError -f $mockVMName
        )
    }

    Context 'Clustered VMs' {
        BeforeEach {
            $mockVMName = 'TestVM'
            Mock -CommandName Get-Command -ParameterFilter {$Name -eq 'Get-Cluster'} -MockWith { 'Get-Cluster' } -ModuleName 'HyperVDsc.Common'
            Mock -CommandName Get-Cluster -MockWith { 'A Cluster' } -ModuleName 'HyperVDsc.Common'
            Mock -CommandName Get-ClusterGroup -ModuleName 'HyperVDsc.Common'
        }

        It 'Should not throw when one clustered VM is found' {
            Mock -CommandName Get-ClusterGroup -ModuleName 'HyperVDsc.Common' -MockWith {
                [Microsoft.FailoverClusters.PowerShell.ClusterObject]::new()
            }
            Mock -CommandName Get-VM -ModuleName 'HyperVDsc.Common' -MockWith {
                $mockVm = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $mockVm.Name = $VMName
                # Test in case local cluster node is holding the machine object
                $mockVm.IsClustered = $true
                $mockVm
            }

            $result = Get-VMHyperV -VMName $mockVMName
            $result.Name | Should -Be $mockVMName
        }

        It 'Should not throw when no clustered VM is found' {
            Mock -CommandName Get-ClusterGroup -ModuleName 'HyperVDsc.Common'
            Mock -CommandName Get-VM -ModuleName 'HyperVDsc.Common'

            $result = Get-VMHyperV -VMName $mockVMName
            $result | Should -BeNullOrEmpty
        }

        It 'Should throw when no clustered VM is found and caller wants it to' {
            Mock -CommandName Get-ClusterGroup -ModuleName 'HyperVDsc.Common'
            Mock -CommandName Get-VM -ModuleName 'HyperVDsc.Common'
            { Get-VMHyperV -VMName $mockVMName -ThrowOnEmpty -ErrorAction Stop} | Should -Throw -ExpectedMessage "No VM with the name '$mockVMName' exists."
        }
    }
} # describe HyperVDsc.Common\Get-VMHyperV
