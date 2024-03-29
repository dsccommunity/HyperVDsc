$script:dscModuleName = 'HyperVDsc'
$script:dscResourceName = 'DSC_VMHost'

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

        Describe 'DSC_VMHost\Get-TargetResource' {
            $fakeVMHost = @{
                ResourceMeteringSaveInterval = 60
            }

            It 'Should return a [System.Collections.Hashtable] object type' {
                Mock -CommandName Assert-Module
                Mock -CommandName Get-VMHost { return $fakeVMHost }

                $result = Get-TargetResource -IsSingleInstance 'Yes'

                $result -is [System.Collections.Hashtable] | Should -Be $true
            }

            It 'Should assert Hyper-V module is installed' {
                Mock -CommandName Assert-Module
                Mock -CommandName Get-VMHost { return $fakeVMHost }

                $result = Get-TargetResource -IsSingleInstance 'Yes'

                Assert-MockCalled -CommandName Assert-Module -ParameterFilter { $ModuleName -eq 'Hyper-V' } -Scope It
            }

        } # describe Get-TargetResource

        Describe 'DSC_VMHost\Test-TargetResource' {

            # Guard mocks
            Mock -CommandName Assert-Module

            $fakeTargetResource = @{
                IsSingleInstance = 'Yes'
                EnableEnhancedSessionMode = $true
                FibreChannelWwnn = 'C003FF0000FFFF00'
                FibreChannelWwpnMaximum = 'C003FFFBEAE1FFFF'
                FibreChannelWwpnMinimum = 'C003FFFBEAE10000'
                MacAddressMinimum = '00155D327500'
                MacAddressMaximum = '00155D3275FF'
                MaximumStorageMigrations = 2
                MaximumVirtualMachineMigrations = 2
                NumaSpanningEnabled = $true
                ResourceMeteringSaveIntervalMinute = 60
                UseAnyNetworkForMigration = $false
                VirtualMachinePath ='C:\ProgramData\Microsoft\Windows\Hyper-V'
                VirtualMachineMigrationAuthenticationType = 'CredSSP'
                VirtualMachineMigrationPerformanceOption = 'TCPIP'
                VirtualHardDiskPath = 'C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks'
                VirtualMachineMigrationEnabled = $true
            }

            It 'Should return a [System.Boolean] object type' {
                Mock -CommandName Get-TargetResource { return $fakeTargetResource }

                $testTargetResourceParams = @{
                    IsSingleInstance = 'Yes'
                    EnableEnhancedSessionMode = $fakeTargetResource.EnableEnhancedSessionMode
                    VirtualMachineMigrationEnabled = $fakeTargetResource.VirtualMachineMigrationEnabled
                }
                $result = Test-TargetResource @testTargetResourceParams

                $result -is [System.Boolean] | Should -Be $true
            }

            It 'Should assert Hyper-V module is installed' {
                Mock -CommandName Get-TargetResource { return $fakeTargetResource }

                $testTargetResourceParams = @{
                    IsSingleInstance = 'Yes'
                    EnableEnhancedSessionMode = $fakeTargetResource.EnableEnhancedSessionMode
                }
                $result = Test-TargetResource @testTargetResourceParams

                Assert-MockCalled -CommandName Assert-Module -ParameterFilter { $ModuleName -eq 'Hyper-V' } -Scope It
            }

            $parameterNames = @(
                'EnableEnhancedSessionMode',
                'FibreChannelWwnn',
                'FibreChannelWwpnMaximum',
                'FibreChannelWwpnMinimum',
                'MacAddressMaximum',
                'MacAddressMinimum',
                'MaximumStorageMigrations',
                'MaximumVirtualMachineMigrations',
                'NumaSpanningEnabled',
                'ResourceMeteringSaveIntervalMinute',
                'UseAnyNetworkForMigration',
                'VirtualHardDiskPath',
                'VirtualMachinePath',
                'VirtualMachineMigrationEnabled'
            )

            # Test each individual parameter value separately
            foreach ($parameterName in $parameterNames)
            {
                $parameterValue = $fakeTargetResource[$parameterName]
                $testTargetResourceParams = @{
                    IsSingleInstance = 'Yes'
                }

                # Pass value verbatim so it should always pass first
                It "Should pass when parameter '$parameterName' is correct" {
                    $testTargetResourceParams[$parameterName] = $parameterValue

                    $result = Test-TargetResource @testTargetResourceParams

                    $result | Should -Be $true
                }

                if ($parameterValue -is [System.Boolean])
                {
                    # Invert parameter value to cause a test failure
                    $testTargetResourceParams[$parameterName] = -not $parameterValue
                }
                elseif ($parameterValue -is [System.String])
                {
                    # Repeat string to cause a test failure
                    $testTargetResourceParams[$parameterName] = "$parameterValue$parameterValue"
                }
                elseif ($parameterValue -is [System.Int32] -or $parameterValue -is [System.Int64])
                {
                    # Add one to cause a test failure
                    $testTargetResourceParams[$parameterName] = $parameterValue + 1
                }

                It "Should fail when parameter '$parameterName' is incorrect" {
                    $result = Test-TargetResource @testTargetResourceParams

                    $result | Should -Be $false
                }
            }

            It "Should pass when parameter <Parameter> is correct" -TestCases @(
                @{
                    Parameter = 'VirtualMachineMigrationAuthenticationType'
                    Value = $fakeTargetResource.VirtualMachineMigrationAuthenticationType
                    Expected = $true
                }
                @{
                    Parameter = 'VirtualMachineMigrationPerformanceOption'
                    Value = $fakeTargetResource.VirtualMachineMigrationPerformanceOption
                    Expected = $true
                }
                @{
                    Parameter = 'VirtualMachineMigrationEnabled'
                    Value = $fakeTargetResource.VirtualMachineMigrationEnabled
                    Expected = $true
                }
            ) -Test {
                param
                (
                    [Parameter()]
                    [System.String]
                    $Parameter,

                    [Parameter()]
                    [System.Object]
                    $Value,

                    [Parameter()]
                    [System.Boolean]
                    $Expected
                )

                $testTargetResourceParams = @{
                    IsSingleInstance = 'Yes'
                    $Parameter = $Value
                }

                $result = Test-TargetResource @testTargetResourceParams | Should -Be $Expected
            }

            It "Should fail when parameter <Parameter> is incorrect" -TestCases @(
                @{
                    Parameter = 'VirtualMachineMigrationAuthenticationType'
                    Value = 'Kerberos'
                    Expected = $false
                }
                @{
                    Parameter = 'VirtualMachineMigrationPerformanceOption'
                    Value = 'Compression'
                    Expected = $false
                }
                @{
                    Parameter = 'VirtualMachineMigrationEnabled'
                    Value = $true
                    Expected = $true
                }
            ) -Test {
                param
                (
                    [Parameter()]
                    [System.String]
                    $Parameter,

                    [Parameter()]
                    [System.Object]
                    $Value,

                    [Parameter()]
                    [System.Boolean]
                    $Expected
                )

                $testTargetResourceParams = @{
                    IsSingleInstance = 'Yes'
                    $Parameter = $Value
                }

                $result = Test-TargetResource @testTargetResourceParams | Should -Be $Expected
            }

        } # describe Test-TargetResource

        Describe 'DSC_VMHost\Set-TargetResource' {
            # Guard mocks
            Mock -CommandName Assert-Module
            Mock -CommandName Get-VMHost
            Mock -CommandName Set-VMHost
            Mock -CommandName Enable-VMMigration
            Mock -CommandName Disable-VMMigration

            It 'Should assert Hyper-V module is installed' {
                $setTargetResourceParams = @{
                    IsSingleInstance = 'Yes'
                }

                $result = Set-TargetResource @setTargetResourceParams

                Assert-MockCalled -CommandName Assert-Module -ParameterFilter { $ModuleName -eq 'Hyper-V' } -Scope It
            }

            It 'Should call "Set-VMHost" with [System.TimeSpan] object when "ResourceMeteringSaveIntervalMinute" specified' {
                $setTargetResourceParams = @{
                    IsSingleInstance = 'Yes'
                    ResourceMeteringSaveIntervalMinute = 60
                }

                $result = Set-TargetResource @setTargetResourceParams

                Assert-MockCalled -CommandName Set-VMHost -ParameterFilter { $ResourceMeteringSaveInterval -is [System.TimeSpan] }
            }

            It 'Should call "Enable-VMMigration" when "VirtualMachineMigrationEnabled" is set to true and computer is domain joined' {
                Mock -CommandName 'Get-CimInstance' -MockWith {
                    [pscustomobject] @{
                        PartOfDomain = $true
                    }
                }

                Mock -CommandName 'Write-Error'

                $setTargetResourceParams = @{
                    IsSingleInstance = 'Yes'
                    VirtualMachineMigrationEnabled = $true
                }

                $result = Set-TargetResource @setTargetResourceParams
                Assert-MockCalled -CommandName Write-Error -Times 0 -Exactly -Scope it
                Assert-MockCalled -CommandName Enable-VMMigration -Times 1 -Exactly -Scope it
                Assert-MockCalled -CommandName Disable-VMMigration -Times 0 -Exactly -Scope it
            }

            It 'Should not call "Enable-VMMigration" and should throw when "VirtualMachineMigrationEnabled" is set to true and computer is not domain joined' {
                Mock -CommandName 'Get-CimInstance' -MockWith {
                    [pscustomobject] @{
                        PartOfDomain = $false
                    }
                }

                $setTargetResourceParams = @{
                    IsSingleInstance = 'Yes'
                    VirtualMachineMigrationEnabled = $true
                }

                { Set-TargetResource @setTargetResourceParams } | Should -Throw
                Assert-MockCalled -CommandName Enable-VMMigration -Times 0 -Exactly -Scope it
                Assert-MockCalled -CommandName Disable-VMMigration -Times 0 -Exactly -Scope it
            }

            It 'Should call "Disable-VMMigration" when "VirtualMachineMigrationEnabled" is set to false' {
                $setTargetResourceParams = @{
                    IsSingleInstance = 'Yes'
                    VirtualMachineMigrationEnabled = $false
                }

                $result = Set-TargetResource @setTargetResourceParams
                Assert-MockCalled -CommandName Enable-VMMigration -Times 0 -Exactly -Scope it
                Assert-MockCalled -CommandName Disable-VMMigration -Times 1 -Exactly -Scope it
            }

            It 'Should not call "Disable-VMMigration" or "Enable-VMMigration" when "VirtualMachineMigrationEnabled" is not set' {
                $setTargetResourceParams = @{
                    IsSingleInstance = 'Yes'
                }

                $result = Set-TargetResource @setTargetResourceParams

                Assert-MockCalled -CommandName Enable-VMMigration -Times 0 -Exactly -Scope it
                Assert-MockCalled -CommandName Disable-VMMigration -Times 0 -Exactly -Scope it
            }

            It 'Should not call "Set-VMHost" when only "VirtualMachineMigrationEnabled" is set' {
                $setTargetResourceParams = @{
                    IsSingleInstance = 'Yes'
                    VirtualMachineMigrationEnabled = $false
                    Verbose = $true
                }

                $result = Set-TargetResource @setTargetResourceParams

                Assert-MockCalled -CommandName Enable-VMMigration -Times 0 -Exactly -Scope it
                Assert-MockCalled -CommandName Disable-VMMigration -Times 1 -Exactly -Scope it
                Assert-MockCalled -CommandName Set-VMHost -Times 0 -Exactly -Scope it
            }

        } # describe Set-TargetResource

    } # InModuleScope
}
finally
{
    Invoke-TestCleanup
}
