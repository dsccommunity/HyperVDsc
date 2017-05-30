function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory)]
        [String]$Name,

        [parameter(Mandatory)]
        [ValidateSet("External","Internal","Private")]
        [String]$Type
    )

    # Check if Hyper-V module is present for Hyper-V cmdlets
    if(!(Get-Module -ListAvailable -Name Hyper-V))
    {
        Throw "Please ensure that Hyper-V role is installed with its PowerShell module"
    }

    $switch = Get-VMSwitch -Name $Name -SwitchType $Type -ErrorAction SilentlyContinue

    if ($switch.NetAdapterInterfaceDescription)
    {
        $netAdapterName = (Get-NetAdapter -InterfaceDescription $switch.NetAdapterInterfaceDescription -ErrorAction SilentlyContinue).Name
        $description = $switch.NetAdapterInterfaceDescription
    }
    if ($null -eq $netAdapterName -and $null -ne $switch.NetAdapterInterfaceDescriptions)
    {
        $netAdapterName = (Get-NetAdapter -InterfaceDescription $switch.NetAdapterInterfaceDescriptions).Name
        $description = $switch.NetAdapterInterfaceDescriptions
    }
    $returnValue = @{
        Name                  = $switch.Name
        Type                  = $switch.SwitchType
        NetAdapterName        = $netAdapterName
        AllowManagementOS     = $switch.AllowManagementOS
        EnableEmbeddedTeaming = $switch.EmbeddedTeamingEnabled
        Ensure                = if($switch){'Present'}else{'Absent'}
        Id                    = $switch.Id
        NetAdapterInterfaceDescription = $description
    }

    if($switch.BandwidthReservationMode -ne $null)
    {
        $returnValue['BandwidthReservationMode'] = $switch.BandwidthReservationMode
    }

    return $returnValue
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory)]
        [String]$Name,

        [parameter(Mandatory)]
        [ValidateSet("External","Internal","Private")]
        [String]$Type,

        [ValidateNotNullOrEmpty()]
        [String[]]$NetAdapterName,

        [Boolean]$AllowManagementOS,

        [Boolean]$EnableEmbeddedTeaming = $false,

        [ValidateSet("Default","Weight","Absolute","None","NA")]
        [String]$BandwidthReservationMode = "NA",

        [ValidateSet("Present","Absent")]
        [String]$Ensure = "Present"
    )
    # Check if Hyper-V module is present for Hyper-V cmdlets
    if(!(Get-Module -ListAvailable -Name Hyper-V))
    {
        Throw "Please ensure that the Hyper-V role is installed with its PowerShell module"
    }
    # Check to see if the BandwidthReservationMode chosen is supported in the OS
    elseif(($BandwidthReservationMode -ne "NA") -and ([version](Get-WmiObject -Class 'Win32_OperatingSystem').Version -lt [version]'6.2.0'))
    {
        Throw "The BandwidthReservationMode cannot be set on a Hyper-V version lower than 2012"
    }

    if ($EnableEmbeddedTeaming -eq $true -and [System.Environment]::OSVersion.Version.Major -lt 10)
    {
        throw "Embedded teaming is only supported on Windows Server 2016"
    }

    if($Ensure -eq 'Present')
    {
        $switch = (Get-VMSwitch -Name $Name -SwitchType $Type -ErrorAction SilentlyContinue)

        # If switch is present and it is external type, that means it doesn't have right properties (TEST code ensures that)
        if($switch -and ($switch.SwitchType -eq 'External'))
        {
            $removeReaddSwitch = $false

            Write-Verbose -Message "Checking switch $Name NetAdapterInterface and BandwidthReservationMode ..."
            if ($switch.EmbeddedTeamingEnabled -eq $false -or $null -eq $switch.EmbeddedTeamingEnabled)
            {
                if((Get-NetAdapter -Name $NetAdapterName).InterfaceDescription -ne $switch.NetAdapterInterfaceDescription)
                {
                    Write-Verbose -Message "The switch $Name NetAdapterInterface is incorrect ..."
                    $removeReaddSwitch = $true
                }
            }
            else 
            {
                $adapters = (Get-NetAdapter -InterfaceDescription $switch.NetAdapterInterfaceDescriptions -ErrorAction SilentlyContinue).Name
                if ((Compare-Object -ReferenceObject $adapters -DifferenceObject $NetAdapterName) -ne $null)
                {
                    Write-Verbose -Message "Switch $Name has an incorrect list of network adapters..."
                    $removeReaddSwitch = $true
                }
            }
            
            if(($BandwidthReservationMode -ne "NA") -and ($switch.BandwidthReservationMode -ne $BandwidthReservationMode))
            {
                Write-Verbose -Message "The switch $Name BandwidthReservationMode is incorrect ..."
                $removeReaddSwitch = $true
            }

            if ($null -ne $switch.EmbeddedTeamingEnabled `
                -and $switch.EmbeddedTeamingEnabled -ne $EnableEmbeddedTeaming)
            {
                Write-Verbose -Message "The switch $Name EnableEmbeddedTeaming is incorrect ..."
                $removeReaddSwitch = $true
            }

            if($removeReaddSwitch)
            {
                Write-Verbose -Message "Removing switch $Name and creating with the correct properties ..."
                $switch | Remove-VMSwitch -Force
                $parameters = @{}
                $parameters["Name"] = $Name
                $parameters["NetAdapterName"] = $NetAdapterName
                if($BandwidthReservationMode -ne "NA")
                {
                    $parameters["MinimumBandwidthMode"] = $BandwidthReservationMode
                }
                if($PSBoundParameters.ContainsKey("AllowManagementOS"))
                {
                    $parameters["AllowManagementOS"] = $AllowManagementOS
                }
                if($PSBoundParameters.ContainsKey("EnableEmbeddedTeaming"))
                {
                    $parameters["EnableEmbeddedTeaming"] = $EnableEmbeddedTeaming
                }
                $null = New-VMSwitch @parameters
                Write-Verbose -Message "Switch $Name has right netadapter $NetAdapterName"
                # Since the switch is recreated, the $switch variable is stale and needs to be reassigned
                $switch = (Get-VMSwitch -Name $Name -SwitchType $Type -ErrorAction SilentlyContinue)
            }
            else
            {
                Write-Verbose -Message "Switch $Name has right netadapter $NetAdapterName and BandwidthReservationMode $BandwidthReservationMode"
            }

            Write-Verbose -Message "Checking switch $Name AllowManagementOS ..."
            if($PSBoundParameters.ContainsKey("AllowManagementOS") -and ($switch.AllowManagementOS -ne $AllowManagementOS))
            {
                Write-Verbose -Message "Switch $Name AllowManagementOS property is not correct"
                $switch | Set-VMSwitch -AllowManagementOS $AllowManagementOS
                Write-Verbose -Message "Switch $Name AllowManagementOS property is set to $AllowManagementOS"
            }
            else
            {
                Write-Verbose -Message "Switch $Name AllowManagementOS is correctly set"
            }
        }

        # If the switch is not present, create one
        else
        {
            Write-Verbose -Message "Switch $Name is not $Ensure."
            Write-Verbose -Message "Creating Switch ..."
            $parameters = @{}
            $parameters["Name"] = $Name

            if($BandwidthReservationMode -ne "NA")
            {
                $parameters["MinimumBandwidthMode"] = $BandwidthReservationMode
            }

            if($NetAdapterName)
            {
                $parameters["NetAdapterName"] = $NetAdapterName
                if($PSBoundParameters.ContainsKey("AllowManagementOS"))
                {
                    $parameters["AllowManagementOS"] = $AllowManagementOS
                }
            }
            else
            { 
                $parameters["SwitchType"] = $Type
            }

            if($PSBoundParameters.ContainsKey("EnableEmbeddedTeaming"))
            {
                $parameters["EnableEmbeddedTeaming"] = $EnableEmbeddedTeaming
            }
            
            $null = New-VMSwitch @parameters
            Write-Verbose -Message "Switch $Name is now $Ensure."
        }
    }
    # Ensure is set to "Absent", remove the switch
    else
    {
        Get-VMSwitch $Name -ErrorAction SilentlyContinue | Remove-VMSwitch -Force
    }
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory)]
        [String]$Name,

        [parameter(Mandatory)]
        [ValidateSet("External","Internal","Private")]
        [String]$Type,

        [ValidateNotNullOrEmpty()]
        [String[]]$NetAdapterName,

        [Boolean]$AllowManagementOS,

        [Boolean]$EnableEmbeddedTeaming = $false,

        [ValidateSet("Default","Weight","Absolute","None","NA")]
        [String]$BandwidthReservationMode = "NA",

        [ValidateSet("Present","Absent")]
        [String]$Ensure = "Present"
    )

    #region input validation

    # Check if Hyper-V module is present for Hyper-V cmdlets
    if(!(Get-Module -ListAvailable -Name Hyper-V))
    {
        Throw "Please ensure that Hyper-V role is installed with its PowerShell module"
    }

    if($Type -eq 'External' -and !($NetAdapterName))
    {
        Throw "For external switch type, NetAdapterName must be specified"
    }
    
    
    if($Type -ne 'External' -and $NetAdapterName)
    {
        Throw "For Internal or Private switch type, NetAdapterName should not be specified"
    }

    if(($BandwidthReservationMode -ne "NA") -and ([version](Get-WmiObject -Class 'Win32_OperatingSystem').Version -lt [version]'6.2.0'))
    {
        Throw "The BandwidthReservationMode cannot be set on a Hyper-V version lower than 2012"
    }

    if ($EnableEmbeddedTeaming -eq $true -and [System.Environment]::OSVersion.Version.Major -lt 10)
    {
        throw "Embedded teaming is only supported on Windows Server 2016"
    }
    #endregion

    try
    {
        # Check if switch exists
        Write-Verbose -Message "Checking if Switch $Name is $Ensure ..."
        $switch = Get-VMSwitch -Name $Name -SwitchType $Type -ErrorAction Stop

        # If switch exists
        if($switch)
        {
            Write-Verbose -Message "Switch $Name is Present"
            # If switch should be present, check the switch type
            if($Ensure -eq 'Present')
            {
                ## Only check the BandwidthReservationMode if specified
                if($PSBoundParameters.ContainsKey('BandwidthReservationMode'))
                {
                    # If the BandwidthReservationMode is correct, or if $switch.BandwidthReservationMode is $null which means it isn't supported on the OS
                    Write-Verbose -Message "Checking if Switch $Name has correct BandwidthReservationMode ..."
                    if($switch.BandwidthReservationMode -eq $BandwidthReservationMode -or $switch.BandwidthReservationMode -eq $null)
                    {
                        Write-Verbose -Message "Switch $Name has correct BandwidthReservationMode or it does not apply to this OS"
                    }
                    else
                    {
                        Write-Verbose -Message "Switch $Name does not have correct BandwidthReservationMode "
                        return $false
                    }
                }

                # If switch is the external type, check additional propeties
                if($switch.SwitchType -eq 'External')
                {
                    if ($EnableEmbeddedTeaming -eq $false)
                    {
                        Write-Verbose -Message "Checking if Switch $Name has correct NetAdapterInterface ..."
                        if((Get-NetAdapter -Name $NetAdapterName -ErrorAction SilentlyContinue).InterfaceDescription -ne $switch.NetAdapterInterfaceDescription)
                        {
                            return $false
                        }
                        else
                        {
                            Write-Verbose -Message "Switch $Name has correct NetAdapterInterface"
                        }
                    }
                    else 
                    {
                        Write-Verbose -Message "Checking if Switch $Name has correct NetAdapterInterfaces ..."
                        if ($null -ne $switch.NetAdapterInterfaceDescriptions)
                        {
                            $adapters = (Get-NetAdapter -InterfaceDescription $switch.NetAdapterInterfaceDescriptions -ErrorAction SilentlyContinue).Name
                            if ((Compare-Object -ReferenceObject $adapters -DifferenceObject $NetAdapterName) -ne $null)
                            {
                                Write-Verbose -Message "Switch $Name has an incorrect list of network adapters"
                                return $false
                            }
                            else 
                            {
                                Write-Verbose -Message "Switch $Name has a correct list of network adapters"
                            }
                        }
                        else 
                        {
                            Write-Verbose -Message "Switch $Name has a correct list of network adapters"    
                            return $false
                        }
                    }  
                
                    if($PSBoundParameters.ContainsKey("AllowManagementOS"))
                    {
                        Write-Verbose -Message "Checking if Switch $Name has AllowManagementOS set correctly..."
                        if(($switch.AllowManagementOS -ne $AllowManagementOS))
                        {
                            return $false
                        }
                        else
                        {
                            Write-Verbose -Message "Switch $Name has AllowManagementOS set correctly"
                        }
                    }
                    return $true
                }
                else
                {
                    return $true
                }

                # Only check embedded teaming if specified
                if ($PSBoundParameters.ContainsKey("EnableEmbeddedTeaming") -eq $true)
                {
                    Write-Verbose -Message "Checking if Switch $Name has correct EnableEmbeddedTeaming ..."
                    if($switch.EmbeddedTeamingEnabled -eq $EnableEmbeddedTeaming -or $null -eq $switch.EmbeddedTeamingEnabled)
                    {
                        Write-Verbose -Message "Switch $Name has correct EnableEmbeddedTeaming or it does not apply to this OS"
                    }
                    else
                    {
                        Write-Verbose -Message "Switch $Name does not have correct EnableEmbeddedTeaming "
                        return $false
                    }
                }
                
            }
            # If switch should be absent, but is there, return $false
            else
            {
                return $false
            }
        }
    }

    # If no switch was present
    catch [System.Management.Automation.ActionPreferenceStopException]
    {
        Write-Verbose -Message "Switch $Name is not Present"
        return ($Ensure -eq 'Absent')
    }
}

Export-ModuleMember -Function *-TargetResource
