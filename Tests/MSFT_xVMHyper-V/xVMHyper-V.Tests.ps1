[CmdletBinding()]
param()

if (!$PSScriptRoot) # $PSScriptRoot is not defined in 2.0
{
    $PSScriptRoot = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path)
}

$ErrorActionPreference = 'stop'
Set-StrictMode -Version latest

$RepoRoot = (Resolve-Path $PSScriptRoot\..\..).Path

$ModuleName = 'MSFT_xVMHyperV'
Import-Module (Join-Path $RepoRoot "DSCResources\$ModuleName\$ModuleName.psm1") -Force;

Describe 'xVMHyper-V' {
    InModuleScope $ModuleName {

        ## Create empty functions to be able to mock the missing Hyper-V cmdlets
        ## CmdletBinding required on Get-VM to support $ErrorActionPreference
        function Get-VM { [CmdletBinding()] param( [Parameter(ValueFromRemainingArguments)] $Name) }
        ## Generation parameter is required for the mocking -ParameterFilter to work
        function New-VM { param ( $Generation) }
        function Set-VM { }
        function Stop-VM { }
        function Remove-VM { }
        function Get-VMNetworkAdapter { }
        function Set-VMNetworkAdapter { }
        function Add-VMNetworkAdapter { }
        function Connect-VMNetworkAdapter { param ( $SwitchName ) }
        function Get-VMFirmware { }
        function Set-VMFirmware { }
        function Get-VMIntegrationService { param ([Parameter(ValueFromPipeline)] $VM, $Name)}
        function Enable-VMIntegrationService { param ([Parameter(ValueFromPipeline)] $VM, $Name)}
        function Disable-VMIntegrationService { param ([Parameter(ValueFromPipeline)] $VM, $name)}

        $stubVhdxDisk = New-Item -Path 'TestDrive:\TestVM.vhdx' -ItemType File;
        $stubVhdDisk = New-Item -Path 'TestDrive:\TestVM.vhd' -ItemType File;
        $StubVMConfig = New-Item -Path 'TestDrive:\TestVM.xml' -ItemType File;
        $stubNIC1 = @{ SwitchName = 'Test Switch 1'; MacAddress = 'AA-BB-CC-DD-EE-FF'; IpAddresses = @('192.168.0.1','10.0.0.1'); };
        $stubNIC2 = @{ SwitchName = 'Test Switch 2'; MacAddress = 'AA-BB-CC-DD-EE-FE'; IpAddresses = @('192.168.1.1'); };
        $stubVM = @{
            HardDrives = @(
                @{ Path = $stubVhdxDisk.FullName; }
                @{ Path = $stubVhdDisk.FullName; }
            );
            #State = 'Running';
            Path = $StubVMConfig.FullPath;
            Generation = 1;
            SecureBoot = $true;
            MemoryStartup = 512MB;
            MinimumMemory = 128MB;
            MaximumMemory = 4096MB;
            ProcessorCount = 1;
            ID = [System.Guid]::NewGuid().ToString();
            CPUUsage = 10;
            MemoryAssigned = 512MB;
            Uptime = New-TimeSpan -Hours 12;
            CreationTime = (Get-Date).AddHours(-12);
            DynamicMemoryEnabled = $true;
            NetworkAdapters = @($stubNIC1,$stubNIC2);
            Notes = '';
        }

        Mock -CommandName Get-VM -ParameterFilter { $Name -eq 'RunningVM' } -MockWith { $runningVM = $stubVM.Clone(); $runningVM['State'] = 'Running'; return [PSCustomObject] $runningVM; }
        Mock -CommandName Get-VM -ParameterFilter { $Name -eq 'StoppedVM' } -MockWith { $stoppedVM = $stubVM.Clone(); $stoppedVM['State'] = 'Off'; return [PSCustomObject] $stoppedVM; }
        Mock -CommandName Get-VM -ParameterFilter { $Name -eq 'PausedVM' } -MockWith { $pausedVM = $stubVM.Clone(); $pausedVM['State'] = 'Paused'; return [PSCustomObject] $pausedVM; }
        Mock -CommandName Get-VM -ParameterFilter { $Name -eq 'NonexistentVM' } -MockWith { Write-Error 'VM not found.'; }
        Mock -CommandName Get-VM -ParameterFilter { $Name -eq 'DuplicateVM' } -MockWith { return @([PSCustomObject] $stubVM, [PSCustomObject] $stubVM); }
        Mock -CommandName Get-VM -ParameterFilter { $Name -eq 'Generation2VM' } -MockWith { $gen2VM = $stubVM.Clone(); $gen2VM['Generation'] = 2; return [PSCustomObject] $gen2VM; }
        Mock -CommandName Get-VMIntegrationService -MockWith {return [pscustomobject]@{Enabled=$false}}
        Mock -CommandName Get-Module -ParameterFilter { ($Name -eq 'Hyper-V') -and ($ListAvailable -eq $true) } -MockWith { return $true; }
        
        Context 'Validates Get-TargetResource Method' {

            It 'Returns a hashtable' {
                $targetResource = Get-TargetResource -Name 'RunningVM' -VhdPath $stubVhdxDisk.FullName;
                $targetResource -is [System.Collections.Hashtable] | Should Be $true;
            }
            It 'Throws when multiple VMs are present' {
                { Get-TargetResource -Name 'DuplicateVM' -VhdPath $stubVhdxDisk.FullName } | Should Throw;
            }
            It 'Does not call Get-VMFirmware if a generation 1 VM' {
                Mock -CommandName Get-VMFirmware -MockWith { throw; }
                $targetResource = Get-TargetResource -Name 'RunningVM' -VhdPath $stubVhdxDisk.FullName;
                Assert-MockCalled -CommandName Get-VMFirmware -Scope It -Exactly 0;
            }
            It 'Calls Get-VMFirmware if a generation 2 VM' {
                Mock -CommandName Get-VMFirmware -MockWith { return $true; }
                $targetResource = Get-TargetResource -Name 'Generation2VM' -VhdPath $stubVhdxDisk.FullName;
                Assert-MockCalled -CommandName Get-VMFirmware -Scope It -Exactly 1;
            }
            It 'Hash table contains key EnableGuestService' {
                $targetResource = Get-TargetResource -Name 'RunningVM' -VhdPath $stubVhdxDisk.FullName;
                $targetResource.ContainsKey('EnableGuestService') | Should Be $true;
            }
        } #end context Validates Get-TargetResource Method

        Context 'Validates Test-TargetResource Method' {
            $testParams = @{
                VhdPath = $stubVhdxDisk.FullName;
            }

            It 'Returns a boolean' {
                $targetResource =  Test-TargetResource -Name 'RunningVM' @testParams;
                $targetResource -is [System.Boolean] | Should Be $true;
            }

            It 'Returns $true when VM is present and "Ensure" = "Present"' {
                Test-TargetResource -Name 'RunningVM' @testParams | Should Be $true;
            }

            It 'Returns $false when VM is not present and "Ensure" = "Present"' {
                Test-TargetResource -Name 'NonexistentVM' @testParams | Should Be $false;
            }
            
            It 'Returns $true when VM is not present and "Ensure" = "Absent"' {
                Test-TargetResource -Name 'NonexistentVM' -Ensure Absent @testParams | Should Be $true;
            }

            It 'Returns $false when VM is present and "Ensure" = "Absent"' {
                Test-TargetResource -Name 'RunningVM' -Ensure Absent @testParams | Should Be $false;
            }

            It 'Returns $true when VM is in the "Running" state and no state is explicitly specified' {
                Test-TargetResource -Name 'RunningVM' @testParams | Should Be $true;
            }

            It 'Returns $true when VM is in the "Stopped" state and no state is explicitly specified' {
                Test-TargetResource -Name 'StoppedVM' @testParams | Should Be $true;
            }

            It 'Returns $true when VM is in the "Paused" state and no state is explicitly specified' {
                Test-TargetResource -Name 'PausedVM' @testParams | Should Be $true;
            }

            It 'Returns $true when VM is in the "Running" state and requested "State" = "Running"' {
                Test-TargetResource -Name 'RunningVM' @testParams | Should Be $true;
            }

            It 'Returns $true when VM is in the "Off" state and requested "State" = "Off"' {
                Test-TargetResource -Name 'StoppedVM' -State Off @testParams | Should Be $true;
            }

            It 'Returns $true when VM is in the "Paused" state and requested "State" = Paused"' {
                Test-TargetResource -Name 'PausedVM' -State Paused @testParams | Should Be $true;
            }

            It 'Returns $false when VM is in the "Running" state and requested "State" = "Off"' {
                Test-TargetResource -Name 'RunningVM' -State Off @testParams | Should Be $false;
            }

            It 'Returns $false when VM is in the "Off" state and requested "State" = "Runnning"' {
                Test-TargetResource -Name 'StoppedVM' -State Running @testParams | Should Be $false;
            }

            It 'Returns $true when VM .vhd file is specified with a generation 1 VM' {
                Test-TargetResource -Name 'StoppedVM' -VhdPath $stubVhdDisk -Generation 1 | Should Be $true;
            }

            It 'Returns $true when VM .vhdx file is specified with a generation 1 VM' {
                Test-TargetResource -Name 'StoppedVM' -VhdPath $stubVhdxDisk -Generation 1 | Should Be $true;
            }

            It 'Returns $true when VM .vhdx file is specified with a generation 2 VM' {
                Mock -CommandName Test-VMSecureBoot -MockWith { return $true; }
                Test-TargetResource -Name 'Generation2VM' -Generation 2 @testParams | Should Be $true;
            }

            It 'Throws when a VM .vhd file is specified with a generation 2 VM' {
                { Test-TargetResource -Name 'Gen2VM' -VhdPath $stubVhdDisk -Generation 2 } | Should Throw;    
            }

            It 'Returns $true when multiple NICs are assigned in the correct order' {
                Test-TargetResource -Name 'RunningVM' @testParams -SwitchName @($stubNIC1.SwitchName,$stubNIC2.SwitchName) | Should Be $true;
            }

            It 'Returns $false when multiple NICs are not assigned/assigned in the wrong order' {
                Test-TargetResource -Name 'RunningVM' @testParams -SwitchName @($stubNIC2.SwitchName,$stubNIC1.SwitchName) | Should Be $false;
            }

            It 'Returns $true when multiple MAC addresses are assigned in the correct order' {
                Test-TargetResource -Name 'RunningVM' @testParams -MACAddress @($stubNIC1.MACAddress,$stubNIC2.MACAddress) | Should Be $true;
            }


            It 'Returns $false when multiple MAC addresses not assigned/assigned in the wrong order' {
                Test-TargetResource -Name 'RunningVM' @testParams -MACAddress @($stubNIC1.MACAddress,$stubNIC2.MACAddress) | Should Be $true;
            }

            It 'Returns $true regardless of "SecureBoot" setting on a generation 1 VM' {
                Test-TargetResource -Name 'RunningVM' -SecureBoot $true @testParams | Should Be $true;
                Test-TargetResource -Name 'RunningVM' -SecureBoot $false @testParams | Should Be $true;
            }

            It 'Returns $true when SecureBoot is On and requested "SecureBoot" = "$true"' {
                Mock -CommandName Test-VMSecureBoot -MockWith { return $true; }
                Test-TargetResource -Name 'Generation2VM' -Generation 2 @testParams | Should Be $true;
            }
            
            It 'Returns $false when SecureBoot is On and requested "SecureBoot" = "$false"' {
                Mock -CommandName Test-VMSecureBoot -MockWith { return $true ; }
                Test-TargetResource -Name 'Generation2MV' -SecureBoot $false -Generation 2 @testParams | Should be $false;
            }

            It 'Returns $false when EnableGuestService is off and requested "EnableGuestService" = "$true"' {
                Test-TargetResource -Name 'RunningVM' -EnableGuestService $true @testParams | Should be $false;
            }

            It 'Returns $true when EnableGuestService is off and "EnableGuestService" is not requested"' {
                Test-TargetResource -Name 'RunningVM'  @testParams | Should be $true;
            }

            It 'Returns $true when EnableGuestService is on and requested "EnableGuestService" = "$true"' {
                Mock -CommandName Get-VMIntegrationService -MockWith {return [pscustomobject]@{Enabled=$true}}
                Test-TargetResource -Name 'RunningVM' -EnableGuestService $true @testParams | Should be $true;
            }

            It 'Throws when Hyper-V Tools are not installed' {
                ## This test needs to be the last in the Context otherwise all subsequent Get-Module checks will fail
                Mock -CommandName Get-Module -ParameterFilter { ($Name -eq 'Hyper-V') -and ($ListAvailable -eq $true) } -MockWith { }
                { Test-TargetResource -Name 'RunningVM' @testParams } | Should Throw;
            }
            
        } #end context Validates Test-TargetResource Method
        
        Context 'Validates Set-TargetResource Method' {
            $testParams = @{
                VhdPath = $stubVhdxDisk.FullName;
            }

            Mock -CommandName Get-VM -ParameterFilter { $Name -eq 'NewVM' } -MockWith { }
            Mock -CommandName New-VM -MockWith {
                $newVM = $stubVM.Clone();
                $newVM['State'] = 'Off';
                $newVM['Generation'] = $Generation;
                return $newVM;
            }
            Mock -CommandName Set-VM -MockWith { return $true; }
            Mock -CommandName Stop-VM -MockWith { return $true; } # requires output to be able to pipe something into Remove-VM
            Mock -CommandName Remove-VM -MockWith { return $true; }
            Mock -CommandName Set-VMNetworkAdapter -MockWith { return $true; }
            Mock -CommandName Get-VMNetworkAdapter -MockWith { return $stubVM.NetworkAdapters.IpAddresses; }
            Mock -CommandName Set-VMState -MockWith { return $true; }

            It 'Removes an existing VM when "Ensure" = "Absent"' {
                Set-TargetResource -Name 'RunningVM' -Ensure Absent @testParams;
                Assert-MockCalled -CommandName Remove-VM -Scope It;
            }

            It 'Creates and does not start a VM that does not exist when "Ensure" = "Present"' {
                Set-TargetResource -Name 'NewVM' @testParams;
                Assert-MockCalled -CommandName New-VM -Exactly -Times 1 -Scope It;
                Assert-MockCalled -CommandName Set-VM -Exactly -Times 1 -Scope It;
                Assert-MockCalled -CommandName Set-VMState -Exactly -Times 0 -Scope It;
            }

            It 'Creates and starts a VM that does not exist when "Ensure" = "Present" and "State" = "Running"' {
                Set-TargetResource -Name 'NewVM' -State Running @testParams;
                Assert-MockCalled -CommandName New-VM -Exactly -Times 1 -Scope It;
                Assert-MockCalled -CommandName Set-VM -Exactly -Times 1 -Scope It;
                Assert-MockCalled -CommandName Set-VMState -Exactly -Times 1 -Scope It;
            }

            It 'Does not change VM state when VM "State" = "Running" and requested "State" = "Running"' {
                Set-TargetResource -Name 'RunningVM' -State Running @testParams;
                 Assert-MockCalled -CommandName Set-VMState -Exactly -Times 0 -Scope It;
            }

            It 'Does not change VM state when VM "State" = "Off" and requested "State" = "Off"' {
                Set-TargetResource -Name 'StoppedVM' -State Off @testParams;
                 Assert-MockCalled -CommandName Set-VMState -Exactly -Times 0 -Scope It;
            }

            It 'Changes VM state when existing VM "State" = "Off" and requested "State" = "Running"' {
                 Set-TargetResource -Name 'StoppedVM' -State Running @testParams;
                 Assert-MockCalled -CommandName Set-VMState -Exactly -Times 1 -Scope It;
            }

            It 'Changes VM state when existing VM "State" = "Running" and requested "State" = "Off"' {
                 Set-TargetResource -Name 'RunningVM' -State Off @testParams;
                 Assert-MockCalled -CommandName Set-VMState -Exactly -Times 1 -Scope It;
            }

            It 'Creates a generation 1 VM by default/when not explicitly specified' {
                Set-TargetResource -Name 'NewVM' @testParams;
                Assert-MockCalled -CommandName New-VM -ParameterFilter { $Generation -eq 1 } -Scope It;
            }

            It 'Creates a generation 1 VM when explicitly specified' {
                Set-TargetResource -Name 'NewVM' -Generation 1 @testParams;
                Assert-MockCalled -CommandName New-VM -ParameterFilter { $Generation -eq 1 } -Scope It;
            }

            It 'Creates a generation 2 VM when explicitly specified' {
                Set-TargetResource -Name 'NewVM' -Generation 2 @testParams;
                Assert-MockCalled -CommandName New-VM -ParameterFilter { $Generation -eq 2 } -Scope It;
            }

            It 'Calls "Add-VMNetworkAdapter" for each NIC when creating a new VM' {
                Mock -CommandName Add-VMNetworkAdapter -MockWith { }
                Set-TargetResource -Name 'NewVM' @testParams -SwitchName 'Switch1','Switch2';
                ## The first NIC is assigned during the VM creation
                Assert-MockCalled -CommandName Add-VMNetworkAdapter -Exactly 1 -Scope It;
            }

            It 'Calls "Connect-VMNetworkAdapter" for each existing NIC when updating an existing VM' {
                Mock -CommandName Connect-VMNetworkAdapter -MockWith { }
                Set-TargetResource -Name 'StoppedVM' @testParams -SwitchName 'Switch1','Switch2';
                ## The first NIC is assigned during the VM creation
                Assert-MockCalled -CommandName Connect-VMNetworkAdapter -Exactly 2 -Scope It;
            }

            It 'Calls "Add-VMNetworkAdapter" for each missing NIC when updating an existing VM' {
                Mock -CommandName Connect-VMNetworkAdapter -MockWith { }
                Mock -CommandName Add-VMNetworkAdapter -MockWith { }
                Set-TargetResource -Name 'StoppedVM' @testParams -SwitchName 'Switch1','Switch2','Switch3';
                ## The first NIC is assigned during the VM creation
                Assert-MockCalled -CommandName Connect-VMNetworkAdapter -Exactly 2 -Scope It;
                Assert-MockCalled -CommandName Add-VMNetworkAdapter -Exactly 1 -Scope It;
            }

            It 'Does not change switch assignments if no switch assignments are specified' {
                Mock -CommandName Connect-VMNetworkAdapter -MockWith { }
                Set-TargetResource -Name 'StoppedVM' @testParams;
                Assert-MockCalled -CommandName Connect-VMNetworkAdapter -Exactly 0 -Scope It;
            }

            It 'Does not change NIC assignments if the switch assisgnments are correct' {
                Mock -CommandName Set-VMNetworkAdapter -MockWith { }
                Set-TargetResource -Name 'StoppedVM' @testParams -SwitchName $stubNIC1.SwitchName,$stubNIC2.SwitchName;
                Assert-MockCalled -CommandName Set-VMNetworkAdapter -Exactly 0 -Scope It;
            }

            It 'Errors when updating MAC addresses on a running VM and "RestartIfNeeded" = "$false"' {
                { Set-TargetResource -Name 'RunningVM' @testParams -MACAddress 'AABBCCDDEEFE','AABBCCDDEEFF' -ErrorAction Stop } | Should Throw;
            }

            It 'Does not change MAC addresses if no MAC addresses assignments are specified' {
                Mock -CommandName Set-VMNetworkAdapter -ParameterFilter { $StaticMacAddress -ne $null } -MockWith { }
                Set-TargetResource -Name 'StoppedVM' @testParams;
                Assert-MockCalled -CommandName Set-VMNetworkAdapter -ParameterFilter { $StaticMacAddress -ne $null } -Exactly 0 -Scope It;
            }

            It 'Calls "Set-VMNetworkAdapter" for each MAC address on a stopped VM' {
                Mock -CommandName Set-VMNetworkAdapter -MockWith { }
                Set-TargetResource -Name 'StoppedVM' @testParams -MACAddress 'AABBCCDDEEFE','AABBCCDDEEFF';
                ## The first NIC is assigned during the VM creation
                Assert-MockCalled -CommandName Set-VMNetworkAdapter -Exactly 2 -Scope It;
            }
       
            It 'Does not change Secure Boot call "Change-VMSecureBoot" when creating a generation 1 VM' {
                Mock -CommandName Change-VMSecureBoot -MockWith { return $true; }
                Set-TargetResource -Name 'RunningVM' @testParams;
                Assert-MockCalled -CommandName Change-VMSecureBoot -Exactly 0 -Scope It;
            }

            It 'Does call "Change-VMSecureBoot" when creating a generation 2 VM' {
                Mock -CommandName Test-VMSecureBoot -MockWith { return $true; }
                Mock -CommandName Change-VMSecureBoot -MockWith { }
                Set-TargetResource -Name 'RunningVM' -Generation 2 -SecureBoot $false @testParams;
                Assert-MockCalled -CommandName Change-VMSecureBoot -Exactly 1 -Scope It;
            }

            It 'Does not change Secure Boot for generation 1 VM' {
                Mock -CommandName Test-VMSecureBoot -MockWith { return $true; }
                Mock -CommandName Change-VMSecureBoot -MockWith { }
                Set-TargetResource -Name 'StoppedVM' -SecureBoot $true @testParams;
                Set-TargetResource -Name 'StoppedVM' -SecureBoot $false @testParams;
                Assert-MockCalled -CommandName Change-VMSecureBoot -Exactly -Times 0 -Scope It;
            }

            It 'Does not change Secure Boot for generation 2 VM with VM "SecureBoot" match' {
                Mock -CommandName Test-VMSecureBoot -MockWith { return $true; }
                Mock -CommandName Change-VMSecureBoot -MockWith { }
                Set-TargetResource -Name 'StoppedVM' -SecureBoot $true -Generation 2 @testParams;
                Assert-MockCalled -CommandName Change-VMSecureBoot -Exactly -Times 0 -Scope It;
            }

            It 'Does change Secure Boot for generation 2 VM with VM "SecureBoot" mismatch' {
                Mock -CommandName Test-VMSecureBoot -MockWith { return $false; }
                Mock -CommandName Change-VMSecureBoot -MockWith { }
                Set-TargetResource -Name 'StoppedVM' -SecureBoot $true -Generation 2 @testParams;
                Assert-MockCalled -CommandName Change-VMSecureBoot -Exactly -Times 1 -Scope It;
            }

            It 'Does call "Enable-VMIntegrationService" when "EnableGuestService" = "$true"' {
                Mock -CommandName Enable-VMIntegrationService -MockWith { }
                Set-TargetResource -Name 'RunningVM' -EnableGuestService $true @testParams
                Assert-MockCalled -CommandName Enable-VMIntegrationService -Exactly -Times 1 -Scope It
            }

            It 'Does call "Disable-VMIntegrationService" when "Guest Service Interface" = "Enabled" and "EnableGuestService" = "$false" specified' {
                Mock -CommandName Disable-VMIntegrationService -MockWith { }
                Mock -CommandName Get-VMIntegrationService -MockWith {return [pscustomobject]@{Enabled=$true}}
                Set-TargetResource -Name 'RunningVM' -EnableGuestService $false @testParams
                Assert-MockCalled -CommandName Disable-VMIntegrationService -Exactly -Times 1 -Scope It
            }

            It 'Throws when Hyper-V Tools are not installed' {
                Mock -CommandName Get-Module -ParameterFilter { ($Name -eq 'Hyper-V') -and ($ListAvailable -eq $true) } -MockWith { }
                { Set-TargetResource -Name 'RunningVM' @testParams } | Should Throw;
            }
        
        } #end context Validates Set-TargetResource Method
        
        Context 'Validates Test-VMSecureBoot Method' {
        
            It 'Returns $true when "SecureBoot" = "On"' {
                Mock -CommandName Get-VM -MockWith { }
                Mock -CommandName Get-VMFirmware -MockWith { return [PSCustomObject] @{ SecureBoot = 'On' }; }
                Test-VMSecureBoot -Name 'TestVM' | Should Be $true;
            }
        
            It 'Returns $false when "SecureBoot" = "Off"' {
                Mock -CommandName Get-VM -MockWith { }
                Mock -CommandName Get-VMFirmware -MockWith { return [PSCustomObject] @{ SecureBoot = 'Off' }; }
                Test-VMSecureBoot -Name 'TestVM' | Should Be $false;
            }
        
        } #end context Validates Test-VMSecureBoot Method
        
        Context 'Validates Change-VMSecureBoot Method' {
        
            It 'Throws if "State" = "Running" and "RestartIfNeeded" = "$false"' {
                { Change-VMSecureBoot -Name 'RunningVM' -SecureBoot $true -RestartIfNeeded $false -ErrorAction Stop } | Should Throw;
            }
        
            It 'Calls Set-VMFirmware when "State" = "Off" and "RestartIfNeeded" = "$false"' {
                Mock -CommandName Set-VMFirmware -MockWith { }
                Change-VMSecureBoot -Name 'StoppedVM' -SecureBoot $true -RestartIfNeeded $false;
                Assert-MockCalled -CommandName Set-VMFirmware -Exactly 1 -Scope It;
            }
        
            It 'Calls Set-VMFirmware when "State" = "Running" and "RestartIfNeeded" = "$true"' {
                Mock -CommandName Set-VMState -MockWith { }
                Mock -CommandName Set-VMFirmware -MockWith { }
                Change-VMSecureBoot -Name 'RunningVM' -SecureBoot $true -RestartIfNeeded $true;
                Assert-MockCalled -CommandName Set-VMFirmware -Scope It;
            }
        } #end context Validates Change-VMSecureBoot Method

    } #end inmodulescope
} #end describe xVMHyper-V
