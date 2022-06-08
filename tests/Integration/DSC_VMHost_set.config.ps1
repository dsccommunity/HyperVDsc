configuration DSC_VMHost_Set_Config
{
    param
    (
        [Parameter(Mandatory  = $true)]
        [System.String]
        $VirtualHardDiskPath,

        [Parameter(Mandatory = $true)]
        [System.String]
        $VirtualMachinePath,

        [Parameter()]
        [System.Boolean]
        $EnableEnhancedSessionMode
    )

    Import-DscResource -ModuleName 'xHyperV'

    node localhost {
        VMHost Integration_Test {
            IsSingleInstance          = 'Yes'
            VirtualHardDiskPath       = $VirtualHardDiskPath
            VirtualMachinePath        = $VirtualMachinePath
            EnableEnhancedSessionMode = $EnableEnhancedSessionMode
        }
    }

}
