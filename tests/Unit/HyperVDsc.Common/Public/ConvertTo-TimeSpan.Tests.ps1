#region HEADER
$script:projectPath = "$PSScriptRoot\..\..\..\.." | Convert-Path
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

$script:subModuleName = ('{0}.Common' -f $script:projectName)
$script:subModuleFile = Join-Path -Path $script:subModulesFolder -ChildPath "$($script:subModuleName)"

Import-Module $script:subModuleFile -Force -ErrorAction 'Stop'
#endregion HEADER

# Import the stub functions.
#Get-Module -Name 'Hyper-V' -All | Remove-Module -Force
Import-Module -Name "$PSScriptRoot/../../Stubs/Hyper-V.stubs.psm1" -Force -DisableNameChecking

InModuleScope $script:subModuleName {
    Describe 'Public\ConvertTo-TimeSpan' {
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

    }
}
