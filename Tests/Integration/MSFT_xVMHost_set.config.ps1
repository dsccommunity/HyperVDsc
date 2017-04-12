configuration MSFT_xVMHost_Set_Config {
    param
    (
        [Parameter(Mandatory)]
        [System.String]
        $VirtualHardDiskPath,

        [Parameter(Mandatory)]
        [System.String]
        $VirtualMachinePath
    )

    Import-DscResource -ModuleName xHyper-V

    node localhost {
        xVMHost Integration_Test {
            IsSingleInstance    = 'Yes'
            VirtualHardDiskPath = $VirtualHardDiskPath
            VirtualMachinePath  = $VirtualMachinePath
        }
    }

}
