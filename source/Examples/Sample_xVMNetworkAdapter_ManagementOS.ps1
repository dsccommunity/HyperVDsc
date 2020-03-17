Configuration Sample_xVMNetworkAdapter_ManagementOS
{
    Import-DscResource -ModuleName 'xHyper-V' -Name xVMNetworkAdapter
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    xVMNetworkAdapter HostOSAdapter {
        Id = 'Management-NIC'
        Name = 'Management-NIC'
        SwitchName = 'SETSwitch'
        VMName = 'ManagementOS'
        Ensure = 'Present'
    }
}
