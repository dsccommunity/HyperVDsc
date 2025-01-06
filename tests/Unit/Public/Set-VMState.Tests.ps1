#region HEADER
$script:projectPath = "$PSScriptRoot\..\..\.." | Convert-Path
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
Import-Module -Name "$PSScriptRoot/../../TestHelpers/Stubs/Hyper-V.stubs.psm1" -Force

InModuleScope $script:subModuleName {
    Describe 'Public\Set-VMState' {
        It 'Should resume VM when current "State" is "Paused" and target state is "Running"' {
            Mock -CommandName Resume-VM
            Mock -CommandName Wait-VMIPAddress
            Mock -CommandName Get-VM -MockWith {
                return @{
                    State = 'Paused'
                }
            }

            Set-VMState -Name 'TestVM' -State 'Running'

            Assert-MockCalled -CommandName Resume-VM -Scope It
            Assert-MockCalled -CommandName Wait-VMIPAddress -Scope It -Exactly 0
        }

        It 'Should resume VM and wait when current "State" is "Paused" and target state is "Running"' {
            Mock -CommandName Resume-VM
            Mock -CommandName Wait-VMIPAddress
            Mock -CommandName Get-VM -MockWith {
                return @{
                    State = 'Paused'
                }
            }

            Set-VMState -Name 'TestVM' -State 'Running' -WaitForIP $true

            Assert-MockCalled -CommandName Resume-VM -Scope It
            Assert-MockCalled -CommandName Wait-VMIPAddress -Scope It
        }

        It 'Should start VM when current "State" is "Off" and target state is "Running"' {
            Mock -CommandName Start-VM
            Mock -CommandName Wait-VMIPAddress
            Mock -CommandName Get-VM -MockWith {
                return @{
                    State = 'Off'
                }
            }

            Set-VMState -Name 'TestVM' -State 'Running'

            Assert-MockCalled -CommandName Start-VM -Scope It
            Assert-MockCalled -CommandName Wait-VMIPAddress -Scope It -Exactly 0
        }

        It 'Should start VM and wait when current "State" is "Off" and target state is "Running"' {
            Mock -CommandName Start-VM
            Mock -CommandName Wait-VMIPAddress
            Mock -CommandName Get-VM -MockWith {
                return @{
                    State = 'Off'
                }
            }

            Set-VMState -Name 'TestVM' -State 'Running' -WaitForIP $true

            Assert-MockCalled -CommandName Start-VM -Scope It
            Assert-MockCalled -CommandName Wait-VMIPAddress -Scope It
        }

        It 'Should suspend VM when current "State" is "Running" and target state is "Paused"' {
            Mock -CommandName Suspend-VM
            Mock -CommandName Get-VM -MockWith {
                return @{
                    State = 'Running'
                }
            }

            Set-VMState -Name 'TestVM' -State 'Paused'

            Assert-MockCalled -CommandName Suspend-VM -Scope It
        }

        It 'Should stop VM when current "State" is "Running" and target state is "Off"' {
            Mock -CommandName Stop-VM
            Mock -CommandName Get-VM -MockWith {
                return @{
                    State = 'Running'
                }
            }

            Set-VMState -Name 'TestVM' -State 'Off'

            Assert-MockCalled -CommandName Stop-VM -Scope It
        }

        It 'Should stop VM when current "State" is "Paused" and target state is "Off"' {
            Mock -CommandName Stop-VM
            Mock -CommandName Get-VM -MockWith {
                return @{
                    State = 'Paused'
                }
            }

            Set-VMState -Name 'TestVM' -State 'Off'

            Assert-MockCalled -CommandName Stop-VM -Scope It
        }
    }
}
