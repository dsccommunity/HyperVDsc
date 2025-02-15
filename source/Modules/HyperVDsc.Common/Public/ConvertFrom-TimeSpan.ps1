<#
    .SYNOPSIS
    Converts a System.TimeSpan into the number of seconds, minutes, hours or days.

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
        [Parameter(Mandatory = $true)]
        [System.TimeSpan]
        $TimeSpan,

        [Parameter(Mandatory = $true)]
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
