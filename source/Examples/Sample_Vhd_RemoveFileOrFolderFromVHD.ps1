Configuration Sample_Vhd_RemoveFileOrFolderFromVHD
{
    param
    (
        [Parameter()]
        $vhdPath = 'C:\temp\disk.vhdx',

        [Parameter()]
        $relativeDestinationPath = 'Temp',

        [Parameter()]
        $Ensure = 'Absent'
    )

    Import-DscResource -ModuleName 'HyperVDsc'

    VhdFile RemoveFile
    {
        VhdPath       = $vhdPath
        FileDirectory = MSFT_xFileDirectory
        {
            DestinationPath = $relativeDestinationPath
            Ensure          = $Ensure
        }
    }
}
