configuration Sample_xVHD_MissingPropertyVHD
{
    param
    (
        [Parameter(Mandatory)]
        [string]$Name,
        
        [Parameter(Mandatory)]
        [string]$Path,
                
        [ValidateSet(1,2)]
        [Uint32 ]$Generation = 1,

        [ValidateSet("Present","Absent")]
        [string]$Ensure = "Present"    
    )

    Import-DscResource -module xHyper-V

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
