<#
    .SYNOPSIS
        Creates a Generation 2 VM with the Trusted Platform Module (TPM) enabled.

    .DESCRIPTION
        Creates a new Generation 2 virtual machine and enables the Trusted
        Platform Module (TPM) on it.

    .PARAMETER NodeName
        The names of one or more nodes to compile a configuration for.
        Defaults to 'localhost'.

    .PARAMETER VMName
        The name of the virtual machine to create.

    .PARAMETER VhdPath
        The path to the VHDX file to associate with the virtual machine.

    .INPUTS
        None.

    .OUTPUTS
        None.

    .EXAMPLE
        Example -VMName 'TPMVM' -VhdPath 'C:\VMs\TPMVM.vhdx'

        Compiles a configuration that creates a Generation 2 VM named 'TPMVM'
        with TPM enabled.
#>
configuration Example
{
    param
    (
        [System.String[]]
        $NodeName = 'localhost',

        [Parameter(Mandatory = $true)]
        [System.String]
        $VMName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $VhdPath
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

        # Ensures a VM with default settings
        VMHyperV NewVM
        {
            Ensure    = 'Present'
            Name      = $VMName
            VhdPath   = $VhdPath
            Generation = 2
            EnableTPM = $true
            DependsOn = '[WindowsFeature]HyperV'
        }
    }
}
