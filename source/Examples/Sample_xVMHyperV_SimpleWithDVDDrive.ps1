configuration Sample_xVMHyperV_SimpleWithDvdDrive
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

    Import-DscResource -ModuleName 'xHyper-V'

    Node $NodeName
    {
        # Install HyperV feature, if not installed - Server SKU only
        WindowsFeature HyperV
        {
            Ensure = 'Present'
            Name   = 'Hyper-V'
        }

        # Ensures a VM with default settings
        xVMHyperV NewVM
        {
            Ensure    = 'Present'
            Name      = $VMName
            VhdPath   = $VhdPath
            Generation = $VhdPath.Split('.')[-1]
            DependsOn = '[WindowsFeature]HyperV'
        }

        # Adds DVD Drive with ISO
        xVMDvdDrive NewVMDvdDriveISO
        {
            Ensure             = 'Present'
            VMName               = $VMName
            ControllerNumber   = 0
            ControllerLocation = 0
            Path               = $ISOPath
            DependsOn          = '[xVMHyperV]NewVM'
        }
    }
}
