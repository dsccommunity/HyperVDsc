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
        FileDirectory = DSC_FileDirectory
        {
            VhdPath         = $vhdPath
            DestinationPath = $relativeDestinationPath
            Ensure          = $Ensure
        }
    }
}
