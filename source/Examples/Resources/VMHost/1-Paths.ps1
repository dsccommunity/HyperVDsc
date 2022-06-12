<#
    .DESCRIPTION
        Set paths för the Hyper-V host.
#>
Configuration Example
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
