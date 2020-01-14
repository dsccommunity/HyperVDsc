#region HEADER
# TODO: Update to correct module name and resource name.
$script:dscModuleName = 'xHyper-V'
$script:dscResourceName = 'MSFT_xVhdFileDirectory'

# Unit Test Template Version: 1.2.4
$script:moduleRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
if ( (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests'))) -or `
     (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1'))) )
{
    & git @('clone', 'https://github.com/PowerShell/DscResource.Tests.git', (Join-Path -Path $script:moduleRoot -ChildPath 'DscResource.Tests'))
}

Import-Module -Name (Join-Path -Path $script:moduleRoot -ChildPath (Join-Path -Path 'DSCResource.Tests' -ChildPath 'TestHelper.psm1')) -Force

$TestEnvironment = Initialize-TestEnvironment `
    -DSCModuleName $script:dscModuleName `
    -DSCResourceName $script:dscResourceName `
    -ResourceType 'Mof' `
    -TestType Unit

#endregion HEADER

function Invoke-TestSetup
{
    Import-Module Storage, CimCmdlets
}

function Invoke-TestCleanup
{
    Remove-Module Storage, CimCmdlets
    Restore-TestEnvironment -TestEnvironment $TestEnvironment
}

# Begin Testing
try
{
    Invoke-TestSetup

    InModuleScope $script:dscResourceName {

        #region Functions, Variables and Mocks
        function Get-FreeDriveLetter
        {
            [CmdletBinding()]
            param()

            $driveLettersInUse = (Storage\Get-Volume).DriveLetter
            $upperCaseChars = 67..90 | ForEach-Object {[char]$_}

            foreach ($char in $upperCaseChars)
            {
                if ($driveLettersInUse -notcontains $char)
                {
                    return $char
                    break
                }
            }
        }

        $vhdDriveLetter = Get-FreeDriveLetter

        function Mount-Vhd {}
        function Dismount-Vhd {}
        function Get-Disk {}
        function Get-Partition {}
        function Get-Volume {}

        $dscFileDirClassName = 'MSFT_FileDirectoryConfiguration'
        $dscNamespace = 'root/microsoft/windows/desiredstateconfiguration'

        Mock Mount-Vhd { [PSCustomObject] @{ Path = 'TestDrive:\VhdExists.vhdx'} }

        Mock Dismount-Vhd {}

        Mock Get-Disk {
            New-CimInstance -ClassName MSFT_Disk -Namespace root/Microsoft/Windows/Storage -ClientOnly
        }

        Mock Get-Partition {
            New-CimInstance -ClassName MSFT_Partitions -Namespace ROOT/Microsoft/Windows/Storage -ClientOnly |
                Add-Member -MemberType NoteProperty -Name Type -Value 'Mocked' -Force -PassThru |
                Add-Member -MemberType NoteProperty -Name DriveLetter -Value $vhdDriveLetter -PassThru
        }

        Mock Get-Volume {
            New-CimInstance -ClassName MSFT_Volumes -Namespace ROOT/Microsoft/Windows/Storage -ClientOnly |
                Add-Member -MemberType NoteProperty -Name DriveLetter -Value $vhdDriveLetter -PassThru
        }

        Mock Get-Module {
            $true
        }
        #endregion

        Describe 'MSFT_xVhdFileDirectory\Get-TargetResource' -Tag 'Get' {

            BeforeAll {
                New-item -Path TestDrive:\VhdExists.vhdx
                'TestFile1' | Out-File TestDrive:\FileExists.txt
                New-Item -Path TestDrive:\SourceDirectoryExists -ItemType Directory
                New-Item -Path TestDrive:\VhdRoot -ItemType Directory
                New-Item -Path TestDrive:\VhdRoot\DestinationDirectoryExists -ItemType Directory
                New-PSDrive -PSProvider FileSystem -Name $vhdDriveLetter -Root TestDrive:\VhdRoot
                Copy-Item -Path TestDrive:\FileExists.txt -Destination ($vhdDriveLetter + ':\DestinationDirectoryExists\FileExists.txt')
            }

            AfterAll {
                Remove-PSDrive $vhdDriveLetter -ErrorAction SilentlyContinue
            }

            It 'Should return a [System.Collections.Hashtable] object type' {

                $fdProperties = @{
                    SourcePath = 'TestDrive:\FileExists.txt'
                    DestinationPath = '\DestinationDirectoryExists\'
                    Type = 'File'
                    Ensure = 'Present'
                }

                $fileDirectory = New-CimInstance -Property $fdProperties -ClassName $dscFileDirClassName -Namespace $dscNamespace  -ClientOnly
                $result = Get-TargetResource -VhdPath TestDrive:\VhdExists.vhdx -FileDirectory $fileDirectory

                $result -is [System.Collections.Hashtable] |
                 Should Be $true
            }

            # Testcases for Get-TargetResource
            $testCases_Get = @(

                @{
                    TestName = 'VhdFile exists, Source File exists, Destination File exists'
                    FileDirectoryProperties = New-CimInstance -ClassName $dscFileDirClassName -Namespace  $dscNamespace -ClientOnly -Property @{SourcePath = 'TestDrive:\FileExists.txt';DestinationPath = 'DestinationDirectoryExists\FileExists.txt';Type = 'File';Ensure = 'Present'}
                    VhdPath = 'TestDrive:\VhdExists.vhdx'
                    ExpectedResult = @{
                        FileDirectory = (
                            New-CimInstance -ClassName $dscFileDirClassName -Namespace  $dscNamespace -ClientOnly -Property @{
                                DestinationPath = $vhdDriveLetter + ':\DestinationDirectoryExists\FileExists.txt'
                                Ensure = 'Present'
                            }
                        )
                        VhdPath='TestDrive:\VhdExists.vhdx'
                    }
                }
                @{
                    TestName = 'VhdFile exists, Source File exists, Destination File does not exist'
                    FileDirectoryProperties = New-CimInstance -ClassName $dscFileDirClassName -Namespace  $dscNamespace -ClientOnly -Property @{SourcePath = 'TestDrive:\FileExists.txt';DestinationPath = 'DestinationDirectoryExists\DoesNotExist.txt';Type = 'File';Ensure = 'Present'}
                    VhdPath = 'TestDrive:\VhdExists.vhdx'
                    ExpectedResult = @{
                        FileDirectory = (
                            New-CimInstance -ClassName $dscFileDirClassName -Namespace  $dscNamespace -ClientOnly -Property @{
                                DestinationPath = $vhdDriveLetter + ':\DestinationDirectoryExists\DoesNotExist.txt'
                                Ensure = 'Absent'
                            }
                        )
                        VhdPath='TestDrive:\VhdExists.vhdx'
                    }
                }
                @{
                    TestName = 'VhdFile exists, Source File does not exist, Destination File exists'
                    FileDirectoryProperties = New-CimInstance -ClassName $dscFileDirClassName -Namespace  $dscNamespace -ClientOnly -Property @{SourcePath = 'TestDrive:\DoesNotExist.txt';DestinationPath = 'DestinationDirectoryExists\FileExists.txt';Type = 'File';Ensure = 'Present'}
                    VhdPath = 'TestDrive:\VhdExists.vhdx'
                    ExpectedResult = @{
                        FileDirectory = (
                            New-CimInstance -ClassName $dscFileDirClassName -Namespace  $dscNamespace -ClientOnly -Property @{
                                DestinationPath = $vhdDriveLetter + ':\DestinationDirectoryExists\FileExists.txt'
                                Ensure = 'Present'
                            }
                        )
                        VhdPath='TestDrive:\VhdExists.vhdx'
                    }
                }
                @{
                    TestName = 'VhdFile exists, Source File does not exist, Destination File does not exist'
                    FileDirectoryProperties = New-CimInstance -ClassName $dscFileDirClassName -Namespace  $dscNamespace -ClientOnly -Property @{SourcePath = 'TestDrive:\DoesNotExist.txt';DestinationPath = 'DestinationDirectoryExists\DoesNotExist.txt';Type = 'File';Ensure = 'Present'}
                    VhdPath = 'TestDrive:\VhdExists.vhdx'
                    ExpectedResult = @{
                        FileDirectory = (
                            New-CimInstance -ClassName $dscFileDirClassName -Namespace  $dscNamespace -ClientOnly -Property @{
                                DestinationPath = $vhdDriveLetter + ':\DestinationDirectoryExists\DoesNotExist.txt'
                                Ensure = 'Absent'
                            }
                        )
                        VhdPath='TestDrive:\VhdExists.vhdx'
                    }
                }
                @{
                    TestName = 'Vhd does not exist, Source File exists, Destination Path does not exist'
                    FileDirectoryProperties = New-CimInstance -ClassName $dscFileDirClassName -Namespace  $dscNamespace -ClientOnly -Property @{SourcePath = 'TestDrive:\FileExists.txt';DestinationPath = 'DoesNotExist\';Type = 'File';Ensure = 'Present'}
                    VhdPath = 'TestDrive:\VhdDoesNotExist.vhdx'
                    ExpectedResult = @{
                        FileDirectory = (
                            New-CimInstance -ClassName $dscFileDirClassName -Namespace  $dscNamespace -ClientOnly -Property @{
                                DestinationPath = 'TestDrive:\VhdDoesNotExist.vhdx'
                                Ensure = 'Absent'
                            }
                        )
                        VhdPath='TestDrive:\VhdDoesNotExist.vhdx'
                    }
                }
                @{
                    TestName = 'Vhd does not exist, Source File does not exist, Destination Path does not exist'
                    FileDirectoryProperties = New-CimInstance -ClassName $dscFileDirClassName -Namespace  $dscNamespace -ClientOnly -Property @{SourcePath = 'TestDrive:\DoesNotExist.txt';DestinationPath = 'DoesNotExist\';Type = 'File';Ensure = 'Present'}
                    VhdPath = 'TestDrive:\VhdDoesNotExist.vhdx'
                    ExpectedResult = @{
                        FileDirectory = (
                            New-CimInstance -ClassName $dscFileDirClassName -Namespace  $dscNamespace -ClientOnly -Property @{
                                DestinationPath = 'TestDrive:\VhdDoesNotExist.vhdx'
                                Ensure = 'Absent'
                            }
                        )
                        VhdPath='TestDrive:\VhdDoesNotExist.vhdx'
                    }
                }
            )

            It 'Should correctly return state when: <TestName>' -TestCases $testCases_Get {
                param(
                    $FileDirectoryProperties,
                    $VhdPath,
                    $ExpectedResult
                )

                $result = Get-TargetResource -VhdPath $VhdPath -FileDirectory $FileDirectoryProperties

                $result['FileDirectory'].CimInstanceProperties.Value |
                 Should Be $ExpectedResult['FileDirectory'].CimInstanceProperties.Value

                $result['VhdPath'] |
                 Should be $ExpectedResult['VhdPath']
            }
        }

        Describe 'MSFT_<ResourceName>\Test-TargetResource' -Tag 'Test' {

            BeforeAll {
                New-item -Path TestDrive:\VhdExists.vhdx
                'TestFile1' | Out-File TestDrive:\FileExists.txt
                New-Item -Path TestDrive:\SourceDirectoryExists -ItemType Directory
                New-Item -Path TestDrive:\VhdRoot -ItemType Directory
                New-Item -Path TestDrive:\VhdRoot\DestinationDirectoryExists -ItemType Directory
                New-PSDrive -PSProvider FileSystem -Name $vhdDriveLetter  -Root TestDrive:\VhdRoot
                Copy-Item -Path TestDrive:\FileExists.txt -Destination ($vhdDriveLetter + ':\DestinationDirectoryExists\FileExists.txt')
            }

            AfterAll {
                Remove-PSDrive $vhdDriveLetter -ErrorAction SilentlyContinue
            }

            Context 'When the system is in the desired state' {

                $testCases_Test_InDesiredState = @(
                    @{
                        TestName = 'VhdPath exists, Destination File exists, No Checksum'
                        VhdPath = 'TestDrive:\VhdExists.vhdx'
                        FileDirectory =  (
                            New-CimInstance -ClassName $dscFileDirClassName -Namespace  $dscNamespace -ClientOnly -Property @{
                                SourcePath = 'TestDrive:\FileExists.txt'
                                DestinationPath = '\DestinationDirectoryExists\FileExists.txt'
                                Ensure = 'Present'
                            }
                        )
                        Checksum = $null
                        ExpectedResult = $true
                    }
                )

                It 'Should return [$true] when <TestName>' -TestCases $testCases_Test_InDesiredState {
                    param (
                        $VhdPath,
                        $FileDirectory,
                        $ExpectedResult
                    )

                    $result = Test-TargetResource -VhdPath $VhdPath -FileDirectory $FileDirectory
                    $result | Should be $ExpectedResult
                }
            }

            Context 'When the system is not in the desired state' {
                $testCases_Test_NotInDesiredState = @(
                    @{
                        TestName = 'VhdPath exists, Destination File does not exist, No Checksum'
                        VhdPath = 'TestDrive:\VhdExists.vhdx'
                        FileDirectory =  (
                            New-CimInstance -ClassName $dscFileDirClassName -Namespace  $dscNamespace -ClientOnly -Property @{
                                SourcePath = 'TestDrive:\FileExists.txt'
                                DestinationPath = '\DestinationDirectoryExists\DoesNotExist.txt'
                                Ensure = 'Present'
                            }
                        )
                        Checksum = $null
                        ExpectedResult = $false
                    }
                )

                It 'Should return [$false] when <TestName>' -TestCases $testCases_Test_NotInDesiredState {
                    param (
                        $VhdPath,
                        $FileDirectory,
                        $ExpectedResult
                    )

                    $result = Test-TargetResource -VhdPath $VhdPath -FileDirectory $FileDirectory
                    $result | Should be $ExpectedResult
                }
            }
        }

        Describe 'MSFT_<ResourceName>\Set-TargetResource' -Tag 'Set' {
            BeforeAll {
                New-item -Path TestDrive:\VhdExists.vhdx
                'TestFile1' | Out-File TestDrive:\FileExists.txt
                New-Item -Path TestDrive:\SourceDirectoryExists -ItemType Directory
                New-Item -Path TestDrive:\VhdRoot -ItemType Directory
                New-Item -Path TestDrive:\VhdRoot\DestinationDirectoryExists -ItemType Directory
                New-PSDrive -PSProvider FileSystem -Name $vhdDriveLetter  -Root TestDrive:\VhdRoot
                Copy-Item -Path TestDrive:\FileExists.txt -Destination ($vhdDriveLetter + ':\DestinationDirectoryExists\FileExists.txt')
            }

            AfterAll {
                Remove-PSDrive $vhdDriveLetter  -ErrorAction SilentlyContinue
            }

            Context 'When the system is in the desired state' {
                $testCases_Set_InDesiredState = @(
                    @{
                        TestName = 'not Throw'
                        VhdPath = 'TestDrive:\VhdExists.vhdx'
                        FileDirectory =  (
                            New-CimInstance -ClassName $dscFileDirClassName -Namespace  $dscNamespace -ClientOnly -Property @{
                                SourcePath = 'TestDrive:\FileExists.txt'
                                DestinationPath = '\DestinationDirectoryExists\FileExists.txt'
                                Ensure = 'Present'
                            }
                        )
                        Checksum = $null
                        ExpectedResult = $null
                    }
                )

                It 'Should <TestName>' -TestCases $testCases_Set_InDesiredState {
                    param (
                        $VhdPath,
                        $FileDirectory,
                        $ExpectedResult
                    )

                    { Set-TargetResource -VhdPath $VhdPath -FileDirectory $FileDirectory } | Should Not Throw
                }
            }

            Context 'When the system is not in the desired state' {

                $testCases_Set_NotInDesiredState = @(
                    @{
                        TestName = 'Copy the source file to DestinationPath'
                        VhdPath = 'TestDrive:\VhdExists.vhdx'
                        FileDirectory =  (
                            New-CimInstance -ClassName $dscFileDirClassName -Namespace  $dscNamespace -ClientOnly -Property @{
                                SourcePath = 'TestDrive:\FileExists.txt'
                                DestinationPath = '\DestinationDirectoryExists\FileDoesNotExist.txt'
                                Ensure = 'Present'
                            }
                        )
                        Checksum = $null
                    }
                )

                It 'Should <TestName>' -TestCases $testCases_Set_NotInDesiredState {
                    param (
                        $VhdPath,
                        $FileDirectory
                    )

                    Set-TargetResource -VhdPath $VhdPath -FileDirectory $FileDirectory

                    (Get-FileHash TestDrive:\FileExists.txt).Hash |
                     Should Be (Get-FileHash TestDrive:\VhdRoot\DestinationDirectoryExists\FileDoesNotExist.txt).hash
                }
            }
        }


        # TODO:
        <#
            Add a function to bundle up the test setup currently in BeforeAll blocks
            Add tests for copying directories
            Add checksum tests (looks like this is currently broken in resource)
        #>
    }
}
finally
{
    Invoke-TestCleanup
}
