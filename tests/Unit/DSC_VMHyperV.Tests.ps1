$script:dscModuleName = 'HyperVDsc'
$script:dscResourceName = 'DSC_VMHyperV'

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
        Describe 'xVMHyper-V' {
            $null = New-Item -Path 'TestDrive:\TestVM.vhdx' -ItemType File
            $null = New-Item -Path 'TestDrive:\TestVM.vhd' -ItemType File

            $stubVhdxDisk = [Microsoft.HyperV.PowerShell.HardDiskDrive]::CreateTypeInstance()
            $stubVhdxDisk.Path = 'TestDrive:\TestVM.vhdx'

            $stubVhdDisk = [Microsoft.HyperV.PowerShell.HardDiskDrive]::CreateTypeInstance()
            $stubVhdDisk.Path = 'TestDrive:\TestVM.vhd'

            $studVhdxDiskSnapshot = New-Item -Path "TestDrive:\TestVM_D0145678-1576-4435-AB18-9F000C1C17D0.avhdx"  -ItemType File
            $StubVMConfig = New-Item -Path 'TestDrive:\TestVM.xml' -ItemType File

            # Mock the class VMNetworkAdapter to support piping to cmdlet Connect-VMNetworkAdapter
            $stubNIC1 = [Microsoft.HyperV.PowerShell.VMNetworkAdapter]::CreateTypeInstance()
            $stubNIC1.SwitchName = 'Test Switch 1'
            $stubNIC1.MacAddress = 'AA-BB-CC-DD-EE-FF'
            $stubNIC1.IpAddresses = @('192.168.0.1', '10.0.0.1')

            # Mock the class VMNetworkAdapter to support piping to cmdlet Connect-VMNetworkAdapter
            $stubNIC2 = [Microsoft.HyperV.PowerShell.VMNetworkAdapter]::CreateTypeInstance()
            $stubNIC2.SwitchName = 'Test Switch 2'
            $stubNIC2.MacAddress = 'AA-BB-CC-DD-EE-FE'
            $stubNIC2.IpAddresses = @('192.168.1.1')

            $mockVmGuid = [System.Guid]::NewGuid().ToString()

            Mock -CommandName Get-VM -ParameterFilter { $Name -eq 'RunningVM' } -MockWith {
                $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM.Name = 'RunningVM'
                $stubVM.HardDrives = @(
                    $stubVhdxDisk,
                    $stubVhdDisk
                )
                $stubVM.Path = $StubVMConfig.FullPath
                $stubVM.Generation = 1
                $stubVM.MemoryStartup = 512MB
                $stubVM.MemoryMinimum = 128MB
                $stubVM.MemoryMaximum = 4096MB
                $stubVM.ProcessorCount = 1
                $stubVM.ID = $mockVmGuid
                $stubVM.CPUUsage = 10
                $stubVM.MemoryAssigned = 512MB
                $stubVM.Uptime = New-TimeSpan -Hours 12
                $stubVM.CreationTime = (Get-Date).AddHours(-12)
                $stubVM.DynamicMemoryEnabled = $true
                $stubVM.Notes = ''
                $stubVM.State = 'Running'
                $stubVM.NetworkAdapters = @(
                    $stubNIC1,
                    $stubNIC2
                )

                return $stubVM
            }

            Mock -CommandName Get-VM -ParameterFilter { $Name -eq 'StoppedVM' } -MockWith {
                $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM.Name = 'StoppedVM'
                $stubVM.HardDrives = @(
                    $stubVhdxDisk,
                    $stubVhdDisk
                )
                $stubVM.Path = $StubVMConfig.FullPath
                $stubVM.Generation = 1
                $stubVM.MemoryStartup = 512MB
                $stubVM.MemoryMinimum = 128MB
                $stubVM.MemoryMaximum = 4096MB
                $stubVM.ProcessorCount = 1
                $stubVM.ID = $mockVmGuid
                $stubVM.CPUUsage = 10
                $stubVM.MemoryAssigned = 512MB
                $stubVM.Uptime = New-TimeSpan -Hours 12
                $stubVM.CreationTime = (Get-Date).AddHours(-12)
                $stubVM.DynamicMemoryEnabled = $true
                $stubVM.Notes = ''
                $stubVM.State = 'Off'
                $stubVM.NetworkAdapters = @(
                    $stubNIC1,
                    $stubNIC2
                )

                return $stubVM
            }

            Mock -CommandName Get-VM -ParameterFilter { $Name -eq 'PausedVM' } -MockWith {
                $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM.Name = 'PausedVM'
                $stubVM.HardDrives = @(
                    $stubVhdxDisk,
                    $stubVhdDisk
                )
                $stubVM.Path = $StubVMConfig.FullPath
                $stubVM.Generation = 1
                $stubVM.MemoryStartup = 512MB
                $stubVM.MemoryMinimum = 128MB
                $stubVM.MemoryMaximum = 4096MB
                $stubVM.ProcessorCount = 1
                $stubVM.ID = $mockVmGuid
                $stubVM.CPUUsage = 10
                $stubVM.MemoryAssigned = 512MB
                $stubVM.Uptime = New-TimeSpan -Hours 12
                $stubVM.CreationTime = (Get-Date).AddHours(-12)
                $stubVM.DynamicMemoryEnabled = $true
                $stubVM.Notes = ''
                $stubVM.State = 'Paused'
                $stubVM.NetworkAdapters = @(
                    $stubNIC1,
                    $stubNIC2
                )

                return $stubVM
            }

            Mock -CommandName Get-VM -ParameterFilter { $Name -eq 'NonexistentVM' } -MockWith {
                Write-Error 'VM not found.'
            }

            Mock -CommandName Get-VM -ParameterFilter { $Name -eq 'DuplicateVM' } -MockWith {
                $stubVM1 = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM1.Name = 'DuplicateVM'
                $stubVM1.HardDrives = @(
                    $stubVhdxDisk,
                    $stubVhdDisk
                )
                $stubVM1.Path = $StubVMConfig.FullPath
                $stubVM1.Generation = 1
                $stubVM1.MemoryStartup = 512MB
                $stubVM1.MemoryMinimum = 128MB
                $stubVM1.MemoryMaximum = 4096MB
                $stubVM1.ProcessorCount = 1
                $stubVM1.ID = $mockVmGuid
                $stubVM1.CPUUsage = 10
                $stubVM1.MemoryAssigned = 512MB
                $stubVM1.Uptime = New-TimeSpan -Hours 12
                $stubVM1.CreationTime = (Get-Date).AddHours(-12)
                $stubVM1.DynamicMemoryEnabled = $true
                $stubVM1.Notes = ''
                $stubVM1.State = 'Off'
                $stubVM1.NetworkAdapters = @(
                    $stubNIC1,
                    $stubNIC2
                )

                $stubVM2 = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM2.Name = 'DuplicateVM'
                $stubVM2.HardDrives = @(
                    $stubVhdxDisk,
                    $stubVhdDisk
                )
                $stubVM2.Path = $StubVMConfig.FullPath
                $stubVM2.Generation = 1
                $stubVM2.MemoryStartup = 512MB
                $stubVM2.MemoryMinimum = 128MB
                $stubVM2.MemoryMaximum = 4096MB
                $stubVM2.ProcessorCount = 1
                $stubVM2.ID = $mockVmGuid
                $stubVM2.CPUUsage = 10
                $stubVM2.MemoryAssigned = 512MB
                $stubVM2.Uptime = New-TimeSpan -Hours 12
                $stubVM2.CreationTime = (Get-Date).AddHours(-12)
                $stubVM2.DynamicMemoryEnabled = $true
                $stubVM2.Notes = ''
                $stubVM2.State = 'Off'
                $stubVM2.NetworkAdapters = @(
                    $stubNIC1,
                    $stubNIC2
                )

                return @(
                    $stubVM1,
                    $stubVM2
                )
            }

            Mock -CommandName Get-VM -ParameterFilter { $Name -eq 'Generation1Vhd' } -MockWith {
                $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM.Name = 'Generation1Vhd'
                $stubVM.HardDrives = @(
                    $stubVhdDisk
                )
                $stubVM.Path = $StubVMConfig.FullPath
                $stubVM.Generation = 1
                $stubVM.MemoryStartup = 512MB
                $stubVM.MemoryMinimum = 128MB
                $stubVM.MemoryMaximum = 4096MB
                $stubVM.ProcessorCount = 1
                $stubVM.ID = $mockVmGuid
                $stubVM.CPUUsage = 10
                $stubVM.MemoryAssigned = 512MB
                $stubVM.Uptime = New-TimeSpan -Hours 12
                $stubVM.CreationTime = (Get-Date).AddHours(-12)
                $stubVM.DynamicMemoryEnabled = $true
                $stubVM.Notes = ''
                $stubVM.State = 'Running'
                $stubVM.NetworkAdapters = @(
                    $stubNIC1,
                    $stubNIC2
                )

                return $stubVM
            }

            Mock -CommandName Get-VM -ParameterFilter { $Name -eq 'Generation2VM' } -MockWith {
                $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM.Name = 'Generation2VM'
                $stubVM.HardDrives = @(
                    $stubVhdxDisk
                )
                $stubVM.Path = $StubVMConfig.FullPath
                $stubVM.Generation = 2
                $stubVM.MemoryStartup = 512MB
                $stubVM.MemoryMinimum = 128MB
                $stubVM.MemoryMaximum = 4096MB
                $stubVM.ProcessorCount = 1
                $stubVM.ID = $mockVmGuid
                $stubVM.CPUUsage = 10
                $stubVM.MemoryAssigned = 512MB
                $stubVM.Uptime = New-TimeSpan -Hours 12
                $stubVM.CreationTime = (Get-Date).AddHours(-12)
                $stubVM.DynamicMemoryEnabled = $true
                $stubVM.Notes = ''
                $stubVM.State = 'Running'
                $stubVM.NetworkAdapters = @(
                    $stubNIC1,
                    $stubNIC2
                )

                return $stubVM
            }

            Mock -CommandName Get-VM -ParameterFilter { $Name -eq 'VMWithAutomaticCheckpoints' } -MockWith {
                $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM.Name = 'VMWithAutomaticCheckpoints'
                $stubVM.HardDrives = @(
                    $stubVhdxDisk
                )
                $stubVM.Path = $StubVMConfig.FullPath
                $stubVM.Generation = 2
                $stubVM.MemoryStartup = 512MB
                $stubVM.MemoryMinimum = 128MB
                $stubVM.MemoryMaximum = 4096MB
                $stubVM.ProcessorCount = 1
                $stubVM.ID = $mockVmGuid
                $stubVM.CPUUsage = 10
                $stubVM.MemoryAssigned = 512MB
                $stubVM.Uptime = New-TimeSpan -Hours 12
                $stubVM.CreationTime = (Get-Date).AddHours(-12)
                $stubVM.DynamicMemoryEnabled = $true
                $stubVM.Notes = ''
                $stubVM.State = 'Running'
                $stubVM.AutomaticCheckpointsEnabled = $true
                $stubVM.NetworkAdapters = @(
                    $stubNIC1,
                    $stubNIC2
                )

                return $stubVM
            }

            Mock -CommandName Get-VM -ParameterFilter { $Name -eq 'VMWithoutAutomaticCheckpoints' } -MockWith {
                $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM.Name = 'VMWithoutAutomaticCheckpoints'
                $stubVM.HardDrives = @(
                    $stubVhdxDisk
                )
                $stubVM.Path = $StubVMConfig.FullPath
                $stubVM.Generation = 2
                $stubVM.MemoryStartup = 512MB
                $stubVM.MemoryMinimum = 128MB
                $stubVM.MemoryMaximum = 4096MB
                $stubVM.ProcessorCount = 1
                $stubVM.ID = $mockVmGuid
                $stubVM.CPUUsage = 10
                $stubVM.MemoryAssigned = 512MB
                $stubVM.Uptime = New-TimeSpan -Hours 12
                $stubVM.CreationTime = (Get-Date).AddHours(-12)
                $stubVM.DynamicMemoryEnabled = $true
                $stubVM.Notes = ''
                $stubVM.State = 'Running'
                $stubVM.AutomaticCheckpointsEnabled = $false
                $stubVM.NetworkAdapters = @(
                    $stubNIC1,
                    $stubNIC2
                )

                return $stubVM
            }

            Mock -CommandName Get-VM -ParameterFilter { $Name -eq 'VMAutomaticCheckpointsUnsupported' } -MockWith {
                $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                $stubVM.Name = 'VMAutomaticCheckpointsUnsupported'
                $stubVM.HardDrives = @(
                    $stubVhdxDisk
                )
                $stubVM.Path = $StubVMConfig.FullPath
                $stubVM.Generation = 2
                $stubVM.MemoryStartup = 512MB
                $stubVM.MemoryMinimum = 128MB
                $stubVM.MemoryMaximum = 4096MB
                $stubVM.ProcessorCount = 1
                $stubVM.ID = $mockVmGuid
                $stubVM.CPUUsage = 10
                $stubVM.MemoryAssigned = 512MB
                $stubVM.Uptime = New-TimeSpan -Hours 12
                $stubVM.CreationTime = (Get-Date).AddHours(-12)
                $stubVM.DynamicMemoryEnabled = $true
                $stubVM.Notes = ''
                $stubVM.State = 'Running'
                $stubVM.NetworkAdapters = @(
                    $stubNIC1,
                    $stubNIC2
                )

                return $stubVM
            }

            $stubGuestServiceInterfaceId = 'Microsoft:{0}\6C09BB55-D683-4DA0-8931-C9BF705F6480' -f $mockVmGuid

            Mock -CommandName Get-VMIntegrationService -MockWith {
                $guestServiceInterface = [Microsoft.HyperV.PowerShell.VMIntegrationComponent]::CreateTypeInstance()
                $guestServiceInterface.Enabled = $false
                $guestServiceInterface.Id = $stubGuestServiceInterfaceId

                return $guestServiceInterface
            }

            Mock -CommandName Get-Module -ParameterFilter { ($Name -eq 'Hyper-V') -and ($ListAvailable -eq $true) } -MockWith { return $true }
            Mock -CommandName Get-VhdHierarchy -ParameterFilter { $VhdPath.EndsWith('.vhd') } -MockWith {
                # Return single Vhd chain for .vhds
                return @($stubVhdDisk.Path)
            }
            Mock -CommandName Get-VhdHierarchy -ParameterFilter { $VhdPath.EndsWith('.vhdx') } -MockWith {
                # Return snapshot hierarchy for .vhdxs
                return @($stubVhdxDiskSnapshot.FullName, $stubVhdxDisk.Path)
            }
            Context 'Validates Get-TargetResource Method' {

                It 'Returns a hashtable' {
                    $targetResource = Get-TargetResource -Name 'RunningVM' -VhdPath $stubVhdxDisk.Path
                    $targetResource -is [System.Collections.Hashtable] | Should -Be $true
                }

                It 'throws when multiple VMs are present' {
                    { Get-TargetResource -Name 'DuplicateVM' -VhdPath $stubVhdxDisk.Path } | Should -Throw
                }

                It 'Does not call Get-VMFirmware if a generation 1 VM' {
                    Mock -CommandName Get-VMFirmware -MockWith { throw }
                    $null = Get-TargetResource -Name 'RunningVM' -VhdPath $stubVhdxDisk.Path
                    Assert-MockCalled -CommandName Get-VMFirmware -Scope It -Exactly 0
                }

                It 'Calls Get-VMFirmware if a generation 2 VM' {
                    Mock -CommandName Get-VMFirmware -MockWith { return $true }
                    $null = Get-TargetResource -Name 'Generation2VM' -VhdPath $stubVhdxDisk.Path
                    Assert-MockCalled -CommandName Get-VMFirmware -Scope It -Exactly 1
                }

                It 'Hash table contains key EnableGuestService' {
                    $targetResource = Get-TargetResource -Name 'RunningVM' -VhdPath $stubVhdxDisk.Path
                    $targetResource.ContainsKey('EnableGuestService') | Should -Be $true
                }
                It 'Hash table contains key AutomaticCheckpointEnabled' {
                    $targetResource = Get-TargetResource -Name 'VMWithAutomaticCheckpoints' -VhdPath $stubVhdxDisk.Path
                    $targetResource.ContainsKey('AutomaticCheckpointsEnabled') | Should -Be $true
                }
                It 'throws when Hyper-V Tools are not installed' {
                    # This test needs to be the last in the Context otherwise all subsequent Get-Module checks will fail
                    Mock -CommandName Get-Module -ParameterFilter { ($Name -eq 'Hyper-V') -and ($ListAvailable -eq $true) }
                    { Get-TargetResource -Name 'RunningVM' @testParams } | Should -Throw
                }
            } #end context Validates Get-TargetResource Method

            Context 'Validates Test-TargetResource Method' {
                $testParams = @{
                    VhdPath = $stubVhdxDisk.Path
                }

                It 'Returns a boolean' {
                    $targetResource = Test-TargetResource -Name 'RunningVM' @testParams
                    $targetResource -is [System.Boolean] | Should -Be $true
                }

                It 'Returns $true when VM is present and "Ensure" = "Present"' {
                    Test-TargetResource -Name 'RunningVM' @testParams | Should -Be $true
                }

                It 'Returns $false when VM is not present and "Ensure" = "Present"' {
                    Test-TargetResource -Name 'NonexistentVM' @testParams | Should -Be $false
                }

                It 'Returns $true when VM is not present and "Ensure" = "Absent"' {
                    Test-TargetResource -Name 'NonexistentVM' -Ensure Absent @testParams | Should -Be $true
                }

                It 'Returns $false when VM is present and "Ensure" = "Absent"' {
                    Test-TargetResource -Name 'RunningVM' -Ensure Absent @testParams | Should -Be $false
                }

                It 'Returns $true when VM is in the "Running" state and no state is explicitly specified' {
                    Test-TargetResource -Name 'RunningVM' @testParams | Should -Be $true
                }

                It 'Returns $true when VM is in the "Stopped" state and no state is explicitly specified' {
                    Test-TargetResource -Name 'StoppedVM' @testParams | Should -Be $true
                }

                It 'Returns $true when VM is in the "Paused" state and no state is explicitly specified' {
                    Test-TargetResource -Name 'PausedVM' @testParams | Should -Be $true
                }

                It 'Returns $true when VM is in the "Running" state and requested "State" = "Running"' {
                    Test-TargetResource -Name 'RunningVM' @testParams | Should -Be $true
                }

                It 'Returns $true when VM is in the "Off" state and requested "State" = "Off"' {
                    Test-TargetResource -Name 'StoppedVM' -State Off @testParams | Should -Be $true
                }

                It 'Returns $true when VM is in the "Paused" state and requested "State" = Paused"' {
                    Test-TargetResource -Name 'PausedVM' -State Paused @testParams | Should -Be $true
                }

                It 'Returns $false when VM is in the "Running" state and requested "State" = "Off"' {
                    Test-TargetResource -Name 'RunningVM' -State Off @testParams | Should -Be $false
                }

                It 'Returns $false when VM is in the "Off" state and requested "State" = "Runnning"' {
                    Test-TargetResource -Name 'StoppedVM' -State Running @testParams | Should -Be $false
                }

                It 'Returns $true when VM .vhd file is specified with a generation 1 VM' {
                    Test-TargetResource -Name 'Generation1Vhd' -VhdPath $stubVhdDisk.Path -Generation 1 -Verbose | Should -Be $true
                }

                It 'Returns $true when VM .vhdx file is specified with a generation 1 VM' {
                    Test-TargetResource -Name 'StoppedVM' -VhdPath $stubVhdxDisk.Path -Generation 1 | Should -Be $true
                }

                It 'Returns $true when VM .vhdx file is specified with a generation 2 VM' {
                    Mock -CommandName Test-VMSecureBoot -MockWith { return $true }
                    Test-TargetResource -Name 'Generation2VM' -Generation 2 @testParams | Should -Be $true
                }

                It 'throws when a VM .vhd file is specified with a generation 2 VM' {
                    { Test-TargetResource -Name 'Gen2VM' -VhdPath $stubVhdDisk.Path -Generation 2 } | Should -Throw
                }

                It 'Returns $true when multiple NICs are assigned in the correct order' {
                    Test-TargetResource -Name 'RunningVM' @testParams -SwitchName @($stubNIC1.SwitchName, $stubNIC2.SwitchName) | Should -Be $true
                }

                It 'Returns $false when multiple NICs are not assigned/assigned in the wrong order' {
                    Test-TargetResource -Name 'RunningVM' @testParams -SwitchName @($stubNIC2.SwitchName, $stubNIC1.SwitchName) | Should -Be $false
                }

                It 'Returns $true when multiple MAC addresses are assigned in the correct order' {
                    Test-TargetResource -Name 'RunningVM' @testParams -MACAddress @($stubNIC1.MACAddress, $stubNIC2.MACAddress) | Should -Be $true
                }

                It 'Returns $false when multiple MAC addresses not assigned/assigned in the wrong order' {
                    Test-TargetResource -Name 'RunningVM' @testParams -MACAddress @($stubNIC1.MACAddress, $stubNIC2.MACAddress) | Should -Be $true
                }

                It 'Returns $true regardless of "SecureBoot" setting on a generation 1 VM' {
                    Test-TargetResource -Name 'RunningVM' -SecureBoot $true @testParams | Should -Be $true
                    Test-TargetResource -Name 'RunningVM' -SecureBoot $false @testParams | Should -Be $true
                }

                It 'Returns $true when SecureBoot is On and requested "SecureBoot" = "$true"' {
                    Mock -CommandName Test-VMSecureBoot -MockWith { return $true }
                    Test-TargetResource -Name 'Generation2VM' -Generation 2 @testParams | Should -Be $true
                }

                It 'Returns $false when SecureBoot is On and requested "SecureBoot" = "$false"' {
                    Mock -CommandName Test-VMSecureBoot -MockWith { return $true }
                    Test-TargetResource -Name 'Generation2VM' -SecureBoot $false -Generation 2 @testParams | Should -Be $false
                }

                It 'Returns $true when VM has snapshot chain' {
                    Mock -CommandName Get-VhdHierarchy -MockWith {
                        return @($studVhdxDiskSnapshot, $stubVhdxDisk)
                    }
                    Test-TargetResource -Name 'Generation2VM' -VhdPath $stubVhdxDisk.Path -Verbose | Should -Be $true
                }

                It 'Returns $false when EnableGuestService is off and requested "EnableGuestService" = "$true"' {
                    Test-TargetResource -Name 'RunningVM' -EnableGuestService $true @testParams | Should -Be $false
                }

                It 'Returns $true when EnableGuestService is off and "EnableGuestService" is not requested"' {
                    Test-TargetResource -Name 'RunningVM'  @testParams | Should -Be $true
                }

                Mock -CommandName Get-Command -ParameterFilter { $Name -eq 'Set-VM' -and $Module -eq 'Hyper-V' } -MockWith {
                    [pscustomobject]@{
                        parameters = @{
                            # Does not contains parameter AutomaticCheckpointsEnabled
                        }
                    }
                }
                It 'throws when AutomaticCheckpointsEnabled is configured but not supported' {
                    { Test-TargetResource -Name 'VMAutomaticCheckpoinstUnsupported' -AutomaticCheckpointsEnabled $true @testParams } | Should -Throw
                }

                Mock -CommandName Get-Command -ParameterFilter { $Name -eq 'Set-VM' -and $Module -eq 'Hyper-V' } -MockWith {
                    [pscustomobject]@{
                        parameters = @{
                            'AutomaticCheckpointsEnabled' = ''
                        }
                    }
                }
                It 'Returns $true when AutomaticCheckpointsEnabled is on and requested "AutomaticCheckpointsEnabled" is not requested' {
                    Test-TargetResource -Name 'VMWithAutomaticCheckpoints' @testParams | Should -Be $true
                }
                It 'Returns $true when AutomaticCheckpointsEnabled is on and requested "AutomaticCheckpointsEnabled" = "$true"' {
                    Test-TargetResource -Name 'VMWithAutomaticCheckpoints' -AutomaticCheckpointsEnabled $true @testParams | Should -Be $true
                }
                It 'Returns $true when AutomaticCheckpointsEnabled is off and requested "AutomaticCheckpointsEnabled" = "$false"' {
                    Test-TargetResource -Name 'VMWithoutAutomaticCheckpoints' -AutomaticCheckpointsEnabled $false @testParams | Should -Be $true
                }
                It 'Returns $false when AutomaticCheckpointsEnabled is off and requested "AutomaticCheckpointsEnabled" = "$true"' {
                    Test-TargetResource -Name 'VMWithoutAutomaticCheckpoints' -AutomaticCheckpointsEnabled $true @testParams | Should -Be $false
                }
                It 'Returns $false when AutomaticCheckpointsEnabled is on and requested "AutomaticCheckpointsEnabled" = "$false"' {
                    Test-TargetResource -Name 'VMWithAutomaticCheckpoints' -AutomaticCheckpointsEnabled $false @testParams | Should -Be $false
                }

                It 'Returns $true when EnableGuestService is on and requested "EnableGuestService" = "$true"' {
                    Mock -CommandName Get-VMIntegrationService -MockWith {
                        $guestServiceInterface = [Microsoft.HyperV.PowerShell.VMIntegrationComponent]::CreateTypeInstance()
                        $guestServiceInterface.Enabled = $true
                        $guestServiceInterface.Id = $stubGuestServiceInterfaceId

                        return $guestServiceInterface
                    }

                    Test-TargetResource -Name 'RunningVM' -EnableGuestService $true @testParams | Should -Be $true
                }

                It 'throws when Hyper-V Tools are not installed' {
                    # This test needs to be the last in the Context otherwise all subsequent Get-Module checks will fail
                    Mock -CommandName Get-Module -ParameterFilter { ($Name -eq 'Hyper-V') -and ($ListAvailable -eq $true) }
                    { Test-TargetResource -Name 'RunningVM' @testParams } | Should -Throw
                }

            } #end context Validates Test-TargetResource Method

            Context 'Validates Set-TargetResource Method' {
                $testParams = @{
                    VhdPath = $stubVhdxDisk.Path
                }

                Mock -CommandName Get-VM -ParameterFilter { $Name -eq 'NewVM' }
                Mock -CommandName New-VM -MockWith {
                    $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                    $stubVM.Name = 'NewVM'
                    $stubVM.Path = $StubVMConfig.FullPath
                    $stubVM.Generation = $Generation
                    $stubVM.ID = $mockVmGuid
                    $stubVM.State = 'Off'

                    return $stubVM
                }

                Mock -CommandName Set-VM -MockWith { return $true }
                Mock -CommandName Stop-VM -MockWith { return $true } # requires output to be able to pipe something into Remove-VM
                Mock -CommandName Remove-VM -MockWith { return $true }
                Mock -CommandName Set-VMNetworkAdapter -MockWith { return $true }
                Mock -CommandName Get-VMNetworkAdapter -MockWith { return $stubVM.NetworkAdapters.IpAddresses }
                Mock -CommandName Set-VMState -MockWith { return $true }
                Mock -CommandName Set-VMMemory

                It 'Removes an existing VM when "Ensure" = "Absent"' {
                    Set-TargetResource -Name 'RunningVM' -Ensure Absent @testParams
                    Assert-MockCalled -CommandName Remove-VM -Scope It
                }

                It 'Creates and starts a VM VM with disabled dynamic memory that does not exist when "Ensure" = "Present" and "State" = "Running"' {
                    Set-TargetResource -Name 'NewVM' -State Running @testParams
                    Assert-MockCalled -CommandName New-VM -Exactly -Times 1 -Scope It
                    Assert-MockCalled -CommandName Set-VM -Exactly -Times 1 -Scope It
                    Assert-MockCalled -CommandName Set-VMState -Exactly -Times 1 -Scope It
                }

                It 'Creates but does not start a VM with disabled dynamic memory that does not exist when "Ensure" = "Present"' {
                    Set-TargetResource -Name 'NewVM' @testParams
                    Assert-MockCalled -CommandName New-VM -Exactly -Times 1 -Scope It
                    Assert-MockCalled -CommandName Set-VM -Exactly -Times 1 -Scope It
                    Assert-MockCalled -CommandName Set-VMState -Exactly -Times 0 -Scope It
                }

                It 'Creates but does not start a VM with disabled dynamic memory when only StartupMemory is specified' {
                    Set-TargetResource -Name 'NewVM' @testParams -StartupMemory 4GB
                    Assert-MockCalled -CommandName New-VM -Exactly -Times 1 -Scope It
                    Assert-MockCalled -CommandName Set-VM -Exactly -Times 1 -Scope It
                    Assert-MockCalled -CommandName Set-VMState -Exactly -Times 0 -Scope It
                }

                It 'Creates but does not start a VM with disabled dynamic memory when identical values for startup, minimum and maximum memory are specified' {
                    Set-TargetResource -Name 'NewVM' @testParams -StartupMemory 4GB -MinimumMemory 4GB -MaximumMemory 4GB
                    Assert-MockCalled -CommandName New-VM -Exactly -Times 1 -Scope It
                    Assert-MockCalled -CommandName Set-VM -Exactly -Times 1 -Scope It
                    Assert-MockCalled -CommandName Set-VMMemory -Exactly -Times 1 -Scope It
                    Assert-MockCalled -CommandName Set-VMState -Exactly -Times 0 -Scope It
                }

                It 'Creates but does not start a VM with enabled dynamic memory because a MinimumMemory value is specified' {
                    Set-TargetResource -Name 'NewVM' @testParams -MinimumMemory 512MB
                    Assert-MockCalled -CommandName New-VM -Exactly -Times 1 -Scope It
                    Assert-MockCalled -CommandName Set-VM -Exactly -Times 1 -Scope It
                    Assert-MockCalled -CommandName Set-VMMemory -Exactly -Times 0 -Scope It
                    Assert-MockCalled -CommandName Set-VMState -Exactly -Times 0 -Scope It
                }

                It 'Creates but does not start a VM with enabled dynamic memory because a MaximumMemory value is specified' {
                    Set-TargetResource -Name 'NewVM' @testParams -MaximumMemory 16GB
                    Assert-MockCalled -CommandName New-VM -Exactly -Times 1 -Scope It
                    Assert-MockCalled -CommandName Set-VM -Exactly -Times 1 -Scope It
                    Assert-MockCalled -CommandName Set-VMMemory -Exactly -Times 0 -Scope It
                    Assert-MockCalled -CommandName Set-VMState -Exactly -Times 0 -Scope It
                }

                It 'Does not change VM state when VM "State" = "Running" and requested "State" = "Running"' {
                    Set-TargetResource -Name 'RunningVM' -State Running @testParams
                    Assert-MockCalled -CommandName Set-VMState -Exactly -Times 0 -Scope It
                }

                It 'Does not change VM state when VM "State" = "Off" and requested "State" = "Off"' {
                    Set-TargetResource -Name 'StoppedVM' -State Off @testParams
                    Assert-MockCalled -CommandName Set-VMState -Exactly -Times 0 -Scope It
                }

                It 'Changes VM state when existing VM "State" = "Off" and requested "State" = "Running"' {
                    Set-TargetResource -Name 'StoppedVM' -State Running @testParams
                    Assert-MockCalled -CommandName Set-VMState -Exactly -Times 1 -Scope It
                }

                It 'Changes VM state when existing VM "State" = "Running" and requested "State" = "Off"' {
                    Set-TargetResource -Name 'RunningVM' -State Off @testParams
                    Assert-MockCalled -CommandName Set-VMState -Exactly -Times 1 -Scope It
                }

                It 'Creates a generation 1 VM by default/when not explicitly specified' {
                    Set-TargetResource -Name 'NewVM' @testParams
                    Assert-MockCalled -CommandName New-VM -ParameterFilter { $Generation -eq 1 } -Scope It
                }

                It 'Creates a generation 1 VM when explicitly specified' {
                    Set-TargetResource -Name 'NewVM' -Generation 1 @testParams
                    Assert-MockCalled -CommandName New-VM -ParameterFilter { $Generation -eq 1 } -Scope It
                }

                It 'Creates a generation 2 VM when explicitly specified' {
                    Set-TargetResource -Name 'NewVM' -Generation 2 @testParams
                    Assert-MockCalled -CommandName New-VM -ParameterFilter { $Generation -eq 2 } -Scope It
                }

                It 'Calls "Add-VMNetworkAdapter" for each NIC when creating a new VM' {
                    Mock -CommandName Add-VMNetworkAdapter
                    Set-TargetResource -Name 'NewVM' @testParams -SwitchName 'Switch1', 'Switch2'
                    # The first NIC is assigned during the VM creation
                    Assert-MockCalled -CommandName Add-VMNetworkAdapter -Exactly 1 -Scope It
                }

                It 'Calls "Connect-VMNetworkAdapter" for each existing NIC when updating an existing VM' {
                    Mock -CommandName Connect-VMNetworkAdapter
                    Set-TargetResource -Name 'StoppedVM' @testParams -SwitchName 'Switch1', 'Switch2'
                    # The first NIC is assigned during the VM creation
                    Assert-MockCalled -CommandName Connect-VMNetworkAdapter -Exactly 2 -Scope It
                }

                It 'Calls "Add-VMNetworkAdapter" for each missing NIC when updating an existing VM' {
                    Mock -CommandName Connect-VMNetworkAdapter
                    Mock -CommandName Add-VMNetworkAdapter
                    Set-TargetResource -Name 'StoppedVM' @testParams -SwitchName 'Switch1', 'Switch2', 'Switch3'
                    # The first NIC is assigned during the VM creation
                    Assert-MockCalled -CommandName Connect-VMNetworkAdapter -Exactly 2 -Scope It
                    Assert-MockCalled -CommandName Add-VMNetworkAdapter -Exactly 1 -Scope It
                }

                It 'Does not change switch assignments if no switch assignments are specified' {
                    Mock -CommandName Connect-VMNetworkAdapter
                    Set-TargetResource -Name 'StoppedVM' @testParams
                    Assert-MockCalled -CommandName Connect-VMNetworkAdapter -Exactly 0 -Scope It
                }

                It 'Does not change NIC assignments if the switch assisgnments are correct' {
                    Mock -CommandName Set-VMNetworkAdapter
                    Set-TargetResource -Name 'StoppedVM' @testParams -SwitchName $stubNIC1.SwitchName, $stubNIC2.SwitchName
                    Assert-MockCalled -CommandName Set-VMNetworkAdapter -Exactly 0 -Scope It
                }

                It 'Errors when updating MAC addresses on a running VM and "RestartIfNeeded" = "$false"' {
                    { Set-TargetResource -Name 'RunningVM' @testParams -MACAddress 'AABBCCDDEEFE', 'AABBCCDDEEFF' -ErrorAction Stop } | Should -Throw
                }

                It 'Does not change MAC addresses if no MAC addresses assignments are specified' {
                    Mock -CommandName Set-VMNetworkAdapter -ParameterFilter { $StaticMacAddress -ne $null }
                    Set-TargetResource -Name 'StoppedVM' @testParams
                    Assert-MockCalled -CommandName Set-VMNetworkAdapter -ParameterFilter { $StaticMacAddress -ne $null } -Exactly 0 -Scope It
                }

                It 'Calls "Set-VMNetworkAdapter" for each MAC address on a stopped VM' {
                    Mock -CommandName Set-VMNetworkAdapter
                    Set-TargetResource -Name 'StoppedVM' @testParams -MACAddress 'AABBCCDDEEFE', 'AABBCCDDEEFF'
                    # The first NIC is assigned during the VM creation
                    Assert-MockCalled -CommandName Set-VMNetworkAdapter -Exactly 2 -Scope It
                }

                It 'Does not change Secure Boot call "Set-VMProperty" when creating a generation 1 VM' {
                    Mock -CommandName Set-VMProperty
                    Set-TargetResource -Name 'RunningVM' @testParams
                    Assert-MockCalled -CommandName Set-VMProperty -ParameterFilter { $VMCommand -eq 'Set-VMFirmware' } -Exactly 0 -Scope It
                }

                It 'Does call "Set-VMProperty" when creating a generation 2 VM' {
                    Mock -CommandName Test-VMSecureBoot -MockWith { return $true }
                    Mock -CommandName Set-VMProperty
                    Set-TargetResource -Name 'RunningVM' -Generation 2 -SecureBoot $false @testParams
                    Assert-MockCalled -CommandName Set-VMProperty -ParameterFilter { $VMCommand -eq 'Set-VMFirmware' } -Exactly 1 -Scope It
                }

                It 'Does not change Secure Boot for generation 1 VM' {
                    Mock -CommandName Test-VMSecureBoot -MockWith { return $true }
                    Mock -CommandName Set-VMProperty
                    Set-TargetResource -Name 'StoppedVM' -SecureBoot $true @testParams
                    Set-TargetResource -Name 'StoppedVM' -SecureBoot $false @testParams
                    Assert-MockCalled -CommandName Set-VMProperty -ParameterFilter { $VMCommand -eq 'Set-VMFirmware' } -Exactly 0 -Scope It
                }

                It 'Does not change Secure Boot for generation 2 VM with VM "SecureBoot" match' {
                    Mock -CommandName Test-VMSecureBoot -MockWith { return $true }
                    Mock -CommandName Set-VMProperty
                    Set-TargetResource -Name 'StoppedVM' -SecureBoot $true -Generation 2 @testParams
                    Assert-MockCalled -CommandName Set-VMProperty -ParameterFilter { $VMCommand -eq 'Set-VMFirmware' } -Exactly 0 -Scope It
                }

                It 'Does change Secure Boot for generation 2 VM with VM "SecureBoot" mismatch' {
                    Mock -CommandName Test-VMSecureBoot -MockWith { return $false }
                    Mock -CommandName Set-VMProperty
                    Set-TargetResource -Name 'StoppedVM' -SecureBoot $true -Generation 2 @testParams
                    Assert-MockCalled -CommandName Set-VMProperty -ParameterFilter { $VMCommand -eq 'Set-VMFirmware' } -Exactly 1 -Scope It
                }

                It 'Does call "Enable-VMIntegrationService" when "EnableGuestService" = "$true"' {
                    Mock -CommandName Enable-VMIntegrationService
                    Set-TargetResource -Name 'RunningVM' -EnableGuestService $true @testParams
                    Assert-MockCalled -CommandName Enable-VMIntegrationService -Exactly -Times 1 -Scope It
                }

                It 'Does call "Disable-VMIntegrationService" when "Guest Service Interface" = "Enabled" and "EnableGuestService" = "$false" specified' {
                    Mock -CommandName Disable-VMIntegrationService
                    Mock -CommandName Get-VMIntegrationService -MockWith {
                        $guestServiceInterface = [Microsoft.HyperV.PowerShell.VMIntegrationComponent]::CreateTypeInstance()
                        $guestServiceInterface.Enabled = $true
                        $guestServiceInterface.Id = $stubGuestServiceInterfaceId

                        return $guestServiceInterface
                    }

                    Set-TargetResource -Name 'RunningVM' -EnableGuestService $false @testParams
                    Assert-MockCalled -CommandName Disable-VMIntegrationService -Exactly -Times 1 -Scope It
                }

                Mock -CommandName Get-Command -ParameterFilter { $Name -eq 'Set-VM' -and $Module -eq 'Hyper-V' } -MockWith {
                    [pscustomobject]@{
                        parameters = @{
                            # Does not contain parameter AutomaticCheckpointsEnabled
                        }
                    }
                }
                It 'throws when AutomaticCheckpointsEnabled is configured but not supported' {
                    { Set-TargetResource -Name 'VMAutomaticCheckpointsUnsupported' -AutomaticCheckpointsEnabled $true @testParams } | Should -Throw
                }
                It 'Does not call "Set-VM" when "AutomaticCheckpointsEnabled" is unsupported and unspecified' {
                    Set-TargetResource -Name 'VMAutomaticCheckpointsUnsupported' @testParams
                    Assert-MockCalled -CommandName Set-VM -Exactly -Times 0 -Scope It
                }

                Mock -CommandName Get-Command -ParameterFilter { $Name -eq 'Set-VM' -and $Module -eq 'Hyper-V' } -MockWith {
                    [pscustomobject]@{
                        parameters = @{
                            'AutomaticCheckpointsEnabled' = ''
                        }
                    }
                }
                $AutomaticCheckpointsEnabledTestCases = @(
                    @{
                        VMName                         = 'VMWithAutomaticCheckpoints'
                        SetAutomaticCheckpointsEnabled = $true
                        Assert                         = 'Does not call "Set-VM"'
                        Times                          = 0
                    },
                    @{
                        VMName                         = 'VMWithoutAutomaticCheckpoints'
                        SetAutomaticCheckpointsEnabled = $false
                        Assert                         = 'Does not call "Set-VM"'
                        Times                          = 0
                    },
                    @{
                        VMName                         = 'VMWithAutomaticCheckpoints'
                        SetAutomaticCheckpointsEnabled = $false
                        Assert                         = 'Does call "Set-VM"'
                        Times                          = 1
                    },
                    @{
                        VMName                         = 'VMWithoutAutomaticCheckpoints'
                        SetAutomaticCheckpointsEnabled = $true
                        Assert                         = 'Does call "Set-VM"'
                        Times                          = 1
                    }
                )
                It '<Assert> on VM <VMName> when "AutomaticCheckpointsEnabled" is set to "<SetAutomaticCheckpointsEnabled>"' -TestCases $AutomaticCheckpointsEnabledTestCases {
                    param
                    (
                        $VMName,
                        $SetAutomaticCheckpointsEnabled,
                        $Times
                    )

                    Set-TargetResource -Name $VMName -AutomaticCheckpointsEnabled $SetAutomaticCheckpointsEnabled @testParams
                    Assert-MockCalled -CommandName Set-VM -ParameterFilter { $Name -eq $VMName -and $AutomaticCheckpointsEnabled -eq $SetAutomaticCheckpointsEnabled } -Exactly -Times $Times -Scope It
                }
                It 'Disables dynamic memory of RuningVM if only StartupMemory specified' {
                    Mock -CommandName Set-VMProperty
                    Set-TargetResource -Name 'RunningVM' -StartupMemory 4GB @testParams
                    Assert-MockCalled -CommandName Set-VMProperty -ParameterFilter {
                        $VMCommand -eq 'Set-VM' -and
                        ($ChangeProperty.StaticMemory -eq $true) -and
                        ($ChangeProperty.DynamicMemory -eq $false)
                    }  -Exactly -Times 1 -Scope It
                }

                It 'Disables dynamic memory of RunningVM if StartupMemory, MinimumMemory and MaximumMemory are specified with the same values' {
                    Mock -CommandName Set-VMProperty
                    Set-TargetResource -Name 'RunningVM' -StartupMemory 4GB -MinimumMemory 4GB -MaximumMemory 4GB @testParams
                    Assert-MockCalled -CommandName Set-VMProperty -ParameterFilter {
                        $VMCommand -eq 'Set-VM' -and
                        ($ChangeProperty.StaticMemory -eq $true) -and
                        ($ChangeProperty.DynamicMemory -eq $false)
                    }  -Exactly -Times 1 -Scope It
                }

                It 'Enables dynamic memory of RuningVM if MinimumMemory is specified ' {
                    Mock -CommandName Set-VMProperty
                    Set-TargetResource -Name 'RunningVM' -MinimumMemory 4GB @testParams
                    Assert-MockCalled -CommandName Set-VMProperty -ParameterFilter {
                        $VMCommand -eq 'Set-VM' -and
                        ($ChangeProperty.StaticMemory -eq $false) -and
                        ($ChangeProperty.DynamicMemory -eq $true)
                    }  -Exactly -Times 1 -Scope It
                }

                It 'Enables dynamic memory of RuningVM if MaximumMemory is specified ' {
                    Mock -CommandName Set-VMProperty
                    Set-TargetResource -Name 'RunningVM' -MaximumMemory 4GB @testParams
                    Assert-MockCalled -CommandName Set-VMProperty -ParameterFilter {
                        $VMCommand -eq 'Set-VM' -and
                        ($ChangeProperty.StaticMemory -eq $false) -and
                        ($ChangeProperty.DynamicMemory -eq $true)
                    }  -Exactly -Times 1 -Scope It
                }

                It 'throws when Hyper-V Tools are not installed' {
                    Mock -CommandName Get-Module -ParameterFilter { ($Name -eq 'Hyper-V') -and ($ListAvailable -eq $true) }
                    { Set-TargetResource -Name 'RunningVM' @testParams } | Should -Throw
                }
            } #end context Validates Set-TargetResource Method

            Context 'Validates Test-VMSecureBoot Method' {
                BeforeAll {
                    Mock -CommandName Get-VM -MockWith {
                        $stubVM = [Microsoft.HyperV.PowerShell.VirtualMachine]::CreateTypeInstance()
                        $stubVM.Name = 'NewVM'
                        $stubVM.Path = $StubVMConfig.FullPath
                        $stubVM.Generation = $Generation
                        $stubVM.ID = $mockVmGuid
                        $stubVM.State = 'Off'

                        return $stubVM
                    }
                }

                It 'Returns $true when "SecureBoot" = "On"' {
                    Mock -CommandName Get-VMFirmware -MockWith {
                        return [PSCustomObject] @{
                            SecureBoot = 'On'
                        }
                    }

                    Test-VMSecureBoot -Name 'TestVM' | Should -Be $true
                }

                It 'Returns $false when "SecureBoot" = "Off"' {
                    Mock -CommandName Get-VMFirmware -MockWith {
                        return [PSCustomObject] @{
                            SecureBoot = 'Off'
                        }
                    }

                    Test-VMSecureBoot -Name 'TestVM' | Should -Be $false
                }

            } #end context Validates Test-VMSecureBoot Method

            Context 'Validates Get-VhdHierarchy Method' {
                It 'Does not throw with null parent path (#52)' {
                    # Must use a different file extension to ensure existing mocks Get-VhdHierarchy or not called
                    $fakeVhdPath = 'BaseVhd.avhdx'

                    Mock -CommandName Get-VHD -ParameterFilter { $Path -eq $fakeVhdPath } -MockWith {
                        return [PSCustomObject] @{
                            Path       = $fakeVhdPath
                            ParentPath = $null
                        }
                    }

                    { Get-VhdHierarchy -VhdPath $fakeVhdPath } | Should -Not -throw
                }

            } #end context validates Get-VhdHierarchy
        } #end describe xVMHyper-V
    } #end inmodulescope
}
finally
{
    Invoke-TestCleanup
}
