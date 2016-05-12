configuration Sample_xVMNetworkAdapter_VM-StaticMacAddress
{
    param
    (
        [string[]]$NodeName = 'localhost',

        [Parameter(Mandatory)]
        [string]$Id,

        [Parameter(Mandatory)]
        [string]$Name,

        [Parameter(Mandatory)]
        [string]$SwitchName,

        [Parameter(Mandatory)]
        [string]$VMName,

        [Parameter(Mandatory)]
        [string]$StaticMacAddress
    )

    Import-DscResource -module xHyper-V

    Node $NodeName
    {
        # Ensures a VM network adapter is attached to a VM
        xVMNetworkAdapter ManagementAdapter
        {
            Ensure            = 'Present'
            Id                = $Id
            Name              = $Name
            SwitchName        = $SwitchName
            VMName            = $VMName
            DynamicMacAddress = $false
            StaticMacAddress  = $StaticMacAddress
        }
    }
}
