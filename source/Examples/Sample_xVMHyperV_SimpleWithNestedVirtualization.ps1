configuration Sample_xVMHyperV_SimpleWithNestedVirtualization
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
        $VhdPath,

        [Parameter(Mandatory = $true)]
        [System.UInt64]
        $Memory
    )

    Import-DscResource -ModuleName 'xHyper-V'

    Node $NodeName
    {
        # Install HyperV feature, if not installed - Server SKU only
        WindowsFeature HyperV
        {
            Ensure = 'Present'
            Name   = 'Hyper-V'
        }

        # Ensures a VM with default settings
        xVMHyperV NewVM
        {
            Ensure        = 'Present'
            Name          = $VMName
            VhdPath       = $VhdPath
            Generation    = 2
            StartupMemory = $Memory
            MinimumMemory = $Memory
            MaximumMemory = $Memory
            DependsOn     = '[WindowsFeature]HyperV'
        }

        # Set the VM options
        xVMProcessor NestedVirtualization
        {
            VMName                         = $VMName
            ExposeVirtualizationExtensions = $true
            DependsOn                      = '[xVMHyperV]NewVM'
        }
    }
}
