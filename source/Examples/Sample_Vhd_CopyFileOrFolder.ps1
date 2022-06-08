Configuration Sample_Vhd_CopyFileOrFolder
{
    param
    (
        [Parameter()]
        $vhdPath = 'C:\temp\disk.vhdx',

        [Parameter()]
        $itemToCopy = 'C:\Temp',

        [Parameter()]
        $relativeDestinationPath = 'Temp'
    )

    Import-DscResource -ModuleName 'HyperVDsc'

    VhdFile FileCopy
    {
        VhdPath       = $vhdPath
        FileDirectory = DSC_FileDirectory
        {
            SourcePath      = $itemToCopy
            DestinationPath = $relativeDestinationPath
        }
    }
}
