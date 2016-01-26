function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.String]
        $VhdPath
    )

    # Check if Hyper-V module is present for Hyper-V cmdlets
    if(!(Get-Module -ListAvailable -Name Hyper-V))
    {
        Throw "Please ensure that Hyper-V role is installed with its PowerShell module"
    }

    $vmobj = Get-VM -Name $Name -ErrorAction SilentlyContinue
    
    # Check if 1 or 0 VM with name = $name exist
    if($vmobj.count -gt 1)
    {
       Throw "More than one VM with the name $Name exist." 
    }
    
    
    $vmSecureBootState = $false;
    if ($vmobj.Generation -eq 2) {
       # Retrieve secure boot status (can only be enabled on Generation 2 VMs) and convert to a boolean.
       $vmSecureBootState = ($vmobj | Get-VMFirmware).SecureBoot -eq 'On'
    } 
    
    @{
        Name             = $Name
        VhdPath          = $vmObj.HardDrives[0].Path
        SwitchName       = $vmObj.NetworkAdapters.SwitchName
        State            = $vmobj.State
        Path             = $vmobj.Path
        Generation       = $vmobj.Generation
        SecureBoot       = $vmSecureBootState
        StartupMemory    = $vmobj.MemoryStartup
        MinimumMemory    = $vmobj.MemoryMinimum
        MaximumMemory    = $vmobj.MemoryMaximum
        MACAddress       = $vmObj.NetWorkAdapters.MacAddress
        ProcessorCount   = $vmobj.ProcessorCount
        Ensure           = if($vmobj){"Present"}else{"Absent"}
        ID               = $vmobj.Id
        Status           = $vmobj.Status
        CPUUsage         = $vmobj.CPUUsage
        MemoryAssigned   = $vmobj.MemoryAssigned
        Uptime           = $vmobj.Uptime
        CreationTime     = $vmobj.CreationTime
        HasDynamicMemory = $vmobj.DynamicMemoryEnabled
        NetworkAdapters  = $vmobj.NetworkAdapters.IPAddresses
        EnableGuestService = ($vmobj | Get-VMIntegrationService -Name 'Guest Service Interface').Enabled
    }
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        # Name of the VM
        [parameter(Mandatory)]
        [String]$Name,
        
        # VHD associated with the VM
        [parameter(Mandatory)]
        [String]$VhdPath,
        
        # Virtual switch associated with the VM
        [String[]]$SwitchName,

        # State of the VM
        [AllowNull()]
        [ValidateSet("Running","Paused","Off")]
        [String]$State,

        # Folder where the VM data will be stored
        [String]$Path,

        # Virtual machine generation
        [ValidateRange(1,2)]
        [UInt32]$Generation = 1,

        # Startup RAM for the VM
        [ValidateRange(32MB,17342MB)]
        [UInt64]$StartupMemory,

        # Minimum RAM for the VM. This enables dynamic memory
        [ValidateRange(32MB,17342MB)]
        [UInt64]$MinimumMemory,

        # Maximum RAM for the VM. This enables dynamic memory
        [ValidateRange(32MB,1048576MB)]
        [UInt64]$MaximumMemory,

        # MAC address of the VM
        [String[]]$MACAddress,

        # Processor count for the VM
        [UInt32]$ProcessorCount,

        # Waits for VM to get valid IP address
        [Boolean]$WaitForIP,

        # If specified, shutdowns and restarts the VM as needed for property changes
        [Boolean]$RestartIfNeeded,

        # Should the VM be created or deleted
        [ValidateSet("Present","Absent")]
        [String]$Ensure = "Present",
        [System.String]
        $Notes,

        # Enable secure boot for Generation 2 VMs
        [Boolean]$SecureBoot = $true,

        # Enable Guest Services
        [Boolean]$EnableGuestService = $false
    )

    # Check if Hyper-V module is present for Hyper-V cmdlets
    if(!(Get-Module -ListAvailable -Name Hyper-V))
    {
        Throw "Please ensure that Hyper-V role is installed with its PowerShell module"
    }

    Write-Verbose -Message "Checking if VM $Name exists ..."
    $vmObj = Get-VM -Name $Name -ErrorAction SilentlyContinue

    # VM already exists
    if($vmObj)
    {
        Write-Verbose -Message "VM $Name exists"

        # If VM shouldn't be there, stop it and remove it
        if($Ensure -eq "Absent")
        {
            Write-Verbose -Message "VM $Name should be $Ensure"
            Get-VM $Name | Stop-VM -Force -Passthru -WarningAction SilentlyContinue | Remove-VM -Force
            Write-Verbose -Message "VM $Name is $Ensure"
        }

        # If VM is present, check its state, startup memory, minimum memory, maximum memory,processor countand mac address
        # One cannot set the VM's vhdpath, path, generation and switchName after creation 
        else
        {
            # If state has been specified and the VM is not in right state, set it to right state
            if($State -and ($vmObj.State -ne $State))
            {
                Write-Verbose -Message "VM $Name is not $State. Expected $State, actual $($vmObj.State)"
                Set-VMState -Name $Name -State $State -WaitForIP $WaitForIP
                Write-Verbose -Message "VM $Name is now $State"
            }

            $changeProperty = @{}
            # If the VM does not have the right startup memory
            if($StartupMemory -and ($vmObj.MemoryStartup -ne $StartupMemory))
            {
                Write-Verbose -Message "VM $Name does not have correct startup memory. Expected $StartupMemory, actual $($vmObj.MemoryStartup)"
                $changeProperty["MemoryStartup"]=$StartupMemory
            }
            elseif($MinimumMemory -and ($vmObj.MemoryStartup -lt $MinimumMemory))
            {
                Write-Verbose -Message "VM $Name has a startup memory $($vmObj.MemoryStartup) lesser than minimum memory $MinimumMemory. Setting startup memory to be equal to $MinimumMemory" 
                $changeProperty["MemoryStartup"]=$MinimumMemory
            }
            elseif($MaximumMemory -and ($vmObj.MemoryStartup -gt $MaximumMemory))
            {
                Write-Verbose -Message "VM $Name has a startup memory $($vmObj.MemoryStartup) greater than maximum memory $MaximumMemory. Setting startup memory to be equal to $MaximumMemory"
                $changeProperty["MemoryStartup"]=$MaximumMemory
            }
            
            # If the VM does not have the right minimum or maximum memory, stop the VM, set the right memory, start the VM
            if($MinimumMemory -or $MaximumMemory)
            {
                $changeProperty["DynamicMemory"]=$true

                if($MinimumMemory -and ($vmObj.Memoryminimum -ne $MinimumMemory))
                {
                    Write-Verbose -Message "VM $Name does not have correct minimum memory. Expected $MinimumMemory, actual $($vmObj.MemoryMinimum)"
                    $changeProperty["MemoryMinimum"]=$MinimumMemory
                }
                if($MaximumMemory -and ($vmObj.Memorymaximum -ne $MaximumMemory))
                {
                    Write-Verbose -Message "VM $Name does not have correct maximum memory. Expected $MaximumMemory, actual $($vmObj.MemoryMaximum)"
                    $changeProperty["MemoryMaximum"]=$MaximumMemory
                }
            }

            # If the VM does not have the right processor count, stop the VM, set the right memory, start the VM
            if($ProcessorCount -and ($vmObj.ProcessorCount -ne $ProcessorCount))
            {
                Write-Verbose -Message "VM $Name does not have correct processor count. Expected $ProcessorCount, actual $($vmObj.ProcessorCount)"
                $changeProperty["ProcessorCount"]=$ProcessorCount
            }

            # Stop the VM, set the right properties, start the VM only if there are properties to change
            if ($changeProperty.Count -gt 0) {
                Change-VMProperty -Name $Name -VMCommand "Set-VM" -ChangeProperty $changeProperty -WaitForIP $WaitForIP -RestartIfNeeded $RestartIfNeeded
                Write-Verbose -Message "VM $Name updated"
            }

            ## Set VM network switches. This can be done while the VM is running.
            for ($i = 0; $i -lt $SwitchName.Count; $i++)
            {
                $switch = $SwitchName[$i]
                $nic = $vmObj.NetworkAdapters[$i]
                if ($nic) {
                    ## We cannot change the MAC address whilst the VM is running..
                    if ($nic.SwitchName -ne $switch) {
                        Write-Verbose -Message "VM $Name NIC $i is not connected to the correct switch. Expected $switch, actual $($nic.SwitchName)"
                        $nic | Connect-VMNetworkAdapter -SwitchName $switch
                        Write-Verbose -Message "VM $Name NIC $i connected to the $switch switch."
                    }
                }
                else {
                    Write-Verbose -Message "VM $Name NIC $i is not present. Expected $switch, actual <missing>"
                    if ($MACAddress -and (-not [System.String]::IsNullOrEmpty($MACAddress[$i])))
                    {
                        Add-VMNetworkAdapter -VMName $Name -SwitchName $switch -StaticMacAddress $MACAddress[$i]
                        Write-Verbose -Message "VM $Name NIC $i added to the correct switch $switch with MAC address $($MACAddress[$i])."
                    }
                    else
                    {
                        Add-VMNetworkAdapter -VMName $Name -SwitchName $switch
                        Write-Verbose -Message "VM $Name NIC $i added to the correct switch $switch."
                    }
                    ## Refresh the NICs after we've added one
                    $vmObj = Get-VM -Name $Name -ErrorAction SilentlyContinue
                }
            }
            
            # If the VM does not have the right MACAddress, stop the VM, set the right MACAddress, start the VM
            for ($i = 0; $i -lt $MACAddress.Count; $i++)
            { 
                $address = $MACAddress[$i]
                $nic = $vmObj.NetworkAdapters[$i]
                if ($nic.MacAddress -ne $address)
                {
                    Write-Verbose -Message "VM $Name NIC $i does not have correct MACAddress. Expected $address, actual $($nic.MacAddress)"
                    Change-VMMACAddress -Name $Name -NICIndex $i -MACAddress $address -WaitForIP $WaitForIP -RestartIfNeeded $RestartIfNeeded
                }
            }

            if ($Generation -eq 2)
            {
                ## Retrive the current secure boot state
                $vmSecureBoot = Test-VMSecureBoot -Name $Name
                if ($SecureBoot -ne $vmSecureBoot)
                {
                    Write-Verbose -Message "VM $Name secure boot is incorrect. Expected $SecureBoot, actual $vmSecureBoot"
                    ## Cannot change the secure boot state whilst the VM is powered on.
                    Change-VMSecureBoot -Name $Name -SecureBoot $SecureBoot -RestartIfNeeded $RestartIfNeeded
                    Write-Verbose -Message "VM $Name secure boot is now correct."
                }
            }

            if($Notes -ne $null)
            {
                # If the VM notes do not match the desire notes, update them.  This can be done while the VM is running.
                if($vmObj.Notes -ne $Notes)
                {
                    Set-Vm -Name $Name -Notes $Notes
                }
            }

            #If the VM doesn't have Guest Service Interface correctly configured, update it.
            $GuestServiceStatus = $vmObj | Get-VMIntegrationService -Name 'Guest Service Interface'
            if ($GuestServiceStatus.Enabled -eq $false -and $EnableGuestService) {
                Write-Verbose -Message "VM $Name has Guest Service Interface disabled and should be enabled"
                $vmObj | Enable-VMIntegrationService -Name 'Guest Service Interface'
                Write-Verbose -Message "VM $Name Guest Service Interface configured correctly"
            }
            elseif ($GuestServiceStatus.Enabled -and -not $EnableGuestService)
            {
                Write-Verbose -Message "VM $Name has Guest Service Interface enabled and should be disabled"
                $vmObj | Disable-VMIntegrationService -Name 'Guest Service Interface'
                Write-Verbose -Message "VM $Name Guest Service Interface configured correctly"
            }
        }
    }

    # VM is not present, create one
    else
    {
        Write-Verbose -Message "VM $Name does not exists"
        if($Ensure -eq "Present")
        {
            Write-Verbose -Message "Creating VM $Name ..."
            
            $parameters = @{}
            $parameters["Name"] = $Name
            $parameters["VHDPath"] = $VhdPath
            $parameters["Generation"] = $Generation

            # Optional parameters
            if($SwitchName)
            {
                $parameters["SwitchName"]=$SwitchName[0]
            }
            if($Path){$parameters["Path"]=$Path}
            $defaultStartupMemory = 512MB
            if($StartupMemory){$parameters["MemoryStartupBytes"]=$StartupMemory}
            elseif($MinimumMemory -and $defaultStartupMemory -lt $MinimumMemory){$parameters["MemoryStartupBytes"]=$MinimumMemory}
            elseif($MaximumMemory -and $defaultStartupMemory -gt $MaximumMemory){$parameters["MemoryStartupBytes"]=$MaximumMemory}
            $null = New-VM @parameters

            $parameters = @{}
            $parameters["Name"] = $Name
            if($MinimumMemory -or $MaximumMemory)
            {
                $parameters["DynamicMemory"]=$true
                if($MinimumMemory){$parameters["MemoryMinimumBytes"]=$MinimumMemory}
                if($MaximumMemory){$parameters["MemoryMaximumBytes"]=$MaximumMemory}
            }

            if($Notes)
            {
                $parameters["Notes"] = $Notes
            }

            if($ProcessorCount)
            {
                $parameters["ProcessorCount"]=$ProcessorCount
            }

            $null = Set-VM @parameters

            ## There's always a NIC added with New-VM
            if($MACAddress)
            {
                Set-VMNetworkAdapter -VMName $Name -StaticMacAddress $MACAddress[0]
            }

            ## Add additional NICs
            for ($i = 1; $i -lt $SwitchName.Count; $i++)
            {
                $addVMNetworkAdapterParams = @{
                    VMName = $Name;
                    SwitchName = $SwitchName[$i];
                }
                if ($MACAddress -and (-not [System.String]::IsNullOrEmpty($MACAddress[$i])))
                {
                    $addVMNetworkAdapterParams['StaticMacAddress'] = $MACAddress[$i];
                }
                Write-Verbose -Message "Adding additional NIC to '$($SwitchName[$i])' switch"
                Add-VMNetworkAdapter @addVMNetworkAdapterParams
            }

            if ($Generation -eq 2) {
                # Secure boot is only applicable to Generation 2 VMs and it defaults to on.
                # Therefore, we only need to explicitly set it to off if specified.
                if ($SecureBoot -eq $false)
                {
                    Set-VMFirmware -VMName $Name -EnableSecureBoot Off
                }
            }

            if ($EnableGuestService)
            {
                Enable-VMIntegrationService -VMName $Name -Name 'Guest Service Interface'
            }
            
            Write-Verbose -Message "VM $Name created"

            if ($State)
            {
                Set-VMState -Name $Name -State $State -WaitForIP $WaitForIP
                Write-Verbose -Message "VM $Name is $State"
            }
            
        }
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        # Name of the VM
        [parameter(Mandatory)]
        [String]$Name,
        
        # VHD associated with the VM
        [parameter(Mandatory)]
        [String]$VhdPath,
        
        # Virtual switch associated with the VM
        [String[]]$SwitchName,

        # State of the VM
        [AllowNull()]
        [ValidateSet("Running","Paused","Off")]
        [String]$State,

        # Folder where the VM data will be stored
        [String]$Path,

        # Virtual machine generation
        [ValidateRange(1,2)]
        [UInt32]$Generation = 1,

        # Startup RAM for the VM
        [ValidateRange(32MB,17342MB)]
        [UInt64]$StartupMemory,

        # Minimum RAM for the VM. This enables dynamic memory
        [ValidateRange(32MB,17342MB)]
        [UInt64]$MinimumMemory,

        # Maximum RAM for the VM. This enables dynamic memory
        [ValidateRange(32MB,1048576MB)]
        [UInt64]$MaximumMemory,

        # MAC address of the VM
        [String[]]$MACAddress,

        # Processor count for the VM
        [UInt32]$ProcessorCount,

        # Waits for VM to get valid IP address
        [Boolean]$WaitForIP,

        # If specified, shutdowns and restarts the VM as needed for property changes
        [Boolean]$RestartIfNeeded,

        # Should the VM be created or deleted
        [ValidateSet("Present","Absent")]
        [String]$Ensure = "Present",
        [System.String]
        $Notes,

        # Enable secure boot for Generation 2 VMs
        [Boolean]$SecureBoot = $true,

        [Boolean]$EnableGuestService = $false
    )

    #region input validation
    
    # Check if Hyper-V module is present for Hyper-V cmdlets
    if(!(Get-Module -ListAvailable -Name Hyper-V))
    {
        Throw "Please ensure that Hyper-V role is installed with its PowerShell module"
    }

    # Check if 1 or 0 VM with name = $name exist
    if((Get-VM -Name $Name -ErrorAction SilentlyContinue).count -gt 1)
    {
       Throw "More than one VM with the name $Name exist." 
    }
    
    # Check if $VhdPath exist
    if(!(Test-Path $VhdPath))
    {
        #Throw "$VhdPath does not exists"
    }

    # Check if Minimum memory is less than StartUpmemory
    if($StartupMemory -and $MinimumMemory -and  ($MinimumMemory -gt $StartupMemory))
    {
        Throw "MinimumMemory($MinimumMemory) should not be greater than StartupMemory($StartupMemory)"
    }
    
    # Check if Minimum memory is greater than Maximummemory
    if($MaximumMemory -and $MinimumMemory -and ($MinimumMemory -gt $MaximumMemory))
    {
        Throw "MinimumMemory($MinimumMemory) should not be greater than MaximumMemory($MaximumMemory)"
    }
    
    # Check if Startup memory is greater than Maximummemory
    if($MaximumMemory -and $StartupMemory -and ($StartupMemory -gt $MaximumMemory))
    {
        Throw "StartupMemory($StartupMemory) should not be greater than MaximumMemory($MaximumMemory)"
    }        

    <#  VM Generation has no direct relation to the virtual hard disk format and cannot be changed
        after the virtual machine has been created. Generation 2 VMs do not support .VHD files.  #>
    if(($Generation -eq 2) -and ($VhdPath.Split('.')[-1] -eq 'vhd'))
    {
        Throw "Generation 2 virtual machines do not support the .VHD virtual disk extension."
    }


    # Check if $Path exist
    if($Path -and !(Test-Path -Path $Path))
    {
        Throw "$Path does not exists"
    }

    #endregion

    $result = $false

    try
    {
        $vmObj = Get-VM -Name $Name -ErrorAction Stop
        if($Ensure -eq "Present")
        {
            if($vmObj.HardDrives.Path -notcontains $VhdPath){return $false}
            for ($i = 0; $i -lt $SwitchName.Count; $i++)
            {
                if ($vmObj.NetworkAdapters[$i].SwitchName -ne $SwitchName[$i])
                {
                    Write-Verbose -Message "Network Adapter '$i' is not connected to the correct switch. Expected '$($SwitchName[$i])', actual '$($vmObj.NetworkAdapters[$i].SwitchName)'"
                    return $false
                }
            }
            if($state -and ($vmObj.State -ne $State)){return $false}
            if($StartupMemory -and ($vmObj.MemoryStartup -ne $StartupMemory)){return $false}
            for ($i = 0; $i -lt $MACAddress.Count; $i++)
            { 
                if ($vmObj.NetworkAdapters[$i].MACAddress -ne $MACAddress[$i])
                {
                    Write-Verbose -Message "Network Adapter '$i' MAC address is incorrect. Expected '$($MACAddress[$i])', actual '$($vmObj.NetworkAdapters[$i].MACAddress)'"
                    return $false
                }
            }
            if($Generation -ne $vmObj.Generation){return $false}
            if($ProcessorCount -and ($vmObj.ProcessorCount -ne $ProcessorCount)){return $false}
            if($MaximumMemory -and ($vmObj.MemoryMaximum -ne $MaximumMemory)){return $false}
            if($MinimumMemory -and ($vmObj.MemoryMinimum -ne $MinimumMemory)){return $false}

            if($vmObj.Generation -eq 2) {
                if ($SecureBoot -ne (Test-VMSecureBoot -Name $Name)){return $false}
            }
            if (($vmObj | Get-VMIntegrationService -Name 'Guest Service Interface').Enabled -ne $EnableGuestService) {return $false}
            return $true
        }
        else
        {
            return $false
        }
    }
    catch [System.Management.Automation.ActionPreferenceStopException]
    {
        ($Ensure -eq 'Absent')
    }
}

