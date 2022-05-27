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
        FileDirectory = MSFT_xFileDirectory
        {
            SourcePath      = $itemToCopy
            DestinationPath = $relativeDestinationPath
        }
    }
}
