configuration MSFT_VMDvdDrive_Remove_Config {

    Import-DscResource -ModuleName 'HyperVDsc'

    node localhost {
        VMDvdDrive Integration_Test {
            VMName             = $Node.VMName
            ControllerNumber   = $Node.ControllerNumber
            ControllerLocation = $Node.ControllerLocation
            Path               = $Node.Path
            Ensure             = 'Absent'
        }
    }
}
