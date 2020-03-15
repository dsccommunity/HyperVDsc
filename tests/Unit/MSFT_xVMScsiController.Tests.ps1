$script:dscModuleName = 'xHyper-V'
$script:dscResourceName = 'MSFT_xVMScsiController'

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

        $testVMName = 'UnitTestVM'

        Describe 'MSFT_xVMScsiController\Get-TargetResource' {

            $stubScsiController = @{
                VMName           = $testVMName
                ControllerNumber = 0
            }

            # Guard mocks
            Mock -CommandName Assert-Module

            It 'Should return a [System.Collections.Hashtable] object type' {
                Mock -CommandName Get-VMScsiController { return $stubScsiController }

                $result = Get-TargetResource -VMName $testVMName -ControllerNumber 0

                $result -is [System.Collections.Hashtable] | Should -Be $true
            }

            It 'Should return "Present" when controller is attached' {
                Mock -CommandName Get-VMScsiController { return $stubScsiController }

                $result = Get-TargetResource -VMName $testVMName -ControllerNumber 0

                $result.Ensure | Should -Be 'Present'
            }

            It 'Should return "Absent" when controller is not attached' {
                Mock -CommandName Get-VMScsiController

                $result = Get-TargetResource -VMName $testVMName -ControllerNumber 0

                $result.Ensure | Should -Be 'Absent'
            }

            It 'Should assert Hyper-V module is installed' {
                Mock -CommandName Assert-Module
                Mock -CommandName Get-VMScsiController

                $null = Get-TargetResource -VMName $testVMName -ControllerNumber 0

                Assert-MockCalled -CommandName Assert-Module -ParameterFilter { $Name -eq 'Hyper-V' } -Scope It
            }
        } # describe Get-TargetResource

        Describe 'MSFT_xVMScsiController\Test-TargetResource' {

            # Guard mocks
            Mock -CommandName Assert-Module

            $stubTargetResource = @{
                VMName           = $testVMName
                ControllerNumber = 0
                Ensure           = 'Present'
            }

            It 'Should return a [System.Boolean] object type' {
                Mock -CommandName Get-TargetResource { return $stubTargetResource }
                $testTargetResourceParams = @{
                    VMName           = $testVMName
                    ControllerNumber = 0
                }

                $result = Test-TargetResource @testTargetResourceParams

                $result -is [System.Boolean] | Should -Be $true
            }

            It "Should pass when parameter 'Ensure' is correct" {
                Mock -CommandName Get-TargetResource { return $stubTargetResource }
                $testTargetResourceParams = @{
                    VMName           = $testVMName
                    ControllerNumber = 0
                    Ensure           = $stubTargetResource['Ensure']
                }

                $result = Test-TargetResource @testTargetResourceParams

                $result | Should -Be $true
            }

            It "Should fail when parameter 'Ensure' is incorrect" {
                Mock -CommandName Get-TargetResource { return $stubTargetResource }
                $testTargetResourceParams = @{
                    VMName           = $testVMName
                    ControllerNumber = 0
                    Ensure           = 'Absent'
                }

                $result = Test-TargetResource @testTargetResourceParams

                $result | Should -Be $false
            }
        } # describe Test-TargetResource

        Describe 'MSFT_xVMScsiController\Set-TargetResource' {
            # Guard mocks
            Mock -CommandName Assert-Module
            Mock -CommandName Get-VMScsiController
            Mock -CommandName Add-VMScsiController
            Mock -CommandName Remove-VMScsiController
            Mock -CommandName Remove-VMHardDiskDrive
            Mock -CommandName Set-VMState

            It 'Should assert Hyper-V module is installed' {
                Mock -CommandName Get-VMHyperV { return @{ State = 'Running' } }
                $setTargetResourceParams = @{
                    VMName           = $testVMName
                    ControllerNumber = 0
                    RestartIfNeeded  = $true
                }

                $null = Set-TargetResource @setTargetResourceParams

                Assert-MockCalled -CommandName Assert-Module
            }

            It 'Should throw if "RestartIfNeeded" is not specified and VM is "Running"' {
                Mock -CommandName Get-VMHyperV { return @{ State = 'Running' } }
                $setTargetResourceParams = @{
                    VMName           = $testVMName
                    ControllerNumber = 0
                }

                { Set-TargetResource @setTargetResourceParams } | Should -Throw 'RestartIfNeeded'
            }

            It 'Should not throw if "RestartIfNeeded" is not specified and VM is "Off"' {
                Mock -CommandName Get-VMHyperV { return @{ State = 'Off' } }
                $setTargetResourceParams = @{
                    VMName           = $testVMName
                    ControllerNumber = 0
                }

                { Set-TargetResource @setTargetResourceParams } | Should -Not -Throw
            }

            It 'Should call "Set-VMState" to stop running VM' {
                Mock -CommandName Get-VMHyperV { return @{ State = 'Running' } }
                $setTargetResourceParams = @{
                    VMName           = $testVMName
                    ControllerNumber = 0
                    RestartIfNeeded  = $true
                }

                $null = Set-TargetResource @setTargetResourceParams

                Assert-MockCalled -CommandName Set-VMState -ParameterFilter { $State -eq 'Off' } -Scope It
            }

            It 'Should call "Set-VMState" to restore VM to its previous state' {
                $testVMState = 'Paused'
                Mock -CommandName Get-VMHyperV { return @{ State = $testVMState } }
                $setTargetResourceParams = @{
                    VMName           = $testVMName
                    ControllerNumber = 0
                    RestartIfNeeded  = $true
                }

                $null = Set-TargetResource @setTargetResourceParams

                Assert-MockCalled -CommandName Set-VMState -ParameterFilter { $State -eq $testVMState } -Scope It
            }

            It 'Should add single controller when it does not exist' {
                Mock -CommandName Get-VMHyperV { return @{ State = 'Running' } }
                Mock -CommandName Get-VMScsiController
                $setTargetResourceParams = @{
                    VMName           = $testVMName
                    ControllerNumber = 0
                    RestartIfNeeded  = $true
                }

                $null = Set-TargetResource @setTargetResourceParams

                Assert-MockCalled -CommandName Add-VMScsiController -Scope It -Exactly 1
            }

            It 'Should add single controller when one already exists' {
                Mock -CommandName Get-VMHyperV { return @{ State = 'Running' } }
                $fakeVMScsiController = [PSCustomObject] @{ ControllerNumber = 0 }
                Mock -CommandName Get-VMScsiController { return $fakeVMScsiController }
                $setTargetResourceParams = @{
                    VMName           = $testVMName
                    ControllerNumber = 1
                    RestartIfNeeded  = $true
                }

                $null = Set-TargetResource @setTargetResourceParams

                Assert-MockCalled -CommandName Add-VMScsiController -Scope It -Exactly 1
            }

            It 'Should throw when adding controller when intermediate controller(s) do not exist' {
                Mock -CommandName Get-VMHyperV { return @{ State = 'Running' } }
                Mock -CommandName Get-VMScsiController
                $setTargetResourceParams = @{
                    VMName           = $testVMName
                    ControllerNumber = 1
                    RestartIfNeeded  = $true
                }

                { Set-TargetResource @setTargetResourceParams } | Should -Throw 'Cannot add controller'
            }

            It 'Should remove controller when Ensure = "Absent"' {
                Mock -CommandName Get-VMHyperV { return @{ State = 'Running' } }
                $fakeVMScsiControllers = @(
                    [PSCustomObject] @{ ControllerNumber = 0 }
                    [PSCustomObject] @{ ControllerNumber = 1 }
                )
                Mock -CommandName Get-VMScsiController { return $fakeVMScsiControllers }
                $setTargetResourceParams = @{
                    VMName           = $testVMName
                    ControllerNumber = 1
                    RestartIfNeeded  = $true
                    Ensure           = 'Absent'
                }

                $null = Set-TargetResource @setTargetResourceParams -WarningAction SilentlyContinue

                Assert-MockCalled -CommandName Remove-VMScsiController -Scope It
            }

            It 'Should remove all attached disks when Ensure = "Absent"' {
                Mock -CommandName Get-VMHyperV { return @{ State = 'Running' } }
                $fakeVMScsiController = [PSCustomObject] @{
                    ControllerNumber = 0
                    Drives = @(
                        [PSCustomObject] @{ Name = 'Hard Drive on SCSI controller number 0 at location 0' }
                        [PSCustomObject] @{ Name = 'Hard Drive on SCSI controller number 0 at location 1' }
                    )
                }
                Mock -CommandName Get-VMScsiController { return $fakeVMScsiController }
                $setTargetResourceParams = @{
                    VMName           = $testVMName
                    ControllerNumber = 0
                    RestartIfNeeded  = $true
                    Ensure           = 'Absent'
                }

                $null = Set-TargetResource @setTargetResourceParams -WarningAction SilentlyContinue

                Assert-MockCalled -CommandName Remove-VMHardDiskDrive -Scope It -Exactly ($fakeVMScsiController.Drives.Count)
            }

            It 'Should throw removing a controller when additional/subsequent controller(s) exist' {
                Mock -CommandName Get-VMHyperV { return @{ State = 'Running' } }
                $fakeVMScsiControllers = @(
                    [PSCustomObject] @{ ControllerNumber = 0 }
                    [PSCustomObject] @{ ControllerNumber = 1 }
                )
                Mock -CommandName Get-VMScsiController { return $fakeVMScsiControllers }
                $setTargetResourceParams = @{
                    VMName           = $testVMName
                    ControllerNumber = 0
                    RestartIfNeeded  = $true
                    Ensure           = 'Absent'
                }

                { Set-TargetResource @setTargetResourceParams } | Should -Throw 'Cannot remove controller'
            }

        } # describe Set-TargetResource
    } # InModuleScope
}
finally
{
    Invoke-TestCleanup
}
