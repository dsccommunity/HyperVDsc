Configuration Sample_xVhd_ChangeAttribute
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

    Import-DscResource -ModuleName 'xHyper-V'

    xVhdFile Change-Attribute
    {
        VhdPath       = $vhdPath
        FileDirectory = MSFT_xFileDirectory
        {
            DestinationPath = $relativeDestinationPath
            Attributes      = $attribute
        }

    }
}
