$script:dscModuleName = 'HyperVDsc'
$script:dscResourceName = 'DSC_VMDvdDrive'

function Invoke-TestSetup
{
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
        -TestType 'Unit'

    # Import the stub functions.
    Import-Module -Name "$PSScriptRoot/Stubs/Hyper-V.stubs.psm1" -Force
}

function Invoke-TestCleanup
{
    Restore-TestEnvironment -TestEnvironment $script:testEnvironment
}

Invoke-TestSetup

try
{
    InModuleScope $script:dscResourceName {
        #region Pester Test Initialization

        $script:VMName = 'HyperVUnitTestsVM'
        $script:TestISOPath = 'd:\test\test.iso'

        $script:splatGetDvdDrive = @{
            VMName             = $script:VMName
            ControllerNumber   = 0
            ControllerLocation = 1
            Verbose            = $True
        }
        $script:splatAddDvdDriveNoPath = @{
            VMName             = $script:VMName
            ControllerNumber   = 0
            ControllerLocation = 1
            Path               = ''
            Ensure             = 'Present'
            Verbose            = $True
        }
        $script:splatAddDvdDrive = @{
            VMName             = $script:VMName
            ControllerNumber   = 0
            ControllerLocation = 1
            Path               = $script:TestISOPath
            Ensure             = 'Present'
            Verbose            = $True
        }
        $script:splatRemoveDvdDrive = @{
            VMName             = $script:VMName
            ControllerNumber   = 0
            ControllerLocation = 1
            Ensure             = 'Absent'
            Verbose            = $True
        }
        $script:mockGetModule = [pscustomobject] @{
            Name               = 'Hyper-V'
        }
        $script:mockGetVM = [pscustomobject] @{
            Name               = $VMName
        }
        $script:mockGetVMScsiController = [pscustomobject] @{
            VMName             = $VMName
        }
        $script:mockGetVMHardDiskDrive = [pscustomobject] @{
            VMName             = $VMName
        }
        $script:mockNoDvdDrive = @{
            VMName             = $script:VMName
            ControllerNumber   = 0
            ControllerLocation = 1
            Ensure             = 'Absent'
        }
        $script:mockDvdDriveWithPath = @{
            VMName             = $script:VMName
            ControllerNumber   = 0
            ControllerLocation = 1
            Path               = $script:TestISOPath
            Ensure             = 'Present'
        }
        $script:mockDvdDriveWithDiffPath = @{
            VMName             = $script:VMName
            ControllerNumber   = 0
            ControllerLocation = 1
            Path               = 'd:\diff\diff.iso'
            Ensure             = 'Present'
        }
        #endregion

        #region function Get-TargetResource
        Describe 'DSC_VMDvdDrive\Get-TargetResource' {
            Context 'DVD Drive does not exist' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Test-ParameterValid `
                    -Verifiable

                Mock `
                    -CommandName Get-VMDvdDrive `
                    -MockWith {} `
                    -ParameterFilter { $VMName -eq $script:splatGetDvdDrive.VMName } `
                    -Verifiable

                It 'should not throw exception' {
                    {
                        $script:resource = Get-TargetResource @script:splatGetDvdDrive
                    } | Should -Not -throw
                }

                It 'should return expected values' {
                    $script:resource.VMName             | Should -Be $script:splatGetDvdDrive.VMName
                    $script:resource.ControllerNumber   | Should -Be $script:splatGetDvdDrive.ControllerNumber
                    $script:resource.ControllerLocation | Should -Be $script:splatGetDvdDrive.ControllerLocation
                    $script:resource.Path               | Should -BeNullOrEmpty
                    $script:resource.Ensure             | Should -Be 'Absent'
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Test-ParameterValid -Exactly 1
                    Assert-MockCalled -CommandName Get-VMDvdDrive -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatGetDvdDrive.VMName }
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
                    -ParameterFilter { $VMName -eq $script:splatGetDvdDrive.VMName } `
                    -Verifiable

                It 'should not throw exception' {
                    {
                        $script:resource = Get-TargetResource @script:splatGetDvdDrive
                    } | Should -Not -throw
                }

                It 'should return expected values' {
                    $script:resource.VMName             | Should -Be $script:splatGetDvdDrive.VMName
                    $script:resource.ControllerNumber   | Should -Be $script:splatGetDvdDrive.ControllerNumber
                    $script:resource.ControllerLocation | Should -Be $script:splatGetDvdDrive.ControllerLocation
                    $script:resource.Path               | Should -BeNullOrEmpty
                    $script:resource.Ensure             | Should -Be 'Present'
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Test-ParameterValid -Exactly 1
                    Assert-MockCalled -CommandName Get-VMDvdDrive -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatGetDvdDrive.VMName }
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
                    -ParameterFilter { $VMName -eq $script:splatGetDvdDrive.VMName } `
                    -Verifiable

                It 'should not throw exception' {
                    {
                        $script:resource = Get-TargetResource @script:splatGetDvdDrive
                    } | Should -Not -throw
                }

                It 'should return expected values' {
                    $script:resource.VMName             | Should -Be $script:splatGetDvdDrive.VMName
                    $script:resource.ControllerNumber   | Should -Be $script:splatGetDvdDrive.ControllerNumber
                    $script:resource.ControllerLocation | Should -Be $script:splatGetDvdDrive.ControllerLocation
                    $script:resource.Path               | Should -Be $script:TestISOPath
                    $script:resource.Ensure             | Should -Be 'Present'
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Test-ParameterValid -Exactly 1
                    Assert-MockCalled -CommandName Get-VMDvdDrive -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatGetDvdDrive.VMName }
                }
            }
        }
        #endregion

        #region function Set-TargetResource
        Describe 'DSC_VMDvdDrive\Set-TargetResource' {
            Context 'DVD Drive does not exist but should' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-TargetResource `
                    -MockWith { $script:mockNoDvdDrive } `
                    -Verifiable

                Mock `
                    -CommandName Add-VMDvdDrive `
                    -ParameterFilter { $VMName -eq $script:splatAddDvdDriveNoPath.VMName } `
                    -Verifiable

                # Mocks that should not be called
                Mock -CommandName Set-VMDvdDrive
                Mock -CommandName Remove-VMDvdDrive

                It 'should not throw exception' {
                    { Set-TargetResource @script:splatAddDvdDriveNoPath } | Should -Not -throw
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-TargetResource -Exactly 1
                    Assert-MockCalled -CommandName Add-VMDvdDrive -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatAddDvdDriveNoPath.VMName }
                    Assert-MockCalled -CommandName Set-VMDvdDrive -Exactly 0
                    Assert-MockCalled -CommandName Remove-VMDvdDrive -Exactly 0
                }
            }

            Context 'DVD Drive does exist and should, path matches' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-TargetResource `
                    -MockWith { $script:mockDvdDriveWithPath } `
                    -Verifiable

                # Mocks that should not be called
                Mock -CommandName Add-VMDvdDrive
                Mock -CommandName Set-VMDvdDrive
                Mock -CommandName Remove-VMDvdDrive

                It 'should not throw exception' {
                    { Set-TargetResource @script:splatAddDvdDrive } | Should -Not -throw
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-TargetResource -Exactly 1
                    Assert-MockCalled -CommandName Add-VMDvdDrive -Exactly 0
                    Assert-MockCalled -CommandName Set-VMDvdDrive -Exactly 0
                    Assert-MockCalled -CommandName Remove-VMDvdDrive -Exactly 0
                }
            }

            Context 'DVD Drive does exist and should, path does not match' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-TargetResource `
                    -MockWith { $script:mockDvdDriveWithDiffPath } `
                    -Verifiable

                Mock `
                    -CommandName Set-VMDvdDrive `
                    -ParameterFilter { $VMName -eq $script:splatAddDvdDrive.VMName } `
                    -Verifiable

                # Mocks that should not be called
                Mock -CommandName Add-VMDvdDrive
                Mock -CommandName Remove-VMDvdDrive

                It 'should not throw exception' {
                    { Set-TargetResource @script:splatAddDvdDrive } | Should -Not -throw
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-TargetResource -Exactly 1
                    Assert-MockCalled -CommandName Add-VMDvdDrive -Exactly 0
                    Assert-MockCalled -CommandName Set-VMDvdDrive -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatAddDvdDrive.VMName }
                    Assert-MockCalled -CommandName Remove-VMDvdDrive -Exactly 0
                }
            }

            Context 'DVD Drive exists and should not' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-TargetResource `
                    -MockWith { $script:mockDvdDriveWithPath } `
                    -Verifiable

                Mock `
                    -CommandName Remove-VMDvdDrive `
                    -ParameterFilter { $VMName -eq $script:splatRemoveDvdDrive.VMName } `
                    -Verifiable

                # Mocks that should not be called
                Mock -CommandName Add-VMDvdDrive
                Mock -CommandName Set-VMDvdDrive

                It 'should not throw exception' {
                    { Set-TargetResource @script:splatRemoveDvdDrive } | Should -Not -throw
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-TargetResource -Exactly 1
                    Assert-MockCalled -CommandName Add-VMDvdDrive -Exactly 0
                    Assert-MockCalled -CommandName Set-VMDvdDrive -Exactly 0
                    Assert-MockCalled -CommandName Remove-VMDvdDrive -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatRemoveDvdDrive.VMName }
                }
            }

            Context 'DVD Drive does not exist and should not' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-TargetResource `
                    -MockWith { $script:mockNoDvdDrive } `
                    -Verifiable

                # Mocks that should not be called
                Mock -CommandName Add-VMDvdDrive
                Mock -CommandName Set-VMDvdDrive
                Mock -CommandName Remove-VMDvdDrive

                It 'should not throw exception' {
                    { Set-TargetResource @script:splatRemoveDvdDrive } | Should -Not -throw
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-TargetResource -Exactly 1
                    Assert-MockCalled -CommandName Add-VMDvdDrive -Exactly 0
                    Assert-MockCalled -CommandName Set-VMDvdDrive -Exactly 0
                    Assert-MockCalled -CommandName Remove-VMDvdDrive -Exactly 0
                }
            }
        }
        #endregion

        #region function Test-TargetResource
        Describe 'DSC_VMDvdDrive\Test-TargetResource' {
            Context 'DVD Drive does not exist but should' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-TargetResource `
                    -MockWith { $script:mockNoDvdDrive } `
                    -Verifiable

                It 'should return false' {
                    Test-TargetResource @script:splatAddDvdDriveNoPath | Should -Be $False
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-TargetResource -Exactly 1
                }
            }

            Context 'DVD Drive does exist and should, path matches' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-TargetResource `
                    -MockWith { $script:mockDvdDriveWithPath } `
                    -Verifiable

                It 'should return true' {
                    Test-TargetResource @script:splatAddDvdDrive | Should -Be $True
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-TargetResource -Exactly 1
                }
            }

            Context 'DVD Drive does exist and should, path does not match' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-TargetResource `
                    -MockWith { $script:mockDvdDriveWithDiffPath } `
                    -Verifiable

                It 'should return false' {
                    Test-TargetResource @script:splatAddDvdDrive | Should -Be $False
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-TargetResource -Exactly 1
                }
            }

            Context 'DVD Drive exists and should not' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-TargetResource `
                    -MockWith { $script:mockDvdDriveWithPath } `
                    -Verifiable

                It 'should return false' {
                    Test-TargetResource @script:splatRemoveDvdDrive | Should -Be $False
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-TargetResource -Exactly 1
                }
            }

            Context 'DVD Drive does not exist and should not' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-TargetResource `
                    -MockWith { $script:mockNoDvdDrive } `
                    -Verifiable

                It 'should return true' {
                    Test-TargetResource @script:splatRemoveDvdDrive | Should -Be $True
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-TargetResource -Exactly 1
                }
            }
        }
        #endregion

        #region function Test-ParameterValid
        Describe 'DSC_VMDvdDrive\Test-ParameterValid' {
            Context 'Hyper-V Module is not available' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-Module `
                    -Verifiable

                # Mocks that should not be called
                Mock -CommandName Get-VMHyperV
                Mock -CommandName Get-VMScsiController
                Mock -CommandName Get-VMIdeController
                Mock -CommandName Get-VMHardDiskDrive

                It 'should throw exception' {
                    $errorMessage = $script:localizedData.RoleMissingError -f 'Hyper-V'

                    { Test-ParameterValid @script:splatAddDvdDriveNoPath } | Should -Throw $errorMessage
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-Module -Exactly 1
                }
            }

            Context 'VM does not exist' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-Module `
                    -MockWith { $script:mockGetModule } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMHyperV `
                    -MockWith { throw } `
                    -ParameterFilter { $VMName -eq $script:splatAddDvdDriveNoPath.VMName } `
                    -Verifiable

                # Mocks that should not be called
                Mock -CommandName Get-VMScsiController
                Mock -CommandName Get-VMIdeController
                Mock -CommandName Get-VMHardDiskDrive

                It 'should throw exception' {
                    { Test-ParameterValid @script:splatAddDvdDriveNoPath } | Should -Throw
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-Module -Exactly 1
                    Assert-MockCalled -CommandName Get-VMHyperV -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatAddDvdDriveNoPath.VMName }
                }
            }

            Context 'VM exists, controller does not exist' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-Module `
                    -MockWith { $script:mockGetModule } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMHyperV `
                    -MockWith { $script:mockGetVM } `
                    -ParameterFilter { $VMName -eq $script:splatAddDvdDriveNoPath.VMName } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMScsiController `
                    -ParameterFilter { $VMName -eq $script:splatAddDvdDriveNoPath.VMName } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMIdeController `
                    -ParameterFilter { $VMName -eq $script:splatAddDvdDriveNoPath.VMName } `
                    -Verifiable

                # Mocks that should not be called
                Mock -CommandName Get-VMHardDiskDrive

                It 'should throw exception' {
                    $errorMessage = $script:localizedData.VMControllerDoesNotExistError -f $script:VMName, 0

                    { Test-ParameterValid @script:splatAddDvdDriveNoPath } | Should -Throw $errorMessage
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-Module -Exactly 1
                    Assert-MockCalled -CommandName Get-VMHyperV -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatAddDvdDriveNoPath.VMName }
                    Assert-MockCalled -CommandName Get-VMScsiController -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatAddDvdDriveNoPath.VMName }
                    Assert-MockCalled -CommandName Get-VMIdeController -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatAddDvdDriveNoPath.VMName }
                }
            }

            Context 'VM exists, SCSI controller exists, HD assigned' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-Module `
                    -MockWith { $script:mockGetModule } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMHyperV `
                    -MockWith { $script:mockGetVM } `
                    -ParameterFilter { $VMName -eq $script:splatAddDvdDriveNoPath.VMName } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMScsiController `
                    -MockWith { $script:mockGetVMScsiController } `
                    -ParameterFilter { $VMName -eq $script:splatAddDvdDriveNoPath.VMName } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMHardDiskDrive `
                    -MockWith { $script:mockGetVMHardDiskDrive } `
                    -ParameterFilter { $VMName -eq $script:splatAddDvdDriveNoPath.VMName } `
                    -Verifiable

                # Mocks that should not be called
                Mock -CommandName Get-VMIdeController

                It 'should throw exception' {
                    $errorMessage = $script:localizedData.ControllerConflictError -f $script:VMName, 0, 1

                    { Test-ParameterValid @script:splatAddDvdDriveNoPath } | Should -Throw $errorMessage
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-Module -Exactly 1
                    Assert-MockCalled -CommandName Get-VMHyperV -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatAddDvdDriveNoPath.VMName }
                    Assert-MockCalled -CommandName Get-VMScsiController -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatAddDvdDriveNoPath.VMName }
                    Assert-MockCalled -CommandName Get-VMHardDiskDrive -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatAddDvdDriveNoPath.VMName }
                }
            }

            Context 'VM exists, SCSI controller exists, HD not assigned, Path invalid' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-Module `
                    -MockWith { $script:mockGetModule } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMHyperV `
                    -MockWith { $script:mockGetVM } `
                    -ParameterFilter { $VMName -eq $script:splatAddDvdDrive.VMName } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMScsiController `
                    -MockWith { $script:mockGetVMScsiController } `
                    -ParameterFilter { $VMName -eq $script:splatAddDvdDrive.VMName } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMHardDiskDrive `
                    -ParameterFilter { $VMName -eq $script:splatAddDvdDrive.VMName } `
                    -Verifiable

                Mock `
                    -CommandName Test-Path `
                    -MockWith { $False } `
                    -Verifiable

                # Mocks that should not be called
                Mock -CommandName Get-VMIdeController

                It 'should throw exception' {
                    $errorMessage = $script:localizedData.PathDoesNotExistError -f $script:TestISOPath

                    { Test-ParameterValid @script:splatAddDvdDrive } | Should -Throw $errorMessage
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-Module -Exactly 1
                    Assert-MockCalled -CommandName Get-VMHyperV -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatAddDvdDrive.VMName }
                    Assert-MockCalled -CommandName Get-VMScsiController -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatAddDvdDrive.VMName }
                    Assert-MockCalled -CommandName Get-VMHardDiskDrive -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatAddDvdDrive.VMName }
                    Assert-MockCalled -CommandName Test-Path -Exactly 1
                }
            }

            Context 'VM exists, SCSI contrller exists, HD not assigned, Path Valid' {
                # Verifiable (should be called) mocks
                Mock `
                    -CommandName Get-Module `
                    -MockWith { $script:mockGetModule } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMHyperV `
                    -MockWith { $script:mockGetVM } `
                    -ParameterFilter { $VMName -eq $script:splatAddDvdDrive.VMName } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMScsiController `
                    -MockWith { $script:mockGetVMScsiController } `
                    -ParameterFilter { $VMName -eq $script:splatAddDvdDrive.VMName } `
                    -Verifiable

                Mock `
                    -CommandName Get-VMHardDiskDrive `
                    -ParameterFilter { $VMName -eq $script:splatAddDvdDrive.VMName } `
                    -Verifiable

                Mock `
                    -CommandName Test-Path `
                    -MockWith { $True } `
                    -Verifiable

                # Mocks that should not be called
                Mock -CommandName Get-VMIdeController

                It 'should not throw exception' {
                    Test-ParameterValid @script:splatAddDvdDrive | Should -Be $True
                }

                It 'all the get mocks should be called' {
                    Assert-VerifiableMock
                    Assert-MockCalled -CommandName Get-Module -Exactly 1
                    Assert-MockCalled -CommandName Get-VMHyperV -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatAddDvdDrive.VMName }
                    Assert-MockCalled -CommandName Get-VMScsiController -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatAddDvdDrive.VMName }
                    Assert-MockCalled -CommandName Get-VMHardDiskDrive -Exactly 1 `
                        -ParameterFilter { $VMName -eq $script:splatAddDvdDrive.VMName }
                    Assert-MockCalled -CommandName Test-Path -Exactly 1
                }
            }
        }
        #endregion
    }
}
finally
{
    Invoke-TestCleanup
}
