
<#
.SYNOPSIS
    Gets MSFT_xVhdFileDirectory resource current state.

.PARAMETER VhdPath
    Path to the VHD.

.PARAMETER FileDirectory
    The FileDirectory objects to copy to the VHD.

.PARAMETER CheckSum
    Indicates the checksum type to use when determining whether two files are the same.
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $VhdPath,

        [Parameter(Mandatory = $true)]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $FileDirectory,

        [Parameter()]
        [ValidateSet('ModifiedDate', 'SHA-1', 'SHA-256', 'SHA-512')]
        [System.String]
        $CheckSum = 'ModifiedDate'
    )

    if ( -not (Test-path $VhdPath))
    {
        $item = New-CimInstance -ClassName MSFT_FileDirectoryConfiguration -Property @{
            DestinationPath = $VhdPath
            Ensure = 'Absent'
        } -Namespace root/Microsoft/Windows/DesiredStateConfiguration -ClientOnly

        return @{
            VhdPath = $VhdPath
            FileDirectory = $item
            CheckSum = $CheckSum
         }
    }

    # Mount VHD.
    $mountVHD = EnsureVHDState -Mounted -VhdPath $vhdPath

    $itemsFound = foreach ($Item in $FileDirectory)
    {
        $item = GetItemToCopy -item $item
        $mountedDrive = $mountVHD | Get-Disk | Get-Partition | Get-Volume
        $letterDrive  = (-join $mountedDrive.DriveLetter) + ":\"

        # show the drive letters.
        Get-PSDrive | Write-Verbose

        $finalPath = Join-Path -Path $letterDrive -ChildPath $item.DestinationPath

        Write-Verbose "Getting the current value at $finalPath ..."

        if (Test-Path $finalPath)
        {
            New-CimInstance -ClassName MSFT_FileDirectoryConfiguration -Property @{
                DestinationPath = $finalPath
                Ensure = 'Present'
            } -Namespace root/Microsoft/Windows/DesiredStateConfiguration -ClientOnly
        }
        else
        {
            New-CimInstance -ClassName MSFT_FileDirectoryConfiguration -Property @{
                DestinationPath = $finalPath
                Ensure = 'Absent'
            } -Namespace root/Microsoft/Windows/DesiredStateConfiguration -ClientOnly
        }
   }

    # Dismount VHD.
    EnsureVHDState -Dismounted -vhdPath $VhdPath

    # Return the result.
    @{
        VhdPath = $VhdPath
        FileDirectory = $itemsFound
        CheckSum = $CheckSum
    }
}


<#
.SYNOPSIS
    Configures MSFT_xVhdFileDirectory resource state.

.PARAMETER VhdPath
    Path to the VHD.

.PARAMETER FileDirectory
    The FileDirectory objects to copy to the VHD.

.PARAMETER CheckSum
    Indicates the checksum type to use when determining whether two files are the same.
#>
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $VhdPath,

        [Parameter(Mandatory = $true)]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $FileDirectory,

        [Parameter()]
        [ValidateSet('ModifiedDate', 'SHA-1', 'SHA-256', 'SHA-512')]
        [System.String]
        $CheckSum = 'ModifiedDate'
    )

    if (-not (Test-Path $VhdPath))
    {
        throw "Specified destination path $VhdPath does not exist!"
    }

    # mount the VHD.
    $mountedVHD = EnsureVHDState -Mounted -VhdPath $VhdPath

    try
    {
        # show the drive letters.
        Get-PSDrive | Write-Verbose

        $mountedDrive = $mountedVHD | Get-Disk | Get-Partition | Get-Volume

        foreach ($item in $FileDirectory)
        {
            $itemToCopy = GetItemToCopy -item $item
            $letterDrive  = (-join $mountedDrive.DriveLetter) + ':\'
            $finalDestinationPath = Join-Path -Path $letterDrive -ChildPath $itemToCopy.DestinationPath

            # if the destination should be removed
            if (-not ($itemToCopy.Ensure))
            {
                if (Test-Path $finalDestinationPath)
                {
                    SetVHDFile -DestinationPath $finalDestinationPath -Ensure:$false -Recurse:($itemToCopy.Recurse)
                }
            }
            else
            {
                # Copy Scenario
                if ($itemToCopy.SourcePath)
                {
                    SetVHDFile -SourcePath $itemToCopy.SourcePath -DestinationPath $finalDestinationPath -Recurse:($itemToCopy.Recurse) -Force:($itemToCopy.Force)
                }
                elseif ($itemToCopy.Content)
                {
                    # Writing a content to a file

                    # if the type is not specified assume it is a file.
                    if (-not ($itemToCopy.Type))
                    {
                        $itemToCopy.Type = 'File'
                    }

                    # Create file/folder scenario
                    SetVHDFile -DestinationPath $finalDestinationPath -Type $itemToCopy.Type -Force:($itemToCopy.Force) -Content $itemToCopy.Content
                }

                # Set Attribute scenario
                if ($itemToCopy.Attributes)
                {
                    SetVHDFile -DestinationPath $finalDestinationPath -Attribute $itemToCopy.Attributes -Force:($itemToCopy.Force)
                }
            }
        }
    }
    finally
    {
        EnsureVHDState -Dismounted -VhdPath $VhdPath
    }
}

