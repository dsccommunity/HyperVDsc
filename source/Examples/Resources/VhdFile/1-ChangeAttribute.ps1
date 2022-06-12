<#
    .DESCRIPTION
        Not yet written.
#>
Configuration Example
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
        FileDirectory = DSC_FileDirectory
        {
            VhdPath         = $vhdPath
            DestinationPath = $relativeDestinationPath
            Attributes      = $attribute
        }

    }
}
