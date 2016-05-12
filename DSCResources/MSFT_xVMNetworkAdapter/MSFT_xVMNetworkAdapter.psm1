Import-LocalizedData -BindingVariable LocalizedData -filename MSFT_xVMNetworkAdapter.psd1 -BaseDirectory $PSScriptRoot -Verbose

Function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    Param (
        [Parameter(Mandatory)]
        [String] $Id,

        [Parameter(Mandatory)]
        [String] $Name,        

        [Parameter(Mandatory)]
        [String] $SwitchName,

        [Parameter(Mandatory)]
        [String] $VMName
    )

    $configuration = @{
        Id = $Id
        Name = $Name
        SwitchName = $SwitchName
        VMName = $VMName
    }

    $arguments = @{
        Name = $Name
    }

    if ($VMName -ne 'Management OS')
    {
        $arguments.Add('VMName',$VMName)
    }
    else
    {
        $arguments.Add('ManagementOS', $true)
        $arguments.Add('SwitchName', $SwitchName)
    }

    Write-Verbose $localizedData.GetVMNetAdapter
    $netAdapter = Get-VMNetworkAdapter @arguments -ErrorAction SilentlyContinue

    if ($netAdapter)
    {
        Write-Verbose -Message $localizedData.FoundVMNetAdapter
        if ($VMName -eq 'Management OS')
        {
            $configuration.Add('StaticMacAddress', $NetAdapter.MacAddress)
        }
        elseif ($NetAdapter.VMName)
        {
            $configuration.Add('StaticMacAddress', $NetAdapter.MacAddress)   
            $configuration.Add('DynamicMacAddress', $NetAdapter.DynamicMacAddressEnabled)
        }
        $configuration.Add('Ensure','Present')
    }
    else 
    {
        Write-Verbose -Message $localizedData.NoVMNetAdapterFound
        $configuration.Add('Ensure','Absent')
    }

    $configuration
}

Function Set-TargetResource
{
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [String] $Id,
        
        [Parameter(Mandatory)]
        [String] $Name,

        [Parameter(Mandatory)]
        [String] $SwitchName,

        [Parameter(Mandatory)]
        [String] $VMName,

        [Parameter()]
        [Bool] $DynamicMacAddress,

        [Parameter()]
        [String] $StaticMacAddress,

        [Parameter()]
        [ValidateSet('Present','Absent')]
        [String] $Ensure='Present'
    )

    if ($DynamicMacAddress -and $StaticMacAddress)
    {
        throw $localizedData.StaticAndDynamicTogether
    }

    $arguments = @{
        Name = $Name
    }

    if ($VMName -ne 'Management OS')
    {
        $arguments.Add('VMName',$VMName)
    }
    else
    {
        $arguments.Add('ManagementOS', $true)
        $arguments.Add('SwitchName', $SwitchName)
    }
    
    Write-Verbose -Message $localizedData.GetVMNetAdapter
    $netAdapterExists = Get-VMNetworkAdapter @Arguments -ErrorAction SilentlyContinue
    
    if ($Ensure -eq 'Present')
    {
        if ($netAdapterExists)
        {
            Write-Verbose -Message $localizedData.FoundVMNetAdapter
            if (($VMName -ne 'Management OS'))
            {
                Write-Verbose -Message $localizedData.ModifyVMNetAdapter
                $setArguments = @{
                    VMNetworkAdapter = $NetAdapterExists
                }

                if ($DynamicMacAddress)
                {
                    if (-not $NetAdapterExists.DynamicMacAddressEnabled)
                    {
                        Write-Verbose -Message $localizedData.EnableDynamicMacAddress
                        $setArguments.Add('DynamicMacAddress',$true)
                    }
                } elseif ($StaticMacAddress) {
                    if ($StaticMacAddress -ne $NetAdapterExists.MacAddress)
                    {
                        Write-Verbose -Message $localizedData.EnableStaticMacAddress
                        $setArguments.Add('StaticMacAddress', $StaticMacAddress)
                    }
                }
                elseif ($NetAdapterExists.SwitchName -ne $SwitchName)
                {
                    Write-Verbose -Message $localizedData.PerformSwitchConnect
                    Connect-VMNetworkAdapter -VMNetworkAdapter $netAdapterExists -SwitchName $SwitchName -ErrorAction Stop -Verbose
                }
                
                Write-Verbose -Message $localizedData.PerformVMNetModify
                Set-VMNetworkAdapter @setArguments -ErrorAction Stop
            }
            else
            {
                Write-Verbose $localizedData.CannotChangeHostAdapterMacAddress
            }
        }
        else
        {
            if ($VMName -ne 'Management OS')
            {
                if ($DynamicMacAddress)
                {
                    $arguments.Add('DynamicMacAddress',$true)
                }
                elseif ($StaticMacAddress)
                {
                    $arguments.Add('StaticMacAddress',$StaticMacAddress)
                }
                $arguments.Add('SwitchName',$SwitchName)
            }
            Write-Verbose -Message $localizedData.AddVMNetAdapter
            Add-VMNetworkAdapter @arguments -ErrorAction Stop
        }
    }
    else
    {
        Write-Verbose -Message $localizedData.RemoveVMNetAdapter
        Remove-VMNetworkAdapter @arguments -ErrorAction Stop
    }
}