#region Helper function

function Set-VMState
{
    param
    (
        [Parameter(Mandatory)]
        [String]$Name,

        [Parameter(Mandatory)]
        [ValidateSet("Running","Paused","Off")]
        [String]$State,

        [Boolean]$WaitForIP
    )

    switch ($State)
    {
        'Running' {
            $oldState = (Get-VM -Name $Name).State
            # If VM is in paused state, use resume-vm to make it running
            if($oldState -eq "Paused"){Resume-VM -Name $Name}
            # If VM is Off, use start-vm to make it running
            elseif ($oldState -eq "Off"){Start-VM -Name $Name}
            
            if($WaitForIP) { Get-VMIPAddress -Name $Name -Verbose }
        }
        'Paused' {if($oldState -ne 'Off'){Suspend-VM -Name $Name}}
        'Off' {Stop-VM -Name $Name -Force -WarningAction SilentlyContinue}
    }
}

function Change-VMMACAddress
{
    param
    (
        [Parameter(Mandatory)]
        [String]$Name,

        [Parameter(Mandatory)]
        [String]$MACAddress,

        [Parameter(Mandatory)]
        [Int]$NICIndex,

        [Boolean]$WaitForIP,

        [Boolean]$RestartIfNeeded
    )
    $vmObj = Get-VM -Name $Name
    $originalState = $vmObj.state
    if($originalState -ne "Off" -and $RestartIfNeeded)
    { 
        Set-VMState -Name $Name -State Off
        $vmObj.NetworkAdapters[$NICIndex] | Set-VMNetworkAdapter -StaticMacAddress $MACAddress

        # Can not move a off VM to paused, but only to running state
        if($originalState -eq "Running")
        {
            Set-VMState -Name $Name -State Running -WaitForIP $WaitForIP
        }

        Write-Verbose -Message "VM $Name NIC $NICIndex now has $MACAddress MACAddress."

        # Cannot make a paused VM to go back to Paused state after turning Off
        if($originalState -eq "Paused")
        {
            Write-Warning -Message "VM $Name state will be OFF and not Paused"
        }
    }
    elseif($originalState -eq "Off")
    {
        $vmObj.NetworkAdapters[$NICIndex] | Set-VMNetworkAdapter -StaticMacAddress $MACAddress
        Write-Verbose -Message "VM $Name NIC $NICIndex now has $MACAddress MACAddress."
    }
    else
    {
        Write-Error -Message "Can not change properties for VM $Name in $($vmObj.State) state unless RestartIfNeeded is set to true"
    }
}