<#
.SYNOPSIS
    Tests if MSFT_xVhdFileDirectory resource state is in the desired state or not.

.PARAMETER VhdPath
    Path to the VHD.

.PARAMETER FileDirectory
    The FileDirectory objects to copy to the VHD.

.PARAMETER CheckSum
    Indicates the checksum type to use when determining whether two files are the same.
#>
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $VhdPath,

        [Parameter(Mandatory = $true)]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $FileDirectory,

        [Parameter()]
        [ValidateSet('ModifiedDate', 'SHA-1', 'SHA-256', 'SHA-512')]
        [System.String]
        $CheckSum = 'ModifiedDate'
    )

    # If the VHD path does not exist throw an error and stop.
    if ( -not (Test-Path $VhdPath))
    {
        throw "VHD does not exist in the specified path $VhdPath"
    }

    # mount the vhd.
    $mountedVHD = EnsureVHDState -Mounted -VhdPath $VhdPath

    try
    {
        # Show the drive letters after mount
        Get-PSDrive | Write-Verbose

        $mountedDrive = $mountedVHD | Get-Disk | Get-Partition | Get-Volume
        $letterDrive  = (-join $mountedDrive.DriveLetter) + ':\'
        Write-Verbose $letterDrive

        # return test result equal to true unless one of the tests in the loop below fails.
        $result = $true

        foreach ($item in $FileDirectory)
        {
            $itemToCopy = GetItemToCopy -item $item
            $destination = $itemToCopy.DestinationPath
            Write-Verbose ("Testing the file with relative VHD destination $destination")
            $destination = $itemToCopy.DestinationPath
            $finalDestinationPath = Join-Path -Path $letterDrive -ChildPath $destination

            if (Test-Path $finalDestinationPath)
            {
                if( -not ($itemToCopy.Ensure))
                {
                    $result = $false
                    break
                }
                else
                {
                    $itemToCopyIsFile = Test-Path $itemToCopy.SourcePath -PathType Leaf
                    $destinationIsFolder = Test-Path $finalDestinationPath -PathType Container

                    if ($itemToCopyIsFile -and $destinationIsFolder)
                    {
                        # Verify if the file exist inside the folder
                        $fileName = Split-Path -Path $itemToCopy.SourcePath -Leaf
                        Write-Verbose "Checking if $fileName exist under $finalDestinationPath"
                        $fileExistInDestination = Test-Path -Path (Join-Path -Path $finalDestinationPath -ChildPath $fileName)

                        # Report if the file exist on the destination folder.
                        Write-Verbose "File exist on the destination under $finalDestinationPath :- $fileExistInDestination"
                        $result = $fileExistInDestination
                        $result = $result -and -not (ItemHasChanged -SourcePath $itemToCopy.SourcePath -DestinationPath (Join-Path -Path $finalDestinationPath -ChildPath $fileName) -CheckSum $CheckSum)
                    }

                    if (($itemToCopy.Type -eq 'Directory') -and ($itemToCopy.Recurse))
                    {
                        $result = $result -and -not(ItemHasChanged -SourcePath $itemToCopy.SourcePath -DestinationPath $finalDestinationPath -CheckSum $CheckSum)

                        if (-not ($result))
                        {
                            break
                        }
                    }
                }
            }
            else
            {
                # If Ensure is specified as Present or if Ensure is not specified at all.
                if(($itemToCopy.Ensure))
                {
                    $result = $false
                    break
                }
            }

            # Check the attribute
            if ($itemToCopy.Attributes)
            {
                $currentAttribute = @(Get-ItemProperty -Path $finalDestinationPath | ForEach-Object -Process { $_.Attributes })
                $result = $currentAttribute.Contains($itemToCopy.Attributes)
            }
          }
    }
    finally
    {
        EnsureVHDState -Dismounted -VhdPath $VhdPath
    }


   Write-Verbose "Test returned $result"
   return $result
}

