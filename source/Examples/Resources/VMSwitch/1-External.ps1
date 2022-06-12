<#
    .DESCRIPTION
        Creates a switch of the type External.
#>
configuration Sample_VMSwitch_External
{
    param
    (
        [System.String[]]
        $NodeName = 'localhost',

        [Parameter(Mandatory = $true)]
        [System.String]
        $SwitchName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $NetAdapterName
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
        VMSwitch ExternalSwitch
        {
            Ensure         = 'Present'
            Name           = $SwitchName
            Type           = 'External'
            NetAdapterName = $NetAdapterName
            DependsOn      = '[WindowsFeature]HyperV'
        }
    }
}
