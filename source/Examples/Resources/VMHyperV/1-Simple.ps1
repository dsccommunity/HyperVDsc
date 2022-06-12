<#
    .DESCRIPTION
        Create a new VM.
#>
configuration Sample_VMHyperV_Simple
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
        $VhdPath
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
            Ensure    = 'Present'
            Name      = $VMName
            VhdPath   = $VhdPath
            Generation = 2
            DependsOn = '[WindowsFeature]HyperV'
        }
    }
}
