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
Import-Module -Name "$PSScriptRoot/Stubs/Hyper-V.stubs.psm1" -Force

InModuleScope $script:subModuleName {
    Describe 'HyperVCommon\Set-VMProperty' {
        # Guard mocks
        Mock Get-VM
        Mock Set-VMState
        Mock Get-VMProcessor
        Mock Set-VMProcessor

        It "Should throw if VM is running and 'RestartIfNeeded' is False" {
            Mock Get-VM { return @{ State = 'Running' } }

            $setVMPropertyParams = @{
                VMName         = 'Test';
                VMCommand      = 'Set-VMProcessor';
                ChangeProperty = @{ ResourcePoolName = 'Dummy' }
            }
            { Set-VMProperty @setVMPropertyParams } | Should Throw 'RestartIfNeeded'
        }

        It "Should stop and restart VM when running and 'RestartIfNeeded' is True" {
            Mock Get-VM { return @{ State = 'Running' } }

            $setVMPropertyParams = @{
                VMName          = 'Test';
                VMCommand       = 'Set-VMProcessor';
                ChangeProperty  = @{ ResourcePoolName = 'Dummy' }
                RestartIfNeeded = $true;
            }
            Set-VMProperty @setVMPropertyParams

            Assert-MockCalled Set-VMState -ParameterFilter { $State -eq 'Off' } -Scope It
            Assert-MockCalled Set-VMState -ParameterFilter { $State -eq 'Running' } -Scope It
        }

    }

    Describe 'HyperVCommon\Set-VMState' {
        # Guard mocks
        Mock Resume-VM
        Mock Start-VM
        Mock Stop-VM
        Mock Suspend-VM
        Mock Wait-VMIPAddress

        It 'Should resume VM when current "State" is "Paused" and target state is "Running"' {
            Mock Get-VM { return @{ State = 'Paused' } }

            Set-VMState -Name 'TestVM' -State 'Running'

            Assert-MockCalled Resume-VM -Scope It
            Assert-MockCalled Wait-VMIPAddress -Scope It -Exactly 0
        }

        It 'Should resume VM and wait when current "State" is "Paused" and target state is "Running"' {
            Mock Get-VM { return @{ State = 'Paused' } }

            Set-VMState -Name 'TestVM' -State 'Running' -WaitForIP $true

            Assert-MockCalled Resume-VM -Scope It
            Assert-MockCalled Wait-VMIPAddress -Scope It
        }

        It 'Should start VM when current "State" is "Off" and target state is "Running"' {
            Mock Get-VM { return @{ State = 'Off' } }

            Set-VMState -Name 'TestVM' -State 'Running'

            Assert-MockCalled Start-VM -Scope It
            Assert-MockCalled Wait-VMIPAddress -Scope It -Exactly 0
        }

        It 'Should start VM and wait when current "State" is "Off" and target state is "Running"' {
            Mock Get-VM { return @{ State = 'Off' } }

            Set-VMState -Name 'TestVM' -State 'Running' -WaitForIP $true

            Assert-MockCalled Start-VM -Scope It
            Assert-MockCalled Wait-VMIPAddress -Scope It
        }

        It 'Should suspend VM when current "State" is "Running" and target state is "Paused"' {
            Mock Get-VM { return @{ State = 'Running' } }

            Set-VMState -Name 'TestVM' -State 'Paused'

            Assert-MockCalled Suspend-VM -Scope It
        }

        It 'Should stop VM when current "State" is "Running" and target state is "Off"' {
            Mock Get-VM { return @{ State = 'Running' } }

            Set-VMState -Name 'TestVM' -State 'Off'

            Assert-MockCalled Stop-VM -Scope It
        }

        It 'Should stop VM when current "State" is "Paused" and target state is "Off"' {
            Mock Get-VM { return @{ State = 'Paused' } }

            Set-VMState -Name 'TestVM' -State 'Off'

            Assert-MockCalled Stop-VM -Scope It
        }
    } # describe HyperVCommon\Set-VMState
}

