<#
    .SYNOPSIS
    Waits for a virtual machine to be assigned an IP address.

    .PARAMETER Name
    Name of the virtual machine to apply the changes to.

    .PARAMETER Timeout
    Number of seconds to wait before timing out. Defaults to 300 (5 minutes).
#>
function Wait-VMIPAddress
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [Alias('VMName')]
        [System.String]
        $Name,

        [Parameter()]
        [System.Int32]
        $Timeout = 300
    )

    [System.Int32] $elapsedSeconds = 0
    while ((Get-VMNetworkAdapter -VMName $Name).IpAddresses.Count -lt 2)
    {
        Write-Verbose -Message ($script:localizedData.WaitingForVMIPAddress -f $Name)
        Start-Sleep -Seconds 3

        $elapsedSeconds += 3
        if ($elapsedSeconds -gt $Timeout)
        {
            $errorMessage = $script:localizedData.WaitForVMIPAddressTimeoutError -f $Name, $Timeout

            New-ObjectNotFoundException -Message $errorMessage
        }
    }
} #end function
