$script:dscModuleName = 'HyperVDsc'
$script:dscResourceName = 'DSC_VMProcessor'

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
    Import-Module -Name "$PSScriptRoot/../TestHelpers/Stubs/Hyper-V.stubs.psm1" -Force
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
        $testResourcePoolName = 'Unit Test Resource Pool'

        Describe 'DSC_VMProcessor\Get-TargetResource' {

            $fakeVMProcessor = @{
                EnableHostResourceProtection = $true
            }

            # Guard mocks
            Mock -CommandName Assert-Module

            It 'Should return a [System.Collections.Hashtable] object type' {
                Mock -CommandName Get-VMProcessor { return $fakeVMProcessor }

                $result = Get-TargetResource -VMName $testVMName

                $result -is [System.Collections.Hashtable] | Should -Be $true
            }

            It 'Should assert Hyper-V module is installed' {
                Mock -CommandName Assert-Module
                Mock -CommandName Get-VMProcessor { return $fakeVMProcessor }

                $null = Get-TargetResource -VMName $testVMName

                Assert-MockCalled -CommandName Assert-Module -ParameterFilter { $ModuleName -eq 'Hyper-V' } -Scope It
            }

            It 'Should throw when VM processor is not found' {
                Mock -CommandName Get-Module { return $true }
                Mock -CommandName Get-VMProcessor { Write-Error 'Not Found' }
                { $null = Get-TargetResource -VMName $testVMName } | Should -Throw 'Not Found'
            }
        } # descrive Get-TargetResource

        Describe 'DSC_VMProcessor\Test-TargetResource' {

            # Guard mocks
            Mock -CommandName Assert-Module
            Mock -CommandName Assert-TargetResourceParameter

            $fakeTargetResource = @{
                VMName = $testVMName
                EnableHostResourceProtection = $true
                ExposeVirtualizationExtensions = $true
                HwThreadCountPerCore = 1
                Maximum = 99
                MaximumCountPerNumaNode = 4
                MaximumCountPerNumaSocket = 1
                RelativeWeight = 99
                Reserve = 0
                ResourcePoolName = $testResourcePoolName
                CompatibilityForMigrationEnabled = $false
                CompatibilityForOlderOperatingSystemsEnabled = $false
            }

            It 'Should return a [System.Boolean] object type' {
                Mock -CommandName Get-TargetResource { return $fakeTargetResource }

                $result = Test-TargetResource -VMName $testVMName

                $result -is [System.Boolean] | Should -Be $true
            }

            It 'Should assert Hyper-V module is installed' {
                Mock -CommandName Get-VMProcessor { return $fakeVMProcessor }

                $null = Test-TargetResource -VMName $testVMName

                Assert-MockCalled -CommandName Assert-Module -ParameterFilter { $ModuleName -eq 'Hyper-V' } -Scope It
            }

            It 'Should assert parameter values are valid' {
                Mock -CommandName Get-VMProcessor { return $fakeVMProcessor }

                $null = Test-TargetResource -VMName $testVMName

                Assert-MockCalled -CommandName Assert-TargetResourceParameter -Scope It
            }

            $parameterNames = @(
                'EnableHostResourceProtection',
                'ExposeVirtualizationExtensions',
                'HwThreadCountPerCore',
                'Maximum',
                'MaximumCountPerNumaNode',
                'MaximumCountPerNumaSocket',
                'RelativeWeight',
                'Reserve',
                'ResourcePoolName',
                'CompatibilityForMigrationEnabled',
                'CompatibilityForOlderOperatingSystemsEnabled'
            )

            # Test each individual parameter value separately
            foreach ($parameterName in $parameterNames)
            {
                $parameterValue = $fakeTargetResource[$parameterName]
                $testTargetResourceParams = @{
                    VMName = $testVMName
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
        } # describe Test-TargetResource

        Describe 'DSC_VMProcessor\Set-TargetResource' {
            # Guard mocks
            Mock -CommandName Assert-Module
            Mock -CommandName Assert-TargetResourceParameter
            Mock -CommandName Get-VM
            Mock -CommandName Set-VMProcessor
            Mock -CommandName Set-VMProperty

            It 'Should assert Hyper-V module is installed' {
                $null = Set-TargetResource -VMName $testVMName

                Assert-MockCalled -CommandName Assert-Module -ParameterFilter { $ModuleName -eq 'Hyper-V' } -Scope It
            }

            It 'Should assert parameter values are valid' {
                $null = Set-TargetResource -VMName $testVMName

                Assert-MockCalled -CommandName Assert-TargetResourceParameter -Scope It
            }

            $restartRequiredParameters = @{
                'ExposeVirtualizationExtensions' = $false
                'CompatibilityForMigrationEnabled' = $true
                'CompatibilityForOlderOperatingSystemsEnabled' = $true
                'HwThreadCountPerCore' = 2
                'MaximumCountPerNumaNode' = 2
                'MaximumCountPerNumaSocket' = 2
                'ResourcePoolName' = $testResourcePoolName
            }

            foreach ($parameter in $restartRequiredParameters.GetEnumerator())
            {
                $setTargetResourceParams = @{
                    VMName = $testVMName
                    $parameter.Name = $parameter.Value
                }

                It "Should not throw when VM is off, '$($parameter.Name)' is specified and 'RestartIfNeeded' is False" {
                    Mock -CommandName Get-VM -MockWith {
                        return @{
                            State = 'Off'
                        }
                    }

                    { Set-TargetResource @setTargetResourceParams } | Should -Not -throw
                }

                It "Should throw when VM is running, '$($parameter.Name)' is specified and 'RestartIfNeeded' is False" {
                    Mock -CommandName Get-VM { return @{ State = 'Running' } }

                    { Set-TargetResource @setTargetResourceParams } | Should -Throw
                }

                It "Should shutdown VM when running, '$($parameter.Name)' is specified and 'RestartIfNeeded' is True" {
                    Mock -CommandName Get-VM { return @{ State = 'Running' } }

                    Set-TargetResource @setTargetResourceParams -RestartIfNeeded $true

                    Assert-MockCalled -CommandName Set-VMProperty -Scope It -Exactly 1
                }
            }

            $noRestartRequiredParameters = @{
                'EnableHostResourceProtection' = $true
                'Maximum' = 50
                'RelativeWeight' = 50
                'Reserve' = 50
            }

            foreach ($parameter in $noRestartRequiredParameters.GetEnumerator())
            {
                $setTargetResourceParams = @{
                    VMName = $testVMName
                    $parameter.Name = $parameter.Value
                }

                It "Should not shutdown VM running and '$($parameter.Name) is specified" {
                    Mock -CommandName Get-VM -MockWith {
                        return @{
                            State = 'Running'
                        }
                    }

                    Set-TargetResource @setTargetResourceParams

                    Assert-MockCalled -CommandName Set-VMProcessor -Scope It -Exactly 1
                    Assert-MockCalled -CommandName Set-VMProperty -Scope It -Exactly 0
                }
            }
        } # describe Set-TargetResource

        Describe 'DSC_VMProcessor\Assert-TargetResourceParameter' {

            # Return Windows Server 2012 R2/Windows 8.1 Update 1
            Mock -CommandName Get-CimInstance { return @{ BuildNumber = '9600' } }

            It "Should not throw when parameter 'ResourcePoolName' is specified on 2012 R2 host" {
                { Assert-TargetResourceParameter -ResourcePoolName 'TestPool' } | Should -Not -throw
            }

            $server2016OnlyParameters = @{
                EnableHostResourceProtection = $true
                ExposeVirtualizationExtensions = $true
                HwThreadCountPerCore = 1
            }

            foreach ($parameter in $server2016OnlyParameters.GetEnumerator())
            {
                $assertTargetResourceParameterParams = @{
                    $parameter.Name = $parameter.Value
                }

                It "Should throw when parameter '$($parameter.Name)' is specified on 2012 R2 host" {
                    { Assert-TargetResourceParameter @assertTargetResourceParameterParams } | Should -Throw '14393'
                }
            }
        } # describe Assert-TargetResourceParameter
    } # InModuleScope
}
finally
{
    Invoke-TestCleanup
}
