configuration Sample_xVMHyperV_Simple
{
    param
    (
        [string[]]$NodeName = 'localhost',

        [Parameter(Mandatory = $true)]
        [string]$VMName,

        [Parameter(Mandatory = $true)]
        [string]$VhdPath
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
            Ensure    = 'Present'
            Name      = $VMName
            VhdPath   = $VhdPath
            Generation = 2
            DependsOn = '[WindowsFeature]HyperV'
        }
    }
}
