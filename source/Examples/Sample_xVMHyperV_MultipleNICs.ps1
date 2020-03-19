Configuration Sample_xVMHyperV_MultipleNICs
{
    param
    (
        [Parameter()]
        [System.String[]]
        $NodeName = 'localhost',

        [Parameter()]
        [System.String]
        $VMName = 'TestVM',

        [Parameter()]
        [System.String]
        $VhdPath = 'C:\temp\disk.vhdx',

        [Parameter()]
        [System.String[]]
        $SwitchName = @('MySwitch'),

        [Parameter()]
        [System.String[]]
        $MACAddress = '0000000'
    )

    Import-DscResource -ModuleName 'xHyper-V'

    Node $NodeName
    {
        # Install HyperV features, if not installed - Server SKU only
        WindowsFeature HyperV
        {
            Ensure = 'Present'
            Name   = 'Hyper-V'
        }

        WindowsFeature HyperVPowerShell
        {
            Ensure = 'Present'
            Name   = 'Hyper-V-PowerShell'
        }

        # Dynamically build the 'DependsOn' array for the 'xVMHyperV' feature
        # based on the number of virtual switches specified
        $xVMHyperVDependsOn = @('[WindowsFeature]HyperV','[WindowsFeature]HyperVPowerShell')

        # Create each virtual switch
        foreach ($vmSwitch in $SwitchName)
        {
            # Remove spaces and hyphens from the identifier
            $vmSwitchName = $vmSwitch -replace ' ','' -replace '-',''
            # Add the virtual switch dependency
            $xVMHyperVDependsOn += "[xVMSwitch]$vmSwitchName"

            xVMSwitch $vmSwitchName
            {
                Ensure         = 'Present'
                Name           = $vmSwitch
                Type           = 'Internal'
                DependsOn      = '[WindowsFeature]HyperV','[WindowsFeature]HyperVPowerShell'
            }
        }

        # Ensures a VM with all the properties
        xVMHyperV $VMName
        {
            Ensure     = 'Present'
            Name       = $VMName
            VhdPath    = $VhdPath
            SwitchName = $SwitchName
            MACAddress = $MACAddress
            # Use the dynamically created dependency list/array
            DependsOn  = $xVMHyperVDependsOn
        }
    }
}
