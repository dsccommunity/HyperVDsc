configuration Sample_xVMNetworkAdapter_VM
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
        [string]$VMName
    )

    Import-DscResource -module xHyper-V

    Node $NodeName
    {
        # Ensures a VM network adapter is attached to a VM
        xVMNetworkAdapter ManagementAdapter
        {
            Ensure         = 'Present'
            Id             = $Id
            Name           = $Name
            SwitchName     = $SwitchName
            VMName         = $VMName
        }
    }
}
