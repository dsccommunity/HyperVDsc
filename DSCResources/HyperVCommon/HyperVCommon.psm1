#region localizeddata
if (Test-Path "${PSScriptRoot}\${PSUICulture}")
{
    Import-LocalizedData `
        -BindingVariable LocalizedData `
        -Filename HyperVCommon.strings.psd1 `
        -BaseDirectory "${PSScriptRoot}\${PSUICulture}"
}
else
{
    #fallback to en-US
    Import-LocalizedData `
        -BindingVariable LocalizedData `
        -Filename HyperVCommon.strings.psd1 `
        -BaseDirectory "${PSScriptRoot}\en-US"
}
#endregion

<#
    .SYNOPSIS
    Throws an InvalidOperation custom exception.

    .PARAMETER ErrorId
    The error Id of the exception.

    .PARAMETER ErrorMessage
    The error message text to set in the exception.
#>
function New-InvalidOperationError
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
    throw $errorRecord
} # end function New-InvalidOperationError

<#
    .SYNOPSIS
    Throws an InvalidArgument custom exception.

    .PARAMETER ErrorId
    The error Id of the exception.

    .PARAMETER ErrorMessage
    The error message text to set in the exception.
#>
function New-InvalidArgumentError
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
    throw $errorRecord
} # end function New-InvalidArgumentError


<#
    .SYNOPSIS
    Ensures that the specified PowerShell module(s) are installed.

    .PARAMETER Name
    Name of the PowerShell module to check is installed.
#>
function Assert-Module
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [System.String[]] $Name
    )

    if (-not (Get-Module -Name $Name -ListAvailable))
    {
        $errorMessage = $localizedData.RoleMissingError -f $Name
        New-InvalidOperationError -ErrorId MissingRole -ErrorMessage $errorMessage
    }

} #end function


<#
    .SYNOPSIS
    Converts a number of seconds, mintutes, hours or days into a System.TimeSpan object.

    .PARAMETER TimeInterval
    The total number of seconds, mintues, hours or days to convert.

    .PARAMETER TimeSpanType
    Convert using specified interval type.
#>
function ConvertTo-TimeSpan
{
    [CmdletBinding()]
    [OutputType([System.TimeSpan])]
    param
    (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.UInt32]
        $TimeInterval,

        [Parameter(Mandatory)]
        [ValidateSet('Seconds','Minutes','Hours','Days')]
        [System.String]
        $TimeIntervalType
    )

    $newTimeSpanParams = @{ };
    switch ($TimeIntervalType)
    {
        'Seconds' { $newTimeSpanParams['Seconds'] = $TimeInterval }
        'Minutes' { $newTimeSpanParams['Minutes'] = $TimeInterval }
        'Hours' { $newTimeSpanParams['Hours'] = $TimeInterval }
        'Days' { $newTimeSpanParams['Days'] = $TimeInterval }
    }
    return (New-TimeSpan @newTimeSpanParams)

} #end function ConvertTo-TimeSpan


<#
    .SYNOPSIS
    Converts a System.TimeSpan into the number of seconds, mintutes, hours or days.

    .PARAMETER TimeSpan
    TimeSpan to convert into an integer

    .PARAMETER TimeSpanType
    Convert timespan into the total number of seconds, minutes, hours or days.
#>
function ConvertFrom-TimeSpan
{
    [CmdletBinding()]
    [OutputType([System.Int32])]
    param
    (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.TimeSpan]
        $TimeSpan,

        [Parameter(Mandatory)]
        [ValidateSet('Seconds','Minutes','Hours','Days')]
        [System.String]
        $TimeSpanType
    )

    switch ($TimeSpanType)
    {
        'Seconds' { return $TimeSpan.TotalSeconds -as [System.UInt32] }
        'Minutes' { return $TimeSpan.TotalMinutes -as [System.UInt32] }
        'Hours' { return $TimeSpan.TotalHours -as [System.UInt32] }
        'Days' { return $TimeSpan.TotalDays -as [System.UInt32] }
    }

} #end function ConvertFrom-TimeSpan
