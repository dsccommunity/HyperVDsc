#region HEADER

# Unit Test Template Version: 1.2.0
$script:moduleRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
if ( (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests'))) -or `
    (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1'))) )
{
    & git @('clone', 'https://github.com/PowerShell/DscResource.Tests.git', (Join-Path -Path $script:moduleRoot -ChildPath '\DSCResource.Tests\'))
}

Import-Module -Name (Join-Path -Path $script:moduleRoot -ChildPath (Join-Path -Path 'DSCResource.Tests' -ChildPath 'TestHelper.psm1')) -Force

$TestEnvironment = Initialize-TestEnvironment `
    -DSCModuleName 'xHyper-V' `
    -DSCResourceName 'MSFT_xVHD' `
    -TestType Unit

#endregion HEADER

function Invoke-TestSetup
{

}

function Invoke-TestCleanup
{
    Restore-TestEnvironment -TestEnvironment $TestEnvironment
}

# Begin Testing
try
{
    Invoke-TestSetup

    InModuleScope 'MSFT_xVHD' {

        Describe 'MSFT_xVHD\Test-TargetResource' {

            # Mocks "Get-Module -Name Hyper-V" so that the DSC resource thinks the Hyper-V module is on the test system
            Mock -CommandName Get-Module -ParameterFilter { ($Name -eq 'Hyper-V') -and ($ListAvailable -eq $true) } -MockWith {
                return $true
            }

            Context 'Parameter validation' {
                It 'Fixed and Dynamic VHDs need MaximumSizeBytes specified' {
                    { Test-TargetResource -Name 'server' -Path 'C:\VMs' -Type 'Dynamic' } |
                        Should Throw 'Specify MaximumSizeBytes property for Fixed and Dynamic VHDs.'
                }

                It 'Parent Path is passed for a non Differencing disk' {
                    { Test-TargetResource -Name 'server' -Path 'C:\VMs' -ParentPath 'C:\VMs\Parent' -Type 'Fixed' -MaximumSizeBytes 1GB } |
                        Should Throw 'Parent path is only supported for Differencing disks'
                }

                It 'Differencing disk needs a Parent Path' {
                    { Test-TargetResource -Name 'server' -Path 'C:\VMs' -Type 'Differencing' } |
                        Should Throw 'Differencing requires a parent path'
                }
            }
        }
    }
}
finally
{
    Invoke-TestCleanup
}
