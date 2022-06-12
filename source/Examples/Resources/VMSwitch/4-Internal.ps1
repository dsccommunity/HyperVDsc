<#
    .DESCRIPTION
        Creates a switch of the type Internal.
#>
configuration Example
{
    param
    (
        [System.String[]]
        $NodeName = 'localhost',

        [Parameter(Mandatory = $true)]
        [System.String]
        $SwitchName
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
        VMSwitch InternalSwitch
        {
            Ensure         = 'Present'
            Name           = $SwitchName
            Type           = 'Internal'
            DependsOn      = '[WindowsFeature]HyperV'
        }
    }
}
