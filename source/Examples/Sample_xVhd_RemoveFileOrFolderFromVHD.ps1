Configuration Sample_xVhd_RemoveFileOrFolderFromVHD
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

    Import-DscResource -ModuleName 'xHyper-V'

    xVhdFile RemoveFile
    {
        VhdPath       = $vhdPath
        FileDirectory = MSFT_xFileDirectory
        {
            DestinationPath = $relativeDestinationPath
            Ensure          = $Ensure
        }
    }
}
