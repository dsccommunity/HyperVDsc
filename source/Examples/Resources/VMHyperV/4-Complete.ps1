<#
    .DESCRIPTION
        Complete example.
#>
configuration Sample_VMHyperV_Complete
{
    param
    (
        [System.String[]]
        $NodeName = 'localhost',

        [Parameter(Mandatory = $true)]
        [System.String]
        $VMName,

        [Parameter(Mandatory = $true)]
        [System.UInt64]
        $VhdSizeBytes,

        [Parameter(Mandatory = $true)]
        [System.UInt64]
        $StartupMemory,

        [Parameter(Mandatory = $true)]
        [System.UInt64]
        $MinimumMemory,

        [Parameter(Mandatory = $true)]
        [System.UInt64]
        $MaximumMemory,

        [Parameter(Mandatory = $true)]
        [System.String]
        $SwitchName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Path,

        [Parameter(Mandatory = $true)]
        [System.UInt32]
        $ProcessorCount,

        [ValidateSet('Off','Paused','Running')]
        [System.String]
        $State = 'Off',

        [Switch]
        $WaitForIP,

        [System.Boolean]
        $AutomaticCheckpointsEnabled
    )

    Import-DscResource -ModuleName 'HyperVDsc'

    Node $NodeName
    {
        # Logic to handle both Client and Server OS
        # Configuration needs to be compiled on target server
        $Operatingsystem = Get-CimInstance -ClassName Win32_OperatingSystem
        if ($Operatingsystem.ProductType -eq 1)
        {
            # Client OS, install Hyper-V as OptionalFeature
            $HyperVDependency = '[WindowsOptionalFeature]HyperV'
            WindowsOptionalFeature HyperV
            {
                Ensure = 'Enable'
                Name = 'Microsoft-Hyper-V-All'
            }
        }
        else {
            # Server OS, install HyperV as WindowsFeature
            $HyperVDependency = '[WindowsFeature]HyperV','[WindowsFeature]HyperVPowerShell'
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
        }

        # Create new VHD
        Vhd NewVhd
        {
            Ensure           = 'Present'
            Name             = "$VMName-OSDisk.vhdx"
            Path             = $Path
            Generation       = 'vhdx'
            MaximumSizeBytes = $VhdSizeBytes
            DependsOn        = $HyperVDependency
        }

        # Ensures a VM with all the properties
        VMHyperV NewVM
        {
            Ensure          = 'Present'
            Name            = $VMName
            VhdPath         = (Join-Path -Path $Path -ChildPath "$VMName-OSDisk.vhdx")
            SwitchName      = $SwitchName
            State           = $State
            Path            = $Path
            Generation      = 2
            StartupMemory   = $StartupMemory
            MinimumMemory   = $MinimumMemory
            MaximumMemory   = $MaximumMemory
            ProcessorCount  = $ProcessorCount
            MACAddress      = $MACAddress
            RestartIfNeeded = $true
            WaitForIP       = $WaitForIP
            AutomaticCheckpointsEnabled = $AutomaticCheckpointsEnabled
            DependsOn       = '[Vhd]NewVhd'
        }
    }
}
