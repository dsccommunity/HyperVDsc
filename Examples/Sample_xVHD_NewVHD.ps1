configuration Sample_xVHD_NewVhd
{
    param
    (
        [string[]]$NodeName = 'localhost',
        
        [Parameter(Mandatory)]
        [string]$Name,
        
        [Parameter(Mandatory)]
        [string]$Path,
                
        [Parameter(Mandatory)]
        [Uint64]$MaximumSizeBytes,

        [ValidateSet(1,2)]
        [Uint32 ]$Generation = 1,

        [ValidateSet("Present","Absent")]
        [string]$Ensure = "Present"        
    )

    Import-DscResource -module xHyper-V

    Node $NodeName
    {
        # Install HyperV feature, if not installed - Server SKU only
        WindowsFeature HyperV
        {
            Ensure = 'Present'
            Name   = 'Hyper-V'
        }
        
        xVhd NewVhd
        {
            Ensure           = $Ensure
            Name             = $Name
            Path             = $Path
            Generation       = $Generation
            MaximumSizeBytes = $MaximumSizeBytes
            DependsOn        = '[WindowsFeature]HyperV'
        }
    }
}