function Change-VMProperty
{
    param
    (
        [Parameter(Mandatory)]
        [String]$Name,

        [Parameter(Mandatory)]
        [String]$VMCommand,

        [Parameter(Mandatory)]
        [Hashtable]$ChangeProperty,

        [Boolean]$WaitForIP,

        [Boolean]$RestartIfNeeded
    )

    $vmObj = Get-VM -Name $Name
    $originalState = $vmObj.state
    if($originalState -ne "Off" -and $RestartIfNeeded)
    { 
        Set-VMState -Name $Name -State Off
        &$VMCommand -Name $Name @ChangeProperty

        # Can not move a off VM to paused, but only to running state
        if($originalState -eq "Running")
        {
            Set-VMState -Name $Name -State Running -WaitForIP $WaitForIP
        }

        Write-Verbose -Message "VM $Name now has correct properties."

        # Cannot make a paused VM to go back to Paused state after turning Off
        if($originalState -eq "Paused")
        {
            Write-Warning -Message "VM $Name state will be OFF and not Paused"
        }
    }
    elseif($originalState -eq "Off")
    {
        &$VMCommand -Name $Name @ChangeProperty 
        Write-Verbose -Message "VM $Name now has correct properties."
    }
    else
    {
        Write-Error -Message "Can not change properties for VM $Name in $($vmObj.State) state unless RestartIfNeeded is set to true"
    }
}

