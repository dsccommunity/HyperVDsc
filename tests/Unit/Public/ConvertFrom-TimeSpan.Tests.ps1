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
    Describe 'Public\ConvertFrom-TimeSpan' {
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

    }
}
