# Fallback message strings in en-US
DATA localizedData
{
    # same as culture = "en-US"
ConvertFrom-StringData @'    
    IncorrectPartitionCount=Partitions on VHD has {0] partitions. Unable to continue without specifying partition number.
    DriveLetter=Drive letter {0} found.
    VHDMissing=VHD does not exist in the specified path {0}.
    DriveLetterFound=Found drive letter: {0}.
    FinalDestinationPath=Items final destination will be {0}.
    CheckIfFileExists=Checking if {0} exist under {1}.
    CheckIfFileExistsResults=File exist on the destination under {0} :- {1}.
    TestResults=Test returned {0}.
    HyperVIsMissing=Hyper-V-Powershell Windows Feature is required to run this resource. Please install Hyper-v feature and try again.
    MountFailed=Mounting Failed from path {0}. Attempting to dismount and mount it back.
    MountedVHD=Mounted VHD from path {0}.
    DismountedVHD=Dismounted VHD from path {0}.
    VHDFileStatus=Setting the VHD file/folder status to {0}.
    CopySuccessful=Copy of {0} to {1} was successful.
    CopyFailed=Copy of {0} to {1} failed. Error: {2}.
    AttributeChanged=Changed the attribute of the file {0} to value {1}
    AttributeChangeFailed=Failed to change the attribute of the file {0} to value {1}
    RemoveItemSuccess=Successfully removed item {0}.
    RemoveItemFailed=Failed to  remove item {0}. Error: {1}.
'@
}

if (Test-Path "$PSScriptRoot\$PSCulture")
{
    Import-LocalizedData LocalizedData -filename "MSFT_xVhdFileDirectory.psm1" -BaseDirectory "$PSScriptRoot\$PSCulture"
}


#  Get the current configuration of the machine 
#  This function is called when you do Get-DscConfiguration after the configuration is set.

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $VhdPath,

        [parameter(Mandatory = $false)]
        [System.Uint32]
        $VhdPartitionNumber,

        [parameter(Mandatory = $true)]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $FileDirectory,

        [ValidateSet('ModifiedDate','SHA-1','SHA-256','SHA-512')]
        [System.String]
        $CheckSum = 'ModifiedDate'
    )

    if(-not (Test-Path -Path $VhdPath))
    {
        $item = New-CimInstance -ClassName MSFT_FileDirectoryConfiguration -Property @{DestinationPath = $VhdPath; Ensure = "Absent"} -Namespace root/microsoft/windows/desiredstateconfiguration -ClientOnly
            
        Return @{
            VhdPath = $VhdPath
            VhdPartitionNumber = $VhdPartitionNumber
            FileDirectory = $item
         }
    }

    # Mount VHD.
    $mountVHD = EnsureVHDState -Mounted -vhdPath $vhdPath
    
    # Retrieve the current drive letter for the VHD
    if($VhdPartitionNumber)
    {
        $mountedDrive =  $mountVHD | Get-Disk | Get-Partition | Where-Object -FilterScript { $_.PartitionNumber -eq $VhdPartitionNumber } | Get-Volume
    }
    else
    {
        $mountedDrive =  $mountVHD | Get-Disk | Get-Partition | Get-Volume
    }
    
    # Turn drive letter into a path
    $letterDrive  = "$($mountedDrive.DriveLetter):\"
    Write-Verbose ($localizedData.DriveLetter -f $letterDrive)
    
    # Determine if files/folders are present
    $itemsFound = foreach($Item in $FileDirectory)
    {
        $itemToCopy = GetItemToCopy -item $Item
        $finalDestinationPath = Join-Path -Path $letterDrive -ChildPath $itemToCopy.DestinationPath
        Write-Verbose ($localizedData.FinalDestinationPath -f $finalDestinationPath)
        
        if(Test-Path $finalDestinationPath)
        {
            New-CimInstance -ClassName MSFT_FileDirectoryConfiguration -Property @{DestinationPath = $finalDestinationPath; Ensure = "Present"} -Namespace root/microsoft/windows/desiredstateconfiguration -ClientOnly
        }
        else
        {            
            New-CimInstance -ClassName MSFT_FileDirectoryConfiguration -Property @{DestinationPath = $finalDestinationPath ; Ensure = "Absent"} -Namespace root/microsoft/windows/desiredstateconfiguration -ClientOnly    
        }
   }

    # Dismount VHD.
    EnsureVHDState -Dismounted -vhdPath $VhdPath 
    
    # Return the result.
    Return @{
      VhdPath = $VhdPath
      VhdPartitionNumber = $VhdPartitionNumber
      FileDirectory = $itemsFound
    }   
}