# The 'Change-VMProperty' method cannot be used as it's hard-coded to use the -Name
# parameter and unfortunately, the Set-VMFirmware cmdlet uses the -VMName parameter instead!
function Change-VMSecureBoot
{
    param
    (
        [Parameter(Mandatory)]
        [String]$Name,

        [Boolean]$SecureBoot,

        [Boolean]$RestartIfNeeded
    )

    $vmObj = Get-VM -Name $Name
    $originalState = $vmObj.state
    if($originalState -ne "Off" -and $RestartIfNeeded)
    { 
        Set-VMState -Name $Name -State Off
        if ($SecureBoot)
        {
            Set-VMFirmware -VMName $Name -EnableSecureBoot On
        }
        else {
            Set-VMFirmware -VMName $Name -EnableSecureBoot Off
        }

        # Can not move a off VM to paused, but only to running state
        if($originalState -eq "Running")
        {
            Set-VMState -Name $Name -State Running -WaitForIP $true
        }

        Write-Verbose -Message "VM $Name now has correct properties."

        # Cannot make a paused VM to go back to Paused state after turning Off
        if($originalState -eq "Paused")
        {
            Write-Warning -Message "VM $Name state will be OFF and not Paused"
        }
    }
    elseif($originalState -eq "Off")
    {
        if ($SecureBoot)
        {
            Set-VMFirmware -VMName $Name -EnableSecureBoot On
        }
        else {
            Set-VMFirmware -VMName $Name -EnableSecureBoot Off
        }
    }
    else
    {
        Write-Error -Message "Can not change properties for VM $Name in $($vmObj.State) state unless RestartIfNeeded is set to true"
    }
}

function Test-VMSecureBoot
{
    param (
        [Parameter(Mandatory)]
        [string]$Name
    )
    $vm = Get-VM -Name $Name;
    return (Get-VMFirmware -VM $vm).SecureBoot -eq 'On';
}

function Get-VMIPAddress
{
    param
    (
        [Parameter(Mandatory)]
        [string]$Name
    )

    while((Get-VMNetworkAdapter -VMName $Name).ipaddresses.count -lt 2)
    {
        Write-Verbose -Message "Waiting for IP Address for VM $Name ..." -Verbose
        Start-Sleep -Seconds 3;
    }
}

#endregion

Export-ModuleMember -Function *-TargetResource
