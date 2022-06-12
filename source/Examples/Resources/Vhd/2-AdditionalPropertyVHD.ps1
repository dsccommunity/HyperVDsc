<#
    .DESCRIPTION
        Description not yet written.
#>
configuration Example
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Path,

        [Parameter(Mandatory = $true)]
        [System.String]
        $ParentPath,

        [Parameter(Mandatory = $true)]
        [System.String]
        $MaximumSizeBytes,

        [Parameter()]
        [ValidateSet('Vhd', 'Vhdx')]
        [System.String]
        $Generation = 'Vhd',

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    Import-DscResource -ModuleName 'HyperVDsc'

    Node localhost
    {
        Vhd WrongVHD
        {
            Ensure           = $Ensure
            Name             = $Name
            Path             = $Path
            ParentPath       = $ParentPath
            MaximumSizeBytes = $MaximumSizeBytes
            Generation       = $Generation
        }
    }
}
