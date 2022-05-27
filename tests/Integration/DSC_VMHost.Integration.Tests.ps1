$script:dscModuleName = 'HyperVDsc'
$script:dscResourceName = 'DSC_VMHost'

try
{
    Import-Module -Name DscResource.Test -Force -ErrorAction 'Stop'
}
catch [System.IO.FileNotFoundException]
{
    throw 'DscResource.Test module dependency not found. Please run ".\build.ps1 -Tasks build" first.'
}

$script:testEnvironment = Initialize-TestEnvironment `
    -DSCModuleName $script:dscModuleName `
    -DSCResourceName $script:dscResourceName `
    -ResourceType 'Mof' `
    -TestType 'Integration'

# Import the common integration test functions
Import-Module -Name ( Join-Path `
        -Path $PSScriptRoot `
        -ChildPath 'IntegrationTestsCommon.psm1' )

# Ensure that the tests can be performed on this computer
if (-not (Test-HyperVInstalled))
{
    return
} # if

$currentVmHost = Get-VMHost
# Set-VMHost appears to update $currentVmHost by reference?!
$currentVirtualHardDiskPath = $currentVmHost.VirtualHardDiskPath
$currentVirtualMachinePath = $currentVmHost.VirtualMachinePath
$currentEnableEnhancedSessionMode = $currentVmHost.EnableEnhancedSessionMode

# Using try/finally to always cleanup even if something awful happens.
try
{
    # Import the configuration
    $ConfigFile = Join-Path -Path $PSScriptRoot -ChildPath "$($script:DSCResourceName)_set.config.ps1"
    . $ConfigFile -Verbose -ErrorAction Stop

    Describe "$($script:DSCResourceName)_Set_Integration" {
        #region DEFAULT TESTS
        It 'Should compile without throwing' {
            {
                & "$($script:DSCResourceName)_Set_Config" `
                    -OutputPath $TestDrive `
                    -ConfigurationData $ConfigData `
                    -VirtualHardDiskPath $TestDrive `
                    -VirtualMachinePath $TestDrive `
                    -EnableEnhancedSessionMode (-not $currentEnableEnhancedSessionMode)

                $startDscConfigurationParams = @{
                    Path         = $TestDrive
                    ComputerName = 'localhost'
                    Wait         = $true
                    Verbose      = $true
                    Force        = $true
                }
                Start-DscConfiguration @startDscConfigurationParams

            } | Should not throw
        }

        It 'should be able to call Get-DscConfiguration without throwing' {
            { Get-DscConfiguration -Verbose -ErrorAction Stop } | Should Not throw
        }
        #endregion

        It 'Should have set the resource and all the parameters should match' {
            $current = Get-DscConfiguration | Where-Object {
                $_.ConfigurationName -eq "$($script:DSCResourceName)_Set_Config"
            }

            $current.VirtualHardDiskPath | Should Be $TestDrive.FullName
            $current.VirtualMachinePath | Should Be $TestDrive.FullName
            $current.EnableEnhancedSessionMode | Should Be (-not $currentEnableEnhancedSessionMode)
        }
    }
}
finally
{
    # Restore current host settings
    Set-VMHost -VirtualHardDiskPath $currentVirtualHardDiskPath `
        -VirtualMachinePath $currentVirtualMachinePath `
        -EnableEnhancedSessionMode $currentEnableEnhancedSessionMode -Verbose

    Restore-TestEnvironment -TestEnvironment $script:testEnvironment
}
