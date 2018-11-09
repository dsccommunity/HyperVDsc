Configuration HostOSAdapter
{
    Import-DscResource -ModuleName xHyper-V -Name xVMNetworkAdapter
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    xVMNetworkAdapter HostOSAdapter {
        Id = 'Management-NIC'
        Name = 'Management-NIC'
        SwitchName = 'SETSwitch'
        VMName = 'ManagementOS'
        NetworkSetting = xNetworkSettings {
            Dhcp = $true
        }
        Ensure = 'Present'
    }
}
