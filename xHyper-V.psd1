@{
# Version number of this module.
ModuleVersion = '3.9.0.0'

# ID used to uniquely identify this module
GUID = 'f5a5f169-7026-4053-932a-19a7c37b1ca5'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = '(c) 2017 Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Module with DSC Resources for Hyper-V area'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '4.0'

# Minimum version of the common language runtime (CLR) required by this module
CLRVersion = '4.0'

# Functions to export from this module
FunctionsToExport = '*'

# Cmdlets to export from this module
CmdletsToExport = '*'

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('DesiredStateConfiguration', 'DSC', 'DSCResourceKit', 'DSCResource')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/PowerShell/xHyper-V/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/PowerShell/xHyper-V'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '* MSFT_xVMHyperV:
  * Increased xVMHyperV StartupMemory and MinimumMemory limits from 17GB to 64GB.
  * EnableGuestService works on localized OS (language independent).
  * Adds missing Hyper-V-PowerShell feature in examples.
* Added the following resources:
  * MSFT_xVMProcessor to manage virtual machine processor options.
  * MSFT_xVMHost to managing Hyper-V host settings.
* MSFT_xVMSwitch:
  * Added support for Switch Embedded Teaming (SET) in Server 2016.
  * Fixed a bug where Get-TargetResource threw an error if a non External switch
 is used.
  * Updated unit tests to use template version 1.2.0.
  * Style fixes.
  * Added support for Localization.
* xHyper-V module:
  * Added vs code formatting rule settings.
  * Fix Markdown rule violations in Readme.md.
  * Added .MetaTestOptIn.json for Markdown common test to be included.
  * Added Appveyor badge for Dev branch in Readme.md and moved to Branches section.
  * Added missing properties for all resources in Readme.md.
  * Added and corrected missing / wrong DataTypes and Dsc attributes in Readme.md.
  * Updated Readme to match DscResources style.
  * Created change log and linked to it from Readme.
  * Removed version info from Readme.
  * Updated appveyor.yml to use Appveyor module.
  * Examples:
    * Removed code from Readme and linked to example files instead.
    * Moved code to new example files where there was only code in Readme.
  * Codecov:
    * Updated appveyor.yml to include codecov.
    * Added .codecov.yml.
    * Added codecov badges to Readme.
* MSFT_xVHD:
  * Support setting the disk type.
  * Added unit tests.
  * Added example Sample\_xVHD\_FixedVHD.ps1
  * Style fixes

'

    } # End of PSData hashtable

} # End of PrivateData hashtable
}








