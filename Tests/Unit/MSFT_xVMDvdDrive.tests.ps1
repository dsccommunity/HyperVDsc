$script:DSCModuleName      = 'xHyper-V'
$script:DSCResourceName    = 'MSFT_xVMDvdDrive'

#region HEADER
# Unit Test Template Version: 1.1.0
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
    -TestType Unit
#endregion HEADER

# Begin Testing
try
{
    #region Pester Tests
    InModuleScope $script:DSCResourceName {
        # Function to create a exception object for testing output exceptions
        function Get-InvalidArguementError
        {
            [CmdletBinding()]
            param
            (
                [Parameter(Mandatory)]
                [ValidateNotNullOrEmpty()]
                [System.String]
                $ErrorId,

                [Parameter(Mandatory)]
                [ValidateNotNullOrEmpty()]
                [System.String]
                $ErrorMessage
            )

            $exception = New-Object -TypeName System.ArgumentException `
                -ArgumentList $ErrorMessage
            $errorCategory = [System.Management.Automation.ErrorCategory]::InvalidArgument
            $errorRecord = New-Object -TypeName System.Management.Automation.ErrorRecord `
                -ArgumentList $exception, $ErrorId, $errorCategory, $null
            return $errorRecord
        } # end function Get-InvalidArguementError

        #region Pester Test Initialization

        $script:VMName = 'HyperVUnitTestsVM'
        $script:TestISOPath = 'd:\test\test.iso'

        $script:splatGetDvdDrive = @{
            VMName             = $script:VMName
            ControllerNumber   = 0
            ControllerLocation = 1
        }
        $script:splatAddDvdDriveNoPath = @{
            VMName             = $script:VMName
            ControllerNumber   = 0
            ControllerLocation = 1
            Path               = ''
            Ensure             = 'Present'
        }
        $script:splatAddDvdDrive = @{
            VMName             = $script:VMName
            ControllerNumber   = 0
            ControllerLocation = 1
            Path               = $script:TestISOPath
            Ensure             = 'Present'
        }
        $script:splatRemoveDvdDrive = @{
            VMName             = $script:VMName
            ControllerNumber   = 0
            ControllerLocation = 1
            Ensure             = 'Absent'
        }
        $script:mockGetVM = [pscustomobject] @{
            Name               = $VMName
        }
        $script:mockGetVMScsiController = [pscustomobject] @{
            VMName               = $VMName
        }
        $script:mockGetVMHardDiskDrive = [pscustomobject] @{
            VMName               = $VMName
        }

        #endregion

        #region Function Get-TargetResource
        Describe 'MSFT_xVMDvdDrive\Get-TargetResource' {
            #region VM Functions
            function Get-VM {
                Param
                (
                    [String]
                    $Name
                )
            }

            function Get-VMScsiController {
                Param
                (
                    [String]
                    $VMName,

                    [Uint32]
                    $ControllerNumber
                )
            }

            function Get-VMIdeController {
                Param
                (
                    [String]
                    $VMName,

                    [Uint32]
                    $ControllerNumber
                )
            }

            function Get-VMHardDiskDrive {
                Param
                (
                    [String]
                    $VMName,

                    [Uint32]
                    $ControllerNumber,

                    [Uint32]
                    $ControllerLocation
                )
            }

            function Get-VMDvdDrive {
                Param
                (
                    [String]
                    $VMName
                )
            }
            #endregion

            Context 'DVD Drive does not exist' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Test-ParameterValid `
                    -Verifiable

                Mock `
                    -CommandName Get-VMDvdDrive `
                    -MockWith {} `
                    -Verifiable

                # Mocks that should not be called
                It 'should not throw exception' {
                    {
                        $script:resource = Get-TargetResource @script:splatGetDvdDrive
                    } | Should Not Throw
                }

                It 'should return expected values' {
                    $script:resource.VMName             | Should Be $script:splatGetDvdDrive.VMName
                    $script:resource.ControllerNumber   | Should Be $script:splatGetDvdDrive.ControllerNumber
                    $script:resource.ControllerLocation | Should Be $script:splatGetDvdDrive.ControllerLocation
                    $script:resource.Path               | Should BeNullOrEmpty
                    $script:resource.Ensure             | Should Be 'Absent'
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMocks
                    Assert-MockCalled -CommandName Test-ParameterValid -Exactly 1
                    Assert-MockCalled -CommandName Get-VMDvdDrive -Exactly 1
                }
            }

            Context 'DVD Drive exists, but has empty path' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Test-ParameterValid `
                    -Verifiable

                Mock `
                    -CommandName Get-VMDvdDrive `
                    -MockWith { $script:splatAddDvdDriveNoPath } `
                    -Verifiable

                # Mocks that should not be called
                It 'should not throw exception' {
                    {
                        $script:resource = Get-TargetResource @script:splatGetDvdDrive
                    } | Should Not Throw
                }

                It 'should return expected values' {
                    $script:resource.VMName             | Should Be $script:splatGetDvdDrive.VMName
                    $script:resource.ControllerNumber   | Should Be $script:splatGetDvdDrive.ControllerNumber
                    $script:resource.ControllerLocation | Should Be $script:splatGetDvdDrive.ControllerLocation
                    $script:resource.Path               | Should BeNullOrEmpty
                    $script:resource.Ensure             | Should Be 'Present'
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMocks
                    Assert-MockCalled -CommandName Test-ParameterValid -Exactly 1
                    Assert-MockCalled -CommandName Get-VMDvdDrive -Exactly 1
                }
            }

            Context 'DVD Drive exists, and has a test ISO path' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Test-ParameterValid `
                    -Verifiable

                Mock `
                    -CommandName Get-VMDvdDrive `
                    -MockWith { $script:splatAddDvdDrive } `
                    -Verifiable

                # Mocks that should not be called
                It 'should not throw exception' {
                    {
                        $script:resource = Get-TargetResource @script:splatGetDvdDrive
                    } | Should Not Throw
                }

                It 'should return expected values' {
                    $script:resource.VMName             | Should Be $script:splatGetDvdDrive.VMName
                    $script:resource.ControllerNumber   | Should Be $script:splatGetDvdDrive.ControllerNumber
                    $script:resource.ControllerLocation | Should Be $script:splatGetDvdDrive.ControllerLocation
                    $script:resource.Path               | Should Be $script:TestISOPath
                    $script:resource.Ensure             | Should Be 'Present'
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMocks
                    Assert-MockCalled -CommandName Test-ParameterValid -Exactly 1
                    Assert-MockCalled -CommandName Get-VMDvdDrive -Exactly 1
                }
            }
        }
        #endregion

        #region Function Set-TargetResource
        Describe 'MSFT_xVMDvdDrive\Set-TargetResource' {
        }
        #endregion

        #region Function Test-TargetResource
        Describe 'MSFT_xVMDvdDrive\Test-TargetResource' {
        }
        #endregion

        #region Function Test-ParameterValid
        Describe 'MSFT_xVMDvdDrive\Test-ParameterValid' {
            #region VM Functions
            function Get-VM {
                Param
                (
                    [String]
                    $Name
                )
            }

            function Get-VMScsiController {
                Param
                (
                    [String]
                    $VMName,

                    [Uint32]
                    $ControllerNumber
                )
            }

            function Get-VMIdeController {
                Param
                (
                    [String]
                    $VMName,

                    [Uint32]
                    $ControllerNumber
                )
            }

            function Get-VMHardDiskDrive {
                Param
                (
                    [String]
                    $VMName,

                    [Uint32]
                    $ControllerNumber,

                    [Uint32]
                    $ControllerLocation
                )
            }

            function Get-VMDvdDrive {
                Param
                (
                    [String]
                    $VMName
                )
            }
            #endregion

            Context 'VM does not exist' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-VM `
                    -MockWith { Throw } `
                    -Verifiable

                # Mocks that should not be called
                Mock -CommandName Get-VMScsiController
                Mock -CommandName Get-VMIdeController
                Mock -CommandName Get-VMHardDiskDrive

                It 'should throw exception' {
                    { Test-ParameterValid @script:splatAddDvdDriveNoPath } | Should Throw
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMocks
                    Assert-MockCalled -CommandName Get-VM -Exactly 1
                }
            }

            Context 'VM exists, controller does not exist' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-VM `
                    -MockWith { $script:mockGetVM } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMScsiController `
                    -Verifiable

                Mock `
                    -CommandName Get-VMIdeController `
                    -Verifiable

                # Mocks that should not be called
                Mock -CommandName Get-VMHardDiskDrive

                It 'should not throw exception' {
                    $errorRecord = Get-InvalidArguementError `
                        -ErrorId 'VMControllerDoesNotExistError' `
                        -ErrorMessage ($LocalizedData.VMControllerDoesNotExistError -f `
                            $script:VMName,0)

                    { Test-ParameterValid @script:splatAddDvdDriveNoPath } | Should Throw $errorRecord
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMocks
                    Assert-MockCalled -CommandName Get-VM -Exactly 1
                    Assert-MockCalled -CommandName Get-VMScsiController -Exactly 1
                    Assert-MockCalled -CommandName Get-VMIdeController -Exactly 1
                }
            }

            Context 'VM exists, SCSI contrller exists, HD assigned' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-VM `
                    -MockWith { $script:mockGetVM } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMScsiController `
                    -MockWith { $script:mockGetVMScsiController } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMHardDiskDrive `
                    -MockWith { $script:mockGetVMHardDiskDrive } `
                    -Verifiable

                # Mocks that should not be called
                Mock -CommandName Get-VMIdeController

                It 'should not throw exception' {
                    $errorRecord = Get-InvalidArguementError `
                        -ErrorId 'ControllerConflictError' `
                        -ErrorMessage ($LocalizedData.ControllerConflictError -f `
                            $script:VMName,0,1)

                    { Test-ParameterValid @script:splatAddDvdDriveNoPath } | Should Throw $errorRecord
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMocks
                    Assert-MockCalled -CommandName Get-VM -Exactly 1
                    Assert-MockCalled -CommandName Get-VMScsiController -Exactly 1
                    Assert-MockCalled -CommandName Get-VMHardDiskDrive -Exactly 1
                }
            }

            Context 'VM exists, SCSI contrller exists, HD not assigned, Path invalid' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-VM `
                    -MockWith { $script:mockGetVM } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMScsiController `
                    -MockWith { $script:mockGetVMScsiController } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMHardDiskDrive `
                    -Verifiable

                Mock `
                    -CommandName Test-Path `
                    -MockWith { $False } `
                    -Verifiable

                # Mocks that should not be called
                Mock -CommandName Get-VMIdeController

                It 'should not throw exception' {
                    $errorRecord = Get-InvalidArguementError `
                        -ErrorId 'PathDoesNotExistError' `
                        -ErrorMessage ($LocalizedData.PathDoesNotExistError -f `
                            $script:TestISOPath)

                    { Test-ParameterValid @script:splatAddDvdDrive } | Should Throw $errorRecord
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMocks
                    Assert-MockCalled -CommandName Get-VM -Exactly 1
                    Assert-MockCalled -CommandName Get-VMScsiController -Exactly 1
                    Assert-MockCalled -CommandName Get-VMHardDiskDrive -Exactly 1
                    Assert-MockCalled -CommandName Test-Path -Exactly 1
                }
            }

            Context 'VM exists, SCSI contrller exists, HD not assigned, Path Valid' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-VM `
                    -MockWith { $script:mockGetVM } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMScsiController `
                    -MockWith { $script:mockGetVMScsiController } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMHardDiskDrive `
                    -Verifiable

                Mock `
                    -CommandName Test-Path `
                    -MockWith { $True } `
                    -Verifiable

                # Mocks that should not be called
                Mock -CommandName Get-VMIdeController

                It 'should not throw exception' {
                    Test-ParameterValid @script:splatAddDvdDrive | Should Be $True
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMocks
                    Assert-MockCalled -CommandName Get-VM -Exactly 1
                    Assert-MockCalled -CommandName Get-VMScsiController -Exactly 1
                    Assert-MockCalled -CommandName Get-VMHardDiskDrive -Exactly 1
                    Assert-MockCalled -CommandName Test-Path -Exactly 1
                }
            }
        }
        #endregion
    }
}
finally
{
    #region FOOTER
    Restore-TestEnvironment -TestEnvironment $TestEnvironment
    #endregion
}
