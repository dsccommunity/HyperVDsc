configuration Sample_VMHyperV_SimpleWithDvdDrive
{
    param
    (
        [System.String[]]
        $NodeName = 'localhost',

        [Parameter(Mandatory = $true)]
        [System.String]
        $VMName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $VhdPath,

        [System.String]
        $ISOPath
    )

    Import-DscResource -ModuleName 'HyperVDsc'

    Node $NodeName
    {
        # Install HyperV feature, if not installed - Server SKU only
        WindowsFeature HyperV
        {
            Ensure = 'Present'
            Name   = 'Hyper-V'
        }

        # Ensures a VM with default settings
        VMHyperV NewVM
        {
            Ensure    = 'Present'
            Name      = $VMName
            VhdPath   = $VhdPath
            Generation = $VhdPath.Split('.')[-1]
            DependsOn = '[WindowsFeature]HyperV'
        }

        # Adds DVD Drive with ISO
        VMDvdDrive NewVMDvdDriveISO
        {
            Ensure             = 'Present'
            VMName               = $VMName
            ControllerNumber   = 0
            ControllerLocation = 0
            Path               = $ISOPath
            DependsOn          = '[VMHyperV]NewVM'
        }
    }
}
