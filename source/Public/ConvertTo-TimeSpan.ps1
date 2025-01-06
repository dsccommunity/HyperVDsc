<#
    .SYNOPSIS
    Converts a number of seconds, minutes, hours or days into a System.TimeSpan object.

    .PARAMETER TimeInterval
    The total number of seconds, minutes, hours or days to convert.

    .PARAMETER TimeSpanType
    Convert using specified interval type.
#>
function ConvertTo-TimeSpan
{
    [CmdletBinding()]
    [OutputType([System.TimeSpan])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.UInt32]
        $TimeInterval,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Seconds','Minutes','Hours','Days')]
        [System.String]
        $TimeIntervalType
    )

    $newTimeSpanParams = @{ }
    switch ($TimeIntervalType)
    {
        'Seconds' { $newTimeSpanParams['Seconds'] = $TimeInterval }
        'Minutes' { $newTimeSpanParams['Minutes'] = $TimeInterval }
        'Hours' { $newTimeSpanParams['Hours'] = $TimeInterval }
        'Days' { $newTimeSpanParams['Days'] = $TimeInterval }
    }
    return (New-TimeSpan @newTimeSpanParams)
}
