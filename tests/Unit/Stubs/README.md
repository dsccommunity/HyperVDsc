# Stubs

A stub function is function with just the skeleton of the original function
or cmdlet. Pester can use a stub function to have something to hook into
when a mock of a cmdlet or function is needed in a unit test. Stub functions
make it possible to run unit tests without having the actual module with
the cmdlet or function installed.

## How to

Install the module `Indented.StubCommand` which is used to generate the
stub module.

```powershell
Install-Module Indented.StubCommand -Scope CurrentUser
```

Install the necessary feature to get the module to create stubs from.

For Windows Server:

```powershell
Install-WindowsFeature -Name 'Hyper-V-PowerShell'
```

For Windows Client:

```powershell
Enable-WindowsOptionalFeature -FeatureName 'Microsoft-Hyper-V-Management-PowerShell' -Online
```

Create the stub modules in output folder 'c:\projects\stub' (can be any
folder).

```powershell
$destinationFolder = 'c:\projects\stubs\'

$functionBody = {
    throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
}

New-StubModule -FromModule 'Hyper-V' -Path $destinationFolder -FunctionBody $functionBody
```

>**NOTE:** It was a problem with the module Hyper-V and specifically the
>cmdlet `Set-VMProcessor` when running `New-StubModule`. When `New-StubCommand`
>is called for the cmdlet `Set-VMProcessor` this error is thrown:
>
>```plaintext
>New-StubCommand : Cannot compare "System.Management.Automation.ParameterMetadata" because it is not IComparable.
>At
>C:\Users\johlju\Documents\WindowsPowerShell\Modules\Indented.StubCommand\1.4.0\Indented.StubCommand.psm1:747
>char:24
>+             $_.Group | New-StubCommand @StubCommandSplat
>+                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    + CategoryInfo          : InvalidOperation: (:) [Write-Error], RuntimeException
>    + FullyQualifiedErrorId : NotIcomparable,New-StubCommand
>```
>
>To workaround this, in the cmdlet `New-StubCommand` the following line
>must be changed.
>
>```powershell
>if ($CommandInfo.CmdletBinding -or $CommandInfo.Parameters.Count -gt 0) {
>```
>
>The line should be changed to:
>
>```powershell
>if ($CommandInfo.CmdletBinding -or $CommandInfo.Parameters.Keys.Count -gt 0) {
>```
>
>For some reason the property `Count` did not return the number of parameters
>but instead returned an object of `System.Management.Automation.ParameterMetadata`,
>by instead counting the number of keys we worked around this issue.
>
>```plaintext
>Name            : Count
>ParameterType   : System.Nullable`1[System.Int64]
>ParameterSets   : {[__AllParameterSets, System.Management.Automation.ParameterSetMetadata]}
>IsDynamic       : False
>Aliases         : {}
>Attributes      : {System.Management.Automation.ValidateNotNullAttribute, __AllParameterSets}
>SwitchParameter : False
>```

## Post-changes due to bugs

Must add a reference to the namespace `Microsoft.Management.Infrastructure` for
the type `Microsoft.Management.Infrastructure.CimSession` to work.
Add the following parameter to the `Add-Type` call at the top of the stub file.

```powershell
Add-Type -IgnoreWarnings -ReferencedAssemblies 'C:\Program Files (x86)\Reference Assemblies\Microsoft\WMI\v1.0\Microsoft.Management.Infrastructure.dll' -TypeDefinition @'

-ReferencedAssemblies 'C:\Program Files (x86)\Reference Assemblies\Microsoft\WMI\v1.0\Microsoft.Management.Infrastructure.dll'
```

One of the namespaces for `Microsoft.HyperV.PowerShell.Commands` is wrongly
generated twice. Remove the duplicate namespace and make sure the enums
`WaitVMTypes` and `RestartType` is moved _inside_ the class `RestartVM`.
