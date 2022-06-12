<#
    .DESCRIPTION
        Description not yet written.
#>
Configuration Example
{
    Import-DscResource -ModuleName 'HyperVDsc' -Name VMNetworkAdapter
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    VMNetworkAdapter ManagementAdapter {
        Id = 'Management-NIC'
        Name = 'Management-NIC'
        SwitchName = 'SETSwitch'
        VMName = 'ManagementOS'
        Ensure = 'Present'
    }

    VMNetworkAdapter ClusterAdapter {
        Id = 'Cluster-NIC'
        Name = 'Cluster-NIC'
        SwitchName = 'SETSwitch'
        VMName = 'ManagementOS'
        Ensure = 'Present'
    }
}
