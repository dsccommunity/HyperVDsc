configuration Sample_xVMScsiController
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
        $VhdPath,   
        
        [Parameter(Mandatory = $true)]
        [string]
        $ControllerNumber
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
            ControllerNumber = $ControllerNumber
            DependsOn        = '[xVMHyperV]NewVM'
        }

    }
}

$mofPath = "C:\temp\Sample_xVMHardDiskDrive"

Sample_xVMScsiController -VMName "test1" -VhdPath "C:\temp\Tests" -ControllerNumber 2 -OutputPath $mofPath
Start-DscConfiguration -Path $mofPath -Verbose -Wait -Force
