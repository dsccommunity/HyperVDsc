<#
    .DESCRIPTION
        Description not yet written.
#>
configuration Example
{
    param
    (
        [Parameter()]
        [System.String[]]
        $NodeName = 'localhost',

        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Path,

        [Parameter()]
        [ValidateSet('Vhd', 'Vhdx')]
        [System.String]
        $Generation = 'Vhd',

        [Parameter()]
        [ValidateSet('Dynamic', 'Fixed', 'Differencing')]
        [System.String]
        $Type = 'Fixed',

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    Import-DscResource -ModuleName 'HyperVDsc'

    Node $NodeName
    {
        # Install HyperV feature, if not installed - Server SKU only
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

        Vhd DiffVhd
        {
            Ensure     = $Ensure
            Name       = $Name
            Path       = $Path
            Generation = $Generation
            Type       = $Type
            DependsOn  = '[WindowsFeature]HyperV', '[WindowsFeature]HyperVPowerShell'
        }
    }
}