# Assert the state of the VHD.
function EnsureVHDState
{
    [CmdletBinding(DefaultParametersetName = 'Mounted')]
    param(
        [Parameter(ParameterSetName = 'Mounted')]
        [switch]
        $Mounted,

        [Parameter(ParameterSetName = 'Dismounted')]
        [switch]
        $Dismounted,

        [Parameter(Mandatory = $true)]
        [System.String]
        $VhdPath
    )

    if ( -not ( Get-Module -ListAvailable Hyper-v))
    {
        throw "Hyper-v-Powershell Windows Feature is required to run this resource. Please install Hyper-v feature and try again"
    }

    if ($PSCmdlet.ParameterSetName -eq 'Mounted')
    {
        # Try mounting the VHD.
        $mountedVHD = Mount-VHD -Path $VhdPath -Passthru -ErrorAction SilentlyContinue -ErrorVariable var

        # If mounting the VHD failed. Dismount the VHD and mount it again.
        if ($var)
        {
            Write-Verbose "Mounting Failed. Attempting to dismount and mount it back"
            Dismount-VHD -Path $VhdPath
            $mountedVHD = Mount-VHD -Path $VhdPath -Passthru -ErrorAction SilentlyContinue

            return $mountedVHD
        }
        else
        {
            return $mountedVHD
        }
    }
    else
    {
        Dismount-VHD -Path $VhdPath -ErrorAction SilentlyContinue
    }
}

# Change the Cim Instance objects in to a hash table containing property value pair.
function GetItemToCopy
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [Microsoft.Management.Infrastructure.CimInstance]
        $Item
    )

    $returnValue = @{
        SourcePath = $Item.CimInstanceProperties['SourcePath'].Value
        DestinationPath = $Item.CimInstanceProperties['DestinationPath'].Value
        Ensure = $Item.CimInstanceProperties['Ensure'].Value
        Recurse = $Item.CimInstanceProperties['Recurse'].Value
        Force = $Item.CimInstanceProperties['Force'].Value
        Content = $Item.CimInstanceProperties['Content'].Value
        Attributes = @($Item.CimInstanceProperties['Attributes'].Value)
        Type = $Item.CimInstanceProperties['Type'].Value
    }

    # Assign Default values, if they are not specified.
    if ($null -eq $returnValue.Ensure)
    {
        $returnValue.Ensure = 'Present'
    }

    if ($null -eq $returnValue.Force)
    {
        $returnValue.Force = 'True'
    }

    if ($null -eq $returnValue.Recurse)
    {
        $returnValue.Recurse  = 'True'
    }

    if ($null -eq $returnValue.Type)
    {
        if (Test-Path -Path $returnValue.SourcePath -PathType Leaf )
        {
            $returnValue.Type = 'File'
        }
        else
        {
            $returnValue.Type = 'Directory'
        }
    }

    # Convert string "True" or "False" to boolean for ease of programming.
    $returnValue.Force =  $returnValue.Force -eq 'True'
    $returnValue.Recurse = $returnValue.Recurse -eq 'True'
    $returnValue.Ensure = $returnValue.Ensure -eq 'Present'
    $returnValue.Keys | ForEach-Object -Process { Write-Verbose -Message "$_ => $($returnValue[$_])"}

    return $returnValue
}


