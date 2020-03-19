# End to end sample for x-Hyper-v
Configuration Sample_EndToEndXHyperV_RunningVM
{
    param
    (
        [Parameter()]
        $vhdPath = 'C:\temp\disk.vhdx',

        [Parameter()]
        $Name = 'Disk1',

        [Parameter()]
        $unattendedFilePathToCopy = 'C:\Media\unattended.xml'
    )

    Import-DscResource -ModuleName 'xHyper-V'

    # Create a switch to be used by the VM
    xVMSwitch switch
    {
        Name   = 'Test-Switch'
        Ensure = 'Present'
        Type   = 'Internal'
    }

    # Create new VHD file.
    xVHD NewVHD1
    {

        Ensure     = 'Present'
        Name       = $name
        Path       = (Split-Path $vhdPath)
        Generation = 'vhd'
        ParentPath = $vhdPath
    }

    # Customize VHD by copying a folders/files to the VHD before a VM can be created
    # Example below shows copying unattended.xml before a VM can be created
    xVhdFile CopyUnattendxml
    {
        VhdPath       = $vhdPath
        FileDirectory = MSFT_xFileDirectory
        {
            SourcePath      = $unattendedFilePathToCopy
            DestinationPath = 'unattended.xml'
        }
    }

    # create the testVM out of the vhd.
    xVMHyperV testvm
    {
        Name            = "$($name)_vm"
        SwitchName      = 'Test-Switch'
        VhdPath         = Join-path (Split-Path $vhdPath) "$name.vhd"
        ProcessorCount  = 2
        MaximumMemory   = 1GB
        MinimumMemory   = 512MB
        RestartIfNeeded = $true
        DependsOn       = '[xVHD]NewVHD1', '[xVMSwitch]switch', '[xVhdFile]CopyUnattendxml'
        State           = 'Running'
    }
}
