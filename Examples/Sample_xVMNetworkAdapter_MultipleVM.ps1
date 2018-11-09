Configuration VMAdapter
{
    Import-DscResource -ModuleName xHyper-V -Name xVMNetworkAdapter
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    xVMNetworkAdapter MyVM01NIC {
        Id = 'MyVM01-NIC'
        Name = 'MyVM01-NIC'
        SwitchName = 'SETSwitch'
        VMName = 'MyVM01'
        NetworkSetting = xNetworkSettings {
            Dhcp = $true
        }
        Ensure = 'Present'
    }

    xVMNetworkAdapter MyVM02NIC {
        Id = 'MyVM02-NIC'
        Name = 'NetAdapter'
        SwitchName = 'SETSwitch'
        VMName = 'MyVM02'
        NetworkSetting = xNetworkSettings {
            Dhcp = $true
        }
        Ensure = 'Present'
    }

    xVMNetworkAdapter MyVM03NIC {
        Id = 'MyVM03-NIC'
        Name = 'NetAdapter'
        SwitchName = 'SETSwitch'
        VMName = 'MyVM03'
        NetworkSetting = xNetworkSettings {
            Dhcp = $true
        }
        Ensure = 'Present'
    }
}
