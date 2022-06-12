<#
    .DESCRIPTION
        Create a VM with nested virtualization.
#>
configuration Sample_VMHyperV_SimpleWithNestedVirtualization
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

    Import-DscResource -ModuleName 'HyperVDsc'

    Node $NodeName
    {
        # Install HyperV feature, if not installed - Server SKU only
        WindowsFeature HyperV
        {
            Ensure = 'Present'
            Name   = 'Hyper-V'
        }

        # Ensures a VM with default settings
        VMHyperV NewVM
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
        VMProcessor NestedVirtualization
        {
            VMName                         = $VMName
            ExposeVirtualizationExtensions = $true
            DependsOn                      = '[VMHyperV]NewVM'
        }
    }
}
