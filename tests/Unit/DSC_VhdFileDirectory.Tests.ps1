$script:dscModuleName = 'HyperVDsc'
$script:dscResourceName = 'DSC_VhdFileDirectory'

function Invoke-TestSetup
{
    try
    {
        Import-Module -Name DscResource.Test -Force -ErrorAction 'Stop'
    }
    catch [System.IO.FileNotFoundException]
    {
        throw 'DscResource.Test module dependency not found. Please run ".\build.ps1 -Tasks build" first.'
    }

    $script:testEnvironment = Initialize-TestEnvironment `
        -DSCModuleName $script:dscModuleName `
        -DSCResourceName $script:dscResourceName `
        -ResourceType 'Mof' `
        -TestType 'Unit'

    # Import the stub functions.
    Import-Module -Name "$PSScriptRoot/Stubs/Hyper-V.stubs.psm1" -Force
}

function Invoke-TestCleanup
{
    Restore-TestEnvironment -TestEnvironment $script:testEnvironment
}

Invoke-TestSetup

try
{
    InModuleScope $script:dscResourceName {

        #region Functions, Variables and Mocks
        function Get-FreeDriveLetter
        {
            [CmdletBinding()]
            param()

            $upperCaseChars = 67..90 | ForEach-Object { [char]$_ }
            $driveLettersInUse = Get-PsDrive | Where-Object -FilterScript {
                $upperCaseChars -contains $_.name
            } | Select-Object -ExpandProperty Name

    foreach ($char in $upperCaseChars)
    {
        if ($driveLettersInUse -notcontains $char)
        {
            Write-Verbose "Selecting $char to use as VhdDriveLetter"

            return $char
            break
        }
    }
}

function New-TestDriveLayout
{
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = "Medium")]
    param(
        [Parameter()]
        [System.String]
        $DriveLetter
    )

    # Source file structure
    New-item -Path TestDrive:\VhdExists.vhdx
    'TestFile1' | Out-File TestDrive:\FileExists.txt
    'TestFile2' | Out-File TestDrive:\FileExists2.txt
    'TestFile3' | Out-File TestDrive:\FileExists3.txt
    New-Item -Path TestDrive:\SourceDirectoryExists -ItemType Directory
    New-Item -Path TestDrive:\SourceDirectoryExists2 -ItemType Directory
    'Some Text' | Out-File TestDrive:\SourceDirectoryExists\File1.txt
    'Some More Text' | Out-File TestDrive:\SourceDirectoryExists2\File2.txt

    # VhdRoot structure
    New-Item -Path TestDrive:\MockVhdRoot -ItemType Directory
    New-Item -Path TestDrive:\MockVhdRoot\DestinationDirectoryExists -ItemType Directory
    Copy-Item -Path TestDrive:\FileExists.txt -Destination TestDrive:\MockVhdRoot\DestinationDirectoryExists\FileExists.txt
    Copy-Item -Path TestDrive:\FileExists2.txt -Destination TestDrive:\MockVhdRoot\DestinationDirectoryExists\FileExists2.txt
    Copy-Item -Path TestDrive:\SourceDirectoryExists TestDrive:\DestinationDirectoryExists\SourceDirectory -Recurse
    (Get-Item TestDrive:\MockVhdRoot\DestinationDirectoryExists\FileExists2.txt).Attributes = ''

    # ShouldProcess supported by New-PsDrive
    New-PSDrive -PSProvider FileSystem -Name $DriveLetter  -Root TestDrive:\MockVhdRoot -scope 1
}

$script:vhdDriveLetter = Get-FreeDriveLetter

# function Mount-Vhd {}
# function Dismount-Vhd {}
# function Get-Disk {}
# function Get-Partition {}
# function Get-Volume {}

$script:dscFileDirClassName = 'DSC_FileDirectoryConfiguration'
$script:dscNamespace = 'root/microsoft/windows/desiredstateconfiguration'

Mock -CommandName Mount-Vhd { [PSCustomObject] @{ Path = 'TestDrive:\VhdExists.vhdx' } }

Mock -CommandName Dismount-Vhd { }

Mock -CommandName Get-Disk {
    New-CimInstance -ClassName DSC_Disk -Namespace root/Microsoft/Windows/Storage -ClientOnly
}

