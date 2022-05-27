Configuration Sample_VMNetworkAdapter_MultipleVMMACAddress
{
    Import-DscResource -ModuleName 'HyperVDsc' -Name VMNetworkAdapter
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    VMNetworkAdapter MyVM01NIC {
        Id = 'MyVM01-NIC'
        Name = 'MyVM01-NIC'
        SwitchName = 'SETSwitch'
        MacAddress = '001523be0c00'
        VMName = 'MyVM01'
        Ensure = 'Present'
    }

    VMNetworkAdapter MyVM02NIC {
        Id = 'MyVM02-NIC'
        Name = 'MyVM02-NIC'
        SwitchName = 'SETSwitch'
        MacAddress = '001523be0c00'
        VMName = 'MyVM02'
        Ensure = 'Present'
    }
}
