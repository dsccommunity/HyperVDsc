<#
    .SYNOPSIS
    Helper function for retrieving a virtual machine, ensuring only one VM is resolved

    .PARAMETER VMName
    Name of the Hyper-V virtual machine to return
#>
function Get-VMHyperVHvDsc
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $VMName
    )

    $vm = Get-VM -Name $VMName -ErrorAction SilentlyContinue

    # Check if 1 or 0 VM with name = $name exist
    if ($vm.count -gt 1)
    {
        $errorMessage = $script:localizedData.MoreThanOneVMExistsError -f $VMName
        New-InvalidResultException -Message $errorMessage
    }

    return $vm
}
