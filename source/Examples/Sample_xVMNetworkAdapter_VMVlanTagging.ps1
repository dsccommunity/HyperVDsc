Configuration Sample_xVMNetworkAdapter_VMVlanTagging
{
    Import-DscResource -ModuleName 'xHyper-V' -Name xVMNetworkAdapter
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    xVMNetworkAdapter MyVM01NIC {
        Id = 'MyVM01-NIC'
        Name = 'MyVM01-NIC'
        SwitchName = 'SETSwitch'
        MacAddress = '001523be0c00'
        VMName = 'MyVM01'
        VlanId = '1'
        Ensure = 'Present'
    }
}