Mock -CommandName Get-Partition {
    New-CimInstance -ClassName DSC_Partitions -Namespace ROOT/Microsoft/Windows/Storage -ClientOnly |
        Add-Member -MemberType NoteProperty -Name Type -Value 'Mocked' -Force -PassThru |
            Add-Member -MemberType NoteProperty -Name DriveLetter -Value $script:vhdDriveLetter -PassThru
}

Mock -CommandName Get-Volume {
    New-CimInstance -ClassName DSC_Volumes -Namespace ROOT/Microsoft/Windows/Storage -ClientOnly |
        Add-Member -MemberType NoteProperty -Name DriveLetter -Value $script:vhdDriveLetter -PassThru
}

Mock -CommandName Get-Module {
    $true
} -ParameterFilter { $Name -and $Name -eq "Hyper-V" }

#endregion

Describe 'DSC_VhdFileDirectory\Get-TargetResource' -Tag 'Get' {

    BeforeAll {
        New-TestDriveLayout -DriveLetter $script:vhdDriveLetter
    }

    AfterAll {
        Remove-PSDrive $script:vhdDriveLetter -ErrorAction SilentlyContinue
    }

    It 'Should return a [System.Collections.Hashtable] object type' {
        $fdProperties = @{
            SourcePath      = 'TestDrive:\FileExists.txt'
            DestinationPath = '\DestinationDirectoryExists\'
            Type            = 'File'
            Ensure          = 'Present'
        }

        $fileDirectory = New-CimInstance -Property $fdProperties -ClassName $script:dscFileDirClassName -Namespace $script:dscNamespace  -ClientOnly
        $result = Get-TargetResource -VhdPath TestDrive:\VhdExists.vhdx -FileDirectory $fileDirectory

        $result -is [System.Collections.Hashtable] |
            Should -Be $true
    }

    #region Testcases for Get-TargetResource
    $testCases_Get = @(
        @{
            TestName                = 'VhdFile exists, Source File exists, Destination File exists'
            FileDirectoryProperties = New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                SourcePath      = 'TestDrive:\FileExists.txt'
                DestinationPath = 'DestinationDirectoryExists\FileExists.txt'
                Type            = 'File'
                Ensure          = 'Present'
            }
            VhdPath                 = 'TestDrive:\VhdExists.vhdx'
            ExpectedResult          = @{
                FileDirectory = New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                    DestinationPath = $script:vhdDriveLetter + ':\DestinationDirectoryExists\FileExists.txt'
                    Ensure          = 'Present'
                }
                VhdPath       = 'TestDrive:\VhdExists.vhdx'
            }
        }
        @{
            TestName                = 'VhdFile exists, Source File exists, Destination File does not exist'
            FileDirectoryProperties = New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                SourcePath      = 'TestDrive:\FileExists.txt'
                DestinationPath = 'DestinationDirectoryExists\DoesNotExist.txt'
                Type            = 'File'
                Ensure          = 'Present'
            }
            VhdPath                 = 'TestDrive:\VhdExists.vhdx'
            ExpectedResult          = @{
                FileDirectory = New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                    DestinationPath = $script:vhdDriveLetter + ':\DestinationDirectoryExists\DoesNotExist.txt'
                    Ensure          = 'Absent'
                }
                VhdPath       = 'TestDrive:\VhdExists.vhdx'
            }
        }
        @{
            TestName                = 'VhdFile exists, Source File does not exist, Destination File exists'
            FileDirectoryProperties = New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                SourcePath      = 'TestDrive:\DoesNotExist.txt'
                DestinationPath = 'DestinationDirectoryExists\FileExists.txt'
                Type            = 'File'
                Ensure          = 'Present'
            }
            VhdPath                 = 'TestDrive:\VhdExists.vhdx'
            ExpectedResult          = @{
                FileDirectory = New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                    DestinationPath = $script:vhdDriveLetter + ':\DestinationDirectoryExists\FileExists.txt'
                    Ensure          = 'Present'
                }
                VhdPath       = 'TestDrive:\VhdExists.vhdx'
            }
        }
        @{
            TestName                = 'VhdFile exists, Source File does not exist, Destination File does not exist'
            FileDirectoryProperties = New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                SourcePath = 'TestDrive:\DoesNotExist.txt'
                DestinationPath = 'DestinationDirectoryExists\DoesNotExist.txt'
                Type = 'File'
                Ensure = 'Present'
            }
            VhdPath                 = 'TestDrive:\VhdExists.vhdx'
            ExpectedResult          = @{
                FileDirectory = New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                    DestinationPath = $script:vhdDriveLetter + ':\DestinationDirectoryExists\DoesNotExist.txt'
                    Ensure          = 'Absent'
                }
                VhdPath       = 'TestDrive:\VhdExists.vhdx'
            }
        }
        @{
            TestName                = 'Vhd does not exist, Source File exists, Destination Path does not exist'
            FileDirectoryProperties = New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                SourcePath = 'TestDrive:\FileExists.txt'
                DestinationPath = 'DoesNotExist\'
                Type = 'File'
                Ensure = 'Present'
            }
            VhdPath                 = 'TestDrive:\VhdDoesNotExist.vhdx'
            ExpectedResult          = @{
                FileDirectory = New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                    DestinationPath = 'TestDrive:\VhdDoesNotExist.vhdx'
                    Ensure          = 'Absent'
                }
                VhdPath       = 'TestDrive:\VhdDoesNotExist.vhdx'
            }
        }
        @{
            TestName                = 'Vhd does not exist, Source File does not exist, Destination Path does not exist'
            FileDirectoryProperties = New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                SourcePath = 'TestDrive:\DoesNotExist.txt'
                DestinationPath = 'DoesNotExist\'
                Type = 'File'
                Ensure = 'Present'
            }
            VhdPath                 = 'TestDrive:\VhdDoesNotExist.vhdx'
            ExpectedResult          = @{
                FileDirectory = New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                    DestinationPath = 'TestDrive:\VhdDoesNotExist.vhdx'
                    Ensure          = 'Absent'
                }
                VhdPath       = 'TestDrive:\VhdDoesNotExist.vhdx'
            }
        }
    )
    #endRegion

    It 'Should correctly return state when: <TestName>' -TestCases $testCases_Get {
        param(
            $FileDirectoryProperties,
            $VhdPath,
            $ExpectedResult
        )

        $result = Get-TargetResource -VhdPath $VhdPath -FileDirectory $FileDirectoryProperties

        $result['FileDirectory'].CimInstanceProperties.Value |
            Should -Be $ExpectedResult['FileDirectory'].CimInstanceProperties.Value

        $result['VhdPath'] |
            Should -Be $ExpectedResult['VhdPath']
    }
}

