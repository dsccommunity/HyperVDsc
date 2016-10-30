$script:DSCModuleName      = 'xHyper-V'
$script:DSCResourceName    = 'MSFT_xVMDvdDrive'

#region HEADER
# Integration Test Template Version: 1.1.1
[String] $script:moduleRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
if ( (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests'))) -or `
     (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1'))) )
{
    & git @('clone','https://github.com/PowerShell/DscResource.Tests.git',(Join-Path -Path $script:moduleRoot -ChildPath '\DSCResource.Tests\'))
}

Import-Module (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1') -Force
$TestEnvironment = Initialize-TestEnvironment `
    -DSCModuleName $script:DSCModuleName `
    -DSCResourceName $script:DSCResourceName `
    -TestType Integration
#endregion

# Using try/finally to always cleanup even if something awful happens.
try
{
    # Import the common integration test functions
    Import-Module -Name ( Join-Path `
        -Path $PSScriptRoot `
        -ChildPath 'IntegrationTestsCommon.psm1' )

    # Ensure that the tests can be performed on this computer
    if (-not (Test-HyperVInstalled))
    {
        Return
    } # if

    $VMName = 'HyperVIntTestsVM'
    $VMPath = Join-Path -Path $TestEnvironment.WorkingFolder `
        -ChildPath $VMName

    # Create a config data object to pass to the DSC Configs
    $ConfigData = @{
        AllNodes = @(
            @{
                NodeName           = 'localhost'
                VMName             = $VMName
                ControllerNumber   = 0
                ControllerLocation = 0
                Path               = ''
            }
        )
    }

    # Add DVD Drive
    $ConfigFile = Join-Path -Path $PSScriptRoot -ChildPath "$($script:DSCResourceName)_add.config.ps1"
    . $ConfigFile -Verbose -ErrorAction Stop

    Describe "$($script:DSCResourceName)_Add_Integration" {
        Context 'Add a DVD Drive to a VM' {
            #region DEFAULT TESTS
            It 'Should compile without throwing' {
                {
                    & "$($script:DSCResourceName)_Add_Config" `
                        -OutputPath $TestEnvironment.WorkingFolder `
                        -ConfigurationData $ConfigData
                    Start-DscConfiguration -Path $TestEnvironment.WorkingFolder `
                        -ComputerName localhost -Wait -Verbose -Force
                } | Should not throw
            }

            It 'should be able to call Get-DscConfiguration without throwing' {
                { Get-DscConfiguration -Verbose -ErrorAction Stop } | Should Not throw
            }
            #endregion

            It 'Should have set the resource and all the parameters should match' {
                $current = Get-DscConfiguration | Where-Object {
                    $_.ConfigurationName -eq "$($script:DSCResourceName)_Mount_Config"
                }
                $current.VMName             | Should Be $VMName
                $current.ControllerNumber   | Should Be 0
                $current.ControllerLocation | Should Be 0
                $current.Path               | Should Be ''
                $current.Ensure             | Should Be 'Present'
            }
        }
    }

    # Dismount ISO
    $ConfigFile = Join-Path -Path $PSScriptRoot -ChildPath "$($script:DSCResourceName)_remove.config.ps1"
    . $ConfigFile -Verbose -ErrorAction Stop

    Describe "$($script:DSCResourceName)_Remove_Integration" {
        Context 'Remove a DVD Drive from a VM' {
            #region DEFAULT TESTS
            It 'Should compile without throwing' {
                {
                    & "$($script:DSCResourceName)_Remove_Config" `
                        -OutputPath $TestEnvironment.WorkingFolder `
                        -ConfigurationData $ConfigData
                    Start-DscConfiguration -Path $TestEnvironment.WorkingFolder `
                        -ComputerName localhost -Wait -Verbose -Force
                } | Should not throw
            }

            It 'should be able to call Get-DscConfiguration without throwing' {
                { Get-DscConfiguration -Verbose -ErrorAction Stop } | Should Not throw
            }
            #endregion

            It 'Should have set the resource and all the parameters should match' {
                $current = Get-DscConfiguration | Where-Object {
                    $_.ConfigurationName -eq "$($script:DSCResourceName)_Remove_Config"
                }
                $current.VMName             | Should Be $VMName
                $current.ControllerNumber   | Should Be 0
                $current.ControllerLocation | Should Be 0
                $current.Path               | Should Be ''
                $current.Ensure             | Should Be 'Absent'
            }
        }
    }
    #endregion Integration Tests for VM DVD Drive
}
finally
{
    #region FOOTER
    if (Get-VM -Name $VMName)
    {
        Remove-VM -Name $VMName -Force
    } # if

    Restore-TestEnvironment -TestEnvironment $TestEnvironment
    #endregion
}
