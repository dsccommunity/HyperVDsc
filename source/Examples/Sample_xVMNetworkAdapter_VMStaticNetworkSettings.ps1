Configuration Sample_xVMNetworkAdapter_VMStaticNetworkSettings
{
    Import-DscResource -ModuleName 'xHyper-V'

    xVMNetworkAdapter MyVM01NIC
    {
        Ensure = 'Present'
        Id = 'MyVM01-NIC'
        Name = 'MyVM01-NIC'
        SwitchName = 'SETSwitch'
        MacAddress = '001523be0c00'
        VMName = 'MyVM01'
        NetworkSetting = xNetworkSettings
        {
            IpAddress = '192.168.0.100'
            Subnet = '255.255.255.255'
            DefaultGateway = '192.168.0.1'
            DnsServer = '192.168.0.1'
        }
    }
}
