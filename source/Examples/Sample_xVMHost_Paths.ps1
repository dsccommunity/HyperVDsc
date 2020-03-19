Configuration Sample_xVMHost_Paths
{
    param
    (
        [Parameter()]
        $VirtualHardDiskPath = 'C:\VMDisks',

        [Parameter()]
        $VirtualMachinePath = 'C:\VMs'
    )

    Import-DscResource -ModuleName 'xHyper-V'

    xVMHost HyperVHostPaths
    {
        IsSingleInstance    = 'Yes'
        VirtualHardDiskPath = $VirtualHardDiskPath
        VirtualMachinePath  = $VirtualMachinePath
    }
}
