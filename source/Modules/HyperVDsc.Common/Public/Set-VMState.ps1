<#
    .SYNOPSIS
    Sets one or more virtual machine properties, powering the VM
    off if required.

    .PARAMETER Name
    Name of the virtual machine to apply the changes to.

    .PARAMETER State
    The target power state of the virtual machine.

    .PARAMETER ChangeProperty
    The collection of cmdlet parameter names and values to pass to the command.

    .PARAMETER WaitForIP
    Waits for the virtual machine to be report an IP address when transitioning
    into a running state.
#>
function Set-VMState
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [Alias('VMName')]
        [System.String]
        $Name,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Running','Paused','Off')]
        [System.String]
        $State,

        [Parameter()]
        [System.Boolean]
        $WaitForIP
    )

    switch ($State)
    {
        'Running' {
            $vmCurrentState = (Get-VM -Name $Name).State
            if ($vmCurrentState -eq 'Paused')
            {
                # If VM is in paused state, use resume-vm to make it running
                Write-Verbose -Message ($script:localizedData.ResumingVM -f $Name)
                Resume-VM -Name $Name
            }
            elseif ($vmCurrentState -eq 'Off')
            {
                # If VM is Off, use start-vm to make it running
                Write-Verbose -Message ($script:localizedData.StartingVM -f $Name)
                Start-VM -Name $Name
            }

            if ($WaitForIP)
            {
                Wait-VMIPAddress -Name $Name -Verbose
            }
        }
        'Paused' {
            if ($vmCurrentState -ne 'Off')
            {
                Write-Verbose -Message ($script:localizedData.SuspendingVM -f $Name)
                Suspend-VM -Name $Name
            }
        }
        'Off' {
            if ($vmCurrentState -ne 'Off')
            {
                Write-Verbose -Message ($script:localizedData.StoppingVM -f $Name)
                Stop-VM -Name $Name -Force -WarningAction SilentlyContinue
            }
        }
    }
} #end function
