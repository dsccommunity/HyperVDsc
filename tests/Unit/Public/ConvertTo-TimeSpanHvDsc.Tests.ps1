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
    Describe 'Public\ConvertTo-TimeSpanHvDsc' {
        It 'Should convert 60 seconds to "System.TimeSpan" of 1 minute' {
            $testSeconds = 60

            $result = ConvertTo-TimeSpanHvDsc -TimeInterval $testSeconds -TimeIntervalType Seconds

            $result.TotalMinutes | Should -Be 1
        }

        It 'Should convert 60 minutes to "System.TimeSpan" of 60 minutes' {
            $testMinutes = 60

            $result = ConvertTo-TimeSpanHvDsc -TimeInterval $testMinutes -TimeIntervalType Minutes

            $result.TotalHours | Should -Be 1
        }

        It 'Should convert 48 hours to "System.TimeSpan" of 2 days' {
            $testHours = 48

            $result = ConvertTo-TimeSpanHvDsc -TimeInterval $testHours -TimeIntervalType Hours

            $result.TotalDays | Should -Be 2
        }

    }
}
