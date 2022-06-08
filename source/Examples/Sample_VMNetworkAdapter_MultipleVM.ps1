Configuration Sample_VMNetworkAdapter_MultipleVM
{
    Import-DscResource -ModuleName 'HyperVDsc' -Name VMNetworkAdapter
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    VMNetworkAdapter MyVM01NIC {
        Id = 'MyVM01-NIC'
        Name = 'MyVM01-NIC'
        SwitchName = 'SETSwitch'
        VMName = 'MyVM01'
        Ensure = 'Present'
    }

    VMNetworkAdapter MyVM02NIC {
        Id = 'MyVM02-NIC'
        Name = 'NetAdapter'
        SwitchName = 'SETSwitch'
        VMName = 'MyVM02'
        Ensure = 'Present'
    }

    VMNetworkAdapter MyVM03NIC {
        Id = 'MyVM03-NIC'
        Name = 'NetAdapter'
        SwitchName = 'SETSwitch'
        VMName = 'MyVM03'
        Ensure = 'Present'
    }
}
