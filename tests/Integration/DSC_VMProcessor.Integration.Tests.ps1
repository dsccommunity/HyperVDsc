$script:dscModuleName = 'HyperVDsc'
$script:dscResourceName = 'DSC_VMProcessor'

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

# Using try/finally to always cleanup even if something awful happens.
try
{
    $VMName = 'HyperVIntTestsVM'
    $VMPath = Join-Path -Path $env:Temp `
        -ChildPath $VMName

    # Make sure test VM does not exist
    if (Get-VM -Name $VMName -ErrorAction SilentlyContinue)
    {
        $null = Remove-VM -Name $VMName -Force
    } # if

    # Create the VM that will be used to test with
    $null = New-VM -Name $VMName -NoVHD -Path $VMPath

    # Create a config data object to pass to the DSC Configs
    $ConfigData = @{
        AllNodes = @(
            @{
                NodeName                                     = 'localhost'
                VMName                                       = $VMName
                CompatibilityForMigrationEnabled             = $true
                CompatibilityForOlderOperatingSystemsEnabled = $true
            }
        )
    }

    # Set processor option(s)
    $ConfigFile = Join-Path -Path $PSScriptRoot -ChildPath "$($script:DSCResourceName)_set.config.ps1"
    . $ConfigFile -Verbose -ErrorAction Stop

    Describe "$($script:DSCResourceName)_Set_Integration" {
        Context 'Configure VM' {
            #region DEFAULT TESTS
            It 'Should compile without throwing' {
                {
                    & "$($script:DSCResourceName)_Set_Config" `
                        -OutputPath $TestDrive `
                        -ConfigurationData $ConfigData
                    Start-DscConfiguration -Path $TestDrive `
                        -ComputerName localhost -Wait -Verbose -Force
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
                $current.VMName | Should Be $VMName
                $current.CompatibilityForMigrationEnabled | Should Be $true
                $current.CompatibilityForOlderOperatingSystemsEnabled | Should Be $true
            }
        }
    }
}
finally
{
    # Make sure the test VM has been removed
    if (Get-VM -Name $VMName -ErrorAction SilentlyContinue)
    {
        $null = Remove-VM -Name $VMName -Force
    } # if

    Restore-TestEnvironment -TestEnvironment $script:testEnvironment
}