Describe "DSC_VhdFileDirectory\Test-TargetResource" -Tag 'Test' {

    BeforeAll {
        New-TestDriveLayout -DriveLetter $script:vhdDriveLetter
    }

    AfterAll {
        Remove-PSDrive $script:vhdDriveLetter -ErrorAction SilentlyContinue
    }

    Context 'When the system is in the desired state' {

        $testCases_Test_InDesiredState = @(
            @{
                TestName      = 'VhdPath exists, Destination File exists, DestinationPath includes filename'
                VhdPath       = 'TestDrive:\VhdExists.vhdx'
                FileDirectory = (
                    New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                        SourcePath      = 'TestDrive:\FileExists.txt'
                        DestinationPath = '\DestinationDirectoryExists\FileExists.txt'
                        Ensure          = 'Present'
                    }
                )
            }
            @{
                TestName      = 'VhdPath exists, Destination File exists, "Archive" attribute specified and set on file'
                VhdPath       = 'TestDrive:\VhdExists.vhdx'
                FileDirectory = (
                    New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                        SourcePath      = 'TestDrive:\FileExists.txt'
                        DestinationPath = '\DestinationDirectoryExists\FileExists.txt'
                        Attributes      = 'Archive'
                        Ensure          = 'Present'
                    }
                )
            }
            @{
                TestName      = 'VhdPath exists, Destination File exists, DestinationPath does not include filename'
                VhdPath       = 'TestDrive:\VhdExists.vhdx'
                FileDirectory = (
                    New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                        SourcePath      = 'TestDrive:\FileExists.txt'
                        DestinationPath = '\DestinationDirectoryExists'
                        Ensure          = 'Present'
                    }
                )
            }
            @{
                TestName      = 'Source is Directory, exists at destination'
                VhdPath       = 'TestDrive:\VhdExists.vhdx'
                FileDirectory = (
                    New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                        SourcePath      = 'TestDrive:\SourceDirectoryExists'
                        DestinationPath = '\DestinationDirectoryExists'
                        Ensure          = 'Present'
                    }
                )
            }
        )

        It 'Should return [$true] when <TestName>' -TestCases $testCases_Test_InDesiredState {
            param (
                $VhdPath,
                $FileDirectory
            )

            $result = Test-TargetResource -VhdPath $VhdPath -FileDirectory $FileDirectory
            $result | Should -Be $true
        }
    }

    Context 'When the system is not in the desired state' {
        $testCases_Test_NotInDesiredState = @(
            @{
                TestName      = 'VhdPath exists, Destination File does not exist, DestinationPath includes Filename'
                VhdPath       = 'TestDrive:\VhdExists.vhdx'
                FileDirectory = (
                    New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                        SourcePath      = 'TestDrive:\FileExists.txt'
                        DestinationPath = '\DestinationDirectoryExists\DoesNotExist.txt'
                        Ensure          = 'Present'
                    }
                )
            }
            @{
                TestName      = 'VhdPath exists, Destination File does not exist, DestinationPath does not include Filename'
                VhdPath       = 'TestDrive:\VhdExists.vhdx'
                FileDirectory = (
                    New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                        SourcePath      = 'TestDrive:\FileExists3.txt'
                        DestinationPath = '\DestinationDirectoryExists'
                        Ensure          = 'Present'
                    }
                )
            }
            @{
                TestName      = 'Destination File exists, but "Ensure" is set to "Absent"'
                VhdPath       = 'TestDrive:\VhdExists.vhdx'
                FileDirectory = (
                    New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                        SourcePath      = 'TestDrive:\FileExists.txt'
                        DestinationPath = '\DestinationDirectoryExists\FileExists.txt'
                        Ensure          = 'Absent'
                    }
                )
            }
            @{
                TestName      = 'Destination File exists, "Archive" attribute specified but not set on file'
                VhdPath       = 'TestDrive:\VhdExists.vhdx'
                FileDirectory = (
                    New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                        SourcePath      = 'TestDrive:\FileExists2.txt'
                        DestinationPath = '\DestinationDirectoryExists\FileExists2.txt'
                        Attributes      = 'Archive'
                        Ensure          = 'Present'
                    }
                )
            }
        )

        It 'Should return [$false] when <TestName>' -TestCases $testCases_Test_NotInDesiredState {
            param (
                $VhdPath,
                $FileDirectory
            )

            $result = Test-TargetResource -VhdPath $VhdPath -FileDirectory $FileDirectory
            $result | Should -Be $false
        }

        It 'Should throw error when VhdPath does not exist' {
            $vhdPath = 'TestDrive:\VhdDoesNotExist.vhdx'
            $fileDirectory = New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                SourcePath      = 'TestDrive:\FileExists.txt'
                DestinationPath = '\DestinationDirectoryExists\DoesNotExist.txt'
                Ensure          = 'Present'
            }
            { Test-TargetResource -VhdPath $vhdPath -FileDirectory $fileDirectory } |
                Should -Throw "VHD does not exist in the specified path $vhdPath"
        }
    }
}

