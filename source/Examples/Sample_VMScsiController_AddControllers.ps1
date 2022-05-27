configuration Sample_VMScsiController_AddControllers
{
    param
    (
        [Parameter()]
        [System.String[]]
        $NodeName = 'localhost',

        [Parameter(Mandatory = $true)]
        [System.String]
        $VMName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $VhdPath
    )

    Import-DscResource -ModuleName 'HyperVDsc'
    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'

    Node $NodeName
    {
        $diskNameOS = "$VMName-OS.vhdx"

        # Install HyperV feature, if not installed - Server SKU only
        WindowsFeature HyperV
        {
            Ensure = 'Present'
            Name   = 'Hyper-V'
        }

        # Create the VHD for the OS
        VHD DiskOS
        {
            Ensure           = 'Present'
            Name             = $diskNameOS
            Path             = $VhdPath
            Generation       = 'vhdx'
            MaximumSizeBytes = 20GB
            DependsOn        = '[WindowsFeature]HyperV'
        }

        # Create the VM
        VMHyperV NewVM
        {
            Ensure     = 'Present'
            Name       = $VMName
            VhdPath    = Join-Path -Path $VhdPath -ChildPath $diskNameOS
            Generation = 2
            DependsOn  = '[VHD]DiskOS'
        }

        # Add and additional SCSI controller
        VMScsiController Controller
        {
            Ensure           = 'Present'
            VMName           = $VMName
            ControllerNumber = 1
            DependsOn        = '[VMHyperV]NewVM'
        }

    }
}