Describe 'HyperVCommon\Wait-VMIPAddress' {
    # Guard mocks
    Mock Get-VMNetworkAdapter -ModuleName $script:DSCResourceName

    It 'Should return when VM network adapter reports 2 IP addresses' {
        Mock Get-VMNetworkAdapter -ModuleName $script:DSCResourceName { return @{ IpAddresses = @('192.168.0.1', '172.16.0.1') } }

        $result = Wait-VMIPAddress -Name 'Test'

        $result | Should BeNullOrEmpty
    }

    It 'Should throw when after timeout is exceeded' {
        Mock Get-VMNetworkAdapter -ModuleName $script:DSCResourceName { return $null }

        { Wait-VMIPAddress -Name 'Test' -Timeout 2 } | Should Throw 'timed out'
    }
} # describe HyperVCommon\WaitVMIPAddress

Describe 'HyperVCommon\ConvertTo-TimeSpan' {

    It 'Should convert 60 seconds to "System.TimeSpan" of 1 minute' {
        $testSeconds = 60

        $result = ConvertTo-TimeSpan -TimeInterval $testSeconds -TimeIntervalType Seconds

        $result.TotalMinutes | Should Be 1
    }

    It 'Should convert 60 minutes to "System.TimeSpan" of 60 minutes' {
        $testMinutes = 60

        $result = ConvertTo-TimeSpan -TimeInterval $testMinutes -TimeIntervalType Minutes

        $result.TotalHours | Should Be 1
    }

    It 'Should convert 48 hours to "System.TimeSpan" of 2 days' {
        $testHours = 48

        $result = ConvertTo-TimeSpan -TimeInterval $testHours -TimeIntervalType Hours

        $result.TotalDays | Should Be 2
    }

} # describe HyperVCommon\ConvertTo-TimeSpan

Describe 'HyperVCommon\ConvertFrom-TimeSpan' {

    It 'Should convert a "System.TimeSpan" of 1 minute to 60 seconds' {
        $testTimeSpan = New-TimeSpan -Minutes 1

        $result = ConvertFrom-TimeSpan -TimeSpan $testTimeSpan -TimeSpanType Seconds

        $result | Should Be 60
    }

    It 'Should convert a "System.TimeSpan" of 1 hour to 60 minutes' {
        $testTimeSpan = New-TimeSpan -Hours 1

        $result = ConvertFrom-TimeSpan -TimeSpan $testTimeSpan -TimeSpanType Minutes

        $result | Should Be 60
    }

    It 'Should convert a "System.TimeSpan" of 2 dayes to 48 hours' {
        $testTimeSpan = New-TimeSpan -Days 2

        $result = ConvertFrom-TimeSpan -TimeSpan $testTimeSpan -TimeSpanType Hours

        $result | Should Be 48
    }

} # describe HyperVCommon\ConvertFrom-TimeSpan

Describe 'HyperVCommon\Get-VMHyperV' {
    # Guard mocks
    Mock Get-VM -ModuleName $script:DSCResourceName

    It 'Should not throw when no VM is found' {
        Mock Get-VM -ModuleName $script:DSCResourceName
        $testVMName = 'TestVM'

        $result = Get-VMHyperV -VMName $testVMName

        $result | Should BeNullOrEmpty
    }

    It 'Should not throw when one VM is found' {
        Mock Get-VM -ModuleName $script:DSCResourceName {
            Write-Output -InputObject ([PSCustomObject] @{ Name = $VMName })
        }
        $testVMName = 'TestVM'

        $result = Get-VMHyperV -VMName $testVMName

        $result.Name | Should Be $testVMName
    }

    It 'Should throw when more than one VM is found' {
        Mock Get-VM -ModuleName $script:DSCResourceName {
            Write-Output -InputObject ([PSCustomObject] @{ Name = $VMName })
            Write-Output -InputObject ([PSCustomObject] @{ Name = $VMName })
        }
        $testVMName = 'TestVM'

        { Get-VMHyperV -VMName $testVMName } | Should Throw 'More than one VM'
    }

} # describe HyperVCommon\Get-VMHyperV
