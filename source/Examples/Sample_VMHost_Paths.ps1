Configuration Sample_VMHost_Paths
{
    param
    (
        [Parameter()]
        $VirtualHardDiskPath = 'C:\VMDisks',

        [Parameter()]
        $VirtualMachinePath = 'C:\VMs'
    )

    Import-DscResource -ModuleName 'HyperVDsc'

    VMHost HyperVHostPaths
    {
        IsSingleInstance    = 'Yes'
        VirtualHardDiskPath = $VirtualHardDiskPath
        VirtualMachinePath  = $VirtualMachinePath
    }
}
