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
        $itemToCopy = 'C:\Temp',

        [Parameter()]
        $relativeDestinationPath = 'Temp'
    )

    Import-DscResource -ModuleName 'HyperVDsc'

    VhdFile FileCopy
    {
        FileDirectory = DSC_FileDirectory
        {
            VhdPath         = $vhdPath
            SourcePath      = $itemToCopy
            DestinationPath = $relativeDestinationPath
        }
    }
}
