<#
    .DESCRIPTION
        VM using dynamic memory.
#>
configuration Sample_VMHyperV_DynamicMemory
{
    param
    (
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
        $StartupMemory,

        [Parameter(Mandatory = $true)]
        [System.UInt64]
        $MinimumMemory,

        [Parameter(Mandatory = $true)]
        [System.UInt64]
        $MaximumMemory
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

        # Ensures a VM with dynamic memory
        VMHyperV NewVM
        {
            Ensure        = 'Present'
            Name          = $VMName
            VhdPath       = $VhdPath
            Generation    = 2
            StartupMemory = $StartupMemory
            MinimumMemory = $MinimumMemory
            MaximumMemory = $MaximumMemory
            DependsOn     = '[WindowsFeature]HyperV'
        }
    }
}
