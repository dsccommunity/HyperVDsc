configuration DSC_VMDvdDrive_Add_Config {

    Import-DscResource -ModuleName 'HyperVDsc'

    node localhost {
        VMDvdDrive Integration_Test {
            VMName             = $Node.VMName
            ControllerNumber   = $Node.ControllerNumber
            ControllerLocation = $Node.ControllerLocation
            Path               = $Node.Path
            Ensure             = 'Present'
        }
    }
}
