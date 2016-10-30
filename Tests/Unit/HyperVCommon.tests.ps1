$script:DSCModuleName      = 'xHyper-V'
$script:DSCResourceName    = 'HyperVCommon'

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

    $LocalizedData = InModuleScope $script:DSCResourceName {
        $LocalizedData
    }

    function Get-InvalidOperationError
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

        $exception = New-Object -TypeName System.InvalidOperationException `
            -ArgumentList $ErrorMessage
        $errorCategory = [System.Management.Automation.ErrorCategory]::InvalidOperation
        $errorRecord = New-Object -TypeName System.Management.Automation.ErrorRecord `
            -ArgumentList $exception, $ErrorId, $errorCategory, $null
        return $errorRecord
    } # end function Get-InvalidOperationError

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
}
finally
{
    #region FOOTER
    Restore-TestEnvironment -TestEnvironment $TestEnvironment
    #endregion

}
