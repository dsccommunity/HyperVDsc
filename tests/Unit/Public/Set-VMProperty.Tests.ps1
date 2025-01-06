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

Import-Module $script:parentModule -Force -ErrorAction 'Stop'
#endregion HEADER

# Import the stub functions.
#Get-Module -Name 'Hyper-V' -All | Remove-Module -Force
Import-Module -Name "$PSScriptRoot/../Stubs/Hyper-V.stubs.psm1" -Force

InModuleScope $script:parentModule {
    Describe 'Public\Set-VMProperty' {
        It "Should throw if VM is running and 'RestartIfNeeded' is False" {
            $mockVMName = 'Test'

            Mock -CommandName Get-VM -MockWith {
                return @{
                    State = 'Running'
                }
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
            Mock -CommandName Get-VM -MockWith {
                return @{
                    State = 'Running'
                }
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
}
