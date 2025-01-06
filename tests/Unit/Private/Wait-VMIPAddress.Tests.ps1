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
#$script:subModulesFolder = Join-Path -Path $script:parentModule.ModuleBase -ChildPath 'Modules'
#Remove-Module -Name $script:parentModule -Force -ErrorAction 'SilentlyContinue'

#$script:subModuleName = (Split-Path -Path $PSCommandPath -Leaf) -replace '\.Tests.ps1'
#$script:subModuleFile = Join-Path -Path $script:subModulesFolder -ChildPath "$($script:subModuleName)"

Import-Module $script:parentModule -Force -ErrorAction 'Stop'
#endregion HEADER

# Import the stub functions.
#Get-Module -Name 'Hyper-V' -All | Remove-Module -Force
Import-Module -Name "$PSScriptRoot/../Stubs/Hyper-V.stubs.psm1" -Force

InModuleScope $script:parentModule {
    Describe 'Private\Wait-VMIPAddress' {
        Context 'When VM network adapter reports 2 IP addresses' {
            BeforeAll {
                Mock -CommandName Get-VMNetworkAdapter -MockWith {
                    return @{
                        IpAddresses = @('192.168.0.1', '172.16.0.1')
                    }
                }
            }

            It 'Should return without throwing an exception' {
                $result = Wait-VMIPAddress -Name 'Test' -Verbose

                $result | Should -BeNullOrEmpty
            }
        }

        Context 'When VM network adapter reports 2 IP addresses' {
            BeforeAll {
                Mock -CommandName Start-Sleep
                Mock -CommandName Get-VMNetworkAdapter -MockWith {
                    return $null
                }
            }

            It 'Should throw the correct exception' {
                { Wait-VMIPAddress -Name 'Test' -Timeout 2 -Verbose } | Should -Throw (
                    $script:localizedData.WaitForVMIPAddressTimeoutError -f 'Test', '2'
                )
            }
        }
    }
}