Function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    Param (
        [Parameter(Mandatory)]
        [String] $Id,
                
        [Parameter(Mandatory)]
        [String] $Name,

        [Parameter(Mandatory)]
        [String] $SwitchName,

        [Parameter(Mandatory)]
        [String] $VMName,

        [Parameter()]
        [Bool] $DynamicMacAddress,

        [Parameter()]
        [String] $StaticMacAddress,

        [Parameter()]
        [ValidateSet('Present','Absent')]
        [String] $Ensure='Present'
    )

    if ($DynamicMacAddress -and $StaticMacAddress)
    {
        throw $localizedData.StaticAndDynamicTogether
    }

    $arguments = @{
        Name = $Name
    }

    if ($VMName -ne 'Management OS')
    {
        $arguments.Add('VMName',$VMName)
    }
    else
    {
        $arguments.Add('ManagementOS', $true)
        $arguments.Add('SwitchName', $SwitchName)
    }
    
    Write-Verbose -Message $localizedData.GetVMNetAdapter
    $netAdapterExists = Get-VMNetworkAdapter @arguments -ErrorAction SilentlyContinue

    if ($Ensure -eq 'Present')
    {
        if ($netAdapterExists)
        {
            if ($VMName -ne 'Management OS')
            {
                if ($DynamicMacAddress)
                {
                    if ($netAdapterExists.DynamicMacAddressEnabled)
                    {
                        Write-Verbose -Message $localizedData.VMNetAdapterExistsNoActionNeeded
                        return $true
                    }
                    else
                    {
                        Write-Verbose -Message $localizedData.EnableDynamicMacAddress
                        return $false
                    }
                }
                elseif ($StaticMacAddress)
                {
                    if ($netAdapterExists.MacAddress -eq $StaticMacAddress)
                    {
                        Write-Verbose -Message $localizedData.VMNetAdapterExistsNoActionNeeded
                        return $true
                    }
                    else
                    {
                        Write-Verbose -Message $localizedData.EnableStaticMacAddress
                        return $false
                    }
                }
                elseif ($netAdapterExists.SwitchName -ne $SwitchName)
                {
                    Write-Verbose -Message $localizedData.SwitchIsDifferent
                    return $false
                } 
                else
                {
                    Write-Verbose -Message $localizedData.VMNetAdapterExistsNoActionNeeded
                    return $true
                }
            }
            else
            {
                Write-Verbose -Message $localizedData.VMNetAdapterExistsNoActionNeeded
                return $true
            }
        }
        else
        {
            Write-Verbose -Message $localizedData.VMNetAdapterDoesNotExistShouldAdd
            return $false
        }
    }
    else
    {
        if ($netAdapterExists)
        {
            Write-Verbose -Message $localizedData.VMNetAdapterExistsShouldRemove
            return $false
        }
        else
        {
            Write-Verbose -Message $localizedData.VMNetAdapterDoesNotExistNoActionNeeded
            return $true
        }
    }
}
