<#
    .DESCRIPTION
        VM with 4 additional disks.
#>
configuration Example
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

        WindowsFeature HyperVPowerShell
        {
            Ensure = 'Present'
            Name   = 'Hyper-V-PowerShell'
        }

        # Create the VHD for the OS
        VHD DiskOS
        {

            Name             = $diskNameOS
            Path             = $VhdPath
            Generation       = 'vhdx'
            MaximumSizeBytes = 20GB
            Ensure           = 'Present'
            DependsOn        = '[WindowsFeature]HyperV'
        }

        # Create the VM
        VMHyperV NewVM
        {
            Name       = $VMName
            VhdPath    = Join-Path $VhdPath -ChildPath $diskNameOS
            Generation = 1
            Ensure     = 'Present'
            DependsOn  = '[VHD]DiskOS'
        }

        # Ensures a SCSI controller exists on the VM
        VMScsiController Controller
        {
            Ensure           = 'Present'
            VMName           = $VMName
            ControllerNumber = 0
            DependsOn        = '[VMHyperV]NewVM'
        }

        foreach ($i in 0 .. 3)
        {
            $diskName = "$VMName-Disk-$i.vhdx"

            # Create the VHD
            VHD "Disk-$i"
            {

                Name             = $diskName
                Path             = $VhdPath
                Generation       = 'vhdx'
                MaximumSizeBytes = 20GB
                Ensure           = 'Present'
                DependsOn        = '[WindowsFeature]HyperV'
            }

            # Attach the VHD
            VMHardDiskDrive "ExtraDisk-$i"
            {
                VMName             = $VMName
                Path               = Join-Path $VhdPath -ChildPath $diskName
                ControllerType     = 'SCSI'
                ControllerLocation = $i
                Ensure             = 'Present'
                DependsOn          = '[VMScsiController]Controller', "[VHD]Disk-$i"
            }
        }
    }
}
