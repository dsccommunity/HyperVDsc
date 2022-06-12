<#
    .DESCRIPTION
        Not yet written.
#>
Configuration Example
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
        FileDirectory = DSC_FileDirectory
        {
            DestinationPath = $relativeDestinationPath
            Ensure          = $Ensure
        }
    }
}
