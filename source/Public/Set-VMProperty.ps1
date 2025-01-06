<#
    .SYNOPSIS
    Sets one or more virtual machine properties, powering the VM
    off if required.

    .PARAMETER Name
    Name of the virtual machine to apply the changes to.

    .PARAMETER VMName
    Name of the virtual machine to apply the changes to.

    .PARAMETER VMCommand
    The Hyper-V cmdlet name to call to enact the changes.

    .PARAMETER ChangeProperty
    The collection of cmdlet parameter names and values to pass to the command.

    .PARAMETER WaitForIP
    Waits for the virtual machine to report an IP address when transitioning
    into a running state.

    .PARAMETER RestartIfNeeded
    Power cycle the virtual machine if changes are required.
#>
function Set-VMProperty
{
    [CmdletBinding(DefaultParameterSetName = 'Name')]
    param
    (
        [Parameter(Mandatory = $true, ParameterSetName = 'Name')]
        [System.String]
        $Name,

        [Parameter(Mandatory = $true, ParameterSetName = 'VMName')]
        [System.String]
        $VMName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $VMCommand,

        [Parameter(Mandatory = $true)]
        [System.Collections.Hashtable]
        $ChangeProperty,

        [Parameter()]
        [System.Boolean]
        $WaitForIP,

        [Parameter()]
        [System.Boolean]
        $RestartIfNeeded
    )

    if ($PSBoundParameters.ContainsKey('VMName'))
    {
        # Add the -Name property to the ChangeProperty hashtable for splatting
        $ChangeProperty['VMName'] = $VMName

        # Set the common parameters for splatting against Get-VM and Set-VMState
        $vmCommonProperty = @{
            Name = $VMName
        }

        # Ensure that the name parameter is set for verbose messages
        $Name = $VMName
    }
    else
    {
        # Add the -Name property to the ChangeProperty hashtable for splatting
        $ChangeProperty['Name'] = $Name

        # Set the common parameters for splatting against Get-VM and Set-VMState
        $vmCommonProperty = @{
            Name = $Name
        }
    }

    $vmObject = Get-VM @vmCommonProperty
    $vmOriginalState = $vmObject.State

    if ($vmOriginalState -ne 'Off' -and $RestartIfNeeded)
    {
        # Turn the vm off to make changes
        Set-VMState @vmCommonProperty -State Off

        Write-Verbose -Message ($script:localizedData.UpdatingVMProperties -f $Name)
        # Make changes using the passed hashtable
        & $VMCommand @ChangeProperty

        # Cannot move an off VM to a paused state - only to running state
        if ($vmOriginalState -eq 'Running')
        {
            Set-VMState @vmCommonProperty -State Running -WaitForIP $WaitForIP
        }

        Write-Verbose -Message ($script:localizedData.VMPropertiesUpdated -f $Name)

        # Cannot restore a vm to a paused state
        if ($vmOriginalState -eq 'Paused')
        {
            Write-Warning -Message ($script:localizedData.VMStateWillBeOffWarning -f $Name)
        }
    }
    elseif ($vmOriginalState -eq 'Off')
    {
        Write-Verbose -Message ($script:localizedData.UpdatingVMProperties -f $Name)
        & $VMCommand @ChangeProperty
        Write-Verbose -Message ($script:localizedData.VMPropertiesUpdated -f $Name)
    }
    else
    {
        $errorMessage = $script:localizedData.CannotUpdatePropertiesOnlineError -f $Name, $vmOriginalState
        New-InvalidOperationException -Message $errorMessage
    }
}
