<#
    .DESCRIPTION
        Add a network adapter that is using static IP address.
#>
Configuration Example
{
    Import-DscResource -ModuleName 'HyperVDsc'

    VMNetworkAdapter MyVM01NIC
    {
        Ensure = 'Present'
        Id = 'MyVM01-NIC'
        Name = 'MyVM01-NIC'
        SwitchName = 'SETSwitch'
        MacAddress = '001523be0c00'
        VMName = 'MyVM01'
        NetworkSetting = VMNetworkAdapterNetworkSettings
        {
            IpAddress = '192.168.0.100'
            Subnet = '255.255.255.255'
            DefaultGateway = '192.168.0.1'
            DnsServers = @( '192.168.0.1', '192.168.0.2' )
        }
    }
}
