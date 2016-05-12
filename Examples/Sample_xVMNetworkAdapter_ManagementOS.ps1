configuration Sample_xVMNetworkAdapter_ManagementOS
{
    param
    (
        [string[]]$NodeName = 'localhost',

        [Parameter(Mandatory)]
        [string]$Id,

        [Parameter(Mandatory)]
        [string]$Name,

        [Parameter(Mandatory)]
        [string]$SwitchName
    )

    Import-DscResource -module xHyper-V

    Node $NodeName
    {
        # Ensures a VM network adapter is attached to the management OS
        xVMNetworkAdapter ManagementAdapter
        {
            Ensure         = 'Present'
            Id             = $Id
            Name           = $Name
            SwitchName     = $SwitchName
            VMName         = 'Management OS'
        }
    }
}
