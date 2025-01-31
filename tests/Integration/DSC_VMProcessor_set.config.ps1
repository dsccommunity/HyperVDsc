configuration DSC_VMProcessor_Set_Config {

    Import-DscResource -ModuleName 'HyperVDsc'

    node localhost {
        VMProcessor Integration_Test {
            VMName                                       = $Node.VMName
            CompatibilityForMigrationEnabled             = $Node.CompatibilityForMigrationEnabled
            CompatibilityForOlderOperatingSystemsEnabled = $Node.CompatibilityForOlderOperatingSystemsEnabled
        }
    }
}
