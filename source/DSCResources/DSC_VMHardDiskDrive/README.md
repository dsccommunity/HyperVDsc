# Description

Manages VHD(X)s attached to a Hyper-V virtual machine.

When parameter `ControllerNumber` or `ControllerLocation` is not provided,
the same logic as `Set-VMHardDiskDrive` command is used.

## Requirements

* The Hyper-V Role has to be installed on the machine.
* The Hyper-V PowerShell module has to be installed on the machine.
