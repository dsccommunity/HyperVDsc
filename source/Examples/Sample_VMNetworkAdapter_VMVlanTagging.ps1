Configuration Sample_VMNetworkAdapter_VMVlanTagging
{
    Import-DscResource -ModuleName 'HyperVDsc' -Name VMNetworkAdapter
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    VMNetworkAdapter MyVM01NIC {
        Id = 'MyVM01-NIC'
        Name = 'MyVM01-NIC'
        SwitchName = 'SETSwitch'
        MacAddress = '001523be0c00'
        VMName = 'MyVM01'
        VlanId = '1'
        Ensure = 'Present'
    }
}