# This is a resource method that gets called if the Test-TargetResource returns false.
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $VhdPath,

        [parameter(Mandatory = $false)]
        [System.Uint32]
        $VhdPartitionNumber,

        [parameter(Mandatory = $true)]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $FileDirectory,

        [ValidateSet('ModifiedDate','SHA-1','SHA-256','SHA-512')]
        [System.String]
        $CheckSum = 'ModifiedDate'
    )

    if(-not (Test-Path -Path $VhdPath))
    {
        Write-Verbose ($localizedData.VHDMissing -f $VhdPath)
        break;
    }
    
    # mount the VHD.
    $mountVHD = EnsureVHDState -Mounted -vhdPath $VhdPath

    try
    {
        # Retrieve the current drive letter for the VHD
        if($VhdPartitionNumber)
        {
            $mountedDrive =  $mountVHD | Get-Disk | Get-Partition | Where-Object -FilterScript { $_.PartitionNumber -eq $VhdPartitionNumber } | Get-Volume
        }
        else
        {
            $mountedDrive =  $mountVHD | Get-Disk | Get-Partition | Get-Volume
        }
        
        # Turn drive letter into a path
        $letterDrive  = "$($mountedDrive.DriveLetter):\"
        Write-Verbose ($localizedData.DriveLetter -f $letterDrive)
            
        foreach($item in $FileDirectory)
        {
            $itemToCopy = GetItemToCopy -item $item
            $finalDestinationPath = Join-Path -Path $letterDrive -ChildPath $itemToCopy.DestinationPath
            Write-Verbose ($localizedData.FinalDestinationPath -f $finalDestinationPath)
            
            # If the destination should be removed 
            if(-not ($itemToCopy.Ensure))
            {
                if(Test-Path $finalDestinationPath)
                {
                    SetVHDFile -destinationPath $finalDestinationPath -ensure:$false -recurse:($itemToCopy.Recurse)
                }
            }
            else
            {
                # Copy Scenario
                if($itemToCopy.SourcePath)
                {
                    SetVHDFile -sourcePath $itemToCopy.SourcePath  -destinationPath $finalDestinationPath -recurse:($itemToCopy.Recurse) -force:($itemToCopy.Force)
                }
                elseif($itemToCopy.Content)
                {
                    "Writing a content to a file"

                    # if the type is not specified assume it is a file.
                    if(-not ($itemToCopy.Type))
                    {
                        $itemToCopy.Type = 'File'
                    }

                    # Create file/folder scenario
                    SetVHDFile -destinationPath $finalDestinationPath -type $itemToCopy.Type -force:($itemToCopy.Force)  -content $itemToCopy.Content
                }                   

                # Set Attribute scenario
                if($itemToCopy.Attributes)
                {
                    SetVHDFile -destinationPath $finalDestinationPath -attribute $itemToCopy.Attributes -force:($itemToCopy.Force)
                }
            }
        }
    }
    finally
    {
        EnsureVHDState -Dismounted -vhdPath $VhdPath
    }    
}

