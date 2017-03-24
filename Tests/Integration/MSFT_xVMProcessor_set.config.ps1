configuration MSFT_xVMProcessor_Set_Config {

    Import-DscResource -ModuleName xHyper-V

    node localhost {
        xVMProcessor Integration_Test {
            VMName                                       = $Node.VMName
            CompatibilityForMigrationEnabled             = $true
            CompatibilityForOlderOperatingSystemsEnabled = $true
        }
    }
}
