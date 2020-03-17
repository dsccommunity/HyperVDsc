$script:dscModuleName = 'xHyper-V'
$script:dscResourceName = 'MSFT_xVMSwitch'

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

        <#
            Defines a variable that contains all the possible Bandwidth Reservation Modes which will be used
            for foreach loops later on
        #>
        New-Variable -Name 'BANDWIDTH_RESERVATION_MODES' -Option 'Constant' -Value @('Default', 'Weight', 'Absolute', 'None')

        # A helper function to mock a VMSwitch
        function New-MockedVMSwitch
        {
            Param (
                [Parameter(Mandatory = $true)]
                [string]
                $Name,

                [Parameter(Mandatory = $true)]
                [ValidateSet('Default', 'Weight', 'Absolute', 'None', 'NA')]
                [string]
                $BandwidthReservationMode,

                [Parameter()]
                [bool]
                $AllowManagementOS = $false
            )

            $mockedVMSwitch = [Microsoft.HyperV.PowerShell.VMSwitch]::CreateTypeInstance()
            $mockedVMSwitch.Name = $Name
            $mockedVMSwitch.SwitchType = 'External'
            $mockedVMSwitch.AllowManagementOS = $AllowManagementOS
            $mockedVMSwitch.NetAdapterInterfaceDescription = 'Microsoft Network Adapter Multiplexor Driver'

            if ($BandwidthReservationMode -ne 'NA')
            {
                $mockedVMSwitch.BandwidthReservationMode = $BandwidthReservationMode
            }

            return $mockedVMSwitch
        }

        Describe 'Validates Get-TargetResource Function' {
            <#
                Mocks Get-VMSwitch and will return $script:mockedVMSwitch which is
                a variable that is created during most It statements to mock a VMSwitch
            #>
            Mock -CommandName Get-VMSwitch -MockWith {
                param
                (
                    [string]
                    $ErrorAction
                )

                if ($ErrorAction -eq 'Stop' -and $script:mockedVMSwitch -eq $null)
                {
                    throw [System.Management.Automation.ActionPreferenceStopException]'No switch can be found by given criteria.'
                }

                return $script:mockedVMSwitch
            }

            # Mocks Get-NetAdapter which returns a simplified network adapter
            Mock -CommandName Get-NetAdapter -MockWith {
                return [PSCustomObject]@{
                    Name = 'SomeNIC'
                    InterfaceDescription = 'Microsoft Network Adapter Multiplexor Driver'
                }
            }

            # Mocks "Get-Module -Name Hyper-V" so that the DSC resource thinks the Hyper-V module is on the test system
            Mock -CommandName Get-Module -ParameterFilter { ($Name -eq 'Hyper-V') -and ($ListAvailable -eq $true) } -MockWith {
                return $true
            }

            # Create all the test cases for Get-TargetResource
            $getTestCases = @()
            foreach ($brmMode in $BANDWIDTH_RESERVATION_MODES) {
                $getTestCases += @{
                    CurrentName = $brmMode + 'BRM'
                    CurrentBandwidthReservationMode = $brmMode
                }
            }

            # Test Get-TargetResource with the test cases created above
            It 'Current switch''s BandwidthReservationMode is set to <CurrentBandwidthReservationMode>' -TestCases $getTestCases {
                param
                (
                    [Parameter()]
                    [string]
                    $CurrentName,

                    [Parameter()]
                    [string]
                    $CurrentBandwidthReservationMode
                )

                # Set the mocked VMSwitch to be returned from Get-VMSwitch based on the input from $getTestCases
                $script:mockedVMSwitch = New-MockedVMSwitch -Name $CurrentName -BandwidthReservationMode $CurrentBandwidthReservationMode

                $targetResource = Get-TargetResource -Name $CurrentName -Type 'External'
                $targetResource -is [System.Collections.Hashtable] | Should -Be $true
                $targetResource['BandwidthReservationMode'] | Should -Be $CurrentBandwidthReservationMode

                Remove-Variable -Scope 'script' -Name 'mockedVMSwitch' -ErrorAction 'SilentlyContinue'
            }

            <#
                Test Get-TargetResource when the VMSwitch's BandwidthReservationMode member variable is not
                set which simulates older versions of Windows that don't support it
            #>
            It 'BandwidthReservationMode is set to null' {
                # Set the mocked VMSwitch to be returned from Get-VMSwitch
                $script:mockedVMSwitch = New-MockedVMSwitch -Name 'NaBRM' -BandwidthReservationMode 'NA'

                $targetResource = Get-TargetResource -Name 'NaBRM' -Type 'External'
                $targetResource -is [System.Collections.Hashtable] | Should -Be $true
                $targetResource['BandwidthReservationMode'] | Should -Be "Default"

                Remove-Variable -Scope 'script' -Name 'mockedVMSwitch' -ErrorAction 'SilentlyContinue'
            }
        }

        # Create all the test cases for Test-TargetResource and Set-TargetResource when the switch already exists
        $testSetTestCases = @()
        foreach ($currentBrmMode in $BANDWIDTH_RESERVATION_MODES)
        {
            foreach ($desiredBrmMode in $BANDWIDTH_RESERVATION_MODES)
            {
                foreach ($ensureOption in @('Present', 'Absent'))
                {
                    $case = @{
                        CurrentName = $currentBrmMode + 'BRM'
                        CurrentBandwidthReservationMode = $currentBrmMode
                        DesiredName = $desiredBrmMode + 'BRM'
                        DesiredBandwidthReservationMode = $desiredBrmMode
                        Ensure = $ensureOption
                        ExpectedResult = $ensureOption -eq 'Present' -and $currentBrmMode -eq $desiredBrmMode
                    }
                    $testSetTestCases += $case
                }
            }
        }

        # Create all the test cases for Test-TargetResource and Set-TargetResource when the switch does not exists
        foreach ($desiredBrmMode in $BANDWIDTH_RESERVATION_MODES)
        {
            foreach ($ensureOption in @('Present', 'Absent'))
            {
                $case = @{
                    CurrentName = $null
                    CurrentBandwidthReservationMode = $null
                    DesiredName = $desiredBrmMode + 'BRM'
                    DesiredBandwidthReservationMode = $desiredBrmMode
                    Ensure = $ensureOption
                    ExpectedResult = $ensureOption -eq 'Absent'
                }
                $testSetTestCases += $case
            }
        }

        Describe 'Validates Test-TargetResource Function' {
            <#
                Mocks Get-VMSwitch and will return $script:mockedVMSwitch which is
                a variable that is created during most It statements to mock a VMSwitch
            #>
            Mock -CommandName Get-VMSwitch -MockWith {
                param (
                    [string]
                    $ErrorAction
                )

                if ($ErrorAction -eq 'Stop' -and $script:mockedVMSwitch -eq $null)
                {
                    throw [System.Management.Automation.ActionPreferenceStopException]'No switch can be found by given criteria.'
                }

                return $script:mockedVMSwitch
            }

            # Mocks Get-NetAdapter which returns a simplified network adapter
            Mock -CommandName Get-NetAdapter -MockWith {
                return [PSCustomObject]@{
                    Name = 'SomeNIC'
                    InterfaceDescription = 'Microsoft Network Adapter Multiplexor Driver'
                }
            }

            # Mocks "Get-Module -Name Hyper-V" so that the DSC resource thinks the Hyper-V module is on the test system
            Mock -CommandName Get-Module -ParameterFilter { ($Name -eq 'Hyper-V') -and ($ListAvailable -eq $true) } -MockWith {
                return $true
            }

            Mock -CommandName Get-OSVersion -MockWith {
                return [Version]::Parse('6.3.9600')
            }

            # Create all the test cases for Get-TargetResource
            $getTestCases = @()
            foreach ($brmMode in $BANDWIDTH_RESERVATION_MODES)
            {
                $getTestCases += @{
                    CurrentName = $brmMode + 'BRM'
                    CurrentBandwidthReservationMode = $brmMode
                }
            }

            # Test Test-TargetResource with the test cases created above
            It 'Current Name "<CurrentName>" | Current BandwidthReservationMode set to "<CurrentBandwidthReservationMode>" | Desired BandwidthReservationMode set to "<DesiredBandwidthReservationMode>" | Ensure "<Ensure>"' -TestCases $testSetTestCases {
                param
                (
                    [Parameter()]
                    [string]
                    $CurrentName,

                    [Parameter()]
                    [string]
                    $CurrentBandwidthReservationMode,

                    [Parameter()]
                    [string]
                    $DesiredName,

                    [Parameter()]
                    [string]
                    $DesiredBandwidthReservationMode,

                    [Parameter()]
                    [string]
                    $Ensure,

                    [Parameter()]
                    [bool]
                    $ExpectedResult
                )

                # Set the mocked VMSwitch to be returned from Get-VMSwitch if the switch exists
                if ($CurrentName)
                {
                    $script:mockedVMSwitch = New-MockedVMSwitch -Name $CurrentName -BandwidthReservationMode $CurrentBandwidthReservationMode -AllowManagementOS $true
                }

                $targetResource = Test-TargetResource -Name $DesiredName -BandwidthReservationMode $DesiredBandwidthReservationMode -Type 'External' -NetAdapterName 'SomeNIC' -Ensure $Ensure -AllowManagementOS $true
                $targetResource | Should -Be $ExpectedResult

                Remove-Variable -Scope 'script' -Name 'mockedVMSwitch' -ErrorAction 'SilentlyContinue'
            }

            Mock -CommandName Get-OSVersion -MockWith {
                return [Version]::Parse('6.1.7601')
            }

            # Test Test-TargetResource when the version of Windows doesn't support BandwidthReservationMode
            It 'Invalid Operating System Exception' {
                $errorMessage = $script:localizedData.BandwidthReservationModeError

                {Test-TargetResource -Name 'WeightBRM' -Type 'External' -NetAdapterName 'SomeNIC' -AllowManagementOS $true -BandwidthReservationMode 'Weight' -Ensure 'Present'} | Should -Throw $errorMessage
            }

            It 'Passes when "BandwidthReservationMode" does not match but is not specified (#48)' {
                $script:mockedVMSwitch = New-MockedVMSwitch -Name 'SomeSwitch' -BandwidthReservationMode 'Absolute'
                $targetResource = Test-TargetResource -Name 'SomeSwitch' -Type 'Internal' -Ensure 'Present'
                $targetResource | Should -Be $true
            }
        }

        Describe 'Validates Set-TargetResource Function' {
            <#
                Mocks Get-VMSwitch and will return $script:mockedVMSwitch which is
                a variable that is created during most It statements to mock a VMSwitch
            #>
            Mock -CommandName Get-VMSwitch -MockWith {
                param
                (
                    [string]
                    $Name,

                    [string]
                    $SwitchType,

                    [string]
                    $ErrorAction
                )

                if ($ErrorAction -eq 'Stop' -and $script:mockedVMSwitch -eq $null)
                {
                    throw [System.Management.Automation.ActionPreferenceStopException]'No switch can be found by given criteria.'
                }

                return $script:mockedVMSwitch
            }

            <#
                Mocks New-VMSwitch and will assign a mocked switch to $script:mockedVMSwitch. This returns $script:mockedVMSwitch
                which is a variable that is created during most It statements to mock a VMSwitch
            #>
            Mock -CommandName New-VMSwitch -MockWith {
                param
                (
                    [string]
                    $Name,

                    [string]
                    $NetAdapterName,

                    [string]
                    $MinimumBandwidthMode,

                    [bool]
                    $AllowManagementOS
                )

                $script:mockedVMSwitch = New-MockedVMSwitch -Name $Name -BandwidthReservationMode $MinimumBandwidthMode -AllowManagementOS $AllowManagementOS
                return $script:mockedVMSwitch
            }

            <#
                Mocks Set-VMSwitch and will modify $script:mockedVMSwitch which is
                a variable that is created during most It statements to mock a VMSwitch
            #>
            Mock -CommandName Set-VMSwitch -MockWith {
                param
                (
                    [bool]
                    $AllowManagementOS
                )

                if ($AllowManagementOS)
                {
                    $script:mockedVMSwitch['AllowManagementOS'] = $AllowManagementOS
                }
            }

            <#
                Mocks Remove-VMSwitch and will remove the variable $script:mockedVMSwitch which is
                a variable that is created during most It statements to mock a VMSwitch
            #>
            Mock -CommandName Remove-VMSwitch -MockWith {
                $script:mockedVMSwitch = $null
            }

            # Mocks Get-NetAdapter which returns a simplified network adapter
            Mock -CommandName Get-NetAdapter -MockWith {
                return [PSCustomObject]@{
                    Name = 'SomeNIC'
                    InterfaceDescription = 'Microsoft Network Adapter Multiplexor Driver'
                }
            }

            # Mocks "Get-Module -Name Hyper-V" so that the DSC resource thinks the Hyper-V module is on the test system
            Mock -CommandName Get-Module -ParameterFilter { ($Name -eq 'Hyper-V') -and ($ListAvailable -eq $true) } -MockWith {
                return $true
            }

            Mock -CommandName Get-OSVersion -MockWith {
                return [Version]::Parse('6.3.9600')
            }

            It 'Current Name "<CurrentName>" | Current BandwidthReservationMode set to "<CurrentBandwidthReservationMode>" | Desired BandwidthReservationMode set to "<DesiredBandwidthReservationMode>" | Ensure "<Ensure>"' -TestCases $testSetTestCases {
                param
                (
                    [Parameter()]
                    [string]
                    $CurrentName,

                    [Parameter()]
                    [string]
                    $CurrentBandwidthReservationMode,

                    [Parameter()]
                    [string]
                    $DesiredName,

                    [Parameter()]
                    [string]
                    $DesiredBandwidthReservationMode,

                    [Parameter()]
                    [string]
                    $Ensure,

                    [Parameter()]
                    [bool]
                    $ExpectedResult
                )

                if ($CurrentName)
                {
                    # Set the mocked VMSwitch to be returned from Get-VMSwitch if the switch exists
                    $script:mockedVMSwitch = New-MockedVMSwitch -Name $CurrentName -BandwidthReservationMode $CurrentBandwidthReservationMode -AllowManagementOS $true
                }
                else
                {
                    if ($Ensure -eq 'Absent')
                    {
                        # This is called when Ensure = 'Absent'. TO make sure there is a VMSwitch to remove.
                        $script:mockedVMSwitch = New-MockedVMSwitch -Name $DesiredName -BandwidthReservationMode $DesiredBandwidthReservationMode -AllowManagementOS $true
                    }
                }

                $targetResource = Set-TargetResource -Name $DesiredName -BandwidthReservationMode $DesiredBandwidthReservationMode -Type 'External' -NetAdapterName 'SomeNIC' -Ensure $Ensure -AllowManagementOS $true
                $targetResource | Should -Be $null

                if ($CurrentName -and $Ensure -eq 'Present')
                {
                    if ($DesiredBandwidthReservationMode -ne $CurrentBandwidthReservationMode)
                    {
                        Assert-MockCalled -CommandName Get-VMSwitch -Times 2 -Scope 'It'
                        Assert-MockCalled -CommandName Remove-VMSwitch -Times 1 -Scope 'It'
                        Assert-MockCalled -CommandName New-VMSwitch -Times 1 -Scope 'It'
                        Assert-MockCalled -CommandName Set-VMSwitch -Times 0 -Scope 'It'
                    }
                    else
                    {
                        Assert-MockCalled -CommandName Get-VMSwitch -Times 1 -Scope 'It'
                    }
                }
                elseif ($Ensure -eq 'Present')
                {
                    Assert-MockCalled -CommandName Get-VMSwitch -Times 1 -Scope 'It'
                    Assert-MockCalled -CommandName New-VMSwitch -Times 1 -Scope 'It'
                }
                else
                {
                    Assert-MockCalled -CommandName Get-VMSwitch -Times 1 -Scope 'It'
                    Assert-MockCalled -CommandName Remove-VMSwitch -Times 1 -Scope 'It'
                }
                Remove-Variable -Scope 'script' -Name 'mockedVMSwitch' -ErrorAction 'SilentlyContinue'
            }

            # Test Set-TargetResource when the version of Windows doesn't support BandwidthReservationMode
            It 'Invalid Operating System Exception' {
                Mock -CommandName Get-OSVersion -MockWith {
                    return [Version]::Parse('6.1.7601')
                }

                $errorMessage = $script:localizedData.BandwidthReservationModeError

                {Set-TargetResource -Name 'WeightBRM' -Type 'External' -NetAdapterName 'SomeNIC' -AllowManagementOS $true -BandwidthReservationMode 'Weight' -Ensure 'Present'} | Should -Throw $errorMessage
            }
        }
    }
}
finally
{
    Invoke-TestCleanup
}
