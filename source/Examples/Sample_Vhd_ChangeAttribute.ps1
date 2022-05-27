Configuration Sample_Vhd_ChangeAttribute
{
    param
    (
        [Parameter(Mandatory = $true, Position = 0)]
        $vhdPath = 'C:\temp\disk.vhdx',

        [Parameter(Mandatory = $true)]
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
