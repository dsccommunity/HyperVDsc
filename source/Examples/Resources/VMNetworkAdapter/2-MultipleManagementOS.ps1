<#
    .DESCRIPTION
        Description not yet written.
#>
Configuration Sample_VMNetworkAdapter_MultipleManagementOS
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
