configuration Sample_xVHD_MissingPropertyVHD
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Path,

        [Parameter()]
        [ValidateSet('Vhd', 'Vhdx')]
        [System.String]
        $Generation = 'Vhd',

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    Import-DscResource -ModuleName 'xHyper-V'

    Node localhost
    {
        xVHD WrongVHD
        {
            Ensure     = $Ensure
            Name       = $Name
            Path       = $Path
            Generation = $Generation
        }
    }
}
