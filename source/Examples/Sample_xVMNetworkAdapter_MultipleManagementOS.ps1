Configuration Sample_xVMNetworkAdapter_MultipleManagementOS
{
    Import-DscResource -ModuleName 'xHyper-V' -Name xVMNetworkAdapter
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    xVMNetworkAdapter ManagementAdapter {
        Id = 'Management-NIC'
        Name = 'Management-NIC'
        SwitchName = 'SETSwitch'
        VMName = 'ManagementOS'
        Ensure = 'Present'
    }

    xVMNetworkAdapter ClusterAdapter {
        Id = 'Cluster-NIC'
        Name = 'Cluster-NIC'
        SwitchName = 'SETSwitch'
        VMName = 'ManagementOS'
        Ensure = 'Present'
    }
}
