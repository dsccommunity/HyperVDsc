# #region HEADER
# $script:projectPath = "$PSScriptRoot\..\..\.." | Convert-Path
# $script:projectName = (Get-ChildItem -Path "$script:projectPath\*\*.psd1" | Where-Object -FilterScript {
#         ($_.Directory.Name -match 'source|src' -or $_.Directory.Name -eq $_.BaseName) -and
#         $(try
#             {
#                 Test-ModuleManifest -Path $_.FullName -ErrorAction Stop
#             }
#             catch
#             {
#                 $false
#             })
#     }).BaseName

# $script:parentModule = Get-Module -Name $script:projectName -ListAvailable | Select-Object -First 1

# Import-Module $script:parentModule -Force -ErrorAction 'Stop'
# #endregion HEADER

# # Import the stub functions.
# #Get-Module -Name 'Hyper-V' -All | Remove-Module -Force
# Import-Module -Name "$PSScriptRoot/../Stubs/Hyper-V.stubs.psm1" -Force

# InModuleScope $script:parentModule {
#     Describe 'Public\Get-VMHyperV' {
#         BeforeAll {
#             $mockVMName = 'TestVM'
#         }

#         # Guard mocks
#         It 'Should not throw when no VM is found' {
#             Mock -CommandName Get-VM

#             $result = Get-VMHyperV -VMName $mockVMName

#             $result | Should -BeNullOrEmpty
#         }

#         It 'Should not throw when one VM is found' {
#             Mock -CommandName Get-VM -MockWith {
#                 [PSCustomObject] @{
#                     Name = $VMName
#                 }
#             }

#             $result = Get-VMHyperV -VMName $mockVMName

#             $result.Name | Should -Be $mockVMName
#         }

#         It 'Should throw when more than one VM is found' {
#             Mock -CommandName Get-VM -MockWith {
#                 @(
#                     [PSCustomObject] @{
#                         Name = $VMName
#                     },
#                     [PSCustomObject] @{
#                         Name = $VMName
#                     }
#                 )
#             }

#             { Get-VMHyperV -VMName $mockVMName } | Should -Throw (
#                 $script:localizedData.MoreThanOneVMExistsError -f $mockVMName
#             )
#         }
#     }
# }
