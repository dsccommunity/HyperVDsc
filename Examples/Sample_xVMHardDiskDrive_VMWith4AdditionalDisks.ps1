configuration Sample_xVMHardDiskDrive
{
    param
    (
        [Parameter()]
        [string[]]
        $NodeName = 'localhost',

        [Parameter(Mandatory = $true)]
        [string]
        $VMName,
        
        [Parameter(Mandatory = $true)]
        [string]
        $VhdPath
    )

    Import-DscResource -ModuleName 'xHyper-V'
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
        xVHD DiskOS
        {
            Ensure = 'Present'
            DependsOn = '[WindowsFeature]HyperV'
            Name = $diskNameOS
            Path = $VhdPath
            Generation = 'vhdx'
            MaximumSizeBytes = 20GB
        }

        # Create the VM
        xVMHyperV NewVM
        {
            Ensure     = 'Present'
            Name       = $VMName
            VhdPath    = Join-Path $VhdPath -ChildPath $diskNameOS
            Generation = 1
            DependsOn  = '[xVHD]DiskOS'
        }
        
        # Ensures a SCSI controller exists on the VM
        xVMScsiController Controller
        {
            Ensure           = 'Present'
            VMName           = $VMName
            ControllerNumber = 0
            DependsOn        = '[xVMHyperV]NewVM'
        }
        
        foreach ($i in 0 .. 3) 
        {
            $diskName = "$VMName-Disk-$i.vhdx"

            # Create the VHD
            xVHD "Disk-$i"
            {
                Ensure = 'Present'
                DependsOn = '[WindowsFeature]HyperV'
                Name = $diskName
                Path = $VhdPath
                Generation = 'vhdx'
                MaximumSizeBytes = 20GB
            }

            # Attach the VHD
            xVMHardDiskDrive "ExtraDisk-$i"
            {
                VMName = $VMName
                Path = Join-Path $VhdPath -ChildPath $diskName
                Ensure = 'Present'
                ControllerType = 'SCSI'
                DependsOn = '[xVMScsiController]Controller', "[xVHD]Disk-$i"
            }
        }
    }
}

$mofPath = "C:\temp\Sample_xVMHardDiskDrive"

Sample_xVMHardDiskDrive -VMName "test1" -VhdPath "C:\temp\Tests" -OutputPath $mofPath 
Start-DscConfiguration -Path $mofPath -Verbose -Wait -Force
