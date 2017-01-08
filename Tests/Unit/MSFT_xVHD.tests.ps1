$script:DSCModuleName      = 'xHyper-V'
$script:DSCResourceName    = 'MSFT_xVHD'

#region HEADER
# Unit Test Template Version: 1.1.0
[String] $script:moduleRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
if ( (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests'))) -or `
     (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1'))) )
{
    & git @('clone','https://github.com/PowerShell/DscResource.Tests.git',(Join-Path -Path $script:moduleRoot -ChildPath '\DSCResource.Tests\'))
}

Import-Module (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1') -Force
$TestEnvironment = Initialize-TestEnvironment `
    -DSCModuleName $script:DSCModuleName `
    -DSCResourceName $script:DSCResourceName `
    -TestType Unit
#endregion HEADER

# Begin Testing
try
{
    #region Pester Tests
    InModuleScope $script:DSCResourceName {
        # Function to create a exception object for testing output exceptions
        function Get-InvalidArgumentError
        {
            [CmdletBinding()]
            param
            (
                [Parameter(Mandatory)]
                [ValidateNotNullOrEmpty()]
                [System.String]
                $ErrorId,

                [Parameter(Mandatory)]
                [ValidateNotNullOrEmpty()]
                [System.String]
                $ErrorMessage
            )

            $exception = New-Object -TypeName System.ArgumentException `
                -ArgumentList $ErrorMessage
            $errorCategory = [System.Management.Automation.ErrorCategory]::InvalidArgument
            $errorRecord = New-Object -TypeName System.Management.Automation.ErrorRecord `
                -ArgumentList $exception, $ErrorId, $errorCategory, $null
            return $errorRecord
        } # end function Get-InvalidArgumentError

        #region Pester Test Initialization

        $script:VMName = 'HyperVUnitTestsVM'
        $script:TestISOPath = 'd:\test\test.iso'

        $script:splatParentPathFixed = @{
            Name       = 'server'
            Path       = 'C:\VMs'
            ParentPath = 'C:\VMs\Parent'
            Type       = 'Fixed'
            Verbose    = $True
        }

        $script:splatNoParentPathDifferencing = @{
            Name       = 'server'
            Path       = 'C:\VMs'
            Type       = 'Differencing'
            Verbose    = $True
        }

        #region Function Set-TargetResource
        Describe 'MSFT_xVHD\Set-TargetResource' {
            Context 'Parent Path is passed fot a non Differencing disk' {
                It 'should throw exception' {
                    { Set-TargetResource @script:splatParentPathFixed } | Should Throw 'Parent path is only supported for Differencing disks'
                }
            }
            Context 'Differencing disk needs a Parent Path' {
                It 'should throw exception' {
                    { Set-TargetResource @script:splatNoParentPathDifferencing } | Should Throw 'Differencing requires a parent path'
                }
            }
        }
        #endregion

        #region Function Test-TargetResource
        Describe 'MSFT_xVHD\Test-TargetResource' {
            Context 'Parent Path is passed fot a non Differencing disk' {
                It 'should throw exception' {
                    { Test-TargetResource @script:splatParentPathFixed } | Should Throw 'Parent path is only supported for Differencing disks'
                }
            }
            Context 'Differencing disk needs a Parent Path' {
                It 'should throw exception' {
                    { Test-TargetResource @script:splatNoParentPathDifferencing } | Should Throw 'Differencing requires a parent path'
                }
            }
        }
        #endregion
    }
}
finally
{
    #region FOOTER
    Restore-TestEnvironment -TestEnvironment $TestEnvironment
    #endregion
}