# This function returns if the current configuration of the machine is the same as the desired configration for this resource.
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $VhdPath,

        [parameter(Mandatory = $false)]
        [System.Uint32]
        $VhdPartitionNumber,

        [parameter(Mandatory = $true)]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $FileDirectory,

        [ValidateSet('ModifiedDate','SHA-1','SHA-256','SHA-512')]
        [System.String]
        $CheckSum = 'ModifiedDate'
    )

    # If the VHD path does not exist throw an error and stop.
    if(-not (Test-Path $VhdPath))
    {
        Write-Verbose ($localizedData.VHDMissing -f $VhdPath)
        break;
    }

    # mount the vhd.
    $mountVHD = EnsureVHDState -Mounted -vhdPath $VhdPath

    try 
    {
        # Retrieve the current drive letter for the VHD
        if($VhdPartitionNumber)
        {
            $mountedDrive =  $mountVHD | Get-Disk | Get-Partition | Where-Object -FilterScript { $_.PartitionNumber -eq $VhdPartitionNumber } | Get-Volume
        }
        else
        {
            $mountedDrive =  $mountVHD | Get-Disk | Get-Partition | Get-Volume
        }
        
        # Check that we only have a single drive letter
        if((($mountedDrive | Measure-Object).Count -gt 1) -or (($mountedDrive | Measure-Object).Count -eq 0))
        {
            Write-Verbose ($localizedData.IncorrectPartitionCount -f ($mountedDrive | Measure-Object).Count)
            break;
        }
        
        # Turn drive letter into a path
        $letterDrive  = "$($mountedDrive.DriveLetter):\"
        Write-Verbose ($localizedData.DriveLetter -f $letterDrive)

        if (!(Test-Path -Path $letterDrive)) {
            Write-Verbose "Can't find $letterDrive"
            Get-PSDrive | Write-Verbose
            break;
        }

        # Return test result equal to true unless one of the tests in the loop below fails.
        $result = $true

        foreach($item in $FileDirectory)
        {  
            $itemToCopy = GetItemToCopy -item $item
            $finalDestinationPath = Join-Path -Path $letterDrive -ChildPath $itemToCopy.DestinationPath
            Write-Verbose ($localizedData.FinalDestinationPath -f $finalDestinationPath)

            if(Test-Path $finalDestinationPath) 
            {               
                if(-not ($itemToCopy.Ensure))
                {
                    $result = $false
                    break;
                }
                else
                {
                    $itemToCopyIsFile = Test-Path $itemToCopy.SourcePath -PathType Leaf
                    $destinationIsFolder = Test-Path $finalDestinationPath -PathType Container

                    if($itemToCopyIsFile -and $destinationIsFolder)
                    {
                        # Verify if the file exist inside the folder
                        $fileName = Split-Path $itemToCopy.SourcePath -Leaf                                                        
                        Write-Verbose ($localizedData.CheckIfFileExists -f $fileName,$finalDestinationPath)
                        $fileExistInDestination = Test-Path -Path (Join-Path -Path $finalDestinationPath -ChildPath $fileName)

                        # Report if the file exist on the destination folder.
                        Write-Verbose ($localizedData.CheckIfFileExistsResults -f $finalDestinationPath,$fileExistInDestination)
                        $result = $fileExistInDestination
                        $result = $result -and -not(ItemHasChanged -sourcePath $itemToCopy.SourcePath -destinationPath (Join-Path -Path $finalDestinationPath -ChildPath $fileName) -CheckSum $CheckSum)
                    }                        
                        
                    if(($itemToCopy.Type -eq "Directory") -and ($itemToCopy.Recurse))
                    {
                        $result = $result -and -not(ItemHasChanged -sourcePath $itemToCopy.SourcePath -destinationPath $finalDestinationPath -CheckSum $CheckSum)
                        
                        if(-not ($result))
                        {
                            break;
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
                    break;
                }                
            }

            # Check the attribute 
            if($itemToCopy.Attributes)
            {
                $currentAttribute = @(Get-ItemProperty -Path $finalDestinationPath | Foreach-Object { $_.Attributes })
                $result = $currentAttribute.Contains($itemToCopy.Attributes)
            }           
          }
    }
    finally
    {
        EnsureVHDState -Dismounted -vhdPath $VhdPath
    }
    
    Write-Verbose ($localizedData.TestResults -f $result)
    return $result;
}

# Assert the state of the VHD.
function EnsureVHDState 
{
    [CmdletBinding(DefaultParametersetName="Mounted")] 
    param
    (
        [parameter(Mandatory=$false,ParameterSetName = "Mounted")]
        [switch]$Mounted,

        [parameter(Mandatory=$false,ParameterSetName = "Dismounted")]  
        [switch]$Dismounted,

        [parameter(Mandatory=$true)]
        $vhdPath 
    )

        if(-not (Get-Module -ListAvailable Hyper-V))
        {
            throw $localizedData.HyperVIsMissing
        }
        
        if($PSCmdlet.ParameterSetName -eq 'Mounted')
        {
             # Try mounting the VHD.
            $mountedVHD = Mount-VHD -Path $vhdPath -Passthru -ErrorAction SilentlyContinue -ErrorVariable AlreadyMounted
            
            # If mounting the VHD failed. Dismount the VHD and mount it again.
            if($AlreadyMounted)
            {
                Write-Verbose ($localizedData.MountFailed -f $vhdPath)
                Dismount-VHD $vhdPath 
                $mountedVHD = Mount-VHD -Path $vhdPath -Passthru -ErrorAction SilentlyContinue

                return $mountedVHD            
            }
            else
            {
                Write-Verbose ($localizedData.MountedVHD -f $vhdPath)
                return $mountedVHD
            }
        }
        else
        {
            Dismount-VHD $vhdPath -ErrorAction SilentlyContinue
            Write-Verbose ($localizedData.DismountedVHD -f $vhdPath)
        }
}

# Change the Cim Instance objects in to a hash table containing property value pair.
function GetItemToCopy
{
    param([Microsoft.Management.Infrastructure.CimInstance] $item)

    $returnValue = @{
        SourcePath = $item.CimInstanceProperties["SourcePath"].Value
        DestinationPath = $item.CimInstanceProperties["DestinationPath"].Value 
        Ensure = $item.CimInstanceProperties["Ensure"].Value 
        Recurse = $item.CimInstanceProperties["Recurse"].Value
        Force = $item.CimInstanceProperties["Force"].Value  
        Content = $item.CimInstanceProperties["Content"].Value       
        Attributes = @($item.CimInstanceProperties["Attributes"].Value) 
        Type = $item.CimInstanceProperties["Type"].Value 
    }

    # Assign Default values, if they are not specified.
    if(-not ($returnValue.Ensure))
    {
        $returnValue.Ensure = "Present"
    }

    if(-not ($returnValue.Force))
    {
        $returnValue.Force = "True"
    }
    
    if(-not ($returnValue.Recurse))
    {
        $returnValue.Recurse  = "True"
    }
    if(-not ($returnValue.Type))
    {
        if(Test-Path -Path $returnValue.SourcePath -PathType Leaf )
        {
            $returnValue.Type = 'File'
        }
        else
        {
            $returnValue.Type = 'Directory'
        }
    }

    # Convert string "True" or "False" to boolean for ease of programming.
    $returnValue.Force =  $returnValue.Force -eq "True"
    $returnValue.Recurse = $returnValue.Recurse -eq "True"
    $returnValue.Ensure = $returnValue.Ensure -eq "Present"
    $returnValue.Keys | Foreach-Object { Write-Verbose "$_ => $($returnValue[$_])" }

    return $returnValue
}


# This is the main function that gets called after the file is mounted to perform copy, set or new operations on the mounted drive.
function SetVHDFile
{
    [CmdletBinding(DefaultParametersetName="Copy")] 
    param
    (
        [parameter(Mandatory=$true,ParameterSetName = "Copy")]
        $sourcePath,
        
        [switch]$recurse,
        
        [switch]$force,
        
        [parameter(Mandatory=$false,ParameterSetName = "New")]  
        $type,
        
        [parameter(Mandatory=$false,ParameterSetName = "New")]  
        $content,
        
        [parameter(Mandatory=$true)]
        $destinationPath,
        
        [parameter(Mandatory=$true,ParameterSetName = "Set")]  
        $attribute,
        
        [parameter(Mandatory=$true,ParameterSetName = "Delete")]
        [switch]$ensure
    )
    
    Write-Verbose ($localizedData.VHDFileStatus -f $($PSCmdlet.ParameterSetName))
    if($PSCmdlet.ParameterSetName -eq 'Copy')
    {
        New-Item -Path (Split-Path $destinationPath) -ItemType Directory -ErrorAction SilentlyContinue        
        try
        {
            Copy-Item -Path $sourcePath -Destination $destinationPath -Force:$force -Recurse:$recurse -ErrorAction SilentlyContinue
            Write-Verbose ($localizedData.CopySuccessful -f $sourcePath,$destinationPath)
        }
        catch
        {
            Write-Verbose ($localizedData.CopyFailed -f $sourcePath,$destinationPath,$_.Exception.Message)
        }
    }
    elseif($PSCmdlet.ParameterSetName -eq 'New')
    {
        if($type -eq 'Directory')
        {
            New-Item -Path $destinationPath -ItemType $type
        }
        else
        {
            New-Item -Path $destinationPath -ItemType $type
            $content | Out-File -FilePath $destinationPath 
        }
    }
    elseif($PSCmdlet.ParameterSetName -eq 'Set')
    {
        try
        {
            Set-ItemProperty -Path $destinationPath -Name Attributes -Value $attribute -ErrorAction Stop
            Write-Verbose ($localizedData.AttributeChanged -f $destinationPath,$attribute)
        }
        catch
        {
            Write-Verbose ($localizedData.AttributeChangeFailed -f $destinationPath,$attribute)
        }
    }
    elseif(-not($ensure))
    {
        try
        {
            Remove-Item -Path $destinationPath -Force:$force -Recurse:$recurse -ErrorAction Stop
            Write-Verbose ($localizedData.RemoveItemSuccess -f $destinationPath)
        }
        catch
        {
            Write-Verbose ($localizedData.RemoveItemFailed -f $destinationPath,$_.Exception.Message)
        }
    }
}

# Detect if the item to be copied is modified version of the orginal.
function ItemHasChanged
{
    param
    (
        [parameter(Mandatory=$true)]
        [ValidateScript({Test-Path $_})] 
        $sourcePath,
        
        [parameter(Mandatory=$true)]
        [ValidateScript({Test-Path $_})]
        $destinationPath,
        
        [parameter(Mandatory=$false)]
        [ValidateSet('ModifiedDate','SHA-1','SHA-256','SHA-512')]
        $CheckSum = 'ModifiedDate'
    )

    $itemIsFolder = Test-Path $sourcePath -Type Container  
    $sourceItems = $null;
    $destinationItems = $null;

    if($itemIsFolder)
    {
        $sourceItems = Get-ChildItem "$sourcePath\*.*" -Recurse
        $destinationItems = Get-ChildItem "$destinationPath\*.*" -Recurse

    }
    else
    {
        $sourceItems = Get-ChildItem $sourcePath
        $destinationItems = Get-ChildItem $destinationPath

    }

    if(-not ($destinationItems))
    {
        return $true;
    }
   
    # Compute the difference using the algorithem specified.
    $difference = $null

    switch($CheckSum)
    {
        'ModifiedDate'
        {
            $difference = Compare-Object -ReferenceObject $sourceItems -DifferenceObject $destinationItems -Property LastWriteTime
        }    
        'SHA-1'
        {
            $difference = Compare-Object -ReferenceObject ($sourceItems | Get-FileHash -Algorithm SHA1) -DifferenceObject ($destinationItems | Get-FileHash -Algorithm SHA1) -Property Hash
        }
        'SHA-256'
        {
            $difference = Compare-Object -ReferenceObject ($sourceItems | Get-FileHash -Algorithm SHA256) -DifferenceObject ($destinationItems | Get-FileHash -Algorithm SHA256) -Property Hash
        }
        'SHA-512'
        {
            $difference = Compare-Object -ReferenceObject ($sourceItems | Get-FileHash -Algorithm SHA512) -DifferenceObject ($destinationItems | Get-FileHash -Algorithm SHA512) -Property Hash
        }
    }
    # If there are object difference between the item at the source and Items at the distenation.
    return ($null -ne $difference)
}

Export-ModuleMember -Function *-TargetResource
