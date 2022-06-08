configuration DSC_VMProcessor_Set_Config {

    Import-DscResource -ModuleName 'HyperVDsc'

    node localhost {
        xVMProcessor Integration_Test {
            VMName                                       = $Node.VMName
            CompatibilityForMigrationEnabled             = $Node.CompatibilityForMigrationEnabled
            CompatibilityForOlderOperatingSystemsEnabled = $Node.CompatibilityForOlderOperatingSystemsEnabled
        }
    }
}
