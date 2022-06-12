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
        [ValidateSet ('Archive', 'Hidden', 'ReadOnly', 'System' )]
        $attribute = 'Archive'
    )

    Import-DscResource -ModuleName 'HyperVDsc'

    VhdFile Change-Attribute
    {
        VhdPath       = $vhdPath
        FileDirectory = DSC_FileDirectory
        {
            DestinationPath = $relativeDestinationPath
            Attributes      = $attribute
        }
    }
}
