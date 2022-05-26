# HyperVDsc

[![Build Status](https://dev.azure.com/dsccommunity/HyperVDsc/_apis/build/status/dsccommunity.HyperVDsc?branchName=master)](https://dev.azure.com/dsccommunity/HyperVDsc/_build/latest?definitionId=25&branchName=master)
![Azure DevOps coverage (branch)](https://img.shields.io/azure-devops/coverage/dsccommunity/HyperVDsc/25/master)
[![codecov](https://codecov.io/gh/dsccommunity/HyperVDsc/branch/master/graph/badge.svg)](https://codecov.io/gh/dsccommunity/HyperVDsc)
[![Azure DevOps tests](https://img.shields.io/azure-devops/tests/dsccommunity/HyperVDsc/25/master)](https://dsccommunity.visualstudio.com/HyperVDsc/_test/analytics?definitionId=25&contextType=build)
[![PowerShell Gallery (with prereleases)](https://img.shields.io/powershellgallery/vpre/HyperVDsc?label=HyperVDsc%20Preview)](https://www.powershellgallery.com/packages/HyperVDsc/)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/v/HyperVDsc?label=HyperVDsc)](https://www.powershellgallery.com/packages/HyperVDsc/)

The **HyperVDsc** module contains DSC resources for deployment and configuration
of Hyper-V hosts, virtual machines and related resources.

## Code of Conduct

This project has adopted this [Code of Conduct](CODE_OF_CONDUCT.md).

## Releases

For each merge to the branch `master` a preview release will be
deployed to [PowerShell Gallery](https://www.powershellgallery.com/).
Periodically a release version tag will be pushed which will deploy a
full release to [PowerShell Gallery](https://www.powershellgallery.com/).

## Contributing

Please check out common DSC Community [contributing guidelines](https://dsccommunity.org/guidelines/contributing).

## Change log

A full list of changes in each version can be found in the [change log](CHANGELOG.md).

## Resources

* [**VHD**](#Vhd) manages VHDs in a Hyper-V host.
* [**VhdFile**](#Vhdfile) manages files or directories in a VHD.
 You can use it to copy files/folders to the VHD, remove files/folders from a VHD,
 and change attributes of a file in a VHD (e.g. change a file attribute to
 'ReadOnly' or 'Hidden').
 This resource is particularly useful when bootstrapping DSC Configurations
 into a VM.
* [**VMDvdDrive**](#Vmdvddrive) manages DVD drives attached to a Hyper-V
 virtual machine.
* [**VMHardDiskDrive**](#Vmharddiskdrive) manages VHD(X)s attached to a Hyper-V virtual machine.
* [**VMHost**](#Vmhost) manages Hyper-V host settings.
* [**VMHyperV**](#Vmhyperv) manages VMs in a Hyper-V host.
* [**VMNetworkAdapter**](#Vmnetworkadapter) manages VMNetadapters attached to
 a Hyper-V virtual machine or the management OS.
* [**VMProcessor**](#Vmprocessor) manages Hyper-V virtual machine processor options.
* [**VMScsiController**](#Vmscsicontroller) manages the SCSI controllers attached to a Hyper-V virtual machine.
* [**VMSwitch**](#Vmswitch) manages virtual switches in a Hyper-V host.

### VHD

Manages VHDs in a Hyper-V host.

#### Requirements for VHD

* The Hyper-V Role has to be installed on the machine.
* The Hyper-V PowerShell module has to be installed on the machine.

#### Parameters for VHD

* **`[String]` Name** _(Key)_: The desired VHD file name.
* **`[String]` Path** _(Key)_: The desired Path where the VHD will be created.
* **`[String]` ParentPath** _(Write)_: Parent VHD file path, for differencing disk.
* **`[Uint64]` MaximumSizeBytes** _(Write)_: Maximum size of VHD to be created.
* **`[String]` Generation** _(Write)_: Virtual disk format.
 The default value is Vhd. { *Vhd* | Vhdx }.
* **`[String]` Type** _(Write)_: Virtual disk type.
 The default value is Dynamic. { *Dynamic* | Fixed | Differencing }.
* **`[String]` Ensure** _(Write)_: Ensures that the VHD is Present or Absent.
 The default value is Present. { *Present* | Absent }.

#### Read-Only Properties from Get-TargetResource for VHD

* **`[String]` ID** _(Read)_: Virtual Disk Identifier.
* **`[String]` Type** _(Read)_: Type of Vhd - Dynamic, Fixed, Differencing.
* **`[Uint64]` FileSizeBytes** _(Read)_: Current size of the VHD.
* **`[Boolean]` IsAttached** _(Read)_: Is the VHD attached to a VM or not.

#### Examples VHD

* [Create a new VHD](/source/Examples/Sample_VHD_NewVHD.ps1)
* [Create a new Fixed VHD](/source/Examples/Sample_VHD_FixedVHD.ps1)
* [Create a differencing VHD](/source/Examples/Sample_VHD_DiffVHD.ps1)

### VhdFile

Manages files or directories in a VHD.
 You can use it to copy files/folders to the VHD, remove files/folders from a VHD,
 and change attributes of a file in a VHD (e.g. change a file attribute to
 'ReadOnly' or 'Hidden').
 This resource is particularly useful when bootstrapping DSC Configurations
 into a VM.

#### Requirements for VhdFile

* The Hyper-V Role has to be installed on the machine.
* The Hyper-V PowerShell module has to be installed on the machine.

#### Parameters for VhdFile

* **`[String]` VhdPath** _(Key)_: Path to the VHD.
* **`[DSC_FileDirectory[]]` FileDirectory** _(Required)_: The FileDirectory objects
 to copy to the VHD (as used in the "File" resource).
 Please see the Examples section for more details.
* **`[String]` CheckSum** _(Write)_: Indicates the checksum type to use when determining
 whether two files are the same. The default value is ModifiedDate.
 { *ModifiedDate* | SHA-1 | SHA-256 | SHA-512 }.

##### DSC_FileDirectory Class

* **`[String]` DestinationPath** _(Required)_: Indicates the location where you want
 to ensure the state for a file or directory.
* **`[String]` SourcePath** _(Write)_: Indicates the path from which to copy the
 file or folder resource.
* **`[String]` Ensure** _(Write)_: Indicates if the file or directory exists.
 Set this property to "Absent" to ensure that the file or directory does not exist.
 Set it to "Present" to ensure that the file or directory does exist.
 { Present | Absent }.
* **`[String]` Type** _(Write)_: Indicates if the resource being configured is a
 directory or a file. Set this property to "Directory" to indicate that the resource
 is a directory. Set it to "File" to indicate that the resource is a file.
 { File | Directory }.
* **`[Boolean]` Recurse** _(Write)_: Indicates if subdirectories are included.
 Set this property to $true to indicate that you want subdirectories to be included.
* **`[Boolean]` Force** _(Write)_: Certain file operations (such as overwriting a
 file or deleting a directory that is not empty) will result in an error. Using the
 Force property overrides such errors.
* **`[String]` Content** _(Write)_: Specifies the contents of a file, such as a
 particular string.
* **`[String[]]` Attributes** _(Write)_: Specifies the desired state of the attributes
 for the targeted file or directory. { ReadOnly | Hidden | System | Archive }.

#### Read-Only Properties from Get-TargetResource for VhdFile

None

#### Examples VhdFile

* [Multiple examples](/source/Examples)

### VMDvdDrive

Manages DVD drives attached to a Hyper-V virtual machine.

#### Requirements for VMDvdDrive

* The Hyper-V Role has to be installed on the machine.
* The Hyper-V PowerShell module has to be installed on the machine.

#### Parameters for VMDvdDrive

* **`[String]` VMName** _(Key)_: Specifies the name of the virtual machine
 to which the DVD drive is to be added.
* **`[Uint32]` ControllerNumber** _(Key)_: Specifies the number of the controller
 to which the DVD drive is to be added.
* **`[Uint32]` ControllerLocation** _(Key)_: Specifies the number of the location
 on the controller at which the DVD drive is to be added.
* **`[String]` Path** _(Write)_: Specifies the full path to the virtual hard disk
 file or physical hard disk volume for the added DVD drive.
* **`[String]` Ensure** _(Write)_: Specifies if the DVD Drive should exist or not.
  The default value is Present. { *Present* | Absent }.

#### Read-Only Properties from Get-TargetResource for VMDvdDrive

None

#### Examples VMDvdDrive

* [Create a VM, given a VHDX and add a DVD Drives](/source/Examples/Sample_VMHyperV_SimpleWithDVDDrive.ps1)

### VMHardDiskDrive

Manages VHD(X)s attached to a Hyper-V virtual machine.
When ControllerNumber or ControllerLocation is not provided, the same logic as
 Set-VMHardDiskDrive cmdlet is used.

#### Requirements for VMHardDiskDrive

* The Hyper-V Role has to be installed on the machine.
* The Hyper-V PowerShell module has to be installed on the machine.

#### Parameters for VMHardDiskDrive

* **`[String]` VMName** _(Key)_: Specifies the name of the virtual machine
 whose hard disk drive is to be manipulated.
* **`[String]` VhdPath** _(Key)_: Specifies the full path of the VHD file to be
 manipulated.
* **`[String]` ControllerType** _(Write)_: Specifies the type of controller to which
 the hard disk drive is to be set. The default value is SCSI. { *SCSI* | IDE }.
* **`[Uint32]` ControllerNumber** _(Write)_: Specifies the number of the controller
 to which the hard disk drive is to be set.
 For IDE: { 0, 1 }, for SCSI: { 0 | 1 | 2 | 3 }.
 Defaults to 0.
* **`[Uint32]` ControllerLocation** _(Write)_: Specifies the number of the location
 on the controller at which the hard disk drive is to be set.
 For IDE: { 0 | 1 }, for SCSI: { 0 .. 63 }.
 Defaults to 0.
* **`[String]` Ensure** _(Write)_: Specifies if the hard disk drive should exist or
 not. The default value is Present. { *Present* | Absent }.

#### Read-Only Properties from Get-TargetResource for VMHardDiskDrive

None

#### Examples VMHardDiskDrive

* [Create a VM, with an OS drive and an additional data drive](/source/Examples/Sample_VMHardDiskDrive_VMWithExtraDisk.ps1)
* [Create a VM, with an OS drive and 4 data drives](/source/Examples/Sample_VMHardDiskDrive_VMWith4AdditionalDisks.ps1)

### VMHost

Manages Hyper-V host settings.

#### Requirements for VMHost

* The Hyper-V Role has to be installed on the machine.
* The Hyper-V PowerShell module has to be installed on the machine.

#### Parameters for VMHost

* **`[String]` IsSingleInstance** _(Key)_: Specifies the resource is a single instance,
 the value must be 'Yes'. { *Yes* }.
* **`[Boolean]` EnableEnhancedSessionMode** _(Write)_: Indicates whether users
 can use enhanced mode when they connect to virtual machines on this server
 by using Virtual Machine Connection.
* **`[String]` FibreChannelWwnn** _(Write)_: Specifies the default value of
 the World Wide Node Name on the Hyper-V host.
* **`[String]` FibreChannelWwpnMaximum** _(Write)_: Specifies the maximum value
 that can be used to generate World Wide Port Names on the Hyper-V host.
 Use with the FibreChannelWwpnMinimum parameter to establish a range of WWPNs
 that the specified Hyper-V host can assign to virtual Fibre Channel adapters.
* **`[String]` FibreChannelWwpnMinimum** _(Write)_: Specifies the minimum value
 that can be used to generate the World Wide Port Names on the Hyper-V host.
 Use with the FibreChannelWwpnMaximum parameter to establish a range of WWPNs
 that the specified Hyper-V host can assign to virtual Fibre Channel adapters.
* **`[String]` MacAddressMaximum** _(Write)_: Specifies the maximum MAC address
 using a valid hexadecimal value. Use with the MacAddressMinimum parameter
 to establish a range of MAC addresses that the specified Hyper-V host can assign
 to virtual machines configured to receive dynamic MAC addresses.
* **`[String]` MacAddressMinimum** _(Write)_: Specifies the minimum MAC address
 using a valid hexadecimal value. Use with the MacAddressMaximum parameter to
 establish a range of MAC addresses that the specified Hyper-V host can assign
 to virtual machines configured to receive dynamic MAC addresses.
* **`[Uint32]` MaximumStorageMigrations** _(Write)_: Specifies the maximum number
 of storage migrations that can be performed at the same time on the Hyper-V host.
* **`[Uint32]` MaximumVirtualMachineMigrations** _(Write)_: Specifies the maximum
 number of live migrations that can be performed at the same time
 on the Hyper-V host.
* **`[Boolean]` NumaSpanningEnabled** _(Write)_: Specifies whether virtual machines
 on the Hyper-V host can use resources from more than one NUMA node.
* **`[Uint32]` ResourceMeteringSaveIntervalMinute** _(Write)_: Specifies how often
 the Hyper-V host saves the data that tracks resource usage. The range is a minimum
 of 60 minutes to a maximum 1440 minutes (24 hours).
* **`[Boolean]` UseAnyNetworkForMigration** _(Write)_: Specifies how networks are
 selected for incoming live migration traffic. If set to $True, any available network
 on the host can be used for this traffic. If set to $False, incoming live migration
 traffic is transmitted only on the networks specified in the MigrationNetworks
 property of the host.
* **`[String]` VirtualHardDiskPath** _(Write)_: Specifies the default folder to
 store virtual hard disks on the Hyper-V host.
* **`[String]` VirtualMachineMigrationAuthenticationType** _(Write)_: Specifies the
 type of authentication to be used for live migrations. { Kerberos | CredSSP }.
* **`[String]` VirtualMachineMigrationPerformanceOption** _(Write)_: Specifies the
 performance option to use for live migration. { TCPIP | Compression | SMB }.
* **`[String]` VirtualMachinePath** _(Write)_: Specifies the default folder
 to store virtual machine configuration files on the Hyper-V host.
* **`[Boolean]` VirtualMachineMigrationEnabled** _(Write)_: Indicates whether Live
 Migration should be enabled or disabled on the Hyper-V host.

#### Read-Only Properties from Get-TargetResource for VMHost

None

#### Examples VMHost

* [Change VM Host paths](/source/Examples/Sample_VMHost_Paths.ps1)

### VMHyperV

Manages VMs in a Hyper-V host.

The following properties **cannot** be changed after VM creation:

* VhdPath
* Path
* Generation

#### Requirements for VMHyperV

* The Hyper-V Role has to be installed on the machine.
* The Hyper-V PowerShell module has to be installed on the machine.

#### Parameters for VMHyperV

* **`[String]` Name** _(Key)_: The desired VM name.
* **`[String]` VhdPath** _(Required)_: The desired VHD associated with the VM.
* **`[String[]]` SwitchName** _(Write)_: Virtual switch(es) associated with the VM.
  Multiple NICs can now be assigned.
* **`[String]` State** _(Write)_: State of the VM: { Running | Paused | Off }.
* **`[String]` Path** _(Write)_: Folder where the VM data will be stored.
* **`[Uint32]` Generation** _(Write)_: Virtual machine generation.
  Generation 2 virtual machines __only__ support VHDX files.
  The default value is 1. { *1* | 2 }.
* **`[Boolean]` SecureBoot** _(Write)_: Enables or disables secure boot
 __only on generation 2 virtual machines__.
 The default value is $true.
* **`[Uint64]` StartupMemory** _(Write)_: Startup RAM for the VM.
  If neither MinimumMemory nor MaximumMemory is specified, dynamic memory will be disabled.
* **`[Uint64]` MinimumMemory** _(Write)_: Minimum RAM for the VM.
  Setting this property enables dynamic memory. Exception:
  If MinimumMemory, MaximumMemory and StartupMemory is equal, dynamic memory will be disabled.
* **`[Uint64]` MaximumMemory** _(Write)_: Maximum RAM for the VM.
  Setting this property enables dynamic memory. Exception:
  If MinimumMemory, MaximumMemory and StartupMemory is equal, dynamic memory will be disabled.
* **`[String[]]` MACAddress** _(Write)_: MAC address(es) of the VM.
  Multiple MAC addresses can now be assigned.
* **`[Uint32]` ProcessorCount** _(Write)_: Processor count for the VM.
* **`[Boolean]` WaitForIP** _(Write)_: If specified, waits for the VM to get
 valid IP address.
* **`[Boolean]` RestartIfNeeded** _(Write)_: If specified, will shutdown and
 restart the VM as needed for property changes.
* **`[String]` Ensure** _(Write)_: Ensures that the VM is Present or Absent.
 The default value is Present. { *Present* | Absent }.
* **`[String]` Notes** _(Write)_: Notes about the VM.
* **`[Boolean]` EnableGuestService** _(Write)_: Enable Guest Service Interface
 for the VM. The default value is $false.

#### Read-Only Properties from Get-TargetResource for VMHyperV

* **`[String]` ID** _(Read)_: VM unique ID.
* **`[String]` Status** _(Read)_: Status of the VM.
* **`[Uint32]` CPUUsage** _(Read)_: CPU Usage of the VM.
* **`[Uint64]` MemoryAssigned** _(Read)_: Memory assigned to the VM.
* **`[String]` Uptime** _(Read)_: Uptime of the VM.
* **`[DateTime]` CreationTime** _(Read)_: Creation time of the VM.
* **`[Boolean]` HasDynamicMemory** _(Read)_: Does VM has dynamic memory enabled.
* **`[String[]]` NetworkAdapters** _(Read)_: Network adapters' IP addresses of
 the VM".

#### Examples VMHyperV

* [Create a VM (Simple)](/source/Examples/Sample_VMHyperV_Simple.ps1)
* [Create a VM with dynamic memory](/source/Examples/Sample_VMHyperV_DynamicMemory.ps1)
* [Create a VM (Complete)](/source/Examples/Sample_VMHyperV_Complete.ps1)
* [Create a VM with multiple NICs attached to multiple switches](/source/Examples/Sample_VMHyperV_MultipleNICs.ps1)

### VMNetworkAdapter

Manages VMNetadapters attached to a Hyper-V virtual machine or the management OS.

#### Requirements for VMNetworkAdapter

* The Hyper-V Role has to be installed on the machine.
* The Hyper-V PowerShell module has to be installed on the machine.

#### Parameters for VMNetworkAdapter

* **`[String]` Id** _(Key)_: Unique string for identifying the resource instance.
* **`[String]` Name** _(Required)_: Name of the network adapter as it appears either
  in the management OS or attached to a VM.
* **`[String]` SwitchName** _(Required)_: Virtual Switch name to connect to.
* **`[String]` VMName** _(Required)_: Name of the VM to attach to.
  If you want to attach new VM Network adapter to the management OS,
  set this property to 'Management OS'.
* **`[xNetworkSettings]` NetworkSetting** _(Write)_: Network Settings of the network adapter.
  If this parameter is not supplied, DHCP will be used.
* **`[String]` MacAddress** _(Write)_: Use this to specify a Static MAC Address.
  If this parameter is not specified, dynamic MAC Address will be set.
* **`[String]` VlanId** _(Write)_: Use this to specify a Vlan id on the
* Network Adapter.
* **`[String]` Ensure** _(Write)_: Ensures that the VM Network Adapter is
  Present or Absent. The default value is Present. { *Present* | Absent }.

##### xNetworkSettings Class

* **`[String]` IpAddress** _(Write)_: IpAddress to give the network adapter.
  Only used if not Dhcp. Required if not Dhcp.
* **`[String]` Subnet** _(Write)_: Subnet to give the network adapter.
  Only used if not Dhcp. Required if not Dhcp.
* **`[String]` DefaultGateway** _(Write)_: DefaultGateway to give the network adapter.
  Only used if not Dhcp.
* **`[String]` DnsServer** _(Write)_: DNSServer to give the network adapter.
  Only used if not Dhcp.

#### Read-Only Properties from Get-TargetResource for VMNetworkAdapter

* **`[Boolean]` DynamicMacAddress** _(Read)_: Does the VMNetworkAdapter use a
 Dynamic MAC Address.

#### Examples VMNetworkAdapter

* [Add a new VM Network adapter in the management OS](/source/Examples/Sample_VMNetworkAdapter_ManagementOS.ps1)
* [Add multiple VM Network adapters to a VM](/source/Examples/Sample_VMNetworkAdapter_MultipleVM.ps1)
* [Add a couple of VM Network adapters in the management OS](/source/Examples/Sample_VMNetworkAdapter_MultipleManagementOS.ps1)
* [Add multiple VM Network adapters to a VM using status MAC addresses](/source/Examples/Sample_VMNetworkAdapter_MultipleVMMACAddress.ps1)
* [Add VM Network adapters to a VM with a Vlan tag](/source/Examples/Sample_VMNetworkAdapter_VMVlanTagging.ps1)
* [Add VM Network adapters to a VM with a static IpAddress](/source/Examples/Sample_VMNetworkAdapter_VMStaticNetworkSettings.ps1)

### VMProcessor

Manages Hyper-V virtual machine processor options.

#### Requirements for VMProcessor

* The Hyper-V Role has to be installed on the machine.
* The Hyper-V PowerShell module has to be installed on the machine.

#### Parameters for VMProcessor

* **`[String]` VMName** _(Key)_: Specifies the name of the virtual machine
 on which the processor is to be configured.
* **`[Boolean]` EnableHostResourceProtection** _(Write)_: Specifies whether to
 enable host resource protection. NOTE: Only supported on Windows 10 and Server 2016.
* **`[Boolean]` ExposeVirtualizationExtensions** _(Write)_: Specifies whether
 nested virtualization is enabled. NOTE: Only supported on
 Windows 10 and Server 2016.
* **`[Uint64]` HwThreadCountPerCore** _(Write)_: Specifies the maximum thread core
 per processor core. NOTE: Only supported on Windows 10 and Server 2016.
* **`[Uint64]` Maximum** _(Write)_: Specifies the maximum percentage of resources
 available to the virtual machine processor to be configured.
 Allowed values range from 0 to 100.
* **`[Uint32]` MaximumCountPerNumaNode** _(Write)_: Specifies the maximum number
 of processors per NUMA node to be configured for the virtual machine.
* **`[Uint32]` MaximumCountPerNumaSocket** _(Write)_: Specifies the maximum number
 of sockets per NUMA node to be configured for the virtual machine.
* **`[Unit32]` RelativeWeight** _(Write)_: Specifies the priority for allocating
 the physical computer's processing power to this virtual machine relative to others.
 Allowed values range from 1 to 10000.
* **`[Uint64]` Reserve** _(Write)_: Specifies the percentage of processor resources
 to be reserved for this virtual machine. Allowed values range from 0 to 100.
* **`[String]` ResourcePoolName** _(Write)_: Specifies the name of the processor
 resource pool to be used.
* **`[Boolean]` CompatibilityForMigrationEnabled** _(Write)_: Specifies whether
 the virtual processors features are to be limited for compatibility when migrating
 the virtual machine to another host.
* **`[Boolean]` CompatibilityForOlderOperatingSystemsEnabled** _(Write)_: Specifies
 whether the virtual processor’s features are to be limited for compatibility
 with older operating systems.
* **`[Boolean]` RestartIfNeeded** _(Write)_: If specified, shutdowns and restarts
 the VM if needed for property changes.

#### Read-Only Properties from Get-TargetResource for VMProcessor

None

#### Examples VMProcessor

* [Create a secure boot gen 2 VM for a given VHD with nested virtualisation enabled](/source/Examples/Sample_VMHyperV_SimpleWithNestedVirtualization.ps1)

### VMScsiController

Manages the SCSI controllers attached to a Hyper-V virtual machine.
When removing a controller, all the disks still connected to the controller will be detached.

#### Requirements for VMScsiController

* The Hyper-V Role has to be installed on the machine.
* The Hyper-V PowerShell module has to be installed on the machine.

#### Parameters for VMScsiController

* **`[String]` VMName** _(Key)_: Specifies the name of the virtual machine whose SCSI
 controller is to be manipulated.
* **`[Uint32]` ControllerNumber** _(Key)_: Specifies the number of the controller to
 be set: { 0 | 1 | 2 | 3 }.
* **`[String]` Ensure** _(Write)_: Specifies if the SCSI controller should exist or
 not. The default value is Present. { *Present* | Absent }.

#### Read-Only Properties from Get-TargetResource for VMScsiController

None

#### Examples VMScsiController

* [Add a secondary SCSI controller](/source/Examples/Sample_VMScsiController_AddControllers.ps1)

### VMSwitch

Manages virtual switches in a Hyper-V host.

#### Requirements for VMSwitch

* The Hyper-V Role has to be installed on the machine.
* The Hyper-V PowerShell module has to be installed on the machine.

#### Parameters for VMSwitch

* **`[String]` Name** _(Key)_: The desired VM Switch name.
* **`[String]` Type** _(Key)_: The desired type of switch.
 { External | Internal | Private }
* **`[String[]]` NetAdapterName** _(Write)_: Network adapter name(s)
 for external switch type.
* **`[Boolean]` AllowManagementOS** _(Write)_: Specify if the VM host
 has access to the physical NIC. The default value is $false.
* **`[Boolean]` EnableEmbeddedTeaming** _(Write)_: Should embedded NIC teaming
 be used (Windows Server 2016 only). The default value is $false.
* **`[String]` BandwidthReservationMode** _(Write)_: Specify the QoS mode used
 (options other than NA are only supported on Hyper-V 2012+).
 The default value is NA. { Default | Weight | Absolute | None | *NA* }.
* **`[String]` LoadBalancingAlgorithm** _(Write)_: Specify the Load Balancing algorithm which should be used for the embedded NIC teaming.
 { Dynamic | HyperVPort }.
* **`[Boolean]` Id** _(Write)_: Specify the desired Unique ID of the Hyper-V switch. If not specified the ID will be generated by the system every time the Hyper-V Switch is created. (Windows Server 2016 only)
* **`[String]` Ensure** _(Write)_: Ensures that the VM Switch is Present or Absent.
 The default value is Present. { *Present* | Absent }.

#### Read-Only Properties from Get-TargetResource for VMSwitch

* **`[String]` NetAdapterInterfaceDescription** _(Read)_: Description of the
 network interface.

#### Examples VMSwitch

* [Create an internal VM Switch](/source/Examples/Sample_VMSwitch_Internal.ps1)
* [Create an external VM Switch](/source/Examples/Sample_VMSwitch_External.ps1)
* [Create an external VM Switch with embedded teaming](/source/Examples/Sample_VMSwitch_ExternalSET.ps1)