# This is the main function that gets called after the file is mounted to perform copy, set or new operations on the mounted drive.
function SetVHDFile
{
    [CmdletBinding(DefaultParametersetName = 'Copy')]
    param
    (
        [Parameter(Mandatory = $true, ParameterSetName = 'Copy')]
        [System.String]
        $SourcePath,

        [Parameter()]
        [switch]
        $Recurse,

        [Parameter()]
        [switch]
        $Force,

        [Parameter(ParameterSetName = 'New')]
        [System.String]
        $Type,

        [Parameter(ParameterSetName = 'New')]
        [System.String]
        $Content,

        [Parameter(Mandatory = $true)]
        [System.String]
        $DestinationPath,

        [Parameter(Mandatory = $true, ParameterSetName = 'Set')]
        [System.String]
        $Attribute,

        [Parameter(Mandatory = $true, ParameterSetName = 'Delete')]
        [switch]
        $Ensure
    )

    Write-Verbose "Setting the VHD file $($PSCmdlet.ParameterSetName)"
    if ($PSCmdlet.ParameterSetName -eq 'Copy')
    {
        New-Item -Path (Split-Path -Path $DestinationPath) -ItemType Directory -ErrorAction SilentlyContinue
        Copy-Item -Path $SourcePath -Destination $DestinationPath -Force:$Force -Recurse:$Recurse -ErrorAction SilentlyContinue
    }
    elseif ($PSCmdlet.ParameterSetName -eq 'New')
    {
        if ($Type -eq 'Directory')
        {
            New-Item -Path $DestinationPath -ItemType $Type
        }
        else
        {
            New-Item -Path $DestinationPath -ItemType $Type
            $Content | Out-File $DestinationPath
        }
    }
    elseif ($PSCmdlet.ParameterSetName -eq 'Set')
    {
        Write-Verbose "Attempting to change the attribute of the file $DestinationPath to value $Attribute"
        Set-ItemProperty -Path $DestinationPath -Name Attributes -Value $Attribute
    }
    elseif (!($Ensure))
    {
        Remove-Item -Path $DestinationPath -Force:$Force -Recurse:$Recurse
    }
}

# Detect if the item to be copied is modified version of the orginal.
function ItemHasChanged
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateScript({Test-Path $_})]
        [System.String]
        $SourcePath,

        [Parameter(Mandatory = $true)]
        [ValidateScript({Test-Path $_})]
        [System.String]
        $DestinationPath,

        [Parameter()]
        [ValidateSet('ModifiedDate', 'SHA-1', 'SHA-256', 'SHA-512')]
        [System.String]
        $CheckSum = 'ModifiedDate'
    )

    $itemIsFolder = Test-Path -Path $SourcePath -Type Container
    $sourceItems = $null
    $destinationItems = $null

    if ($itemIsFolder)
    {
        $sourceItems = Get-ChildItem -Path "$SourcePath\*.*" -Recurse
        $destinationItems = Get-ChildItem -Path "$DestinationPath\*.*" -Recurse
    }
    else
    {
        $sourceItems = Get-ChildItem -Path $SourcePath
        $destinationItems = Get-ChildItem -Path $DestinationPath
    }

    if ( -not ($destinationItems))
    {
        return $true
    }

    # Compute the difference using the algorithem specified.
    $difference = $null

    switch ($CheckSum)
    {
        'ModifiedDate'
        {
            $difference = Compare-Object -ReferenceObject $sourceItems -DifferenceObject $destinationItems -Property LastWriteTime
        }
        'SHA-1'
        {
            $difference = Compare-Object -ReferenceObject ($sourceItems | Get-FileHash -Algorithm SHA1) -DifferenceObject ($destinationItems |
                Get-FileHash -Algorithm SHA1) -Property Hash
        }
        'SHA-256'
        {
            $difference = Compare-Object -ReferenceObject ($sourceItems | Get-FileHash -Algorithm SHA256) -DifferenceObject ($destinationItems |
                Get-FileHash -Algorithm SHA256) -Property Hash
        }
        'SHA-512'
        {
            $difference = Compare-Object -ReferenceObject ($sourceItems | Get-FileHash -Algorithm SHA512) -DifferenceObject ($destinationItems |
                Get-FileHash -Algorithm SHA512) -Property Hash
        }
    }
    # If there are object difference between the item at the source and Items at the distenation.
    return ($null -ne $difference)
}

Export-ModuleMember -Function *-TargetResource