Describe "DSC_VhdFileDirectory\Set-TargetResource" -Tag 'Set' {
    BeforeAll {
        New-TestDriveLayout -DriveLetter $script:vhdDriveLetter
    }

    AfterAll {
        Remove-PSDrive $script:vhdDriveLetter  -ErrorAction SilentlyContinue
    }

    Context 'When the system is in the desired state' {
        $testCases_Set_InDesiredState = @(
            @{
                TestName       = 'not throw'
                VhdPath        = 'TestDrive:\VhdExists.vhdx'
                FileDirectory  = (
                    New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                        SourcePath      = 'TestDrive:\FileExists.txt'
                        DestinationPath = '\DestinationDirectoryExists\FileExists.txt'
                        Ensure          = 'Present'
                    }
                )
                ExpectedResult = $null
            }
        )

        It 'Should <TestName>' -TestCases $testCases_Set_InDesiredState {
            param (
                $VhdPath,
                $FileDirectory,
                $ExpectedResult
            )

            { Set-TargetResource -VhdPath $VhdPath -FileDirectory $FileDirectory } | Should -Not -throw
        }
    }

    Context 'When the system is not in the desired state' {

        It 'Should copy the source file to DestinationPath' {
            $vhdPath = 'TestDrive:\VhdExists.vhdx'
            $fileDirectory = New-CimInstance -ClassName $script:dscFileDirClassName -Namespace $script:dscNamespace -ClientOnly -Property @{
                SourcePath      = 'TestDrive:\FileExists.txt'
                DestinationPath = '\DestinationDirectoryExists\FileDoesNotExist.txt'
                Ensure          = 'Present'
            }

            Set-TargetResource -VhdPath $VhdPath -FileDirectory $FileDirectory

            (Get-FileHash TestDrive:\FileExists.txt).Hash |
                Should -Be (Get-FileHash TestDrive:\MockVhdRoot\DestinationDirectoryExists\FileDoesNotExist.txt).hash
        }

        It 'Should Insert content into file when "Content" is specified' {
            $vhdPath = 'TestDrive:\VhdExists.vhdx'
            $fileDirectory = New-CimInstance -ClassName $script:dscFileDirClassName -Namespace $script:dscNamespace -ClientOnly -Property @{
                Content         = 'This is some text'
                DestinationPath = '\DestinationDirectoryExists\FileDoesNotExist2.txt'
                Ensure          = 'Present'
            }

            Set-TargetResource -VhdPath $vhdPath -FileDirectory $fileDirectory

            Get-Content TestDrive:\MockVhdRoot\DestinationDirectoryExists\FileDoesNotExist2.txt |
                Should -Be 'This is some text'
        }

        It 'Should set "hidden" attribute when specified for nonexistent file' {
            $vhdPath = 'TestDrive:\VhdExists.vhdx'
            $fileDirectory = New-CimInstance -ClassName $script:dscFileDirClassName -Namespace  $script:dscNamespace -ClientOnly -Property @{
                SourcePath      = 'TestDrive:\FileExists.txt'
                DestinationPath = '\DestinationDirectoryExists\FileDoesNotExist3.txt'
                Ensure          = 'Present'
                Attributes      = 'Hidden'
            }

            Set-TargetResource -VhdPath $vhdPath -FileDirectory $fileDirectory

            (Get-Item TestDrive:\MockVhdRoot\DestinationDirectoryExists\FileDoesNotExist3.txt -Force).Attributes |
                Should -Be 'Hidden'
        }

        It 'Should remove the file when "Ensure" is set to "Absent"' {
            $vhdPath = 'TestDrive:\VhdExists.vhdx'
            $fileDirectory = New-CimInstance -ClassName $script:dscFileDirClassName -Namespace $script:dscNamespace -ClientOnly -Property @{
                SourcePath      = 'TestDrive:\FileExists.txt'
                DestinationPath = '\DestinationDirectoryExists\FileExists.txt'
                Ensure          = 'Absent'
            }

            Set-TargetResource -VhdPath $vhdPath -FileDirectory $fileDirectory

            Test-Path TestDrive:\MockVhdRoot\DestinationDirectoryExists\FileExists.txt |
                Should -Be $false
        }

        It 'Should throw error when VhdPath does not exist' {
            $vhdPath = 'TestDrive:\VhdDoesNotExist.vhdx'
            $fileDirectory = New-CimInstance -ClassName $script:dscFileDirClassName -Namespace $script:dscNamespace -ClientOnly -Property @{
                SourcePath      = 'TestDrive:\FileExists.txt'
                DestinationPath = '\DestinationDirectoryDoesNotExist\FileDoesNotExist.txt'
                Ensure          = 'Present'
            }

            { Set-TargetResource -VhdPath $vhdPath -FileDirectory $fileDirectory } |
                Should -Throw "Specified destination path $vhdPath does not exist!"
        }
    }
}
}
}
finally
{
    Invoke-TestCleanup
}
