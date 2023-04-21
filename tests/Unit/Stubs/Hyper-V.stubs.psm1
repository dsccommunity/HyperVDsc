# Name: Hyper-V
# Version: 2.0.0.0
# CreatedOn: 2020-03-08 16:10:56Z
Add-Type -IgnoreWarnings -ReferencedAssemblies 'C:\Program Files (x86)\Reference Assemblies\Microsoft\WMI\v1.0\Microsoft.Management.Infrastructure.dll' -TypeDefinition @'

namespace Microsoft.HyperV.PowerShell
{
    public enum BootDevice : int
    {
        Floppy = 0,
        CD = 1,
        IDE = 2,
        LegacyNetworkAdapter = 3,
        NetworkAdapter = 4,
        VHD = 5,
    }

    public enum CacheAttributes : int
    {
        Default = 0,
        WriteCacheEnabled = 1,
        WriteCacheAndFUAEnabled = 2,
        WriteCacheDisabled = 3,
    }

    public enum CaptureLiveState : int
    {
        CaptureCrashConsistentState = 0,
        CaptureSavedState = 1,
        CaptureDataConsistentState = 2,
    }

    public enum CheckpointType : int
    {
        Disabled = 2,
        Production = 3,
        ProductionOnly = 4,
        Standard = 5,
    }

    public enum ConsoleModeType : int
    {
        Default = 0,
        COM1 = 1,
        COM2 = 2,
        None = 3,
    }

    public enum ControllerType : int
    {
        IDE = 0,
        SCSI = 1,
        PMEM = 2,
    }

    public enum CopyFileSourceType : int
    {
        Host = 0,
    }

    public enum CriticalErrorAction : int
    {
        None = 0,
        Pause = 1,
    }

    public class Drive
    {
        public bool IsSecondaryStubType = true;

        public Drive() { }
    }

    public class DvdDrive
    {
        // Property
        public Microsoft.HyperV.PowerShell.DvdMediaType DvdMediaType { get; set; }
        public System.String Path { get; set; }
        public System.Int32 ControllerLocation { get; set; }
        public System.Int32 ControllerNumber { get; set; }
        public Microsoft.HyperV.PowerShell.ControllerType ControllerType { get; set; }
        public System.String Name { get; set; }
        public System.String PoolName { get; set; }
        public System.String Id { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private DvdDrive() { }
        public static DvdDrive CreateTypeInstance()
        {
            return new DvdDrive();
        }
    }

    public enum DvdMediaType : int
    {
        None = 0,
        ISO = 1,
        PassThrough = 2,
    }

    public enum EnhancedSessionTransportType : int
    {
        VMBus = 0,
        HvSocket = 1,
    }

    public enum GroupType : int
    {
        VMCollectionType = 0,
        ManagementCollectionType = 1,
    }

    public class HardDiskDrive : Drive
    {
        // Property
        public System.String Path { get; set; }
        public System.Nullable<System.Int32> DiskNumber { get; set; }
        public System.Nullable<System.UInt64> MaximumIOPS { get; set; }
        public System.Nullable<System.UInt64> MinimumIOPS { get; set; }
        public System.Nullable<System.Guid> QoSPolicyID { get; set; }
        public System.Nullable<System.Boolean> SupportPersistentReservations { get; set; }
        public System.Nullable<Microsoft.HyperV.PowerShell.CacheAttributes> WriteHardeningMethod { get; set; }
        public System.Int32 ControllerLocation { get; set; }
        public System.Int32 ControllerNumber { get; set; }
        public Microsoft.HyperV.PowerShell.ControllerType ControllerType { get; set; }
        public System.String Name { get; set; }
        public System.String PoolName { get; set; }
        public System.String Id { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private HardDiskDrive() { }
        public static HardDiskDrive CreateTypeInstance()
        {
            return new HardDiskDrive();
        }
    }

    public enum IovInterruptModerationValue : int
    {
        Default = 0,
        Adaptive = 1,
        Off = 2,
        Low = 100,
        Medium = 200,
        High = 300,
    }

    public enum IPProtocolPreference : int
    {
        IPv4 = 0,
        IPv6 = 1,
    }

    public class KeyStorageDrive
    {
        // Property
        public System.Int32 ControllerLocation { get; set; }
        public System.Int32 ControllerNumber { get; set; }
        public Microsoft.HyperV.PowerShell.ControllerType ControllerType { get; set; }
        public System.String Name { get; set; }
        public System.String Path { get; set; }
        public System.String PoolName { get; set; }
        public System.String Id { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private KeyStorageDrive() { }
        public static KeyStorageDrive CreateTypeInstance()
        {
            return new KeyStorageDrive();
        }
    }

    public enum MigrationAuthenticationType : int
    {
        CredSSP = 0,
        Kerberos = 1,
    }

    public enum OnOffState : int
    {
        On = 0,
        Off = 1,
    }

    public enum OperationType : int
    {
        MoveVirtualMachine = 0,
        ImportVirtualMachine = 1,
        MoveVirtualMachineAndStorage = 2,
    }

    public enum RecoveryAuthenticationType : int
    {
        Kerberos = 1,
        Certificate = 2,
        CertificateAndKerberos = 3,
    }

    public enum ReplicationAuthenticationType : int
    {
        Kerberos = 1,
        Certificate = 2,
    }

    public enum ResolutionType : int
    {
        Maximum = 2,
        Single = 3,
        Default = 4,
    }

    public enum SnapshotType : int
    {
        Standard = 0,
        Recovery = 1,
        Planned = 2,
        Missing = 5,
        Replica = 6,
        AppConsistentReplica = 7,
        SyncedReplica = 8,
    }

    public enum StartAction : int
    {
        Nothing = 2,
        StartIfRunning = 3,
        Start = 4,
    }

    public enum StopAction : int
    {
        TurnOff = 2,
        Save = 3,
        ShutDown = 4,
    }

    public enum ThreadCount : int
    {
        Automatic = 0,
        Low = 1,
        Medium = 2,
        High = 3,
    }

    public class VHDMetrics
    {
        public bool IsSecondaryStubType = true;

        public VHDMetrics() { }
    }

    public class VirtualMachine
    {
        // Property
        public System.String ConfigurationLocation { get; set; }
        public System.Boolean SmartPagingFileInUse { get; set; }
        public System.String SmartPagingFilePath { get; set; }
        public System.String SnapshotFileLocation { get; set; }
        public Microsoft.HyperV.PowerShell.StartAction AutomaticStartAction { get; set; }
        public System.Int32 AutomaticStartDelay { get; set; }
        public Microsoft.HyperV.PowerShell.StopAction AutomaticStopAction { get; set; }
        public Microsoft.HyperV.PowerShell.CriticalErrorAction AutomaticCriticalErrorAction { get; set; }
        public System.Int32 AutomaticCriticalErrorActionTimeout { get; set; }
        public System.Boolean AutomaticCheckpointsEnabled { get; set; }
        public System.Int32 CPUUsage { get; set; }
        public System.Int64 MemoryAssigned { get; set; }
        public System.Int64 MemoryDemand { get; set; }
        public System.String MemoryStatus { get; set; }
        public System.Nullable<System.Boolean> NumaAligned { get; set; }
        public System.Int32 NumaNodesCount { get; set; }
        public System.Int32 NumaSocketCount { get; set; }
        public System.Nullable<Microsoft.HyperV.PowerShell.VMHeartbeatStatus> Heartbeat { get; set; }
        public System.String IntegrationServicesState { get; set; }
        public System.Version IntegrationServicesVersion { get; set; }
        public System.TimeSpan Uptime { get; set; }
        public Microsoft.HyperV.PowerShell.VMOperationalStatus[] OperationalStatus { get; set; }
        public System.Nullable<Microsoft.HyperV.PowerShell.VMOperationalStatus> PrimaryOperationalStatus { get; set; }
        public System.Nullable<Microsoft.HyperV.PowerShell.VMOperationalStatus> SecondaryOperationalStatus { get; set; }
        public System.String[] StatusDescriptions { get; set; }
        public System.String PrimaryStatusDescription { get; set; }
        public System.String SecondaryStatusDescription { get; set; }
        public System.String Status { get; set; }
        public Microsoft.HyperV.PowerShell.VMReplicationHealthState ReplicationHealth { get; set; }
        public Microsoft.HyperV.PowerShell.VMReplicationMode ReplicationMode { get; set; }
        public Microsoft.HyperV.PowerShell.VMReplicationState ReplicationState { get; set; }
        public System.Boolean ResourceMeteringEnabled { get; set; }
        public Microsoft.HyperV.PowerShell.CheckpointType CheckpointType { get; set; }
        public Microsoft.HyperV.PowerShell.EnhancedSessionTransportType EnhancedSessionTransportType { get; set; }
        public System.Collections.Generic.IReadOnlyList<Microsoft.HyperV.PowerShell.VMGroup> Groups { get; set; }
        public System.String Version { get; set; }
        public Microsoft.HyperV.PowerShell.VirtualMachineType VirtualMachineType { get; set; }
        public Microsoft.HyperV.PowerShell.VirtualMachineSubType VirtualMachineSubType { get; set; }
        public System.String Notes { get; set; }
        public Microsoft.HyperV.PowerShell.VMState State { get; set; }
        public Microsoft.HyperV.PowerShell.VMComPort ComPort1 { get; set; }
        public Microsoft.HyperV.PowerShell.VMComPort ComPort2 { get; set; }
        public Microsoft.HyperV.PowerShell.DvdDrive[] DVDDrives { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMFibreChannelHba> FibreChannelHostBusAdapters { get; set; }
        public Microsoft.HyperV.PowerShell.VMFloppyDiskDrive FloppyDrive { get; set; }
        public Microsoft.HyperV.PowerShell.HardDiskDrive[] HardDrives { get; set; }
        public Microsoft.HyperV.PowerShell.VMRemoteFx3DVideoAdapter RemoteFxAdapter { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMIntegrationComponent> VMIntegrationService { get; set; }
        public System.Boolean DynamicMemoryEnabled { get; set; }
        public System.Int64 MemoryMaximum { get; set; }
        public System.Int64 MemoryMinimum { get; set; }
        public System.Int64 MemoryStartup { get; set; }
        public System.Int64 ProcessorCount { get; set; }
        public System.Boolean BatteryPassthroughEnabled { get; set; }
        public System.Int32 Generation { get; set; }
        public System.Boolean IsClustered { get; set; }
        public System.Nullable<System.Guid> ParentSnapshotId { get; set; }
        public System.String ParentSnapshotName { get; set; }
        public System.String Path { get; set; }
        public System.Int64 SizeOfSystemFiles { get; set; }
        public System.Boolean GuestControlledCacheTypes { get; set; }
        public System.UInt32 LowMemoryMappedIoSpace { get; set; }
        public System.UInt64 HighMemoryMappedIoSpace { get; set; }
        public System.Nullable<Microsoft.HyperV.PowerShell.OnOffState> LockOnDisconnect { get; set; }
        public System.DateTime CreationTime { get; set; }
        public System.Guid Id { get; set; }
        public System.String Name { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMNetworkAdapter> NetworkAdapters { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VirtualMachine() { }
        public static VirtualMachine CreateTypeInstance()
        {
            return new VirtualMachine();
        }
    }

    public class VirtualMachineBase
    {
        // Property
        public Microsoft.HyperV.PowerShell.VMComPort ComPort1 { get; set; }
        public Microsoft.HyperV.PowerShell.VMComPort ComPort2 { get; set; }
        public Microsoft.HyperV.PowerShell.DvdDrive[] DVDDrives { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMFibreChannelHba> FibreChannelHostBusAdapters { get; set; }
        public Microsoft.HyperV.PowerShell.VMFloppyDiskDrive FloppyDrive { get; set; }
        public Microsoft.HyperV.PowerShell.HardDiskDrive[] HardDrives { get; set; }
        public Microsoft.HyperV.PowerShell.VMRemoteFx3DVideoAdapter RemoteFxAdapter { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMIntegrationComponent> VMIntegrationService { get; set; }
        public System.Boolean DynamicMemoryEnabled { get; set; }
        public System.Int64 MemoryMaximum { get; set; }
        public System.Int64 MemoryMinimum { get; set; }
        public System.Int64 MemoryStartup { get; set; }
        public System.Int64 ProcessorCount { get; set; }
        public System.Boolean BatteryPassthroughEnabled { get; set; }
        public System.Int32 Generation { get; set; }
        public System.Boolean IsClustered { get; set; }
        public System.String Notes { get; set; }
        public System.Nullable<System.Guid> ParentSnapshotId { get; set; }
        public System.String ParentSnapshotName { get; set; }
        public System.String Path { get; set; }
        public System.Int64 SizeOfSystemFiles { get; set; }
        public Microsoft.HyperV.PowerShell.VMState State { get; set; }
        public System.String Version { get; set; }
        public System.Boolean GuestControlledCacheTypes { get; set; }
        public System.UInt32 LowMemoryMappedIoSpace { get; set; }
        public System.UInt64 HighMemoryMappedIoSpace { get; set; }
        public System.Nullable<Microsoft.HyperV.PowerShell.OnOffState> LockOnDisconnect { get; set; }
        public System.DateTime CreationTime { get; set; }
        public System.Guid Id { get; set; }
        public System.String Name { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMNetworkAdapter> NetworkAdapters { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VirtualMachineBase() { }
        public static VirtualMachineBase CreateTypeInstance()
        {
            return new VirtualMachineBase();
        }
    }

    public enum VirtualMachineSubType : int
    {
        Unknown = 0,
        Generation1 = 1,
        Generation2 = 2,
    }

    public enum VirtualMachineType : int
    {
        RealizedVirtualMachine = 3,
        PlannedVirtualMachine = 4,
    }

    public class VMAssignedDevice
    {
        // Property
        public System.String InstanceID { get; set; }
        public System.String LocationPath { get; set; }
        public System.String ResourcePoolName { get; set; }
        public System.UInt16 VirtualFunction { get; set; }
        public System.String Name { get; set; }
        public System.String Id { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMAssignedDevice() { }
        public static VMAssignedDevice CreateTypeInstance()
        {
            return new VMAssignedDevice();
        }
    }

    public class VMBios
    {
        // Property
        public System.Boolean NumLockEnabled { get; set; }
        public Microsoft.HyperV.PowerShell.BootDevice[] StartupOrder { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMBios() { }
        public static VMBios CreateTypeInstance()
        {
            return new VMBios();
        }
    }

    public class VMBootSource
    {
        public bool IsSecondaryStubType = true;

        public VMBootSource() { }
    }

    public class VMCompatibilityError
    {
        public bool IsSecondaryStubType = true;

        public VMCompatibilityError() { }
    }

    public class VMCompatibilityReport
    {
        // Property
        public Microsoft.HyperV.PowerShell.VirtualMachine VM { get; set; }
        public Microsoft.HyperV.PowerShell.OperationType OperationType { get; set; }
        public System.String Destination { get; set; }
        public System.String Path { get; set; }
        public System.String SnapshotPath { get; set; }
        public System.String VhdDestinationPath { get; set; }
        public System.String VhdSourcePath { get; set; }
        public Microsoft.HyperV.PowerShell.VMCompatibilityError[] Incompatibilities { get; set; }

        // Fabricated constructor
        private VMCompatibilityReport() { }
        public static VMCompatibilityReport CreateTypeInstance()
        {
            return new VMCompatibilityReport();
        }
    }

    public class VMComponentObject
    {
        // Property
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMComponentObject() { }
        public static VMComponentObject CreateTypeInstance()
        {
            return new VMComponentObject();
        }
    }

    public class VMComPort
    {
        // Property
        public System.String Path { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState DebuggerMode { get; set; }
        public System.String Name { get; set; }
        public System.String Id { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMComPort() { }
        public static VMComPort CreateTypeInstance()
        {
            return new VMComPort();
        }
    }

    public class VMConnectAce
    {
        // Property
        public System.String UserName { get; set; }
        public System.Security.Principal.SecurityIdentifier UserId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMId { get; set; }
        public System.String ComputerName { get; set; }
        public Microsoft.HyperV.PowerShell.VMConnectAceAccessType Access { get; set; }

        // Fabricated constructor
        private VMConnectAce() { }
        public static VMConnectAce CreateTypeInstance()
        {
            return new VMConnectAce();
        }
    }

    public enum VMConnectAceAccessType : int
    {
        Allowed = 0,
        Denied = 1,
    }

    public class VMCurrentTask
    {
        public bool IsSecondaryStubType = true;

        public VMCurrentTask() { }
    }

    public class VMDriveController
    {
        // Property
        public System.Int32 ControllerNumber { get; set; }
        public Microsoft.HyperV.PowerShell.Drive[] Drives { get; set; }
        public System.String Name { get; set; }
        public System.String Id { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMDriveController() { }
        public static VMDriveController CreateTypeInstance()
        {
            return new VMDriveController();
        }
    }

    public class VMExternalNetworkAdapter
    {
        public bool IsSecondaryStubType = true;

        public VMExternalNetworkAdapter() { }
    }

    public class VMFibreChannelHba
    {
        // Property
        public System.String SanName { get; set; }
        public System.String WorldWideNodeNameSetA { get; set; }
        public System.String WorldWidePortNameSetA { get; set; }
        public System.String WorldWideNodeNameSetB { get; set; }
        public System.String WorldWidePortNameSetB { get; set; }
        public System.Boolean IsTemplate { get; set; }
        public System.String Name { get; set; }
        public System.String Id { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMFibreChannelHba() { }
        public static VMFibreChannelHba CreateTypeInstance()
        {
            return new VMFibreChannelHba();
        }
    }

    public class VMFirmware
    {
        // Property
        public Microsoft.HyperV.PowerShell.VMBootSource[] BootOrder { get; set; }
        public Microsoft.HyperV.PowerShell.IPProtocolPreference PreferredNetworkBootProtocol { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState SecureBoot { get; set; }
        public System.Nullable<System.Guid> SecureBootTemplateId { get; set; }
        public System.String SecureBootTemplate { get; set; }
        public Microsoft.HyperV.PowerShell.ConsoleModeType ConsoleMode { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState PauseAfterBootFailure { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMFirmware() { }
        public static VMFirmware CreateTypeInstance()
        {
            return new VMFirmware();
        }
    }

    public class VMFloppyDiskDrive
    {
        // Property
        public System.String Path { get; set; }
        public System.String PoolName { get; set; }
        public System.String Name { get; set; }
        public System.String Id { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMFloppyDiskDrive() { }
        public static VMFloppyDiskDrive CreateTypeInstance()
        {
            return new VMFloppyDiskDrive();
        }
    }

    public class VMGpuPartitionAdapter
    {
        // Property
        public System.Nullable<System.UInt64> MinPartitionVRAM { get; set; }
        public System.Nullable<System.UInt64> MaxPartitionVRAM { get; set; }
        public System.Nullable<System.UInt64> OptimalPartitionVRAM { get; set; }
        public System.Nullable<System.UInt64> MinPartitionEncode { get; set; }
        public System.Nullable<System.UInt64> MaxPartitionEncode { get; set; }
        public System.Nullable<System.UInt64> OptimalPartitionEncode { get; set; }
        public System.Nullable<System.UInt64> MinPartitionDecode { get; set; }
        public System.Nullable<System.UInt64> MaxPartitionDecode { get; set; }
        public System.Nullable<System.UInt64> OptimalPartitionDecode { get; set; }
        public System.Nullable<System.UInt64> MinPartitionCompute { get; set; }
        public System.Nullable<System.UInt64> MaxPartitionCompute { get; set; }
        public System.Nullable<System.UInt64> OptimalPartitionCompute { get; set; }
        public System.String Name { get; set; }
        public System.String Id { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMGpuPartitionAdapter() { }
        public static VMGpuPartitionAdapter CreateTypeInstance()
        {
            return new VMGpuPartitionAdapter();
        }
    }

    public class VMGroup
    {
        // Property
        public System.String Name { get; set; }
        public System.Guid InstanceId { get; set; }
        public Microsoft.HyperV.PowerShell.GroupType GroupType { get; set; }
        public System.Collections.Generic.IReadOnlyList<Microsoft.HyperV.PowerShell.VirtualMachine> VMMembers { get; set; }
        public System.Collections.Generic.IReadOnlyList<Microsoft.HyperV.PowerShell.VMGroup> VMGroupMembers { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMGroup() { }
        public static VMGroup CreateTypeInstance()
        {
            return new VMGroup();
        }
    }

    public enum VMHeartbeatStatus : int
    {
        Unknown = 0,
        Disabled = 1,
        NoContact = 2,
        Error = 3,
        LostCommunication = 4,
        OkApplicationsUnknown = 5,
        OkApplicationsHealthy = 6,
        OkApplicationsCritical = 7,
        Paused = 8,
    }

    public class VMHost
    {
        // Property
        public System.Int32 LogicalProcessorCount { get; set; }
        public System.TimeSpan ResourceMeteringSaveInterval { get; set; }
        public Microsoft.HyperV.PowerShell.VMHostNumaNode[] HostNumaStatus { get; set; }
        public Microsoft.HyperV.PowerShell.VMNumaNodeStatus[] NumaStatus { get; set; }
        public System.Boolean IovSupport { get; set; }
        public System.String[] IovSupportReasons { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMInternalNetworkAdapter> InternalNetworkAdapters { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMExternalNetworkAdapter> ExternalNetworkAdapters { get; set; }
        public System.Collections.Generic.IReadOnlyList<System.String> SupportedVmVersions { get; set; }
        public System.Collections.Generic.IReadOnlyList<Microsoft.Virtualization.Client.Management.SecureBootTemplate> SecureBootTemplates { get; set; }
        public System.Boolean EnableEnhancedSessionMode { get; set; }
        public System.String FibreChannelWwnn { get; set; }
        public System.String FibreChannelWwpnMaximum { get; set; }
        public System.String FibreChannelWwpnMinimum { get; set; }
        public System.String MacAddressMaximum { get; set; }
        public System.String MacAddressMinimum { get; set; }
        public System.Boolean NumaSpanningEnabled { get; set; }
        public System.String VirtualHardDiskPath { get; set; }
        public System.String VirtualMachinePath { get; set; }
        public System.String FullyQualifiedDomainName { get; set; }
        public System.Int64 MemoryCapacity { get; set; }
        public System.String Name { get; set; }
        public System.UInt32 MaximumStorageMigrations { get; set; }
        public System.UInt32 MaximumVirtualMachineMigrations { get; set; }
        public System.Boolean UseAnyNetworkForMigration { get; set; }
        public Microsoft.HyperV.PowerShell.MigrationAuthenticationType VirtualMachineMigrationAuthenticationType { get; set; }
        public System.Boolean VirtualMachineMigrationEnabled { get; set; }
        public Microsoft.HyperV.PowerShell.VMMigrationPerformance VirtualMachineMigrationPerformanceOption { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMHost() { }
        public static VMHost CreateTypeInstance()
        {
            return new VMHost();
        }
    }

    public class VMHostAssignableDevice
    {
        // Property
        public System.String InstanceID { get; set; }
        public System.String LocationPath { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMHostAssignableDevice() { }
        public static VMHostAssignableDevice CreateTypeInstance()
        {
            return new VMHostAssignableDevice();
        }
    }

    public class VMHostCluster
    {
        // Property
        public System.String ClusterName { get; set; }
        public System.String SharedStoragePath { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMHostCluster() { }
        public static VMHostCluster CreateTypeInstance()
        {
            return new VMHostCluster();
        }
    }

    public class VMHostNumaNode
    {
        // Property
        public System.Int32 NodeId { get; set; }
        public System.Int32[] ProcessorsAvailability { get; set; }
        public System.Int32 MemoryAvailable { get; set; }
        public System.Int32 MemoryTotal { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMHostNumaNode() { }
        public static VMHostNumaNode CreateTypeInstance()
        {
            return new VMHostNumaNode();
        }
    }

    public class VMHostSupportedVersion
    {
        // Property
        public System.String Name { get; set; }
        public System.Version Version { get; set; }
        public System.Boolean IsDefault { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMHostSupportedVersion() { }
        public static VMHostSupportedVersion CreateTypeInstance()
        {
            return new VMHostSupportedVersion();
        }
    }

    public class VMIdeController
    {
        // Property
        public System.Int32 ControllerNumber { get; set; }
        public Microsoft.HyperV.PowerShell.Drive[] Drives { get; set; }
        public System.String Name { get; set; }
        public System.String Id { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMIdeController() { }
        public static VMIdeController CreateTypeInstance()
        {
            return new VMIdeController();
        }
    }

    public class VMIntegrationComponent
    {
        // Property
        public System.Boolean Enabled { get; set; }
        public Microsoft.HyperV.PowerShell.VMIntegrationComponentOperationalStatus[] OperationalStatus { get; set; }
        public System.Nullable<Microsoft.HyperV.PowerShell.VMIntegrationComponentOperationalStatus> PrimaryOperationalStatus { get; set; }
        public System.String PrimaryStatusDescription { get; set; }
        public System.Nullable<Microsoft.HyperV.PowerShell.VMIntegrationComponentOperationalStatus> SecondaryOperationalStatus { get; set; }
        public System.String SecondaryStatusDescription { get; set; }
        public System.String[] StatusDescription { get; set; }
        public System.String Name { get; set; }
        public System.String Id { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMIntegrationComponent() { }
        public static VMIntegrationComponent CreateTypeInstance()
        {
            return new VMIntegrationComponent();
        }
    }

    public enum VMIntegrationComponentOperationalStatus : int
    {
        Ok = 2,
        Degraded = 3,
        Error = 6,
        NonRecoverableError = 7,
        NoContact = 12,
        LostCommunication = 13,
        ProtocolMismatch = 32775,
        ApplicationCritical = 32782,
        CommunicationTimedOut = 32783,
        CommunicationFailed = 32784,
        Disabled = 32896,
    }

    public class VMInternalNetworkAdapter
    {
        // Property
        public System.Boolean IsManagementOs { get; set; }
        public System.String MacAddress { get; set; }
        public System.String DeviceId { get; set; }
        public System.String AdapterId { get; set; }
        public System.String Name { get; set; }
        public System.String SwitchName { get; set; }
        public System.String[] StatusDescription { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterOperationalStatus[] Status { get; set; }
        public System.Boolean IsExternalAdapter { get; set; }
        public System.String Id { get; set; }
        public System.Nullable<System.Guid> SwitchId { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMNetworkAdapterAclSetting> AclList { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMNetworkAdapterExtendedAclSetting> ExtendedAclList { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterIsolationSetting IsolationSetting { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMNetworkAdapterRoutingDomainSetting> RoutingDomainList { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterVlanSetting VlanSetting { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterBandwidthSetting BandwidthSetting { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterIsolationMode CurrentIsolationMode { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState MacAddressSpoofing { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState DhcpGuard { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState RouterGuard { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterPortMirroringMode PortMirroringMode { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState IeeePriorityTag { get; set; }
        public System.UInt32 VirtualSubnetId { get; set; }
        public System.UInt32 DynamicIPAddressLimit { get; set; }
        public System.UInt32 StormLimit { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState AllowTeaming { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState FixSpeed10G { get; set; }
        public System.UInt32 VMQWeight { get; set; }
        public System.Int64 IPsecOffloadMaxSA { get; set; }
        public System.Boolean VrssEnabled { get; set; }
        public System.Boolean VrssEnabledRequested { get; set; }
        public System.Boolean VmmqEnabled { get; set; }
        public System.Boolean VmmqEnabledRequested { get; set; }
        public System.UInt32 VrssMaxQueuePairs { get; set; }
        public System.UInt32 VrssMaxQueuePairsRequested { get; set; }
        public System.UInt32 VrssMinQueuePairs { get; set; }
        public System.UInt32 VrssMinQueuePairsRequested { get; set; }
        public Microsoft.HyperV.PowerShell.VrssQueueSchedulingModeType VrssQueueSchedulingMode { get; set; }
        public Microsoft.HyperV.PowerShell.VrssQueueSchedulingModeType VrssQueueSchedulingModeRequested { get; set; }
        public System.Boolean VrssExcludePrimaryProcessor { get; set; }
        public System.Boolean VrssExcludePrimaryProcessorRequested { get; set; }
        public System.Boolean VrssIndependentHostSpreading { get; set; }
        public System.Boolean VrssIndependentHostSpreadingRequested { get; set; }
        public Microsoft.HyperV.PowerShell.VrssVmbusChannelAffinityPolicyType VrssVmbusChannelAffinityPolicy { get; set; }
        public Microsoft.HyperV.PowerShell.VrssVmbusChannelAffinityPolicyType VrssVmbusChannelAffinityPolicyRequested { get; set; }
        public System.Int32 VmqUsage { get; set; }
        public System.UInt32 IPsecOffloadSAUsage { get; set; }
        public System.Boolean VFDataPathActive { get; set; }
        public Microsoft.Management.Infrastructure.CimInstance VMQueue { get; set; }
        public System.UInt32 BandwidthPercentage { get; set; }
        public System.Boolean IsTemplate { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMInternalNetworkAdapter() { }
        public static VMInternalNetworkAdapter CreateTypeInstance()
        {
            return new VMInternalNetworkAdapter();
        }
    }

    public class VMMemory
    {
        // Property
        public System.String ResourcePoolName { get; set; }
        public System.Int32 Buffer { get; set; }
        public System.Boolean DynamicMemoryEnabled { get; set; }
        public System.Int64 Maximum { get; set; }
        public System.Int64 MaximumPerNumaNode { get; set; }
        public System.Int64 Minimum { get; set; }
        public System.Int32 Priority { get; set; }
        public System.Int64 Startup { get; set; }
        public System.String Name { get; set; }
        public System.String Id { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMMemory() { }
        public static VMMemory CreateTypeInstance()
        {
            return new VMMemory();
        }
    }

    public class VMMeteringReportForResourcePool
    {
        // Property
        public System.String ResourcePoolName { get; set; }
        public Microsoft.HyperV.PowerShell.VMResourcePoolType[] ResourcePoolType { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Nullable<System.TimeSpan> MeteringDuration { get; set; }
        public System.Nullable<System.UInt64> AverageProcessorUsage { get; set; }
        public System.Nullable<System.UInt64> AverageMemoryUsage { get; set; }
        public System.Nullable<System.UInt64> MaximumMemoryUsage { get; set; }
        public System.Nullable<System.UInt64> MinimumMemoryUsage { get; set; }
        public System.Nullable<System.UInt64> TotalDiskAllocation { get; set; }
        public System.Nullable<System.UInt64> AggregatedAverageNormalizedIOPS { get; set; }
        public System.Nullable<System.UInt64> AggregatedAverageLatency { get; set; }
        public System.Nullable<System.UInt64> AggregatedDiskDataRead { get; set; }
        public System.Nullable<System.UInt64> AggregatedDiskDataWritten { get; set; }
        public System.Nullable<System.UInt64> AggregatedNormalizedIOCount { get; set; }
        public Microsoft.HyperV.PowerShell.VMPortAclMeteringReport[] NetworkMeteredTrafficReport { get; set; }
        public Microsoft.HyperV.PowerShell.VHDMetrics[] HardDiskMetrics { get; set; }

        // Fabricated constructor
        private VMMeteringReportForResourcePool() { }
        public static VMMeteringReportForResourcePool CreateTypeInstance()
        {
            return new VMMeteringReportForResourcePool();
        }
    }

    public class VMMeteringReportForVirtualMachine
    {
        // Property
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Nullable<System.TimeSpan> MeteringDuration { get; set; }
        public System.Nullable<System.UInt64> AverageProcessorUsage { get; set; }
        public System.Nullable<System.UInt64> AverageMemoryUsage { get; set; }
        public System.Nullable<System.UInt64> MaximumMemoryUsage { get; set; }
        public System.Nullable<System.UInt64> MinimumMemoryUsage { get; set; }
        public System.Nullable<System.UInt64> TotalDiskAllocation { get; set; }
        public System.Nullable<System.UInt64> AggregatedAverageNormalizedIOPS { get; set; }
        public System.Nullable<System.UInt64> AggregatedAverageLatency { get; set; }
        public System.Nullable<System.UInt64> AggregatedDiskDataRead { get; set; }
        public System.Nullable<System.UInt64> AggregatedDiskDataWritten { get; set; }
        public System.Nullable<System.UInt64> AggregatedNormalizedIOCount { get; set; }
        public Microsoft.HyperV.PowerShell.VMPortAclMeteringReport[] NetworkMeteredTrafficReport { get; set; }
        public Microsoft.HyperV.PowerShell.VHDMetrics[] HardDiskMetrics { get; set; }

        // Fabricated constructor
        private VMMeteringReportForVirtualMachine() { }
        public static VMMeteringReportForVirtualMachine CreateTypeInstance()
        {
            return new VMMeteringReportForVirtualMachine();
        }
    }

    public class VMMigrationNetwork
    {
        // Property
        public System.String Subnet { get; set; }
        public System.Nullable<System.Int32> Priority { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMMigrationNetwork() { }
        public static VMMigrationNetwork CreateTypeInstance()
        {
            return new VMMigrationNetwork();
        }
    }

    public enum VMMigrationPerformance : int
    {
        TCPIP = 0,
        Compression = 1,
        SMB = 2,
    }

    public class VMNetworkAdapter
    {
        // Property
        public System.Boolean ClusterMonitored { get; set; }
        public System.String MacAddress { get; set; }
        public System.UInt32 MediaType { get; set; }
        public System.Boolean DynamicMacAddressEnabled { get; set; }
        public System.Boolean InterruptModeration { get; set; }
        public System.Boolean AllowPacketDirect { get; set; }
        public System.Boolean NumaAwarePlacement { get; set; }
        public System.Boolean IsLegacy { get; set; }
        public System.Boolean IsSynthetic { get; set; }
        public System.String[] IPAddresses { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState DeviceNaming { get; set; }
        public System.UInt32 IovWeight { get; set; }
        public System.UInt32 IovQueuePairsRequested { get; set; }
        public Microsoft.HyperV.PowerShell.IovInterruptModerationValue IovInterruptModeration { get; set; }
        public System.UInt32 PacketDirectNumProcs { get; set; }
        public System.UInt32 PacketDirectModerationCount { get; set; }
        public System.UInt32 PacketDirectModerationInterval { get; set; }
        public System.UInt32 IovQueuePairsAssigned { get; set; }
        public System.Int32 IovUsage { get; set; }
        public Microsoft.Management.Infrastructure.CimInstance VirtualFunction { get; set; }
        public System.String[] MandatoryFeatureId { get; set; }
        public System.String[] MandatoryFeatureName { get; set; }
        public System.String PoolName { get; set; }
        public System.Boolean Connected { get; set; }
        public System.String SwitchName { get; set; }
        public System.String AdapterId { get; set; }
        public System.String TestReplicaPoolName { get; set; }
        public System.String TestReplicaSwitchName { get; set; }
        public System.String[] StatusDescription { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterOperationalStatus[] Status { get; set; }
        public System.Boolean IsManagementOs { get; set; }
        public System.Boolean IsExternalAdapter { get; set; }
        public System.String Id { get; set; }
        public System.Nullable<System.Guid> SwitchId { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMNetworkAdapterAclSetting> AclList { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMNetworkAdapterExtendedAclSetting> ExtendedAclList { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterIsolationSetting IsolationSetting { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMNetworkAdapterRoutingDomainSetting> RoutingDomainList { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterVlanSetting VlanSetting { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterBandwidthSetting BandwidthSetting { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterIsolationMode CurrentIsolationMode { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState MacAddressSpoofing { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState DhcpGuard { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState RouterGuard { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterPortMirroringMode PortMirroringMode { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState IeeePriorityTag { get; set; }
        public System.UInt32 VirtualSubnetId { get; set; }
        public System.UInt32 DynamicIPAddressLimit { get; set; }
        public System.UInt32 StormLimit { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState AllowTeaming { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState FixSpeed10G { get; set; }
        public System.UInt32 VMQWeight { get; set; }
        public System.Int64 IPsecOffloadMaxSA { get; set; }
        public System.Boolean VrssEnabled { get; set; }
        public System.Boolean VrssEnabledRequested { get; set; }
        public System.Boolean VmmqEnabled { get; set; }
        public System.Boolean VmmqEnabledRequested { get; set; }
        public System.UInt32 VrssMaxQueuePairs { get; set; }
        public System.UInt32 VrssMaxQueuePairsRequested { get; set; }
        public System.UInt32 VrssMinQueuePairs { get; set; }
        public System.UInt32 VrssMinQueuePairsRequested { get; set; }
        public Microsoft.HyperV.PowerShell.VrssQueueSchedulingModeType VrssQueueSchedulingMode { get; set; }
        public Microsoft.HyperV.PowerShell.VrssQueueSchedulingModeType VrssQueueSchedulingModeRequested { get; set; }
        public System.Boolean VrssExcludePrimaryProcessor { get; set; }
        public System.Boolean VrssExcludePrimaryProcessorRequested { get; set; }
        public System.Boolean VrssIndependentHostSpreading { get; set; }
        public System.Boolean VrssIndependentHostSpreadingRequested { get; set; }
        public Microsoft.HyperV.PowerShell.VrssVmbusChannelAffinityPolicyType VrssVmbusChannelAffinityPolicy { get; set; }
        public Microsoft.HyperV.PowerShell.VrssVmbusChannelAffinityPolicyType VrssVmbusChannelAffinityPolicyRequested { get; set; }
        public System.Int32 VmqUsage { get; set; }
        public System.UInt32 IPsecOffloadSAUsage { get; set; }
        public System.Boolean VFDataPathActive { get; set; }
        public Microsoft.Management.Infrastructure.CimInstance VMQueue { get; set; }
        public System.UInt32 BandwidthPercentage { get; set; }
        public System.Boolean IsTemplate { get; set; }
        public System.String Name { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMNetworkAdapter() { }
        public static VMNetworkAdapter CreateTypeInstance()
        {
            return new VMNetworkAdapter();
        }
    }

    public enum VMNetworkAdapterAclAction : byte
    {
        Allow = 1,
        Deny = 2,
        Meter = 3,
    }

    public enum VMNetworkAdapterAclDirection : byte
    {
        Inbound = 1,
        Outbound = 2,
        Both = 3,
    }

    public class VMNetworkAdapterAclSetting
    {
        // Property
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterAclAction Action { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterAclDirection Direction { get; set; }
        public System.String LocalAddress { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterAclType LocalAddressType { get; set; }
        public System.String MeteredMegabytes { get; set; }
        public System.String RemoteAddress { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterAclType RemoteAddressType { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterBase ParentAdapter { get; set; }
        public System.Boolean IsTemplate { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMNetworkAdapterAclSetting() { }
        public static VMNetworkAdapterAclSetting CreateTypeInstance()
        {
            return new VMNetworkAdapterAclSetting();
        }
    }

    public enum VMNetworkAdapterAclType : byte
    {
        Mac = 1,
        IPv4 = 2,
        IPv6 = 3,
        WildcardIPv4 = 4,
        WildcardIPv6 = 5,
        WildcardBoth = 6,
        WildcardMac = 7,
    }

    public class VMNetworkAdapterBandwidthSetting
    {
        public bool IsSecondaryStubType = true;

        public VMNetworkAdapterBandwidthSetting() { }
    }

    public class VMNetworkAdapterBase
    {
        // Manually added properties
        public System.String MacAddress { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState DeviceNaming { get; set; }

        // Property
        public System.String SwitchName { get; set; }
        public System.String AdapterId { get; set; }
        public System.String[] StatusDescription { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterOperationalStatus[] Status { get; set; }
        public System.Boolean IsManagementOs { get; set; }
        public System.Boolean IsExternalAdapter { get; set; }
        public System.String Id { get; set; }
        public System.Nullable<System.Guid> SwitchId { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMNetworkAdapterAclSetting> AclList { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMNetworkAdapterExtendedAclSetting> ExtendedAclList { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterIsolationSetting IsolationSetting { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMNetworkAdapterRoutingDomainSetting> RoutingDomainList { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterVlanSetting VlanSetting { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterBandwidthSetting BandwidthSetting { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterIsolationMode CurrentIsolationMode { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState MacAddressSpoofing { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState DhcpGuard { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState RouterGuard { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterPortMirroringMode PortMirroringMode { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState IeeePriorityTag { get; set; }
        public System.UInt32 VirtualSubnetId { get; set; }
        public System.UInt32 DynamicIPAddressLimit { get; set; }
        public System.UInt32 StormLimit { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState AllowTeaming { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState FixSpeed10G { get; set; }
        public System.UInt32 VMQWeight { get; set; }
        public System.Int64 IPsecOffloadMaxSA { get; set; }
        public System.Boolean VrssEnabled { get; set; }
        public System.Boolean VrssEnabledRequested { get; set; }
        public System.Boolean VmmqEnabled { get; set; }
        public System.Boolean VmmqEnabledRequested { get; set; }
        public System.UInt32 VrssMaxQueuePairs { get; set; }
        public System.UInt32 VrssMaxQueuePairsRequested { get; set; }
        public System.UInt32 VrssMinQueuePairs { get; set; }
        public System.UInt32 VrssMinQueuePairsRequested { get; set; }
        public Microsoft.HyperV.PowerShell.VrssQueueSchedulingModeType VrssQueueSchedulingMode { get; set; }
        public Microsoft.HyperV.PowerShell.VrssQueueSchedulingModeType VrssQueueSchedulingModeRequested { get; set; }
        public System.Boolean VrssExcludePrimaryProcessor { get; set; }
        public System.Boolean VrssExcludePrimaryProcessorRequested { get; set; }
        public System.Boolean VrssIndependentHostSpreading { get; set; }
        public System.Boolean VrssIndependentHostSpreadingRequested { get; set; }
        public Microsoft.HyperV.PowerShell.VrssVmbusChannelAffinityPolicyType VrssVmbusChannelAffinityPolicy { get; set; }
        public Microsoft.HyperV.PowerShell.VrssVmbusChannelAffinityPolicyType VrssVmbusChannelAffinityPolicyRequested { get; set; }
        public System.Int32 VmqUsage { get; set; }
        public System.UInt32 IPsecOffloadSAUsage { get; set; }
        public System.Boolean VFDataPathActive { get; set; }
        public Microsoft.Management.Infrastructure.CimInstance VMQueue { get; set; }
        public System.UInt32 BandwidthPercentage { get; set; }
        public System.Boolean IsTemplate { get; set; }
        public System.String Name { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMNetworkAdapterBase() { }
        public static VMNetworkAdapterBase CreateTypeInstance()
        {
            return new VMNetworkAdapterBase();
        }
    }

    public class VMNetworkAdapterConnectionTestResult
    {
        // Property
        public System.Int32 RoundTripTime { get; set; }

        // Fabricated constructor
        private VMNetworkAdapterConnectionTestResult() { }
        public static VMNetworkAdapterConnectionTestResult CreateTypeInstance()
        {
            return new VMNetworkAdapterConnectionTestResult();
        }
    }

    public enum VMNetworkAdapterExtendedAclAction : byte
    {
        Allow = 1,
        Deny = 2,
    }

    public enum VMNetworkAdapterExtendedAclDirection : byte
    {
        Inbound = 1,
        Outbound = 2,
    }

    public class VMNetworkAdapterExtendedAclSetting
    {
        // Property
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterExtendedAclDirection Direction { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterExtendedAclAction Action { get; set; }
        public System.String LocalIPAddress { get; set; }
        public System.String RemoteIPAddress { get; set; }
        public System.String LocalPort { get; set; }
        public System.String RemotePort { get; set; }
        public System.String Protocol { get; set; }
        public System.Int32 Weight { get; set; }
        public System.Boolean Stateful { get; set; }
        public System.Int32 IdleSessionTimeout { get; set; }
        public System.Int32 IsolationID { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterBase ParentAdapter { get; set; }
        public System.Boolean IsTemplate { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMNetworkAdapterExtendedAclSetting() { }
        public static VMNetworkAdapterExtendedAclSetting CreateTypeInstance()
        {
            return new VMNetworkAdapterExtendedAclSetting();
        }
    }

    public class VMNetworkAdapterFailoverSetting
    {
        // Property
        public System.String IPv4Address { get; set; }
        public System.String IPv4SubnetMask { get; set; }
        public System.String IPv4DefaultGateway { get; set; }
        public System.String IPv4PreferredDNSServer { get; set; }
        public System.String IPv4AlternateDNSServer { get; set; }
        public System.String IPv6Address { get; set; }
        public System.String IPv6SubnetPrefixLength { get; set; }
        public System.String IPv6DefaultGateway { get; set; }
        public System.String IPv6PreferredDNSServer { get; set; }
        public System.String IPv6AlternateDNSServer { get; set; }
        public Microsoft.HyperV.PowerShell.WmiProtocolIFType ProtocolIFType { get; set; }

        // Fabricated constructor
        private VMNetworkAdapterFailoverSetting() { }
        public static VMNetworkAdapterFailoverSetting CreateTypeInstance()
        {
            return new VMNetworkAdapterFailoverSetting();
        }
    }

    public enum VMNetworkAdapterIsolationMode : byte
    {
        None = 0,
        NativeVirtualSubnet = 1,
        ExternalVirtualSubnet = 2,
        Vlan = 3,
    }

    public class VMNetworkAdapterIsolationSetting
    {
        // Property
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterIsolationMode IsolationMode { get; set; }
        public System.Boolean AllowUntaggedTraffic { get; set; }
        public System.Int32 DefaultIsolationID { get; set; }
        public Microsoft.HyperV.PowerShell.OnOffState MultiTenantStack { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterBase ParentAdapter { get; set; }
        public System.Boolean IsTemplate { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMNetworkAdapterIsolationSetting() { }
        public static VMNetworkAdapterIsolationSetting CreateTypeInstance()
        {
            return new VMNetworkAdapterIsolationSetting();
        }
    }

    public enum VMNetworkAdapterOperationalStatus : int
    {
        Unknown = 0,
        Other = 1,
        Ok = 2,
        Degraded = 3,
        Stressed = 4,
        PredictiveFailure = 5,
        Error = 6,
        NonRecoverableError = 7,
        Starting = 8,
        Stopping = 9,
        Stopped = 10,
        InService = 11,
        NoContact = 12,
        LostCommunication = 13,
        Aborted = 14,
        Dormant = 15,
        SupportingEntity = 16,
        Completed = 17,
        PowerMode = 18,
        ProtocolVersion = 32775,
    }

    public enum VMNetworkAdapterPortMirroringMode : int
    {
        None = 0,
        Destination = 1,
        Source = 2,
    }

    public enum VMNetworkAdapterPrivateVlanMode : int
    {
        Isolated = 1,
        Community = 2,
        Promiscuous = 3,
    }

    public class VMNetworkAdapterRdmaSetting
    {
        // Property
        public System.UInt32 RdmaWeight { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterBase ParentAdapter { get; set; }
        public System.Boolean IsTemplate { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMNetworkAdapterRdmaSetting() { }
        public static VMNetworkAdapterRdmaSetting CreateTypeInstance()
        {
            return new VMNetworkAdapterRdmaSetting();
        }
    }

    public class VMNetworkAdapterRoutingDomainSetting
    {
        // Property
        public System.Guid RoutingDomainID { get; set; }
        public System.String RoutingDomainName { get; set; }
        public System.Int32[] IsolationID { get; set; }
        public System.String[] IsolationName { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterBase ParentAdapter { get; set; }
        public System.Boolean IsTemplate { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMNetworkAdapterRoutingDomainSetting() { }
        public static VMNetworkAdapterRoutingDomainSetting CreateTypeInstance()
        {
            return new VMNetworkAdapterRoutingDomainSetting();
        }
    }

    public class VMNetworkAdapterTeamMappingSetting
    {
        // Property
        public System.String NetAdapterName { get; set; }
        public System.String NetAdapterDeviceId { get; set; }
        public Microsoft.Virtualization.Client.Management.DisableOnFailoverFeature DisableOnFailover { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterBase ParentAdapter { get; set; }
        public System.Boolean IsTemplate { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMNetworkAdapterTeamMappingSetting() { }
        public static VMNetworkAdapterTeamMappingSetting CreateTypeInstance()
        {
            return new VMNetworkAdapterTeamMappingSetting();
        }
    }

    public enum VMNetworkAdapterVlanMode : int
    {
        Untagged = 0,
        Access = 1,
        Trunk = 2,
        Private = 3,
    }

    public class VMNetworkAdapterVlanSetting
    {
        // Property
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterVlanMode OperationMode { get; set; }
        public System.Int32 AccessVlanId { get; set; }
        public System.Int32 NativeVlanId { get; set; }
        public System.Collections.Generic.List<System.Int32> AllowedVlanIdList { get; set; }
        public System.String AllowedVlanIdListString { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterPrivateVlanMode PrivateVlanMode { get; set; }
        public System.Int32 PrimaryVlanId { get; set; }
        public System.Int32 SecondaryVlanId { get; set; }
        public System.Collections.Generic.List<System.Int32> SecondaryVlanIdList { get; set; }
        public System.String SecondaryVlanIdListString { get; set; }
        public Microsoft.HyperV.PowerShell.VMNetworkAdapterBase ParentAdapter { get; set; }
        public System.Boolean IsTemplate { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMNetworkAdapterVlanSetting() { }
        public static VMNetworkAdapterVlanSetting CreateTypeInstance()
        {
            return new VMNetworkAdapterVlanSetting();
        }
    }

    public class VMNumaNodeStatus
    {
        public bool IsSecondaryStubType = true;

        public VMNumaNodeStatus() { }
    }

    public enum VMOperationalStatus : int
    {
        Ok = 2,
        Degraded = 3,
        PredictiveFailure = 5,
        InService = 11,
        Dormant = 15,
        SupportingEntityInError = 16,
        ApplyingSnapshot = 23769,
        CreatingSnapshot = 32768,
        DeletingSnapshot = 32770,
        WaitingToStart = 32771,
        MergingDisks = 32772,
        ExportingVirtualMachine = 32773,
        MigratingVirtualMachine = 32774,
        BackingUpVirtualMachine = 32776,
        ModifyingUpVirtualMachine = 32777,
        StorageMigrationPhaseOne = 32778,
        StorageMigrationPhaseTwo = 32779,
        MigratingPlannedVm = 32780,
        CheckingCompatibility = 32781,
        ApplicationCriticalState = 32782,
        CommunicationTimedOut = 32783,
        CommunicationFailed = 32784,
        NoIommu = 32785,
        NoIovSupportInNic = 32786,
        SwitchNotInIovMode = 32787,
        IovBlockedByPolicy = 32788,
        IovNoAvailResources = 32789,
        IovGuestDriversNeeded = 32790,
        CriticalIoError = 32795,
    }

    public class VMPartitionableGpu
    {
        // Property
        public System.String Name { get; set; }
        public System.Collections.Generic.IList<System.UInt16> ValidPartitionCounts { get; set; }
        public System.UInt16 PartitionCount { get; set; }
        public System.UInt64 TotalVRAM { get; set; }
        public System.UInt64 AvailableVRAM { get; set; }
        public System.UInt64 MinPartitionVRAM { get; set; }
        public System.UInt64 MaxPartitionVRAM { get; set; }
        public System.UInt64 OptimalPartitionVRAM { get; set; }
        public System.UInt64 TotalEncode { get; set; }
        public System.UInt64 AvailableEncode { get; set; }
        public System.UInt64 MinPartitionEncode { get; set; }
        public System.UInt64 MaxPartitionEncode { get; set; }
        public System.UInt64 OptimalPartitionEncode { get; set; }
        public System.UInt64 TotalDecode { get; set; }
        public System.UInt64 AvailableDecode { get; set; }
        public System.UInt64 MinPartitionDecode { get; set; }
        public System.UInt64 MaxPartitionDecode { get; set; }
        public System.UInt64 OptimalPartitionDecode { get; set; }
        public System.UInt64 TotalCompute { get; set; }
        public System.UInt64 AvailableCompute { get; set; }
        public System.UInt64 MinPartitionCompute { get; set; }
        public System.UInt64 MaxPartitionCompute { get; set; }
        public System.UInt64 OptimalPartitionCompute { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMPartitionableGpu() { }
        public static VMPartitionableGpu CreateTypeInstance()
        {
            return new VMPartitionableGpu();
        }
    }

    public class VMPmemController
    {
        // Property
        public System.Int32 ControllerNumber { get; set; }
        public System.Boolean IsTemplate { get; set; }
        public System.String DescriptionForAdd { get; set; }
        public Microsoft.HyperV.PowerShell.Drive[] Drives { get; set; }
        public System.String Name { get; set; }
        public System.String Id { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMPmemController() { }
        public static VMPmemController CreateTypeInstance()
        {
            return new VMPmemController();
        }
    }

    public class VMPortAclMeteringReport
    {
        public bool IsSecondaryStubType = true;

        public VMPortAclMeteringReport() { }
    }

    public class VMProcessor
    {
        // Property
        public System.String ResourcePoolName { get; set; }
        public System.Int64 Count { get; set; }
        public System.Boolean CompatibilityForMigrationEnabled { get; set; }
        public System.Boolean CompatibilityForOlderOperatingSystemsEnabled { get; set; }
        public System.Int64 HwThreadCountPerCore { get; set; }
        public System.Boolean ExposeVirtualizationExtensions { get; set; }
        public System.Boolean EnablePerfmonPmu { get; set; }
        public System.Boolean EnablePerfmonLbr { get; set; }
        public System.Boolean EnablePerfmonPebs { get; set; }
        public System.Boolean EnablePerfmonIpt { get; set; }
        public System.Boolean EnableLegacyApicMode { get; set; }
        public System.Boolean AllowACountMCount { get; set; }
        public System.Int64 Maximum { get; set; }
        public System.Int64 Reserve { get; set; }
        public System.Int32 RelativeWeight { get; set; }
        public System.Int64 MaximumCountPerNumaNode { get; set; }
        public System.Int64 MaximumCountPerNumaSocket { get; set; }
        public System.Boolean EnableHostResourceProtection { get; set; }
        public System.Collections.Generic.IReadOnlyList<Microsoft.HyperV.PowerShell.VMProcessorOperationalStatus> OperationalStatus { get; set; }
        public System.Collections.Generic.IReadOnlyList<System.String> StatusDescription { get; set; }
        public System.String Name { get; set; }
        public System.String Id { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMProcessor() { }
        public static VMProcessor CreateTypeInstance()
        {
            return new VMProcessor();
        }
    }

    public enum VMProcessorOperationalStatus : int
    {
        Ok = 2,
        HostResourceProtectionFirst = 40000,
        HostResourceProtectionUnknown = 40000,
        HostResourceProtectionEnabled = 40001,
        HostResourceProtectionDisabled = 40002,
        HostResourceProtectionDegradedSuspended = 40003,
        HostResourceProtectionLast = 40004,
        HostResourceProtectionDegradedFirst = 40020,
        HostResourceProtectionDegradedSerialPipe = 40020,
        HostResourceProtectionDegradedSynthDebug = 40021,
        HostResourceProtectionDegradedLegacyNic = 40022,
        HostResourceProtectionDegradedDvdMedia = 40023,
        HostResourceProtectionDegradedFloppyMedia = 40024,
        HostResourceProtectionDegradedLast = 40025,
    }

    public class VMRemoteFx3DVideoAdapter
    {
        // Property
        public System.String MaximumScreenResolution { get; set; }
        public System.Byte MaximumMonitors { get; set; }
        public System.UInt64 VRAMSizeBytes { get; set; }
        public System.String Name { get; set; }
        public System.String Id { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMRemoteFx3DVideoAdapter() { }
        public static VMRemoteFx3DVideoAdapter CreateTypeInstance()
        {
            return new VMRemoteFx3DVideoAdapter();
        }
    }

    public class VMRemoteFXPhysicalVideoAdapter
    {
        // Property
        public System.String Id { get; set; }
        public System.String Name { get; set; }
        public System.String GPUID { get; set; }
        public System.Int64 TotalVideoMemory { get; set; }
        public System.Int64 AvailableVideoMemory { get; set; }
        public System.Int64 DedicatedSystemMemory { get; set; }
        public System.Int64 DedicatedVideoMemory { get; set; }
        public System.Int64 SharedSystemMemory { get; set; }
        public System.Boolean Enabled { get; set; }
        public System.Boolean CompatibleForVirtualization { get; set; }
        public System.String DirectXVersion { get; set; }
        public System.String PixelShaderVersion { get; set; }
        public System.String DriverProvider { get; set; }
        public System.String DriverDate { get; set; }
        public System.String DriverInstalledDate { get; set; }
        public System.String DriverVersion { get; set; }
        public System.String DriverModelVersion { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMRemoteFXPhysicalVideoAdapter() { }
        public static VMRemoteFXPhysicalVideoAdapter CreateTypeInstance()
        {
            return new VMRemoteFXPhysicalVideoAdapter();
        }
    }

    public class VMReplication
    {
        // Property
        public Microsoft.HyperV.PowerShell.ReplicationAuthenticationType AuthenticationType { get; set; }
        public System.Boolean AutoResynchronizeEnabled { get; set; }
        public System.TimeSpan AutoResynchronizeIntervalEnd { get; set; }
        public System.TimeSpan AutoResynchronizeIntervalStart { get; set; }
        public System.Boolean BypassProxyServer { get; set; }
        public System.String CertificateThumbprint { get; set; }
        public System.Boolean CompressionEnabled { get; set; }
        public System.Boolean EnableWriteOrderPreservationAcrossDisks { get; set; }
        public System.Collections.Generic.IList<Microsoft.HyperV.PowerShell.HardDiskDrive> ExcludedDisks { get; set; }
        public System.Nullable<System.DateTime> InitialReplicationStartTime { get; set; }
        public System.Int32 RecoveryHistory { get; set; }
        public System.Int32 ReplicaServerPort { get; set; }
        public System.Boolean ReplicateHostKvpItems { get; set; }
        public System.Int32 ReplicationFrequencySec { get; set; }
        public System.Nullable<System.DateTime> ResynchronizeStartTime { get; set; }
        public System.Int32 VSSSnapshotFrequencyHour { get; set; }
        public System.Boolean VSSSnapshotReplicationEnabled { get; set; }
        public System.String AllowedPrimaryServer { get; set; }
        public System.String CurrentReplicaServerName { get; set; }
        public System.Nullable<System.DateTime> LastAppliedLogTime { get; set; }
        public System.Nullable<System.DateTime> LastReplicationTime { get; set; }
        public System.String PrimaryServerName { get; set; }
        public System.String ReplicaServerName { get; set; }
        public System.Collections.Generic.IList<Microsoft.HyperV.PowerShell.HardDiskDrive> ReplicatedDisks { get; set; }
        public Microsoft.HyperV.PowerShell.VMReplicationHealthState ReplicationHealth { get; set; }
        public Microsoft.HyperV.PowerShell.VMReplicationMode ReplicationMode { get; set; }
        public Microsoft.HyperV.PowerShell.VMReplicationRelationshipType ReplicationRelationshipType { get; set; }
        public Microsoft.HyperV.PowerShell.VMReplicationState ReplicationState { get; set; }
        public Microsoft.HyperV.PowerShell.VirtualMachine TestVirtualMachine { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMReplication() { }
        public static VMReplication CreateTypeInstance()
        {
            return new VMReplication();
        }
    }

    public class VMReplicationAuthorizationEntry
    {
        // Property
        public System.String AllowedPrimaryServer { get; set; }
        public System.String ReplicaStorageLocation { get; set; }
        public System.String TrustGroup { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMReplicationAuthorizationEntry() { }
        public static VMReplicationAuthorizationEntry CreateTypeInstance()
        {
            return new VMReplicationAuthorizationEntry();
        }
    }

    public class VMReplicationHealth
    {
        // Property
        public System.Collections.Generic.IList<Microsoft.HyperV.PowerShell.VMCurrentTask> CurrentTask { get; set; }
        public System.Nullable<System.DateTime> MonitoringStartTime { get; set; }
        public System.Nullable<System.DateTime> MonitoringEndTime { get; set; }
        public Microsoft.HyperV.PowerShell.VMReplicationType LastReplicationType { get; set; }
        public Microsoft.HyperV.PowerShell.VMReplicationType FailedOverReplicationType { get; set; }
        public System.Nullable<System.DateTime> LastTestFailoverInitiatedTime { get; set; }
        public System.Nullable<System.DateTime> LastVSSSnapshotTime { get; set; }
        public System.UInt64 InitialReplicationSize { get; set; }
        public System.UInt64 PendingReplicationSize { get; set; }
        public System.UInt64 AverageReplicationSize { get; set; }
        public System.UInt64 MaximumReplicationSize { get; set; }
        public System.Nullable<System.TimeSpan> AverageReplicationLatency { get; set; }
        public System.Nullable<System.TimeSpan> MaximumReplicationLatency { get; set; }
        public System.UInt32 ReplicationErrors { get; set; }
        public System.UInt32 SuccessfulReplicationCount { get; set; }
        public System.UInt32 MissedReplicationCount { get; set; }
        public System.String[] ReplicationHealthDetails { get; set; }
        public System.String AllowedPrimaryServer { get; set; }
        public System.String CurrentReplicaServerName { get; set; }
        public System.Nullable<System.DateTime> LastAppliedLogTime { get; set; }
        public System.Nullable<System.DateTime> LastReplicationTime { get; set; }
        public System.String PrimaryServerName { get; set; }
        public System.String ReplicaServerName { get; set; }
        public System.Collections.Generic.IList<Microsoft.HyperV.PowerShell.HardDiskDrive> ReplicatedDisks { get; set; }
        public Microsoft.HyperV.PowerShell.VMReplicationHealthState ReplicationHealth { get; set; }
        public Microsoft.HyperV.PowerShell.VMReplicationMode ReplicationMode { get; set; }
        public Microsoft.HyperV.PowerShell.VMReplicationRelationshipType ReplicationRelationshipType { get; set; }
        public Microsoft.HyperV.PowerShell.VMReplicationState ReplicationState { get; set; }
        public Microsoft.HyperV.PowerShell.VirtualMachine TestVirtualMachine { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMReplicationHealth() { }
        public static VMReplicationHealth CreateTypeInstance()
        {
            return new VMReplicationHealth();
        }
    }

    public enum VMReplicationHealthState : int
    {
        NotApplicable = 0,
        Normal = 1,
        Warning = 2,
        Critical = 3,
    }

    public enum VMReplicationMode : int
    {
        None = 0,
        Primary = 1,
        Replica = 2,
        TestReplica = 3,
        ExtendedReplica = 4,
    }

    public enum VMReplicationRelationshipType : int
    {
        Simple = 0,
        Extended = 1,
    }

    public class VMReplicationServer
    {
        // Property
        public Microsoft.HyperV.PowerShell.RecoveryAuthenticationType AllowedAuthenticationType { get; set; }
        public Microsoft.HyperV.PowerShell.VMReplicationAuthorizationEntry[] AuthorizationEntries { get; set; }
        public System.Int32 CertificateAuthenticationPort { get; set; }
        public System.Collections.Hashtable CertificateAuthenticationPortMapping { get; set; }
        public System.String CertificateThumbprint { get; set; }
        public System.String DefaultStorageLocation { get; set; }
        public System.Int32 KerberosAuthenticationPort { get; set; }
        public System.Collections.Hashtable KerberosAuthenticationPortMapping { get; set; }
        public System.TimeSpan MonitoringInterval { get; set; }
        public System.TimeSpan MonitoringStartTime { get; set; }
        public Microsoft.HyperV.PowerShell.VMReplicationServerOperationalStatus[] OperationalStatus { get; set; }
        public System.Boolean ReplicationAllowedFromAnyServer { get; set; }
        public System.Boolean ReplicationEnabled { get; set; }
        public System.String[] StatusDescriptions { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMReplicationServer() { }
        public static VMReplicationServer CreateTypeInstance()
        {
            return new VMReplicationServer();
        }
    }

    public enum VMReplicationServerOperationalStatus : int
    {
        Unknown = 0,
        Other = 1,
        Ok = 2,
        Degraded = 3,
        Stressed = 4,
        PredictiveFailure = 5,
        Error = 6,
        NonRecoverableError = 7,
        Starting = 8,
        Stopping = 9,
        Stopped = 10,
        InService = 11,
        NoContact = 12,
        LostCommunication = 13,
        Aborted = 14,
        Dormant = 15,
        SupportingEntityInError = 16,
        Completed = 17,
        PowerMode = 18,
    }

    public enum VMReplicationState : int
    {
        Disabled = 0,
        ReadyForInitialReplication = 1,
        InitialReplicationInProgress = 2,
        WaitingForInitialReplication = 3,
        Replicating = 4,
        PreparedForFailover = 5,
        FailedOverWaitingCompletion = 6,
        FailedOver = 7,
        Suspended = 8,
        Error = 9,
        WaitingForStartResynchronize = 10,
        Resynchronizing = 11,
        ResynchronizeSuspended = 12,
        RecoveryInProgress = 13,
        FailbackInProgress = 14,
        FailbackComplete = 15,
        WaitingForUpdateCompletion = 16,
        UpdateError = 17,
        WaitingForRepurposeCompletion = 18,
        PreparedForSyncReplication = 19,
        PreparedForGroupReverseReplication = 20,
        FiredrillInProgress = 21,
    }

    public enum VMReplicationType : int
    {
        None = 0,
        Regular = 1,
        ApplicationConsistent = 2,
        Planned = 3,
    }

    public class VMResourcePool
    {
        // Property
        public System.String Name { get; set; }
        public System.String[] ParentName { get; set; }
        public System.Boolean ResourceMeteringEnabled { get; set; }
        public Microsoft.HyperV.PowerShell.VMResourcePoolType ResourcePoolType { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMResourcePool() { }
        public static VMResourcePool CreateTypeInstance()
        {
            return new VMResourcePool();
        }
    }

    public enum VMResourcePoolType : int
    {
        Memory = 0,
        Processor = 1,
        Ethernet = 2,
        VHD = 3,
        ISO = 4,
        VFD = 5,
        FibreChannelPort = 6,
        FibreChannelConnection = 7,
        PciExpress = 8,
    }

    public class VMSan
    {
        // Property
        public Microsoft.Management.Infrastructure.CimInstance[] HBAs { get; set; }
        public System.String Note { get; set; }
        public System.String Name { get; set; }
        public System.String[] ParentName { get; set; }
        public System.Boolean ResourceMeteringEnabled { get; set; }
        public Microsoft.HyperV.PowerShell.VMResourcePoolType ResourcePoolType { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMSan() { }
        public static VMSan CreateTypeInstance()
        {
            return new VMSan();
        }
    }

    public class VMScsiController
    {
        // Property
        public System.Int32 ControllerNumber { get; set; }
        public System.Boolean IsTemplate { get; set; }
        public Microsoft.HyperV.PowerShell.Drive[] Drives { get; set; }
        public System.String Name { get; set; }
        public System.String Id { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMScsiController() { }
        public static VMScsiController CreateTypeInstance()
        {
            return new VMScsiController();
        }
    }

    public class VMSecurity
    {
        // Property
        public System.Boolean TpmEnabled { get; set; }
        public System.Boolean KsdEnabled { get; set; }
        public System.Boolean Shielded { get; set; }
        public System.Boolean EncryptStateAndVmMigrationTraffic { get; set; }
        public System.Boolean VirtualizationBasedSecurityOptOut { get; set; }
        public System.Boolean BindToHostTpm { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMSecurity() { }
        public static VMSecurity CreateTypeInstance()
        {
            return new VMSecurity();
        }
    }

    public class VMSnapshot
    {
        // Property
        public Microsoft.HyperV.PowerShell.SnapshotType SnapshotType { get; set; }
        public System.Boolean IsAutomaticCheckpoint { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public Microsoft.HyperV.PowerShell.VMState State { get; set; }
        public Microsoft.HyperV.PowerShell.VMComPort ComPort1 { get; set; }
        public Microsoft.HyperV.PowerShell.VMComPort ComPort2 { get; set; }
        public Microsoft.HyperV.PowerShell.DvdDrive[] DVDDrives { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMFibreChannelHba> FibreChannelHostBusAdapters { get; set; }
        public Microsoft.HyperV.PowerShell.VMFloppyDiskDrive FloppyDrive { get; set; }
        public Microsoft.HyperV.PowerShell.HardDiskDrive[] HardDrives { get; set; }
        public Microsoft.HyperV.PowerShell.VMRemoteFx3DVideoAdapter RemoteFxAdapter { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMIntegrationComponent> VMIntegrationService { get; set; }
        public System.Boolean DynamicMemoryEnabled { get; set; }
        public System.Int64 MemoryMaximum { get; set; }
        public System.Int64 MemoryMinimum { get; set; }
        public System.Int64 MemoryStartup { get; set; }
        public System.Int64 ProcessorCount { get; set; }
        public System.Boolean BatteryPassthroughEnabled { get; set; }
        public System.Int32 Generation { get; set; }
        public System.Boolean IsClustered { get; set; }
        public System.String Notes { get; set; }
        public System.Nullable<System.Guid> ParentSnapshotId { get; set; }
        public System.String ParentSnapshotName { get; set; }
        public System.String Path { get; set; }
        public System.Int64 SizeOfSystemFiles { get; set; }
        public System.String Version { get; set; }
        public System.Boolean GuestControlledCacheTypes { get; set; }
        public System.UInt32 LowMemoryMappedIoSpace { get; set; }
        public System.UInt64 HighMemoryMappedIoSpace { get; set; }
        public System.Nullable<Microsoft.HyperV.PowerShell.OnOffState> LockOnDisconnect { get; set; }
        public System.DateTime CreationTime { get; set; }
        public System.Guid Id { get; set; }
        public System.String Name { get; set; }
        public System.Collections.Generic.List<Microsoft.HyperV.PowerShell.VMNetworkAdapter> NetworkAdapters { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMSnapshot() { }
        public static VMSnapshot CreateTypeInstance()
        {
            return new VMSnapshot();
        }
    }

    public enum VMState : int
    {
        Other = 1,
        Running = 2,
        Off = 3,
        Stopping = 4,
        Saved = 6,
        Paused = 9,
        Starting = 10,
        Reset = 11,
        Saving = 32773,
        Pausing = 32776,
        Resuming = 32777,
        FastSaved = 32779,
        FastSaving = 32780,
        ForceShutdown = 32781,
        ForceReboot = 32782,
        Hibernated = 32783,
        ComponentServicing = 32784,
        RunningCritical = 32785,
        OffCritical = 32786,
        StoppingCritical = 32787,
        SavedCritical = 32788,
        PausedCritical = 32789,
        StartingCritical = 32790,
        ResetCritical = 32791,
        SavingCritical = 32792,
        PausingCritical = 32793,
        ResumingCritical = 32794,
        FastSavedCritical = 32795,
        FastSavingCritical = 32796,
    }

    public class VMStorageResourcePool
    {
        // Property
        public System.String[] Paths { get; set; }
        public System.String Name { get; set; }
        public System.String[] ParentName { get; set; }
        public System.Boolean ResourceMeteringEnabled { get; set; }
        public Microsoft.HyperV.PowerShell.VMResourcePoolType ResourcePoolType { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMStorageResourcePool() { }
        public static VMStorageResourcePool CreateTypeInstance()
        {
            return new VMStorageResourcePool();
        }
    }

    public class VMStorageSetting
    {
        // Property
        public Microsoft.HyperV.PowerShell.ThreadCount ThreadCountPerChannel { get; set; }
        public System.UInt16 VirtualProcessorsPerChannel { get; set; }
        public System.Boolean DisableInterruptBatching { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMStorageSetting() { }
        public static VMStorageSetting CreateTypeInstance()
        {
            return new VMStorageSetting();
        }
    }

    public class VMSwitch
    {
        // Property
        public System.String Name { get; set; }
        public System.Guid Id { get; set; }
        public System.String Notes { get; set; }
        public Microsoft.HyperV.PowerShell.VMSwitchExtension[] Extensions { get; set; }
        public Microsoft.HyperV.PowerShell.VMSwitchBandwidthMode BandwidthReservationMode { get; set; }
        public System.Boolean PacketDirectEnabled { get; set; }
        public System.Boolean EmbeddedTeamingEnabled { get; set; }
        public System.Boolean IovEnabled { get; set; }
        public Microsoft.HyperV.PowerShell.VMSwitchType SwitchType { get; set; }
        public System.Boolean AllowManagementOS { get; set; }
        public System.String NetAdapterInterfaceDescription { get; set; }
        public System.String[] NetAdapterInterfaceDescriptions { get; set; }
        public System.Guid[] NetAdapterInterfaceGuid { get; set; }
        public System.Boolean IovSupport { get; set; }
        public System.String[] IovSupportReasons { get; set; }
        public System.UInt32 AvailableIPSecSA { get; set; }
        public System.UInt32 NumberIPSecSAAllocated { get; set; }
        public System.UInt32 AvailableVMQueues { get; set; }
        public System.UInt32 NumberVmqAllocated { get; set; }
        public System.UInt32 IovQueuePairCount { get; set; }
        public System.UInt32 IovQueuePairsInUse { get; set; }
        public System.UInt32 IovVirtualFunctionCount { get; set; }
        public System.UInt32 IovVirtualFunctionsInUse { get; set; }
        public System.Boolean PacketDirectInUse { get; set; }
        public System.Boolean DefaultQueueVrssEnabledRequested { get; set; }
        public System.Boolean DefaultQueueVrssEnabled { get; set; }
        public System.Boolean DefaultQueueVmmqEnabledRequested { get; set; }
        public System.Boolean DefaultQueueVmmqEnabled { get; set; }
        public System.UInt32 DefaultQueueVrssMaxQueuePairsRequested { get; set; }
        public System.UInt32 DefaultQueueVrssMaxQueuePairs { get; set; }
        public System.UInt32 DefaultQueueVrssMinQueuePairsRequested { get; set; }
        public System.UInt32 DefaultQueueVrssMinQueuePairs { get; set; }
        public Microsoft.HyperV.PowerShell.VrssQueueSchedulingModeType DefaultQueueVrssQueueSchedulingModeRequested { get; set; }
        public Microsoft.HyperV.PowerShell.VrssQueueSchedulingModeType DefaultQueueVrssQueueSchedulingMode { get; set; }
        public System.Boolean DefaultQueueVrssExcludePrimaryProcessorRequested { get; set; }
        public System.Boolean DefaultQueueVrssExcludePrimaryProcessor { get; set; }
        public System.Boolean SoftwareRscEnabled { get; set; }
        public System.UInt32 BandwidthPercentage { get; set; }
        public System.UInt64 DefaultFlowMinimumBandwidthAbsolute { get; set; }
        public System.UInt64 DefaultFlowMinimumBandwidthWeight { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMSwitch() { }
        public static VMSwitch CreateTypeInstance()
        {
            return new VMSwitch();
        }
    }

    public enum VMSwitchBandwidthMode : int
    {
        Default = 0,
        Weight = 1,
        Absolute = 2,
        None = 3,
    }

    public class VMSwitchExtension
    {
        // Property
        public System.String Id { get; set; }
        public System.String Name { get; set; }
        public System.String Vendor { get; set; }
        public System.String Version { get; set; }
        public Microsoft.HyperV.PowerShell.VMSwitchExtensionType ExtensionType { get; set; }
        public System.String ParentExtensionId { get; set; }
        public System.String ParentExtensionName { get; set; }
        public System.String SwitchId { get; set; }
        public System.String SwitchName { get; set; }
        public System.Boolean Enabled { get; set; }
        public System.Boolean Running { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMSwitchExtension() { }
        public static VMSwitchExtension CreateTypeInstance()
        {
            return new VMSwitchExtension();
        }
    }

    public class VMSwitchExtensionPortData
    {
        // Property
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.String VMNetworkAdapterName { get; set; }
        public System.String Name { get; set; }
        public System.Nullable<System.Guid> Id { get; set; }
        public System.String ExtensionId { get; set; }
        public System.String ExtensionName { get; set; }
        public System.Management.Automation.PSObject Data { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMSwitchExtensionPortData() { }
        public static VMSwitchExtensionPortData CreateTypeInstance()
        {
            return new VMSwitchExtensionPortData();
        }
    }

    public class VMSwitchExtensionPortFeature
    {
        // Property
        public System.Nullable<System.Guid> Id { get; set; }
        public System.String ExtensionId { get; set; }
        public System.String ExtensionName { get; set; }
        public System.String Name { get; set; }
        public Microsoft.Management.Infrastructure.CimInstance SettingData { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMSwitchExtensionPortFeature() { }
        public static VMSwitchExtensionPortFeature CreateTypeInstance()
        {
            return new VMSwitchExtensionPortFeature();
        }
    }

    public class VMSwitchExtensionSwitchData
    {
        // Property
        public System.String SwitchName { get; set; }
        public System.String Name { get; set; }
        public System.Nullable<System.Guid> Id { get; set; }
        public System.String ExtensionId { get; set; }
        public System.String ExtensionName { get; set; }
        public System.Management.Automation.PSObject Data { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMSwitchExtensionSwitchData() { }
        public static VMSwitchExtensionSwitchData CreateTypeInstance()
        {
            return new VMSwitchExtensionSwitchData();
        }
    }

    public class VMSwitchExtensionSwitchFeature
    {
        // Property
        public System.Nullable<System.Guid> Id { get; set; }
        public System.String ExtensionId { get; set; }
        public System.String ExtensionName { get; set; }
        public System.String Name { get; set; }
        public Microsoft.Management.Infrastructure.CimInstance SettingData { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMSwitchExtensionSwitchFeature() { }
        public static VMSwitchExtensionSwitchFeature CreateTypeInstance()
        {
            return new VMSwitchExtensionSwitchFeature();
        }
    }

    public enum VMSwitchExtensionType : int
    {
        Unknown = 0,
        Capture = 1,
        Filter = 2,
        Forwarding = 3,
        Monitoring = 4,
        Native = 5,
    }

    public enum VMSwitchLoadBalancingAlgorithm : int
    {
        HyperVPort = 4,
        Dynamic = 5,
    }

    public class VMSwitchTeam
    {
        // Property
        public System.String Name { get; set; }
        public System.Guid Id { get; set; }
        public System.String[] NetAdapterInterfaceDescription { get; set; }
        public System.Guid[] NetAdapterInterfaceGuid { get; set; }
        public System.Nullable<Microsoft.HyperV.PowerShell.VMSwitchTeamingMode> TeamingMode { get; set; }
        public System.Nullable<Microsoft.HyperV.PowerShell.VMSwitchLoadBalancingAlgorithm> LoadBalancingAlgorithm { get; set; }

        // Fabricated constructor
        private VMSwitchTeam() { }
        public static VMSwitchTeam CreateTypeInstance()
        {
            return new VMSwitchTeam();
        }
    }

    public enum VMSwitchTeamingMode : int
    {
        SwitchIndependent = 1,
    }

    public enum VMSwitchType : int
    {
        Private = 0,
        Internal = 1,
        External = 2,
    }

    public class VMSystemSwitchExtension
    {
        // Property
        public System.String Id { get; set; }
        public System.String Name { get; set; }
        public System.String Vendor { get; set; }
        public System.String Version { get; set; }
        public Microsoft.HyperV.PowerShell.VMSwitchExtensionType ExtensionType { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMSystemSwitchExtension() { }
        public static VMSystemSwitchExtension CreateTypeInstance()
        {
            return new VMSystemSwitchExtension();
        }
    }

    public class VMVideo
    {
        // Property
        public Microsoft.HyperV.PowerShell.ResolutionType ResolutionType { get; set; }
        public System.Int32 HorizontalResolution { get; set; }
        public System.Int32 VerticalResolution { get; set; }
        public System.String Name { get; set; }
        public System.String Id { get; set; }
        public System.Guid VMId { get; set; }
        public System.String VMName { get; set; }
        public System.Guid VMSnapshotId { get; set; }
        public System.String VMSnapshotName { get; set; }
        public Microsoft.Management.Infrastructure.CimSession CimSession { get; set; }
        public System.String ComputerName { get; set; }
        public System.Boolean IsDeleted { get; set; }

        // Fabricated constructor
        private VMVideo() { }
        public static VMVideo CreateTypeInstance()
        {
            return new VMVideo();
        }
    }

    public enum VrssQueueSchedulingModeType : int
    {
        Dynamic = 0,
        StaticVmq = 1,
        StaticVrss = 2,
    }

    public enum VrssVmbusChannelAffinityPolicyType : int
    {
        None = 1,
        Weak = 2,
        Strong = 3,
        Strict = 4,
    }

    public enum WaitVMTypes : int
    {
        Heartbeat = 0,
        IPAddress = 1,
        Reboot = 2,
        MemoryOperations = 3,
    }

    public enum WmiProtocolIFType : int
    {
        None = 0,
        Other = 1,
        IPv4 = 4096,
        IPv6 = 4097,
        IPv4v6 = 4098,
    }

}

namespace Microsoft.HyperV.PowerShell.Commands
{
    public class GetVMHostNumaNodeStatus
    {
        // Constructor
        public GetVMHostNumaNodeStatus() { }

        // Property
        public Microsoft.Management.Infrastructure.CimSession[] CimSession { get; set; }
        public System.String[] ComputerName { get; set; }
        public System.Management.Automation.PSCredential[] Credential { get; set; }
        public System.Nullable<System.Int32> Id { get; set; }
        public Microsoft.HyperV.PowerShell.Commands.VirtualMachineParameterType VirtualMachineParameterType { get; set; }
        public System.String ParameterSetName { get; set; }
        public System.Management.Automation.InvocationInfo MyInvocation { get; set; }
        public System.Management.Automation.PagingParameters PagingParameters { get; set; }
        public System.Management.Automation.CommandInvocationIntrinsics InvokeCommand { get; set; }
        public System.Management.Automation.Host.PSHost Host { get; set; }
        public System.Management.Automation.SessionState SessionState { get; set; }
        public System.Management.Automation.PSEventManager Events { get; set; }
        public System.Management.Automation.JobRepository JobRepository { get; set; }
        public System.Management.Automation.JobManager JobManager { get; set; }
        public System.Management.Automation.ProviderIntrinsics InvokeProvider { get; set; }
        public System.Boolean Stopping { get; set; }
        public System.Management.Automation.ICommandRuntime CommandRuntime { get; set; }
        public System.Management.Automation.PSTransactionContext CurrentPSTransaction { get; set; }
        public System.Management.Automation.CommandOrigin CommandOrigin { get; set; }

    }

    public class RestartVM
    {
        // Constructor
        public RestartVM() { }

        // Property
        public Microsoft.Management.Infrastructure.CimSession[] CimSession { get; set; }
        public System.String[] ComputerName { get; set; }
        public System.Management.Automation.PSCredential[] Credential { get; set; }
        public Microsoft.HyperV.PowerShell.VirtualMachine[] VM { get; set; }
        public System.String[] Name { get; set; }
        public System.Management.Automation.SwitchParameter Force { get; set; }
        public System.Management.Automation.SwitchParameter AsJob { get; set; }
        public System.Management.Automation.SwitchParameter Passthru { get; set; }
        public System.Management.Automation.SwitchParameter Wait { get; set; }
        public Microsoft.HyperV.PowerShell.Commands.RestartVM.WaitVMTypes For { get; set; }
        public System.UInt16 Delay { get; set; }
        public System.Nullable<System.Int32> Timeout { get; set; }
        public Microsoft.HyperV.PowerShell.Commands.RestartVM.RestartType Type { get; set; }
        public Microsoft.HyperV.PowerShell.Commands.VirtualMachineParameterType VirtualMachineParameterType { get; set; }
        public System.String ParameterSetName { get; set; }
        public System.Management.Automation.InvocationInfo MyInvocation { get; set; }
        public System.Management.Automation.PagingParameters PagingParameters { get; set; }
        public System.Management.Automation.CommandInvocationIntrinsics InvokeCommand { get; set; }
        public System.Management.Automation.Host.PSHost Host { get; set; }
        public System.Management.Automation.SessionState SessionState { get; set; }
        public System.Management.Automation.PSEventManager Events { get; set; }
        public System.Management.Automation.JobRepository JobRepository { get; set; }
        public System.Management.Automation.JobManager JobManager { get; set; }
        public System.Management.Automation.ProviderIntrinsics InvokeProvider { get; set; }
        public System.Boolean Stopping { get; set; }
        public System.Management.Automation.ICommandRuntime CommandRuntime { get; set; }
        public System.Management.Automation.PSTransactionContext CurrentPSTransaction { get; set; }
        public System.Management.Automation.CommandOrigin CommandOrigin { get; set; }

        public enum WaitVMTypes : int
        {
            Heartbeat = 0,
            IPAddress = 1,
        }

        public enum RestartType : int
        {
            Reset = 0,
            Reboot = 1,
        }
    }

    public enum VirtualMachineParameterType : int
    {
        None = 0,
        VMObject = 1,
        SingularVMObject = 2,
        Name = 3,
        SingularName = 4,
        VMName = 5,
        SingularVMName = 6,
        VMId = 7,
    }
}

namespace Microsoft.Vhd.PowerShell
{
    public enum VhdCompactMode : int
    {
        Full = 0,
        Quick = 1,
        Retrim = 2,
        Pretrimmed = 3,
        Prezeroed = 4,
    }

    public enum VhdFormat : int
    {
        Unknown = 0,
        VHD = 2,
        VHDX = 3,
        VHDSet = 4,
    }

    public class VHDSetInfo
    {
        // Property
        public System.String ComputerName { get; set; }
        public System.String Path { get; set; }
        public System.Collections.Generic.IReadOnlyCollection<System.String> SnapshotIdList { get; set; }
        public System.Collections.Generic.IReadOnlyCollection<System.String> AllPaths { get; set; }

        // Fabricated constructor
        private VHDSetInfo() { }
        public static VHDSetInfo CreateTypeInstance()
        {
            return new VHDSetInfo();
        }
    }

    public class VHDSnapshotInfo
    {
        // Property
        public System.String ComputerName { get; set; }
        public System.String FilePath { get; set; }
        public System.Guid SnapshotId { get; set; }
        public System.String SnapshotPath { get; set; }
        public System.DateTime CreationTime { get; set; }
        public System.String ResilientChangeTrackingId { get; set; }
        public System.Collections.Generic.IReadOnlyCollection<System.String> ParentPathsList { get; set; }

        // Fabricated constructor
        private VHDSnapshotInfo() { }
        public static VHDSnapshotInfo CreateTypeInstance()
        {
            return new VHDSnapshotInfo();
        }
    }

    public enum VhdType : int
    {
        Unknown = 0,
        Fixed = 2,
        Dynamic = 3,
        Differencing = 4,
    }

    public class VirtualHardDisk
    {
        // Property
        public System.String ComputerName { get; set; }
        public System.String Path { get; set; }
        public Microsoft.Vhd.PowerShell.VhdFormat VhdFormat { get; set; }
        public Microsoft.Vhd.PowerShell.VhdType VhdType { get; set; }
        public System.UInt64 FileSize { get; set; }
        public System.UInt64 Size { get; set; }
        public System.Nullable<System.UInt64> MinimumSize { get; set; }
        public System.UInt32 LogicalSectorSize { get; set; }
        public System.UInt32 PhysicalSectorSize { get; set; }
        public System.UInt32 BlockSize { get; set; }
        public System.String ParentPath { get; set; }
        public System.String DiskIdentifier { get; set; }
        public System.Nullable<System.UInt32> FragmentationPercentage { get; set; }
        public System.UInt32 Alignment { get; set; }
        public System.Boolean Attached { get; set; }
        public System.Nullable<System.UInt32> DiskNumber { get; set; }
        public System.Boolean IsPMEMCompatible { get; set; }
        public Microsoft.Virtualization.Client.Management.VirtualHardDiskPmemAddressAbstractionType AddressAbstractionType { get; set; }

        // Fabricated constructor
        private VirtualHardDisk() { }
        public static VirtualHardDisk CreateTypeInstance()
        {
            return new VirtualHardDisk();
        }
    }

}

namespace Microsoft.Virtualization.Client.Management
{
    [System.Flags]
    public enum DisableOnFailoverFeature : int
    {
        None = 0,
        RDMA = 1,
    }

    public class SecureBootTemplate
    {
        public bool IsSecondaryStubType = true;

        public SecureBootTemplate() { }
    }

    public enum VirtualHardDiskPmemAddressAbstractionType : int
    {
        None = 0,
        BTT = 1,
        Unknown = 65535,
    }

}

'@

function Add-VMAssignableDevice {
    <#
    .SYNOPSIS
        Add-VMAssignableDevice [-VMName] <string[]> [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-InstancePath <string>] [-LocationPath <string>] [-VirtualFunction <uint16>] [-ResourcePoolName <string>] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]

Add-VMAssignableDevice [-VM] <VirtualMachine[]> [-InstancePath <string>] [-LocationPath <string>] [-VirtualFunction <uint16>] [-ResourcePoolName <string>] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMAssignedDevice])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [ValidateNotNullOrEmpty()]
        [string]
        ${InstancePath},

        [ValidateNotNullOrEmpty()]
        [string]
        ${LocationPath},

        [System.Nullable[uint16]]
        ${VirtualFunction},

        [ValidateNotNull()]
        [string]
        ${ResourcePoolName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMDvdDrive {
    <#
    .SYNOPSIS
        Adds a DVD drive to a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-v hosts on which the DVD drive is to be added. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine to which the DVD drive is to be added.
    .PARAMETER VM
        Specifies the virtual machine to which the DVD drive is to be added.
    .PARAMETER VMDriveController
        Specifies the drive controller to which the DVD drive is to be added.
    .PARAMETER ControllerNumber
        Specifies the number of the controller to which the DVD drive is to be added. If not specified, the first IDE controller on which the specified ControllerLocation is available is used.
    .PARAMETER ControllerLocation
        Specifies the number of the location on the controller at which the DVD drive is to be added. If not specified, the number of the first available location on the controller is used.
    .PARAMETER Path
        Specifies the full path to the virtual hard disk file or physical hard disk volume for the added DVD drive.
    .PARAMETER ResourcePoolName
        Specifies the friendly name of the ISO resource pool to which this DVD drive is to be associated.
    .PARAMETER AllowUnverifiedPaths
        Specifies that no error is to be thrown if the specified path is not verified as accessible by the cluster. This parameter is applicable to clustered virtual machines.
    .PARAMETER Passthru
        Passes the added Microsoft.HyperV.PowerShell.DvdDrive through to the pipeline.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.DvdDrive])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMDriveController', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMDriveController[]]
        ${VMDriveController},

        [Parameter(ParameterSetName='VMObject', Position=2)]
        [Parameter(ParameterSetName='VMName', Position=2)]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ControllerNumber},

        [Parameter(Position=3)]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ControllerLocation},

        [Parameter(Position=4)]
        [string]
        ${Path},

        [ValidateNotNull()]
        [string]
        ${ResourcePoolName},

        [switch]
        ${AllowUnverifiedPaths},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMFibreChannelHba {
    <#
    .SYNOPSIS
        Adds a virtual Fibre Channel host bus adapter to a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which a virtual Fibre Channel host bus adapter is to be added. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine to which the virtual Fibre Channel host bus adapter is to be added.
    .PARAMETER VMName
        Specifies the name of the virtual machine to which the virtual Fibre Channel host bus adapter is to be added.
    .PARAMETER SanName
        Specifies the virtual storage area network (SAN) name to associate with this virtual Fibre Channel host bus adapter. Use the Get-VMSan cmdlet to get a list of all virtual SANs on the host.
    .PARAMETER GenerateWwn
        Specifies that the world wide names for the Fibre Channel host bus adapter are to be generated automatically. When specified, the WorldWideNodeNameSetA , WorldWideNodeNameSetB , WorldWidePortNameSetA , and WorldWidePortNameSetB parameters cannot be used.
    .PARAMETER WorldWideNodeNameSetA
        Specifies the world wide node name of address A associated with the Fibre Channel host bus adapter to be added.
    .PARAMETER WorldWidePortNameSetA
        Specifies the world wide port name of address A associated with the Fibre Channel host bus adapter to be added.
    .PARAMETER WorldWideNodeNameSetB
        Specifies the world wide node name of address B associated with the Fibre Channel host bus adapter to be added.
    .PARAMETER WorldWidePortNameSetB
        Specifies the world wide port name of address B associated with the Fibre Channel host bus adapter to be added.
    .PARAMETER Passthru
        Specifies that an object representing the virtual machine to which the virtual Fibre Channel host bus adapter being added is to be passed through to the pipeline.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName and GenerateWwn', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMFibreChannelHba])]
    param (
        [Parameter(ParameterSetName='VMName and GenerateWwn')]
        [Parameter(ParameterSetName='VMName and manual WWN')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName and manual WWN')]
        [Parameter(ParameterSetName='VMName and GenerateWwn')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName and manual WWN')]
        [Parameter(ParameterSetName='VMName and GenerateWwn')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VM object and GenerateWwn', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='VM Object and manual WWN', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName and GenerateWwn', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='VMName and manual WWN', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [Parameter(Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SanName},

        [Parameter(ParameterSetName='VMName and GenerateWwn')]
        [Parameter(ParameterSetName='VM object and GenerateWwn')]
        [switch]
        ${GenerateWwn},

        [Parameter(ParameterSetName='VMName and manual WWN', Mandatory=$true)]
        [Parameter(ParameterSetName='VM Object and manual WWN', Mandatory=$true)]
        [Alias('Wwnn1')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${WorldWideNodeNameSetA},

        [Parameter(ParameterSetName='VMName and manual WWN', Mandatory=$true)]
        [Parameter(ParameterSetName='VM Object and manual WWN', Mandatory=$true)]
        [Alias('Wwpn1')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${WorldWidePortNameSetA},

        [Parameter(ParameterSetName='VMName and manual WWN', Mandatory=$true)]
        [Parameter(ParameterSetName='VM Object and manual WWN', Mandatory=$true)]
        [Alias('Wwnn2')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${WorldWideNodeNameSetB},

        [Parameter(ParameterSetName='VMName and manual WWN', Mandatory=$true)]
        [Parameter(ParameterSetName='VM Object and manual WWN', Mandatory=$true)]
        [Alias('Wwpn2')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${WorldWidePortNameSetB},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMGpuPartitionAdapter {
    <#
    .SYNOPSIS
        Add-VMGpuPartitionAdapter [-VMName] <string[]> [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-Passthru] [-MinPartitionVRAM <uint64>] [-MaxPartitionVRAM <uint64>] [-OptimalPartitionVRAM <uint64>] [-MinPartitionEncode <uint64>] [-MaxPartitionEncode <uint64>] [-OptimalPartitionEncode <uint64>] [-MinPartitionDecode <uint64>] [-MaxPartitionDecode <uint64>] [-OptimalPartitionDecode <uint64>] [-MinPartitionCompute <uint64>] [-MaxPartitionCompute <uint64>] [-OptimalPartitionCompute <uint64>] [-WhatIf] [-Confirm] [<CommonParameters>]

Add-VMGpuPartitionAdapter [-VM] <VirtualMachine[]> [-Passthru] [-MinPartitionVRAM <uint64>] [-MaxPartitionVRAM <uint64>] [-OptimalPartitionVRAM <uint64>] [-MinPartitionEncode <uint64>] [-MaxPartitionEncode <uint64>] [-OptimalPartitionEncode <uint64>] [-MinPartitionDecode <uint64>] [-MaxPartitionDecode <uint64>] [-OptimalPartitionDecode <uint64>] [-MinPartitionCompute <uint64>] [-MaxPartitionCompute <uint64>] [-OptimalPartitionCompute <uint64>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMGpuPartitionAdapter])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [switch]
        ${Passthru},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${MinPartitionVRAM},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${MaxPartitionVRAM},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${OptimalPartitionVRAM},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${MinPartitionEncode},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${MaxPartitionEncode},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${OptimalPartitionEncode},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${MinPartitionDecode},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${MaxPartitionDecode},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${OptimalPartitionDecode},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${MinPartitionCompute},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${MaxPartitionCompute},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${OptimalPartitionCompute}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMGroupMember {
    <#
    .SYNOPSIS
        Adds group members to a virtual machine group.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies on or more Hyper-V hosts where this cmdlet adds a group member. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies the name of the virtual machine group to which this cmdlet adds virtual machines or groups of virtual machines.
    .PARAMETER Id
        Specifies the unique ID of the virtual machine group to which this cmdlet adds virtual machines or groups of virtual machines.
    .PARAMETER VMGroup
        Specifies the virtual machine group to which this cmdlet adds virtual machines or groups of virtual machines. To obtain a VMGroup object, use the Get-VMGroup cmdlet.
    .PARAMETER VM
        Specifies an array of virtual machines that this cmdlet adds to a virtual machine group. To obtain a VirtualMachine object, use the Get-VM cmdlet.
    .PARAMETER VMGroupMember
        Specifies an array of virtual machine groups that this cmdlet adds to a virtual machine group.
    .PARAMETER Passthru
        Indicates that this cmdlet returns the Microsoft.HyperV.PowerShell.VMGroup object that it configures.
    #>

    [CmdletBinding(DefaultParameterSetName='VM Using Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMGroup])]
    param (
        [Parameter(ParameterSetName='VMGroup Using ID')]
        [Parameter(ParameterSetName='VM Using Name')]
        [Parameter(ParameterSetName='VMGroup Using Name')]
        [Parameter(ParameterSetName='VM Using ID')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VM Using Name')]
        [Parameter(ParameterSetName='VMGroup Using Name')]
        [Parameter(ParameterSetName='VM Using ID')]
        [Parameter(ParameterSetName='VMGroup Using ID')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VM Using ID')]
        [Parameter(ParameterSetName='VM Using Name')]
        [Parameter(ParameterSetName='VMGroup Using Name')]
        [Parameter(ParameterSetName='VMGroup Using ID')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMGroup Using Name', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='VM Using Name', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='VMGroup Using ID', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='VM Using ID', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [guid]
        ${Id},

        [Parameter(ParameterSetName='VMGroup Using InputObject', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='VM Using InputObject', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMGroup]
        ${VMGroup},

        [Parameter(ParameterSetName='VM Using InputObject', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VM Using Name', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VM Using ID', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMGroup Using ID', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VMGroup Using Name', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VMGroup Using InputObject', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMGroup[]]
        ${VMGroupMember},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMHardDiskDrive {
    <#
    .SYNOPSIS
        Adds a hard disk drive to a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine to which the hard disk drive is to be added.
    .PARAMETER VM
        Specifies the virtual machine to which the hard disk drive is to be added.
    .PARAMETER VMDriveController
        Specifies the controller to which the hard disk drive is to be added.
    .PARAMETER ControllerType
        Specifies the type of the controller to which the hard disk drive is to be added. If not specified, IDE is attempted first. If the IDE controller port at the specified number and location is already connected to a drive, then it will try to create one on the SCSI controller specified by ControllerNumber . Allowed values are IDE and SCSI .
    .PARAMETER ControllerNumber
        Specifies the number of the controller to which the hard disk drive is to be added. If not specified, this parameter assumes the value of the first available controller at the location specified in the ControllerLocation parameter.
    .PARAMETER ControllerLocation
        Specifies the number of the location on the controller at which the hard disk drive is to be added. If not specified, the first available location in the controller specified with the ControllerNumber parameter is used.
    .PARAMETER Path
        Specifies the full path of the hard disk drive file to be added.
    .PARAMETER DiskNumber
        Specifies the disk number of the offline physical hard drive to be connected as a passthrough disk.
    .PARAMETER ResourcePoolName
        Specifies the friendly name of the ISO resource pool to which this virtual hard disk is to be associated.
    .PARAMETER SupportPersistentReservations
        Indicates that the hard disk supports SCSI persistent reservation semantics. Specify this parameter when the hard disk is a shared disk that is used by multiple virtual machines.
    .PARAMETER AllowUnverifiedPaths
        Specifies that no error is to be thrown if the specified path is not verified as accessible by the cluster. This parameter is applicable to clustered virtual machines.
    .PARAMETER MaximumIOPS
        Specifies the maximum normalized I/O operations per second (IOPS) for the hard disk. Hyper-V calculates normalized IOPS as the total size of I/O per second divided by 8 KB.
    .PARAMETER MinimumIOPS
        Specifies the minimum normalized I/O operations per second (IOPS) for the hard disk. Hyper-V calculates normalized IOPS as the total size of I/O per second divided by 8 KB.
    .PARAMETER QoSPolicyID
        Specifies the unique ID for a storage QoS policy that this cmdlet associates with the hard disk drive.
    .PARAMETER QoSPolicy
        Specifies the name of the storage Quality of Service (QoS) policy that this cmdlet associates with the hard disk drive.
    .PARAMETER Passthru
        Passes the added Microsoft.HyperV.PowerShell.HardDiskDrive object through to the pipeline.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.HardDiskDrive])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Alias('PSComputerName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMDriveController', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMDriveController]
        ${VMDriveController},

        [Parameter(ParameterSetName='VMName', Position=1)]
        [Parameter(ParameterSetName='VMObject', Position=1)]
        [System.Nullable[Microsoft.HyperV.PowerShell.ControllerType]]
        ${ControllerType},

        [Parameter(ParameterSetName='VMObject', Position=2)]
        [Parameter(ParameterSetName='VMName', Position=2)]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ControllerNumber},

        [Parameter(Position=3)]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ControllerLocation},

        [Parameter(Position=4)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Path},

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [Alias('Number')]
        [uint32]
        ${DiskNumber},

        [ValidateNotNull()]
        [string]
        ${ResourcePoolName},

        [Alias('ShareVirtualDisk')]
        [switch]
        ${SupportPersistentReservations},

        [switch]
        ${AllowUnverifiedPaths},

        [System.Nullable[uint64]]
        ${MaximumIOPS},

        [System.Nullable[uint64]]
        ${MinimumIOPS},

        [string]
        ${QoSPolicyID},

        [ciminstance]
        ${QoSPolicy},

        [switch]
        ${Passthru},

        [System.Nullable[Microsoft.HyperV.PowerShell.CacheAttributes]]
        ${OverrideCacheAttributes}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMHostAssignableDevice {
    <#
    .SYNOPSIS
        Add-VMHostAssignableDevice -ResourcePoolName <string[]> [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-Force] [-InstancePath <string>] [-LocationPath <string>] [<CommonParameters>]

Add-VMHostAssignableDevice [-VMHostAssignableDevice] <VMHostAssignableDevice[]> -ResourcePoolName <string[]> [-Force] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Path')]
    param (
        [Parameter(ParameterSetName='Path')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Path')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Path')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [switch]
        ${Force},

        [Parameter(ParameterSetName='Path')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${InstancePath},

        [Parameter(ParameterSetName='Path')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${LocationPath},

        [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMHostAssignableDevice[]]
        ${VMHostAssignableDevice},

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ResourcePoolName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMKeyStorageDrive {
    <#
    .SYNOPSIS
        Add-VMKeyStorageDrive [-VMName] <string[]> [[-ControllerNumber] <int>] [[-ControllerLocation] <int>] [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-ResourcePoolName <string>] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]

Add-VMKeyStorageDrive [-VM] <VirtualMachine[]> [[-ControllerNumber] <int>] [[-ControllerLocation] <int>] [-ResourcePoolName <string>] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.KeyStorageDrive])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Alias('PSComputerName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMObject', Position=2)]
        [Parameter(ParameterSetName='VMName', Position=2)]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ControllerNumber},

        [Parameter(Position=3)]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ControllerLocation},

        [ValidateNotNull()]
        [string]
        ${ResourcePoolName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMMigrationNetwork {
    <#
    .SYNOPSIS
        Adds a network for virtual machine migration on one or more virtual machine hosts.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER Subnet
        Specifies a string representing an IPv4 or IPv6 subnet mask which identifies the network to be added for virtual machine migration.
    .PARAMETER Priority
        Specifies the priority of the network to be added for virtual machine migration. Multiple networks can have the same priority.
    .PARAMETER Passthru
        Specifies that an Microsoft.HyperV.PowerShell.MigrationNetwork object is to be passed through to the pipeline representing the network added for virtual machine migration.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the network is to be added for virtual machine migration. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMMigrationNetwork])]
    param (
        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Subnet},

        [Parameter(Position=1)]
        [ValidateNotNullOrEmpty()]
        [uint32]
        ${Priority},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMNetworkAdapter {
    <#
    .SYNOPSIS
        Adds a virtual network adapter to a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual network adapter is to be added. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine on which the network adapter is to be added.
    .PARAMETER ManagementOS
        Specifies the management operating system.
    .PARAMETER SwitchName
        Specifies the name of the virtual switch to connect to the new network adapter. If the switch name is not unique, then the operation fails.
    .PARAMETER IsLegacy
        Specifies whether the virtual network adapter is the legacy type.
    .PARAMETER Name
        Specifies a name for the new virtual network adapter. The default value is "Network Adapter."
    .PARAMETER DynamicMacAddress
        Assigns a dynamically generated MAC address to the new virtual network adapter.
    .PARAMETER StaticMacAddress
        Assigns a specific MAC address to the new virtual network adapter.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to be pipeline representing the network adapter to be added. If you specify -ManagementOS , the object passed is a Microsoft.HyperV.PowerShell.VMInternalNetworkAdapter ; otherwise the object passed is a Microsoft.HyperV.PowerShell.VMNetworkAdapter .
    .PARAMETER ResourcePoolName
        Specifies the friendly name of a resource pool.
    .PARAMETER VM
        Specifies the virtual machine on which the network adapter is to be added.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapter])]
    [OutputType([Microsoft.HyperV.PowerShell.VMInternalNetworkAdapter])]
    param (
        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='ManagementOS')]
        [switch]
        ${ManagementOS},

        [ValidateNotNullOrEmpty()]
        [string]
        ${SwitchName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [bool]
        ${IsLegacy},

        [Alias('VMNetworkAdapterName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [switch]
        ${DynamicMacAddress},

        [ValidateNotNull()]
        [bool]
        ${NumaAwarePlacement},

        [ValidateNotNullOrEmpty()]
        [string]
        ${StaticMacAddress},

        [switch]
        ${Passthru},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNull()]
        [string]
        ${ResourcePoolName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Microsoft.HyperV.PowerShell.OnOffState]
        ${DeviceNaming}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMNetworkAdapterAcl {
    <#
    .SYNOPSIS
        Creates an ACL to apply to the traffic through a virtual machine network adapter.
    .PARAMETER Action
        Specifies the action for the ACL. Allowed values are Allow , Deny , and Meter . A metering ACL must be IP-based, i.e. either -RemoteIPAddress or -LocalIPAddress must be specified.
    .PARAMETER Direction
        Specifies the direction of the network traffic to which the ACL is to apply. Allowed values are Inbound , Outbound , or Both . . If Both is specified, the new ACL entry is added to both the inbound direction and the outbound direction. In the output of Get-VMNetworkAdapterAcl, the ACL entry appears in both the inbound ACL list and the outbound ACL list.
    .PARAMETER LocalIPAddress
        Specifies the local IP address to which the ACL is to apply. For an inbound packet, this is the destination IP address in the packet header; for an outbound packet, this is the source IP address in the packet header. It can be either IPv4 or IPv6 address. It can be either a host address or a subnet address, e.g. 1.2.3.4, 2001::2008, 192.168.1.0/24, or f001:f002:f003:f004::1/64. The IP address can also be a wildcard, 0.0.0.0/0 for all IPv4 addresses, ::/0 for all IPv6 addresses, or ANY for all IPv4 and IPv6 addresses.
    .PARAMETER LocalMacAddress
        Specifies the local MAC address to which the ACL is to apply. For an inbound packet, this is the destination MAC address in the packet header; for an outbound packet, this is the source MAC address in the packet header. It can be a host MAC address, e.g. 00-ab-00-11-22-33, or a wildcard, ANY, for all MAC addresses.
    .PARAMETER RemoteIPAddress
        Specifies the remote IP address to which this ACL is to apply. For an inbound packet, this is the source IP address in the packet header; for an outbound packet, this is the destination IP address in the packet header. It can be either IPv4 or IPv6 address. It can be either a host address or a subnet address, e.g. 1.2.3.4, 2001::2008, 192.168.1.0/24, or f001:f002:f003:f004::1/64.the IP address can also be a wildcard, 0.0.0.0/0 for all IPv4 addresses, ::/0 for all IPv6 addresses, or ANY for all IPv4 and IPv6 addresses.
    .PARAMETER RemoteMacAddress
        Specifies the remote MAC address to which this ACL is to apply. For an inbound packet, this is the source MAC address in the packet header; for an outbound packet, this is the destination MAC address in the packet header. It can be a host MAC address, e.g. 00-ab-00-11-22-33, or a wildcard, ANY, for all MAC addresses.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the ACL to be added.
    .PARAMETER VMNetworkAdapter
        Specifies the virtual machine network adapter to which the ACL is to apply.
    .PARAMETER ManagementOS
        Specifies that the ACL is to be applied in the management (i.e. the parent, or host) operating system.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of the virtual machine network adapter to which the ACL is to apply.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the ACL is to be created. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine on which the ACL is to apply.
    .PARAMETER VM
        Specifies the virtual machine on which the ACL is to apply.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterAclSetting])]
    param (
        [Parameter(Mandatory=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterAclAction]
        ${Action},

        [Parameter(Mandatory=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterAclDirection]
        ${Direction},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${LocalIPAddress},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${LocalMacAddress},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${RemoteIPAddress},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${RemoteMacAddress},

        [switch]
        ${Passthru},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [string]
        ${VMNetworkAdapterName},

        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMNetworkAdapterExtendedAcl {
    <#
    .SYNOPSIS
        Creates an extended ACL for a virtual network adapter.
    .PARAMETER Action
        Specifies the action for the ACL. The acceptable values for this parameter are:

        - Allow

        - Deny
    .PARAMETER Direction
        Specifies the direction of network traffic, from the perspective of the virtual machine, to which the ACL applies. The cmdlet adds an ACL that has the value that you specify. The acceptable values for this parameter are:

        - Inbound

        - Outbound

        If you run the Get-VMNetworkAdapterExtendedAcl cmdlet, the entry that you create appears in both the inbound ACL and the outbound ACL.

    .PARAMETER LocalIPAddress
        Specifies the local IP address for the ACL. For an inbound packet, the local address is the destination IP address. For an outbound packet, the local address is the source IP address. You can specify a host address or a subnet address, or specify a wildcard, such as 0.0.0.0/0 for all IPv4 addresses, ::/0 for all IPv6 addresses, or ANY for all IPv4 and IPv6 addresses.
    .PARAMETER RemoteIPAddress
        Specifies the local IP address for the ACL. For an inbound packet, the remote address is the source IP address. For an outbound packet, the remote address is the destination IP address. You can specify a host address or a subnet address, or specify a wildcard, such as 0.0.0.0/0 for all IPv4 addresses, ::/0 for all IPv6 addresses, or ANY for all IPv4 and IPv6 addresses.
    .PARAMETER LocalPort
        Specifies the local port for the ACL. For an inbound TCP or UDP packet, the local port is the destination port. For an outbound packet, the local port is the source port.
    .PARAMETER RemotePort
        Specifies the remote port for the ACL. For an inbound TCP or UDP packet, the remote port is the source port. For an outbound packet, the remote port is the destination port.
    .PARAMETER Protocol
        Specifies the protocol that the ACL applies to. The acceptable values for this parameter are:

        - TCP

        - UDP

        - ICMP

        - an integer IP protocol ID
    .PARAMETER Weight
        Specifies the weight of an ACL entry. Larger weight values apply first, and once an ACL entry applies to a packet, other entries are no longer relevant for that packet.
    .PARAMETER Stateful
        Indicates whether the ACL applies to packets in both directions of the same session. If you specify a value of $True, the ACL applies to a return packet even though that packet has the opposite direction with respect to the ACL.
    .PARAMETER IdleSessionTimeout
        Specifies a time-out period, in seconds, for idle sessions.
    .PARAMETER IsolationID
        Specifies an ID of a virtual subnet. The cmdlet adds an ACL that applies to traffic on the isolated network that you specify. The subnet uses virtual local area network (VLAN) or Hyper-V Network Virtualization. For more information about isolation IDs, see the Set-VmNetworkAdapterIsolation cmdlet.
    .PARAMETER Passthru
        Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.
    .PARAMETER VMNetworkAdapter
        Specifies an array VM network adapters as VMNetworkAdapterBase objects. The cmdlet adds an ACL to the adapters that you specify. To obtain a network adapter, use the Get-VMNetworkAdapter cmdlet.
    .PARAMETER ManagementOS
        Indicates that the cmdlet operates on the parent or host operating system. If you specify this parameter, this cmdlet creates an ACL that applies to the parent or host operating system.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of a virtual network adapter. The cmdlet adds an ACL to the adapter that you specify.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies an array of Hyper-V hosts. The cmdlet adds the ACL to the network adapters on the Hyper-V hosts that you specify.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies an array of names of virtual machines. The cmdlet adds an ACL for the virtual machines that you specify.
    .PARAMETER VM
        Specifies an array of virtual machine objects. The cmdlet adds an ACL for the virtual machines that you specify. To obtain a virtual machine object, use the Get-VM cmdlet.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterExtendedAclSetting])]
    param (
        [Parameter(Mandatory=$true, Position=1)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterExtendedAclAction]
        ${Action},

        [Parameter(Mandatory=$true, Position=2)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterExtendedAclDirection]
        ${Direction},

        [Parameter(Position=3)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${LocalIPAddress},

        [Parameter(Position=4)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${RemoteIPAddress},

        [Parameter(Position=5)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${LocalPort},

        [Parameter(Position=6)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${RemotePort},

        [Parameter(Position=7)]
        [ValidateNotNull()]
        [string]
        ${Protocol},

        [Parameter(Mandatory=$true, Position=8)]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${Weight},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${Stateful},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${IdleSessionTimeout},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${IsolationID},

        [switch]
        ${Passthru},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='ManagementOS')]
        [string]
        ${VMNetworkAdapterName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMNetworkAdapterRoutingDomainMapping {
    <#
    .SYNOPSIS
        Adds a routing domain and virtual subnets to a virtual network adapter.
    .PARAMETER RoutingDomainID
        Specifies the ID of a routing domain. The ID of a routing domain is a system-assigned GUID. The cmdlet adds the routing domain that you specify to the virtual network adapter.
    .PARAMETER RoutingDomainName
        Specifies the name of a routing domain. The cmdlet adds the routing domain that you specify to the virtual network adapter.
    .PARAMETER IsolationID
        Specifies an array of IDs of virtual subnets. The cmdlet adds the virtual subnets that you specify to the virtual network adapter. You can isolate a virtual machine adapter by using virtual local area network (VLAN), Hyper-V Network Virtualization, or a third party virtualization solution. For more information about isolation IDs, see the Set-VmNetworkAdapterIsolation cmdlet.
    .PARAMETER IsolationName
        Specifies an array of names of virtual subnets. The cmdlet adds the virtual subnets that you specify to the virtual network adapter. The subnet uses VLAN or Hyper-V Network Virtualization.
    .PARAMETER Passthru
        Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.
    .PARAMETER VMNetworkAdapter
        Specifies an array of virtual network adapter as VMNetworkAdapterBase objects. The cmdlet adds the routing domain on the adapters that you specify. To obtain a network adapter, use the Get-VMNetworkAdapter cmdlet.
    .PARAMETER ManagementOS
        Indicates that the cmdlet operates on the parent or host operating system.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of a virtual network adapter. The cmdlet adds the routing domain on adapter that you specify.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies an array of Hyper-V hosts. The cmdlet adds the routing domain and virtual subnet to a virtual network adapter on the Hyper-V hosts that you specify.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies an array of friendly names of virtual machines. The cmdlet adds the routing domain to the network interfaces that belong to the virtual machines that you specify.
    .PARAMETER VM
        Specifies an array of virtual machine objects. The cmdlet adds the routing domain to the network interfaces that belong to the virtual machines that you specify. To obtain a virtual machine object, use the Get-VM cmdlet.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterRoutingDomainSetting])]
    param (
        [Parameter(Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [guid]
        ${RoutingDomainID},

        [Parameter(Mandatory=$true, Position=2)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${RoutingDomainName},

        [Parameter(Mandatory=$true, Position=3)]
        [ValidateNotNullOrEmpty()]
        [int[]]
        ${IsolationID},

        [Parameter(Position=4)]
        [string[]]
        ${IsolationName},

        [switch]
        ${Passthru},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [string]
        ${VMNetworkAdapterName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMPmemController {
    <#
    .SYNOPSIS
        Add-VMPmemController [-VMName] <string[]> [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]

Add-VMPmemController [-VM] <VirtualMachine[]> [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMPmemController])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMRemoteFx3dVideoAdapter {
    <#
    .SYNOPSIS
        Adds a RemoteFX video adapter in a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the RemoteFX video adapter is to be added. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine on which the RemoteFX video adapter is to be added.
    .PARAMETER VMName
        Specifies the name of virtual machine on which the RemoteFX video adapter is to be added.
    .PARAMETER Passthru
        Specifies that a VMRemoteFxVideoAdapter object is to be passed through to the pipeline representing the RemoteFX video adapter to be added.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMRemoteFx3DVideoAdapter])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMScsiController {
    <#
    .SYNOPSIS
        Adds a SCSI controller in a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which a SCSI controller is to be added. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine in which the SCSI controller is to be added.
    .PARAMETER VMName
        Specifies the name of the virtual machine in which the SCSI controller is to be added.
    .PARAMETER Passthru
        Specifies that a VMScsiController object is to be passed through to the pipeline representing the SCSI controller to be added.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMScsiController])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMStoragePath {
    <#
    .SYNOPSIS
        Adds a path to a storage resource pool.
    .PARAMETER Path
        Specifies the path to be added to the storage resource pool.
    .PARAMETER ResourcePoolName
        Specifies the name of the resource pool to which the path is to be added.
    .PARAMETER ResourcePoolType
        Specifies the type of the resource pool for which storage paths are to be added. Allowed values are VFD , VHD , and ISO .
    .PARAMETER Passthru
        Indicates that this cmdlet returns a String .
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the path to the storage resource pool is to be added. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMStorageResourcePool])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Path},

        [Parameter(Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ResourcePoolName},

        [Parameter(Mandatory=$true, Position=2)]
        [ValidateSet('VHD','ISO','VFD')]
        [Microsoft.HyperV.PowerShell.VMResourcePoolType]
        ${ResourcePoolType},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMSwitch {
    <#
    .SYNOPSIS
        Adds a virtual switch to an Ethernet resource pool.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies an array of Hyper-V hosts. The cmdlet adds the virtual switch on the Hyper-V hosts that you specify.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies the name of the virtual switch to be added.
    .PARAMETER VMSwitch
        Specifies the virtual switch to be added to the Ethernet resource pool.
    .PARAMETER ResourcePoolName
        Specifies the name of the resource pool to which the virtual switch is to be added.
    #>

    [CmdletBinding(DefaultParameterSetName='NetworkByName')]
    param (
        [Parameter(ParameterSetName='NetworkByName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='NetworkByName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='NetworkByName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='NetworkByName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('SwitchName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='NetworkByObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMSwitch[]]
        ${VMSwitch},

        [Parameter(Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ResourcePoolName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMSwitchExtensionPortFeature {
    <#
    .SYNOPSIS
        Adds a feature to a virtual network adapter.
    .PARAMETER VMName
        Specifies the name of the virtual machine in which the feature is to be added.
    .PARAMETER VMNetworkAdapter
        Specifies the virtual machine network adapter for which the feature is to be added.
    .PARAMETER ManagementOS
        Specifies that the feature is to be added in the management (i.e. the parent, or host) operating system.
    .PARAMETER ExternalPort
        Specifies the virtual switch port connected to the external network adapter.
    .PARAMETER SwitchName
        Specifies the name of the virtual switch.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of the virtual machine network adapter for which the feature is to be added.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which a feature is to be added to a virtual network adapter. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine in which the feature is to be added.
    .PARAMETER VMSwitchExtensionFeature
        Specifies the feature to be added to the virtual switch. You can get such a feature object from Get-VMSystemSwitchExtensionPortFeature to add a new configuration to a virtual network adapter, or from the Get-VMSwitchExtensionPortFeature cmdlet to update an existing configuration.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the feature to be added.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitchExtensionPortFeature])]
    param (
        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='ExternalPort', Mandatory=$true)]
        [switch]
        ${ExternalPort},

        [Parameter(ParameterSetName='ExternalPort')]
        [string]
        ${SwitchName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='ManagementOS')]
        [string]
        ${VMNetworkAdapterName},

        [Parameter(ParameterSetName='ExternalPort')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='ExternalPort')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='ExternalPort')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitchExtensionPortFeature[]]
        ${VMSwitchExtensionFeature},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMSwitchExtensionSwitchFeature {
    <#
    .SYNOPSIS
        Adds a feature to a virtual switch.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which a feature is to be added to a virtual switch. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMSwitchExtensionFeature
        Specifies the feature to be added to the virtual switch.
    .PARAMETER SwitchName
        Specifies the name of the virtual switch to which the feature is to be added.
    .PARAMETER VMSwitch
        Specifies the virtual switch to which the feature is to be added.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the feature to be added.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitchExtensionSwitchFeature])]
    param (
        [Parameter(ParameterSetName='SwitchName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='SwitchName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='SwitchName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitchExtensionSwitchFeature[]]
        ${VMSwitchExtensionFeature},

        [Parameter(ParameterSetName='SwitchName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SwitchName},

        [Parameter(ParameterSetName='SwitchObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMSwitch[]]
        ${VMSwitch},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-VMSwitchTeamMember {
    <#
    .SYNOPSIS
        Adds members to a virtual switch team.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that runs this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER VMSwitch
        Specifies an array of virtual switches that this cmdlet configures. To obtain a VMSwitch object, use the Get-VMSwitch cmdlet.
    .PARAMETER VMSwitchName
        Specifies an array of names of virtual switches that this cmdlet configures.
    .PARAMETER NetAdapterName
        Specifies an array of names of virtual network adapters that this cmdlet adds to the switch team.
    .PARAMETER NetAdapterInterfaceDescription
        Specifies an array of interface descriptions of the virtual network adapters that this cmdlet adds to the switch team.
    .PARAMETER Passthru
        Indicates that this cmdlet returns the Microsoft.HyperV.PowerShell.VMSwitch object that it modifies.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='SwitchName_NetAdapterName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitch])]
    param (
        [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='SwitchName_NetAdapterName', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterName', ValueFromPipelineByPropertyName=$true)]
        [Alias('PSComputerName')]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='SwitchObject_NetAdapterName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitch[]]
        ${VMSwitch},

        [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='SwitchName_NetAdapterName', Mandatory=$true, Position=0)]
        [Alias('SwitchName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMSwitchName},

        [Parameter(ParameterSetName='SwitchObject_NetAdapterName')]
        [Parameter(ParameterSetName='SwitchName_NetAdapterName')]
        [Alias('InterfaceAlias')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${NetAdapterName},

        [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription')]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${NetAdapterInterfaceDescription},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Checkpoint-VM {
    <#
    .SYNOPSIS
        Creates a checkpoint of a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more virtual machine hosts on which the virtual machine checkpoint is to be created. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine of which a checkpoint is to be taken.
    .PARAMETER Name
        Specifies the name of the virtual machine of which a checkpoint is to be taken.
    .PARAMETER SnapshotName
        Specifies the name of the checkpoint to be taken. If not provided, a combination of the virtual machine's name and a current timestamp is used.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the virtual machine of which a checkpoint is to be taken.
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSnapshot])]
    param (
        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(Position=1)]
        [Alias('CheckpointName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SnapshotName},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Compare-VM {
    <#
    .SYNOPSIS
        Compares a virtual machine and a virtual machine host for compatibility, returning a compatibility report.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-v hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VirtualMachinePath
        Specifies the path where the resulting virtual machine configuration files are to be stored.
    .PARAMETER SnapshotFilePath
        Specifies the path for any snapshot files associated with the virtual machine.
    .PARAMETER SmartPagingFilePath
        Specifies the new path to use for a smart paging file, if one is needed.
    .PARAMETER CompatibilityReport
        Specifies a compatibility report which resolves any incompatibilities between the virtual machine and the virtual machine host.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Name
        Specifies the name of the virtual machine to be compared.
    .PARAMETER VM
        Specifies a virtual machine.
    .PARAMETER DestinationCimSession
        Specifies the CIMSession on the Hyper-V host to which this cmdlet compares the virtual machine for compatibility.
    .PARAMETER DestinationHost
        Specifies the Hyper-V host to which the virtual machine is to be compared for compatibility.
    .PARAMETER DestinationCredential
        Specifies a user account that has permission to perform this action. The default is the current user.
    .PARAMETER IncludeStorage
        Specifies that the compatibility comparison should include both the virtual machine and its storage.
    .PARAMETER DestinationStoragePath
        Specifies a destination storage path to which all virtual machine storage is to be moved.
    .PARAMETER Vhds
        Specifies an array of hash tables that specifies a location for each individual virtual hard disk that needs to be compared. Each hash table has two entries. The first entry specifies the current location of the virtual hard disk to move, and has a key of SourceFilePath . The second entry specifies the new location for the virtual hard disk, and has a key of DestinationFilePath . The virtual hard disk names must be identical in both entries.
    .PARAMETER ResourcePoolName
        Specifies the friendly name of the resource pool.
    .PARAMETER RetainVhdCopiesOnSource
        Indicates that this cmdlet retains parent virtual hard disks on the source computer.
    .PARAMETER Path
        Specifies the path to the configuration file of the virtual machine to be compared.
    .PARAMETER VhdDestinationPath
        Specifies the folder to which the virtual machine's VHD is to be copied.
    .PARAMETER Register
        Specifies that the comparison should be made for an in-place import operation.
    .PARAMETER Copy
        Specifies that the comparison should be made for a copy import operation.
    .PARAMETER VhdSourcePath
        Specifies the folder from which the virtual machine's VHD files are to be copied.
    .PARAMETER GenerateNewId
        Specifies that the virtual machine should be copied and given a new unique identifier.
    #>

    [CmdletBinding(DefaultParameterSetName='NameSingleDestination', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMCompatibilityReport])]
    param (
        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
        [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
        [Parameter(ParameterSetName='Register')]
        [Parameter(ParameterSetName='Copy')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Copy')]
        [Parameter(ParameterSetName='NameSingleDestination')]
        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='Register')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='NameSingleDestination')]
        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='Register')]
        [Parameter(ParameterSetName='Copy')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Copy')]
        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession', Mandatory=$true)]
        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VirtualMachinePath},

        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
        [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
        [Parameter(ParameterSetName='Copy')]
        [Alias('CheckpointFileLocation','SnapshotFileLocation')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SnapshotFilePath},

        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
        [Parameter(ParameterSetName='Copy')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SmartPagingFilePath},

        [Parameter(ParameterSetName='CompatibilityReport', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMCompatibilityReport]
        ${CompatibilityReport},

        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='NameMultipleDestinations', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='NameSingleDestination', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='NameSingleDestinationAndCimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='VMSingleDestination', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='VMSingleDestinationAndCimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='VMMultipleDestinations', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine]
        ${VM},

        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='NameSingleDestinationAndCimSession', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VMSingleDestinationAndCimSession', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [CimSession]
        ${DestinationCimSession},

        [Parameter(ParameterSetName='NameSingleDestination', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='NameMultipleDestinations', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VMSingleDestination', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VMMultipleDestinations', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DestinationHost},

        [Parameter(ParameterSetName='NameSingleDestination')]
        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='VMSingleDestination')]
        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [ValidateNotNullOrEmpty()]
        [pscredential]
        [System.Management.Automation.CredentialAttribute()]
        ${DestinationCredential},

        [Parameter(ParameterSetName='NameSingleDestination')]
        [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
        [Parameter(ParameterSetName='VMSingleDestination')]
        [Parameter(ParameterSetName='VMSingleDestinationAndCimSession')]
        [switch]
        ${IncludeStorage},

        [Parameter(ParameterSetName='NameSingleDestination')]
        [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
        [Parameter(ParameterSetName='VMSingleDestination')]
        [Parameter(ParameterSetName='VMSingleDestinationAndCimSession')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DestinationStoragePath},

        [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [ValidateNotNullOrEmpty()]
        [hashtable[]]
        ${Vhds},

        [Parameter(ParameterSetName='NameSingleDestination')]
        [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
        [Parameter(ParameterSetName='VMSingleDestination')]
        [Parameter(ParameterSetName='VMSingleDestinationAndCimSession')]
        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ResourcePoolName},

        [Parameter(ParameterSetName='NameSingleDestination')]
        [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
        [Parameter(ParameterSetName='VMSingleDestination')]
        [Parameter(ParameterSetName='VMSingleDestinationAndCimSession')]
        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
        [switch]
        ${RetainVhdCopiesOnSource},

        [Parameter(ParameterSetName='Register', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='Copy', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Path},

        [Parameter(ParameterSetName='Copy', Position=1)]
        [string]
        ${VhdDestinationPath},

        [Parameter(ParameterSetName='Register')]
        [switch]
        ${Register},

        [Parameter(ParameterSetName='Copy', Mandatory=$true)]
        [switch]
        ${Copy},

        [Parameter(ParameterSetName='Copy')]
        [string]
        ${VhdSourcePath},

        [Parameter(ParameterSetName='Copy')]
        [switch]
        ${GenerateNewId}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Complete-VMFailover {
    <#
    .SYNOPSIS
        Completes a virtual machine's failover process on the Replica server. Removes all recovery points on a failed over virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the failover process is to be completed. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose failover process is to be completed.
    .PARAMETER VM
        Specifies the virtual machine whose failover process is to be completed.
    .PARAMETER Passthru
        Indicates that this cmdlet returns the Microsoft.HyperV.PowerShell.VirtualMachine on which it operates. By default, this cmdlet does not return a value.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='High')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Connect-VMNetworkAdapter {
    <#
    .SYNOPSIS
        Connects a virtual network adapter to a virtual switch.
    .PARAMETER VMNetworkAdapter
        Specifies the virtual network adapter to be connected.
    .PARAMETER Name
        Specifies the name of the virtual network adapter to be connected.
    .PARAMETER SwitchName
        Specifies the name of the virtual switch to which the virtual network adapter is to be connected.
    .PARAMETER VMSwitch
        Specifies the virtual switch to which the virtual network adapter is to be connected.
    .PARAMETER UseAutomaticConnection
        Specifies that the network adapter is to be connected to any virtual switch in the resource pool, rather than to a specific virtual switch.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.VMNetworkAdapter object is to be passed through to the pipeline representing the virtual network adapter to be connected.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more virtual machine hosts on which the virtual network adapter is to be connected. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine in which the network adapter is to be connected.
    #>

    [CmdletBinding(DefaultParameterSetName='Name_SwitchName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapter])]
    param (
        [Parameter(ParameterSetName='Object_SwitchName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='Object_SwitchObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='Object_UseAutomaticConnection', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapter[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='Name_SwitchObject', Position=1)]
        [Parameter(ParameterSetName='Name_SwitchName', Position=1)]
        [Parameter(ParameterSetName='Name_UseAutomaticConnection', Position=1)]
        [Alias('VMNetworkAdapterName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Object_SwitchName', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='Name_SwitchName', Mandatory=$true, Position=2)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SwitchName},

        [Parameter(ParameterSetName='Name_SwitchObject', Mandatory=$true, Position=2, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='Object_SwitchObject', Mandatory=$true, Position=1, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMSwitch]
        ${VMSwitch},

        [Parameter(ParameterSetName='Object_UseAutomaticConnection', Mandatory=$true)]
        [Parameter(ParameterSetName='Name_UseAutomaticConnection', Mandatory=$true)]
        [switch]
        ${UseAutomaticConnection},

        [switch]
        ${Passthru},

        [Parameter(ParameterSetName='Name_SwitchName')]
        [Parameter(ParameterSetName='Name_UseAutomaticConnection')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name_SwitchName')]
        [Parameter(ParameterSetName='Name_UseAutomaticConnection')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name_UseAutomaticConnection')]
        [Parameter(ParameterSetName='Name_SwitchName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Name_SwitchObject', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='Name_SwitchName', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='Name_UseAutomaticConnection', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Connect-VMSan {
    <#
    .SYNOPSIS
        Associates a host bus adapter with a virtual storage area network (SAN).
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts where the host bus adapter is to be associated with the virtual storage area network (SAN). NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies the name of the virtual storage area network (SAN) with which the host bus adapter is to be associated.
    .PARAMETER HostBusAdapter
        Specifies the host bus adapter to be associated with the virtual storage area network (SAN).
    .PARAMETER WorldWideNodeName
        Specifies the world wide node name of the host bus adapter to be associated with the virtual storage area network (SAN).
    .PARAMETER WorldWidePortName
        The port world wide name of the host bus adapter to be associated with the virtual storage area network (SAN).
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.Powershell.VMSan object is to be passed through to the pipeline representing the virtual storage area network (SAN) to be associated with the host bus adapter.
    #>

    [CmdletBinding(DefaultParameterSetName='StringWwn', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSan])]
    param (
        [Parameter(ParameterSetName='StringWwn', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='StringWwn', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='StringWwn', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [Alias('SanName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='HbaObject', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [ciminstance[]]
        ${HostBusAdapter},

        [Parameter(ParameterSetName='StringWwn', Mandatory=$true)]
        [Alias('Wwnn','NodeName','Wwnns','NodeNames','WorldWideNodeNames','NodeAddress')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${WorldWideNodeName},

        [Parameter(ParameterSetName='StringWwn', Mandatory=$true)]
        [Alias('Wwpn','PortName','Wwpns','PortNames','WorldWidePortNames','PortAddress')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${WorldWidePortName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Convert-VHD {
    <#
    .SYNOPSIS
        Converts the format, version type, and block size of a virtual hard disk file.
    .PARAMETER Path
        Specifies the path to the virtual hard disk file to be converted. If a file name or relative path is specified, the path of the converted hard disk path is calculated relative to the current working directory
    .PARAMETER DestinationPath
        Specifies the path to the converted virtual hard disk file.
    .PARAMETER VHDType
        Specifies the type of the converted virtual hard disk. Allowed values are Fixed , Dynamic , and Differencing . The default is determined by the type of source virtual hard disk.
    .PARAMETER ParentPath
        Specifies the parent path for the destination-differencing virtual hard disk file.
    .PARAMETER BlockSizeBytes
        Specifies the block size, in bytes, of the virtual hard disk after conversion.
    .PARAMETER DeleteSource
        Specifies that the source virtual hard disk is to be deleted after the conversion.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the converted virtual hard disk.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual hard disk is to be converted. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.Vhd.PowerShell.VirtualHardDisk])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('FullName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Path},

        [Parameter(Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DestinationPath},

        [ValidateNotNullOrEmpty()]
        [Microsoft.Vhd.PowerShell.VhdType]
        ${VHDType},

        [ValidateNotNullOrEmpty()]
        [string]
        ${ParentPath},

        [ValidateNotNullOrEmpty()]
        [uint32]
        ${BlockSizeBytes},

        [switch]
        ${DeleteSource},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru},

        [Microsoft.Virtualization.Client.Management.VirtualHardDiskPmemAddressAbstractionType]
        ${AddressAbstractionType},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Copy-VMFile {
    <#
    .SYNOPSIS
        Copies a file to a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies an array of Hyper-V hosts. The cmdlet copies the file to the hosts you specify.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies an array of virtual machine objects by name. The cmdlet copies files to the virtual machines you specify.
    .PARAMETER VM
        Specifies an array of virtual machine objects. The cmdlet copies files to the virtual machines you specify. To obtain a virtual machine object, use the Get-VM cmdlet.
    .PARAMETER SourcePath
        Specifies a path. The cmdlet copies the file from the source path.
    .PARAMETER DestinationPath
        Specifies a path. The cmdlet copies the file to the destination path.
    .PARAMETER FileSource
        Specifies the type of a file source.
    .PARAMETER CreateFullPath
        Indicates that when the cmdlet copies a file, it creates folders if the folder does not already exist.
    .PARAMETER Force
        Forces the command to run without asking for user confirmation.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(Mandatory=$true, Position=1, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SourcePath},

        [Parameter(Mandatory=$true, Position=2)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DestinationPath},

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.CopyFileSourceType]
        ${FileSource},

        [switch]
        ${CreateFullPath},

        [switch]
        ${Force},

        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Debug-VM {
    <#
    .SYNOPSIS
        Debugs a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies an array of Hyper-V hosts. The cmdlet debugs the virtual machines on the hosts you specify.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies an array of virtual machine objects that are to be debugged. To obtain virtual machine objects, use the Get-VM cmdlet.
    .PARAMETER Name
        Specifies an array of names of virtual machines to be debugged.
    .PARAMETER Force
        Forces the command to run without asking for user confirmation.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.
    .PARAMETER InjectNonMaskableInterrupt
        Indicates that the cmdlet sends a nonmaskable interrupt (NMI) to the virtual machine. An interrupt handler must process a nonmaskable interrupt.
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [switch]
        ${Force},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru},

        [switch]
        ${InjectNonMaskableInterrupt}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Disable-VMConsoleSupport {
    <#
    .SYNOPSIS
        Disables keyboard, video, and mouse for a generation 2 virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies an array of virtual machines on which this cmdlet disables support for keyboard, video, and mouse. To obtain a VirtualMachine object, use the Get-VM cmdlet.
    .PARAMETER VMName
        Specifies an array of names of virtual machines on which this cmdlet disables support for keyboard, video, and mouse.
    .PARAMETER Passthru
        Indicates that this cmdlet returns the Microsoft.HyperV.VirtualMachine object that it modifies.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Disable-VMEventing {
    <#
    .SYNOPSIS
        Disables virtual machine eventing.
    .PARAMETER Force
        Specifies that the confirmation prompt is to be suppressed. (This is useful in scripting the cmdlet.)
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which virtual machine eventing is to be disabled. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [switch]
        ${Force},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Disable-VMIntegrationService {
    <#
    .SYNOPSIS
        Disables an integration service on a virtual machine.
    .PARAMETER VMIntegrationService
        Specifies the integration service to be disabled.
    .PARAMETER Name
        Specifies the name of the integration service to be disabled.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the integration service on a virtual machine is to be disabled. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine on which the integration service is to be disabled.
    .PARAMETER VMName
        Specifies the name of the virtual machine on which the integration service is to be disabled.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.IntegrationService object is to be passed through to the pipeline representing the integration service to be disabled.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMIntegrationComponent])]
    param (
        [Parameter(ParameterSetName='VMIntegrationService', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMIntegrationComponent[]]
        ${VMIntegrationService},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=1, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=1, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Disable-VMMigration {
    <#
    .SYNOPSIS
        Disables migration on one or more virtual machine hosts.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Passthru
        Indicates that this cmdlet returns a Microsoft.HyperV.PowerShell.Host object. By default, this cmdlet does not return a value.
    #>

    [CmdletBinding(DefaultParameterSetName='ComputerName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMHost])]
    param (
        [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ComputerName', Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ComputerName', Position=1)]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Disable-VMRemoteFXPhysicalVideoAdapter {
    <#
    .SYNOPSIS
        Disables one or more RemoteFX physical video adapters from use with RemoteFX-enabled virtual machines.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the RemoteFX physical video adapters are to be disabled. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER GPU
        Specifies one or more RemoteFX physical video adapters to disable.
    .PARAMETER Name
        Specifies an array of names of adapters. The cmdlet disables the RemoteFX physical video adapters that you specify.
    .PARAMETER Passthru
        Specifies that Microsoft.HyperV.PowerShell.VMRemoteFXPhysicalVideoAdapter objects are to be passed to the pipeline representing the RemoteFX physical video adapters to be disabled.
    #>

    [CmdletBinding(DefaultParameterSetName='GPUByName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMRemoteFXPhysicalVideoAdapter])]
    param (
        [Parameter(ParameterSetName='GPUByName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='GPUByName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='GPUByName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='GPUByObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMRemoteFXPhysicalVideoAdapter[]]
        ${GPU},

        [Parameter(ParameterSetName='GPUByName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Disable-VMResourceMetering {
    <#
    .SYNOPSIS
        Disables collection of resource utilization data for a virtual machine or resource pool.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which resource utilization data collection is to be disabled. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine on which resource utilization data collection is to be disabled.
    .PARAMETER VMName
        Specifies the friendly name of the virtual machine on which resource utilization data collection is to be disabled.
    .PARAMETER ResourcePoolName
        Specifies the friendly name of the resource pool on which resource utilization data collection is to be disabled.
    .PARAMETER ResourcePoolType
        Specifies the resource type of the resource pool on which resource utilization data collection is to be disabled.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    param (
        [Parameter(ParameterSetName='ResourcePool', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='VMName', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ResourcePool')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ResourcePool')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='ResourcePool', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ResourcePoolName},

        [Parameter(ParameterSetName='ResourcePool', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Ethernet','Memory','Processor','VHD')]
        [Microsoft.HyperV.PowerShell.VMResourcePoolType]
        ${ResourcePoolType}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Disable-VMSwitchExtension {
    <#
    .SYNOPSIS
        Disables one or more extensions on one or more virtual switches.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the extension is to be disabled. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies the name of the extension to be disabled.
    .PARAMETER VMSwitchExtension
        Specifies the extension to be disabled.
    .PARAMETER VMSwitchName
        Specifies the name of the switch on which the extension is to be disabled.
    .PARAMETER VMSwitch
        Specifies the virtual switch on which the extension is to be disabled.
    #>

    [CmdletBinding(DefaultParameterSetName='ExtensionName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitchExtension])]
    param (
        [Parameter(ParameterSetName='ExtensionNameSwitchName', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='ExtensionName', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ExtensionName')]
        [Parameter(ParameterSetName='ExtensionNameSwitchName')]
        [Alias('PSComputerName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ExtensionName')]
        [Parameter(ParameterSetName='ExtensionNameSwitchName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='ExtensionName', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='ExtensionNameSwitchName', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='ExtensionNameSwitchObject', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='ExtensionObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitchExtension[]]
        ${VMSwitchExtension},

        [Parameter(ParameterSetName='ExtensionNameSwitchName', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMSwitchName},

        [Parameter(ParameterSetName='ExtensionNameSwitchObject', Mandatory=$true, Position=1, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitch[]]
        ${VMSwitch}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Disable-VMTPM {
    <#
    .SYNOPSIS
        Disables TPM functionality on a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts to run the cmdlet. NetBIOS names, IP addresses, and fully-qualified domain names are allowable. The default is the local computer. Use "localhost" or a dot (".") to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies a user account that has permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine for which you want to disable TPM.
    .PARAMETER VMName
        Specifies the name of the virtual machine for which you want to disable TPM.
    .PARAMETER Passthru
        Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Disconnect-VMNetworkAdapter {
    <#
    .SYNOPSIS
        Disconnects a virtual network adapter from a virtual switch or Ethernet resource pool.
    .PARAMETER VMNetworkAdapter
        Specifies the virtual network adapter to be disconnected.
    .PARAMETER VMName
        Specifies the name of the virtual machine in which the virtual network adapter is to be disconnected.
    .PARAMETER Name
        Specifies the name of the virtual network adapter to be disconnected.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which a virtual network adapter is to be disconnected. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.VMNetworkAdapter object is to be passed through to the pipeline representing the virtual network adapter to be disconnected.
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapter])]
    param (
        [Parameter(ParameterSetName='Obj', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapter[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='Name', Position=1)]
        [Alias('VMNetworkAdapterName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Disconnect-VMSan {
    <#
    .SYNOPSIS
        Removes a host bus adapter from a virtual storage area network (SAN).
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which a host bus adapter is to be removed from a virtual storage area network (SAN). NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies the name of the virtual storage area network (SAN) from which the host bus adapter is to be removed.
    .PARAMETER HostBusAdapter
        Specifies the host bus adapter to be removed from the virtual storage area network (SAN).
    .PARAMETER WorldWideNodeName
        The world wide node name of the host bus adapter to be removed from the virtual storage area network (SAN).
    .PARAMETER WorldWidePortName
        The world wide port name of the host bus adapter to be removed from the virtual storage area network (SAN).
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the virtual storage area network (SAN) from which the host bus adapter is to be removed.
    #>

    [CmdletBinding(DefaultParameterSetName='StringWwn', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSan])]
    param (
        [Parameter(ParameterSetName='StringWwn', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='StringWwn')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='StringWwn')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [Alias('SanName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='HbaObject', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [ciminstance[]]
        ${HostBusAdapter},

        [Parameter(ParameterSetName='StringWwn', Mandatory=$true)]
        [Alias('Wwnn','NodeName','Wwnns','NodeNames','WorldWideNodeNames','NodeAddress')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${WorldWideNodeName},

        [Parameter(ParameterSetName='StringWwn', Mandatory=$true)]
        [Alias('Wwpn','PortName','Wwpns','PortNames','WorldWidePortNames','PortAddress')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${WorldWidePortName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Dismount-VHD {
    <#
    .SYNOPSIS
        Dismounts a virtual hard disk.
    .PARAMETER DiskNumber
        Specifies the disk number of the virtual hard disk to be dismounted.
    .PARAMETER Path
        Specifies one or more virtual hard disk files for which the corresponding virtual hard disks are to be dismounted.
    .PARAMETER SnapshotId
        Specifies the unique ID of a VHD set snapshot.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the virtual hard disk to be dismounted.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which a virtual hard disk is to be dismounted. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='Path', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.Vhd.PowerShell.VirtualHardDisk])]
    param (
        [Parameter(ParameterSetName='Disk', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [Alias('Number')]
        [ValidateNotNullOrEmpty()]
        [uint32]
        ${DiskNumber},

        [Parameter(ParameterSetName='Path', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('FullName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Path},

        [Parameter(ParameterSetName='Path', ValueFromPipelineByPropertyName=$true)]
        [System.Nullable[guid]]
        ${SnapshotId},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Dismount-VMHostAssignableDevice {
    <#
    .SYNOPSIS
        Dismount-VMHostAssignableDevice [[-InstancePath] <string>] [[-LocationPath] <string>] [-Force] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='ComputerName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMHostAssignableDevice])]
    param (
        [Parameter(Position=2)]
        [string]
        ${InstancePath},

        [Parameter(Position=3)]
        [string]
        ${LocationPath},

        [Parameter(Position=4)]
        [switch]
        ${Force},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Enable-VMConsoleSupport {
    <#
    .SYNOPSIS
        Enables keyboard, video, and mouse for virtual machines.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies an array of virtual machines on which this cmdlet enables support for keyboard, video, and mouse. To obtain a VirtualMachine object, use the Get-VM cmdlet.
    .PARAMETER VMName
        Specifies an array of names of virtual machines on which this cmdlet enables support keyboard, video, and mouse.
    .PARAMETER Passthru
        Indicates that this cmdlet returns the Microsoft.HyperV.VirtualMachine object that it modifies.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Enable-VMEventing {
    <#
    .SYNOPSIS
        Enables virtual machine eventing.
    .PARAMETER Force
        Specifies that the confirmation prompt is to be suppressed. (This is useful in scripting the cmdlet.)
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which virtual machine eventing is to be enabled. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [switch]
        ${Force},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Enable-VMIntegrationService {
    <#
    .SYNOPSIS
        Enables an integration service on a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which an integration service is to be enabled. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMIntegrationService
        Specifies the integration service to be enabled.
    .PARAMETER Name
        Specifies the name of the integration service to be enabled.
    .PARAMETER VM
        Specifies the virtual machine on which the integration service is to be enabled.
    .PARAMETER VMName
        Specifies the name of the virtual machine on which the integration service is to be enabled.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.IntegrationService object is to be passed through to the pipeline representing the integration service to be enabled.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMIntegrationComponent])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMIntegrationService', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMIntegrationComponent[]]
        ${VMIntegrationService},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=1, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=1, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Enable-VMMigration {
    <#
    .SYNOPSIS
        Enables migration on one or more virtual machine hosts.
    .PARAMETER Passthru
        Indicates that this cmdlet returns a Microsoft.HyperV.PowerShell.Host object.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='ComputerName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMHost])]
    param (
        [switch]
        ${Passthru},

        [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ComputerName', Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ComputerName', Position=1)]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Enable-VMRemoteFXPhysicalVideoAdapter {
    <#
    .SYNOPSIS
        Enables one or more RemoteFX physical video adapters for use with RemoteFX-enabled virtual machines.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the RemoteFX physical video adapters are to be enabled. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER GPU
        Specifies the RemoteFX physical video adapters to be enabled.
    .PARAMETER Name
        Specifies an array of names of adapters. The cmdlet enables the RemoteFX physical video adapters that you specify.
    .PARAMETER Passthru
        Specifies that one or more Microsoft.HyperV.PowerShell.VMRemoteFXPhysicalVideoAdapter objects are to be passed through to the pipeline representing the RemoteFX physical video adapters to be enabled.
    #>

    [CmdletBinding(DefaultParameterSetName='GPUByName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMRemoteFXPhysicalVideoAdapter])]
    param (
        [Parameter(ParameterSetName='GPUByName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='GPUByName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='GPUByName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='GPUByObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMRemoteFXPhysicalVideoAdapter[]]
        ${GPU},

        [Parameter(ParameterSetName='GPUByName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Enable-VMReplication {
    <#
    .SYNOPSIS
        Enables replication of a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that have the virtual machines for which you want to enable replication. NetBIOS names, IP addresses, and fully qualified domain names (FQDN) are allowed. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine you want to configure for replication.
    .PARAMETER VM
        Specifies the virtual machine you want to configure for replication.
    .PARAMETER ReplicaServerName
        Specifies the name of the Replica server to which this virtual machine will be replicated.
    .PARAMETER ReplicaServerPort
        Specifies the port on the Replica server to use for replication traffic. Make sure you specify a port that is configured on the Replica server to support the same authentication type you specify using the AuthenticationType parameter in this cmdlet. Run the Get-VMReplicationServer cmdlet on the Replica server to check the configuration of the port, or contact the administrator of the specified Replica server.
    .PARAMETER AuthenticationType
        Specifies the authentication type to use for virtual machine replication, either Kerberos or Certificate. The specified Replica server must support the chosen authentication type. Run the Get-VMReplicationServer cmdlet to verify the authentication configured for the specified Replica server, or contact the administrator of the specified Replica server.
    .PARAMETER CertificateThumbprint
        Specifies the certificate to use for mutual authentication of the replication data. This parameter is required only when "Certificate" is specified as the type of authentication. Specify the thumbprint of a valid computer certificate from the Personal store.

        The certificate must have all of the following properties to be valid: - It must not be expired.

        - It must include both client and server authentication extensions for extended key usage (EKU), and an associated private key.

        - It must terminate at a valid root certificate.

        The requirement for the subject common name (CN) differs depending on whether the virtual machine belongs to a cluster. For virtual machines that do not belong to a cluster, the subject common name (CN) must be equal to, or subject alternative name (DNS Name) should contain, the FQDN of the host. For virtual machines that belong to a cluster, the subject common name (CN) must be equal to, or subject alternative name (DNS Name) must contain, the and fully qualified domain name (FQDN) of the Hyper-V Replica Broker.

        To display a list of certificates in the computer's My store and the thumbprint of each certificate, type the following:

        `PS C:\> cd cert:\LocalMachine\My`

        `PS C:\> dir | format-list`
        For more information about certificate stores, see http://technet.microsoft.com//library/cc757138.aspx (http://technet.microsoft.com//library/cc757138.aspx).

    .PARAMETER CompressionEnabled
        Specifies whether to compress replication data for this virtual machine when it is sent over the network.
    .PARAMETER ReplicateHostKvpItems
        Specifies whether to replicate host-only key value pairs (KVP) for this virtual machine.
    .PARAMETER BypassProxyServer
        Specifies whether to bypass a proxy server while replicating data to the Replica server.
    .PARAMETER EnableWriteOrderPreservationAcrossDisks
        Determines whether all virtual hard disks selected for replication are replicated to the same point in time. This is useful if the virtual machine runs an application that saves data across virtual hard disks (for example, one virtual hard disk dedicated for application data, and another virtual hard disk dedicated for application log files).
    .PARAMETER VSSSnapshotFrequencyHour
        Specifies the frequency, in hours, at which Volume Shadow Copy Service (VSS) performs a snapshot backup of the virtual machines. Specify this parameter only if application-consistent replication is enabled for the virtual machines and the value you set for the RecoveryHistory parameter is not zero. The cmdlet sets a value of zero for this parameter if application-consistent replication is disabled. Do not specify this parameter if you are extending replication from the Replica virtual machine.
    .PARAMETER RecoveryHistory
        Specifies whether to store additional recovery points on the replica virtual machine. Storing more than the most recent recovery point of the primary virtual machine allows you to recover to an earlier point in time. However, storing additional recovery points requires more storage and processing resources. You can configure as many as 24 recovery points to be stored.
    .PARAMETER ReplicationFrequencySec
        Specifies the frequency, in seconds, at which Hyper-V replicates changes to the Replica server.
    .PARAMETER ExcludedVhd
        Specifies one or more virtual hard disks to exclude from replication (for example, a virtual hard disk dedicated for the paging file). Be careful not to exclude virtual hard disks that are critical to the virtual machine's ability to start up, such as the virtual hard disk that stores the guest operating system. Excluding a critical disk could prevent the replica virtual machine from starting up properly.
    .PARAMETER ExcludedVhdPath
        Specifies the fully qualified path names to the virtual hard disks to exclude from replication.
    .PARAMETER AutoResynchronizeEnabled
        Enables replicating virtual machines that require resynchronization to be resynchronized automatically. (For example, a virtual machine requires resynchronization if the primary server shuts down abruptly). Resynchronization requires significant storage and processing resources. We recommended scheduling resynchronization during off-peak hours to reduce the impact to the host and other virtual machines running on the host. Use the AutoResynchronizeIntervalStart and AutoResynchronizeIntervalEnd parameters to specify an off-peak time to start the automatic resynchronization.
    .PARAMETER AutoResynchronizeIntervalStart
        Specifies the start of the time period in which you want resynchronization to start automatically.
    .PARAMETER AutoResynchronizeIntervalEnd
        Specifies the end of the time period in which you want resynchronization to start automatically.
    .PARAMETER AsReplica
        Specifies that the virtual machine is a replica virtual machine, enabling it to be used as the source for the initial replication of the primary virtual machine.
    .PARAMETER AllowedPrimaryServer
        When you use the AsReplica parameter to specify a virtual machine as a replica virtual machine, this parameter determines which primary servers can send replication to the replica virtual machine. Replication is accepted only from the server specified in the chosen authentication entry, or any other authentication entry that has the same trust group.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMReplication])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMName_AsReplica')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMName_AsReplica')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMName_AsReplica')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='VMName_AsReplica', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='VMObject_AsReplica', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=1)]
        [Alias('ReplicaServer')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ReplicaServerName},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=2)]
        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=2)]
        [Alias('ReplicaPort')]
        [ValidateRange(1, 65535)]
        [int]
        ${ReplicaServerPort},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=3)]
        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=3)]
        [Alias('AuthType')]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.ReplicationAuthenticationType]
        ${AuthenticationType},

        [Parameter(ParameterSetName='VMName', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='VMObject', ValueFromPipelineByPropertyName=$true)]
        [Alias('Thumbprint','Cert')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${CertificateThumbprint},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${CompressionEnabled},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${ReplicateHostKvpItems},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${BypassProxyServer},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${EnableWriteOrderPreservationAcrossDisks},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Alias('VSSFreq')]
        [ValidateRange(1, 12)]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${VSSSnapshotFrequencyHour},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Alias('RecHist')]
        [ValidateRange(0, 24)]
        [System.Nullable[int]]
        ${RecoveryHistory},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Alias('RepFreq')]
        [ValidateRange(30, 900)]
        [System.Nullable[int]]
        ${ReplicationFrequencySec},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.HardDiskDrive[]]
        ${ExcludedVhd},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ExcludedVhdPath},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Alias('AutoResync')]
        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${AutoResynchronizeEnabled},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Alias('AutoResyncStart')]
        [ValidateNotNull()]
        [System.Nullable[timespan]]
        ${AutoResynchronizeIntervalStart},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Alias('AutoResyncEnd')]
        [ValidateNotNull()]
        [System.Nullable[timespan]]
        ${AutoResynchronizeIntervalEnd},

        [Parameter(ParameterSetName='VMObject_AsReplica')]
        [Parameter(ParameterSetName='VMName_AsReplica')]
        [switch]
        ${AsReplica},

        [Parameter(ParameterSetName='VMName_AsReplica', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='VMObject_AsReplica', ValueFromPipelineByPropertyName=$true)]
        [Alias('AllowedPS')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${AllowedPrimaryServer},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Enable-VMResourceMetering {
    <#
    .SYNOPSIS
        Collects resource utilization data for a virtual machine or resource pool.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies the virtual machine host or hosts on which resource utilization data collection is to be enabled. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine for which you want to collect resource utilization data.
    .PARAMETER VMName
        Specifies the friendly name of the virtual machine for which you want to collect resource utilization data.
    .PARAMETER ResourcePoolName
        Specifies the friendly name of the resource pool for which you want to collect resource utilization data.
    .PARAMETER ResourcePoolType
        Specifies the resource type of the resource pool for which you want to collect resource utilization data.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    param (
        [Parameter(ParameterSetName='ResourcePool', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='VMName', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ResourcePool')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ResourcePool')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='ResourcePool', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ResourcePoolName},

        [Parameter(ParameterSetName='ResourcePool', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Ethernet','Memory','Processor','VHD')]
        [Microsoft.HyperV.PowerShell.VMResourcePoolType]
        ${ResourcePoolType}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Enable-VMSwitchExtension {
    <#
    .SYNOPSIS
        Enables one or more extensions on one or more switches.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which an extension is to be enabled. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies the name of the network extension to be enabled.
    .PARAMETER VMSwitchExtension
        Specifies the extension to be enabled.
    .PARAMETER VMSwitchName
        Specifies the name of the switch on which the extension is to be enabled.
    .PARAMETER VMSwitch
        Specifies the virtual switch on which the extension is to be enabled.
    #>

    [CmdletBinding(DefaultParameterSetName='ExtensionName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitchExtension])]
    param (
        [Parameter(ParameterSetName='ExtensionNameSwitchName', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='ExtensionName', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ExtensionName')]
        [Parameter(ParameterSetName='ExtensionNameSwitchName')]
        [Alias('PSComputerName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ExtensionName')]
        [Parameter(ParameterSetName='ExtensionNameSwitchName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='ExtensionName', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='ExtensionNameSwitchName', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='ExtensionNameSwitchObject', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='ExtensionObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitchExtension[]]
        ${VMSwitchExtension},

        [Parameter(ParameterSetName='ExtensionNameSwitchName', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMSwitchName},

        [Parameter(ParameterSetName='ExtensionNameSwitchObject', Mandatory=$true, Position=1, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitch[]]
        ${VMSwitch}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Enable-VMTPM {
    <#
    .SYNOPSIS
        Enables TPM functionality on a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession or Get-CimSession cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts to run the cmdlet. NetBIOS names, IP addresses, and fully-qualified domain names are allowable. The default is the local computer. Use "localhost" or a dot (".") to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies a user account that has permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine for which to enable TPM.
    .PARAMETER VMName
        Specifies the name of the virtual machine for which to enable TPM.
    .PARAMETER Passthru
        Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Export-VM {
    <#
    .SYNOPSIS
        Exports a virtual machine to disk.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual machine is to be exported. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine to be exported.
    .PARAMETER Name
        Specifies the name of the virtual machine to be exported.
    .PARAMETER Path
        Specifies the path to the folder into which the virtual machine is to be exported.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.VirtualMachine object is to be passed through to the pipeline representing the virtual machine to be exported.
    .PARAMETER CaptureLiveState
        Specifies how Hyper-V captures the running virtual machine memory state. The acceptable values for this parameter are:

        - CaptureSavedState. Include memory state.  - CaptureDataConsistentState. Use Production Checkpoint technology.  - CaptureCrashConsistentState. Do nothing to handle virtual machine state.
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(Mandatory=$true, Position=1)]
        [string]
        ${Path},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru},

        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.CaptureLiveState]]
        ${CaptureLiveState}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Export-VMSnapshot {
    <#
    .SYNOPSIS
        Exports a virtual machine checkpoint to disk.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual machine checkpoint is to be exported. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine of which the checkpoint is to be exported.
    .PARAMETER VMSnapshot
        Specifies the checkpoint to be exported.
    .PARAMETER Name
        Specifies the name of the checkpoint to be exported.
    .PARAMETER Path
        Specifies the path to the folder into which the checkpoint is to be exported.
    .PARAMETER VMName
        Specifies the name of the virtual machine of which the checkpoint is to be exported.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that a VMSnapshot object is to be passed through to the pipeline representing the checkpoint to be exported.
    #>

    [CmdletBinding(DefaultParameterSetName='SnapshotName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSnapshot])]
    param (
        [Parameter(ParameterSetName='SnapshotName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='SnapshotName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='SnapshotName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='SnapshotObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot[]]
        ${VMSnapshot},

        [Parameter(ParameterSetName='SnapshotName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='VMObject', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Path},

        [Parameter(ParameterSetName='SnapshotName', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VHD {
    <#
    .SYNOPSIS
        Gets the virtual hard disk object associated with a virtual hard disk.
    .PARAMETER DiskNumber
        Specifies the disk number associated with the virtual hard disk to be retrieved.
    .PARAMETER Path
        Specifies the path to the virtual hard disk file of the virtual hard disk to be retrieved. If a filename or relative path is specified, the path is calculated relative to the current working directory.
    .PARAMETER VMId
        Specifies the virtual machine identifier of the virtual machine whose virtual hard disks are to be retrieved.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which a virtual hard disk is to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='Path')]
    [OutputType([Microsoft.Vhd.PowerShell.VirtualHardDisk])]
    param (
        [Parameter(ParameterSetName='Disk', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [Alias('Number')]
        [ValidateNotNullOrEmpty()]
        [uint32]
        ${DiskNumber},

        [Parameter(ParameterSetName='Path', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('FullName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Path},

        [Parameter(ParameterSetName='VMId', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('Id')]
        [ValidateNotNullOrEmpty()]
        [guid[]]
        ${VMId},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VHDSet {
    <#
    .SYNOPSIS
        Gets information about a VHD set.
    .PARAMETER Path
        Specifies an array of paths of VHD set files that this cmdlet gets. If you specify a file name or a relative path, the cmdlet determines the full path relative to the current working folder.
    .PARAMETER GetAllPaths
        Indicates that this cmdlet gets the paths of all files on which this VHD set file depends.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding()]
    [OutputType([Microsoft.Vhd.PowerShell.VHDSetInfo])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('FullName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Path},

        [switch]
        ${GetAllPaths},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VHDSnapshot {
    <#
    .SYNOPSIS
        Gets information about a checkpoint in a VHD set.
    .PARAMETER Path
        Specifies an array of paths of VHD set files from which this cmdlet gets checkpoints. If you specify a file name or relative path, the cmdlet determines the full path relative to the current working folder.
    .PARAMETER GetParentPaths
        Gets the paths of all files on which this VHD checkpoint depends.
    .PARAMETER SnapshotId
        Specifies an array of unique IDs of VHD checkpoints that this cmdlet gets from a VHD set file.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this command. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding()]
    [OutputType([Microsoft.Vhd.PowerShell.VHDSnapshotInfo])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('FullName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Path},

        [switch]
        ${GetParentPaths},

        [guid[]]
        ${SnapshotId},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VM {
    <#
    .SYNOPSIS
        Gets the virtual machines from one or more Hyper-V hosts.
    .PARAMETER Name
        Specifies the name of the virtual machine to be retrieved.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts from which virtual machines are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Id
        Specifies the identifier of the virtual machine to be retrieved.
    .PARAMETER ClusterObject
        Specifies the cluster resource or cluster group of the virtual machine to be retrieved.
    #>

    [CmdletBinding(DefaultParameterSetName='Name')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='Name', Position=0, ValueFromPipeline=$true)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Name')]
        [Parameter(ParameterSetName='Id')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [Parameter(ParameterSetName='Id')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [Parameter(ParameterSetName='Id')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Id', Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [System.Nullable[guid]]
        ${Id},

        [Parameter(ParameterSetName='ClusterObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [PSTypeName('Microsoft.FailoverClusters.PowerShell.ClusterObject')]
        [psobject]
        ${ClusterObject}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMAssignableDevice {
    <#
    .SYNOPSIS
        Get-VMAssignableDevice [-VMName] <string[]> [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [<CommonParameters>]

Get-VMAssignableDevice [-VM] <VirtualMachine[]> [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMAssignedDevice])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMBios {
    <#
    .SYNOPSIS
        Gets the BIOS of a virtual machine or snapshot.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the BIOS of a virtual machine or snapshot is to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine whose BIOS is to be retrieved.
    .PARAMETER VMSnapshot
        Specifies the virtual machine snapshot whose BIOS is to be retrieved.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose BIOS is to be retrieved.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMBios])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMComPort {
    <#
    .SYNOPSIS
        Gets the COM ports of a virtual machine or snapshot.
    .PARAMETER VM
        Specifies the virtual machine whose COM ports are to be retrieved.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose COM ports are to be retrieved.
    .PARAMETER VMSnapshot
        Specifies the snapshot whose COM ports are to be retrieved.
    .PARAMETER Number
        Specifies the Id (1 or 2) of the COM ports to be retrieved.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the COM ports of a virtual machine or snapshot are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMComPort])]
    param (
        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(Position=1)]
        [ValidateRange(1, 2)]
        [int]
        ${Number},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMConnectAccess {
    <#
    .SYNOPSIS
        Gets entries showing users and the virtual machines to which they can connect on one or more Hyper-V hosts.
    .PARAMETER VMId
        Specifies the unique identifier of a virtual machine for which connect access entries are being sought.
    .PARAMETER VMName
        Specifies the name of the virtual machine for which connect access entries are being sought.
    .PARAMETER UserName
        Specifies the user or users for whom connect access entries are being sought.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMConnectAce])]
    param (
        [Parameter(ParameterSetName='VMId', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [guid[]]
        ${VMId},

        [Parameter(ParameterSetName='VMName', Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [Alias('UserId','Sid')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${UserName},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMDvdDrive {
    <#
    .SYNOPSIS
        Gets the DVD drives attached to a virtual machine or snapshot.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts from which the DVD drives are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine from which the DVD drives are to be retrieved.
    .PARAMETER VM
        Specifies the virtual machine from which the DVD drives are to be retrieved.
    .PARAMETER ControllerLocation
        Specifies the number of the location on the controller from which the DVD drives are to be retrieved.
    .PARAMETER ControllerNumber
        Specifies the number of the controller from which the DVD drives are to be retrieved.
    .PARAMETER VMDriveController
        Specifies the controller from which the DVD drives are to be retrieved.
    .PARAMETER VMSnapshot
        Specifies the virtual machine snapshot from which the DVD drives are to be retrieved.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.DvdDrive])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ControllerLocation},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMSnapshot')]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ControllerNumber},

        [Parameter(ParameterSetName='VMDriveController', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMDriveController[]]
        ${VMDriveController},

        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMFibreChannelHba {
    <#
    .SYNOPSIS
        Gets the Fibre Channel host bus adapters associated with one or more virtual machines.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the Fibre Channel host bus adapters are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies a virtual machine or machines for which the Fibre Channel host bus adapters are to be retrieved.
    .PARAMETER VMName
        Specifies the friendly name or names of the virtual machines for which the Fibre Channel host bus adapters are to be retrieved.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMFibreChannelHba])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMFirmware {
    <#
    .SYNOPSIS
        Gets the firmware configuration of a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies an array of Hyper-V hosts. The cmdlet gets the virtual machine firmware from the hosts you specify.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies an array of virtual machine objects. The cmdlet gets the firmware configuration for the virtual machines you specify. To obtain a virtual machine object, use the Get-VM cmdlet.
    .PARAMETER VMSnapshot
        Specifies the virtual machine snapshot to be used with the VM when retrieving the firmware configuration.
    .PARAMETER VMName
        Specifies an array of names of virtual machines. The cmdlet gets the firmware configuration for the virtual machines you specify.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMFirmware])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMFloppyDiskDrive {
    <#
    .SYNOPSIS
        Gets the floppy disk drives of a virtual machine or snapshot.
    .PARAMETER VMSnapshot
        Specifies the snapshot whose floppy disk drives are to be retrieved.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which floppy disk drives are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine whose floppy disk drives are to be retrieved.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose floppy disk drives are to be retrieved.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMFloppyDiskDrive])]
    param (
        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMGpuPartitionAdapter {
    <#
    .SYNOPSIS
        Get-VMGpuPartitionAdapter [-VMName] <string[]> [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-AdapterId <string>] [<CommonParameters>]

Get-VMGpuPartitionAdapter [-VMSnapshot] <VMSnapshot> [<CommonParameters>]

Get-VMGpuPartitionAdapter [-VM] <VirtualMachine[]> [-AdapterId <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMGpuPartitionAdapter])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${AdapterId}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMGroup {
    <#
    .SYNOPSIS
        Gets virtual machine groups.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies an array of names of virtual machine groups that this cmdlet gets.
    .PARAMETER Id
        Specifies the unique ID of the virtual machine group that this cmdlet gets.
    #>

    [CmdletBinding(DefaultParameterSetName='Name')]
    [OutputType([Microsoft.HyperV.PowerShell.VMGroup])]
    param (
        [Parameter(ParameterSetName='Name')]
        [Parameter(ParameterSetName='Id')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [Parameter(ParameterSetName='Id')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [Parameter(ParameterSetName='Id')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Name', Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Id', Position=0)]
        [ValidateNotNullOrEmpty()]
        [guid]
        ${Id}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMHardDiskDrive {
    <#
    .SYNOPSIS
        Gets the virtual hard disk drives attached to one or more virtual machines.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts from which the virtual hard disk drives are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine from which the virtual hard disks drives are to be retrieved.
    .PARAMETER VM
        Specifies the virtual machine from which the virtual hard disk drives are to be retrieved.
    .PARAMETER VMSnapshot
        Specifies the snapshot from which the virtual hard disk drives are to be retrieved.
    .PARAMETER ControllerLocation
        Specifies the number of the location on the controller at which the virtual hard disk drives are to be retrieved. If not specified, the number of the first available location on the controller is used.
    .PARAMETER VMDriveController
        Specifies the drive controller from which the virtual hard disk drives are to be retreived.
    .PARAMETER ControllerNumber
        Specifies the number of the controller at which the virtual hard disk drives are to be retrieved. If not specified, the first controller on which the specified ControllerLocation is available is used.
    .PARAMETER ControllerType
        Specifies the type of the controller from which the virtual hard disk drives are to be retrieved. Allowed values are Floppy , IDE , and SCSI .
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.HardDiskDrive])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ControllerLocation},

        [Parameter(ParameterSetName='VMDriveController', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMDriveController[]]
        ${VMDriveController},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMSnapshot')]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ControllerNumber},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMSnapshot')]
        [System.Nullable[Microsoft.HyperV.PowerShell.ControllerType]]
        ${ControllerType}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMHost {
    <#
    .SYNOPSIS
        Gets a Hyper-V host.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='ComputerName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMHost])]
    param (
        [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ComputerName', Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ComputerName', Position=1, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMHostAssignableDevice {
    <#
    .SYNOPSIS
        Get-VMHostAssignableDevice [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [<CommonParameters>]
    #>

    [CmdletBinding()]
    [OutputType([Microsoft.HyperV.PowerShell.VMHostAssignableDevice])]
    param (
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMHostCluster {
    <#
    .SYNOPSIS
        Gets virtual machine host clusters.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ClusterName
        Specifies an array of names of the virtual machine host clusters that this cmdlet gets.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='ClusterName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMHostCluster])]
    param (
        [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ClusterName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ClusterName},

        [Parameter(ParameterSetName='ClusterName', Position=1, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMHostNumaNode {
    <#
    .SYNOPSIS
        Gets the NUMA topology of a virtual machine host.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Id
        Identifies a NUMA node for which a VMHostNumaNode is to be retrieved.
    #>

    [CmdletBinding(DefaultParameterSetName='ComputerName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMHostNumaNode])]
    param (
        [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ComputerName', Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ComputerName', Position=1)]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${Id}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMHostNumaNodeStatus {
    <#
    .SYNOPSIS
        Gets the status of the virtual machines on the non-uniform memory access (NUMA) nodes of a virtual machine host or hosts.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Id
        Identifies a NUMA node for which virtual machine status is to be retrieved.
    #>

    [CmdletBinding(DefaultParameterSetName='ComputerName')]
    [OutputType([Microsoft.HyperV.PowerShell.Commands.GetVMHostNumaNodeStatus])]
    param (
        [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ComputerName', Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ComputerName', Position=1)]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${Id}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMHostSupportedVersion {
    <#
    .SYNOPSIS
        Returns a list of virtual machine configuration versions that are supported on a host.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts to run the cmdlet. NetBIOS names, IP addresses, and fully-qualified domain names are allowable. The default is the local computer. Use "localhost" or a dot (".") to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies a user account that has permission to perform this action. The default is the current user.
    .PARAMETER Default
        Specifies that the cmdlet is to return the default virtual machine configuration version for this host.
    #>

    [CmdletBinding(DefaultParameterSetName='ComputerName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMHostSupportedVersion])]
    param (
        [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ComputerName', Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ComputerName', Position=1)]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [switch]
        ${Default}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMIdeController {
    <#
    .SYNOPSIS
        Gets the IDE controllers of a virtual machine or snapshot.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the IDE controllers of a virtual machine or snapshot are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine whose IDE controllers are to be retrieved.
    .PARAMETER VMSnapshot
        Specifies the snapshot whose IDE controllers are to be retrieved.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose IDE controllers are to be retrieved.
    .PARAMETER ControllerNumber
        Specifies the number of the IDE controller to be retrieved. Allowed values are 0 and 1.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMIdeController])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(Position=1)]
        [ValidateNotNull()]
        [ValidateRange(0, 1)]
        [System.Nullable[int]]
        ${ControllerNumber}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMIntegrationService {
    <#
    .SYNOPSIS
        Gets the integration services of a virtual machine or snapshot.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the integration services are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine from which the integration services are to be retrieved.
    .PARAMETER VMSnapshot
        Specifies the snapshot from which the integration services are to be retrieved.
    .PARAMETER VMName
        Specifies the name of the virtual machine from which the integration services are to be retrieved.
    .PARAMETER Name
        Specifies the name of the integration service to be retrieved.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMIntegrationComponent])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(Position=1)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMKeyProtector {
    <#
    .SYNOPSIS
        Retrieves a key protector for a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts to run the cmdlet. NetBIOS names, IP addresses, and fully-qualified domain names are allowable. The default is the local computer. Use "localhost" or a dot (".") to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies a user account that has permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine for which the cmdlet gets a key protector.
    .PARAMETER VMName
        Specifies the name of the virtual machine for which the cmdlet gets a key protector.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMKeyStorageDrive {
    <#
    .SYNOPSIS
        Get-VMKeyStorageDrive [-VMName] <string[]> [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-ControllerLocation <int>] [-ControllerNumber <int>] [<CommonParameters>]

Get-VMKeyStorageDrive [-VM] <VirtualMachine[]> [-ControllerLocation <int>] [-ControllerNumber <int>] [<CommonParameters>]

Get-VMKeyStorageDrive [-VMDriveController] <VMDriveController[]> [-ControllerLocation <int>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.KeyStorageDrive])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ControllerLocation},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ControllerNumber},

        [Parameter(ParameterSetName='VMDriveController', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMDriveController[]]
        ${VMDriveController}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMMemory {
    <#
    .SYNOPSIS
        Gets the memory of a virtual machine or snapshot.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the memory of a virtual machine or snapshot is to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine whose memory is to be retrieved.
    .PARAMETER VMSnapshot
        Specifies the snapshot whose memory is to be retrieved.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose memory is to be retrieved.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMMemory])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMMigrationNetwork {
    <#
    .SYNOPSIS
        Gets the networks added for migration to one or more virtual machine hosts.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the networks added for migration are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Subnet
        Specifies a string representing an IPv4 or IPv6 subnet mask which identifies the networks to be retrieved.
    .PARAMETER Priority
        Specifies the priority of the networks to be retrieved.
    #>

    [CmdletBinding()]
    [OutputType([Microsoft.HyperV.PowerShell.VMMigrationNetwork])]
    param (
        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Subnet},

        [ValidateNotNullOrEmpty()]
        [uint32[]]
        ${Priority}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMNetworkAdapter {
    <#
    .SYNOPSIS
        Gets the virtual network adapters of a virtual machine, snapshot, management operating system, or of a virtual machine and management operating system.
    .PARAMETER IsLegacy
        Specify as $TRUE to retrieve only legacy network adapters, or as $FALSE to retrieve only Hyper-V-specific network adapters. If not specified, virtual network adapters of both types are retrieved.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on the virtual network adapters are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine whose virtual network adapters are to be retrieved. . The asterisk, "*", is the wildcard. If it is specified the cmdlet returns virtual network adapters from every virtual machine in the system.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose network adapters are to be retrieved.
    .PARAMETER Name
        Specifies the name of the network adapter to be retrieved.
    .PARAMETER All
        Specifies all virtual network adapters in the system, regardless of whether the virtual network adapter is in the management operating system or in a virtual machine.
    .PARAMETER ManagementOS
        Specifies the management operating system, i.e. the virtual machine host operating system.
    .PARAMETER VMSnapshot
        Specifies the snapshot whose network adapters are to be retrieved.
    .PARAMETER SwitchName
        Specifies the name of the virtual switch whose network adapters are to be retrieved. (This parameter is available only for virtual network adapters in the management operating system.)
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterBase])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [bool]
        ${IsLegacy},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='All')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='All')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='All')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(Position=1)]
        [Alias('VMNetworkAdapterName')]
        [string]
        ${Name},

        [Parameter(ParameterSetName='All', Mandatory=$true)]
        [switch]
        ${All},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SwitchName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMNetworkAdapterAcl {
    <#
    .SYNOPSIS
        Gets the ACLs configured for a virtual machine network adapter.
    .PARAMETER VMSnapshot
        Specifies the snapshot in which the ACLs configured for a virtual machine network adapter are to be retrieved.
    .PARAMETER VMName
        Specifies the name of the virtual machine in which the ACLs configured for a virtual machine network adapter are to be retrieved.
    .PARAMETER VMNetworkAdapter
        Specifies the virtual network adapter for which the configured ACLs are to be retrieved.
    .PARAMETER ManagementOS
        Specifies that the ACLs are to be configured in the management (i.e. the parent, or host) operating system.
    .PARAMETER VMNetworkAdapterName
        Specifies the virtual network adapter name for which the configured ACLs are to be retrieved.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the ACLs configured for a virtual machine network adapter are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine in which the ACLs configured for a virtual machine network adapter are to be retrieved.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterAclSetting])]
    param (
        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='VMName', Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='ManagementOS')]
        [string]
        ${VMNetworkAdapterName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMNetworkAdapterExtendedAcl {
    <#
    .SYNOPSIS
        Gets extended ACLs configured for a virtual network adapter.
    .PARAMETER VMSnapshot
        Specifies a snapshot as a VMSnapshot object. The cmdlet gets ACLs for network adapters that belong to the snapshot that you specify. To obtain a snapshot, use the Get-VMSnapshot cmdlet.
    .PARAMETER VMName
        Specifies an array of names of VMs. The cmdlet gets ACLs associated with network adapters that belong to the VMs that you specify.
    .PARAMETER VMNetworkAdapter
        Specifies an array of virtual network adapter objects. The cmdlet gets ACLs associated with the adapters that you specify. To obtain a network adapter, use the Get-VMNetworkAdapter cmdlet.
    .PARAMETER ManagementOS
        Indicates that the cmdlet operates on the parent or host operating system. If you specify this parameter, this cmdlet gets ACLs associated with network adapters in the parent or host operating system.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of a virtual network adapter. The cmdlet gets extended ACLs associated with the adapter that you specify.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies an array of Hyper-V hosts. The cmdlet gets the ACLs associated with the virtual network adapters on the Hyper-V hosts that you specify.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies an array of virtual machines as VirtualMachine objects. The cmdlet gets ACLs for network adapters that belong to the virtual machines that you specify. To obtain a virtual machine object, use the Get-VM cmdlet.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterExtendedAclSetting])]
    param (
        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='VMName', Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='ManagementOS')]
        [string]
        ${VMNetworkAdapterName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMNetworkAdapterFailoverConfiguration {
    <#
    .SYNOPSIS
        Gets the IP address of a virtual network adapter configured to be used when a virtual machine fails over.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the IP address configuration of a virtual network adapter is to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine for which you want to get the IP address configuration of a virtual network adapter.
    .PARAMETER VM
        Specifies the virtual machine for which you want to get the IP address configuration of a virtual network adapter.
    .PARAMETER VMNetworkAdapter
        Specifies the virtual network adapter whose IP address configuration you want to get.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of the virtual network adapter whose IP address configuration you want to get.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterFailoverSetting])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapter[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [string]
        ${VMNetworkAdapterName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMNetworkAdapterIsolation {
    <#
    .SYNOPSIS
        Gets isolation settings for a virtual network adapter.
    .PARAMETER VMSnapshot
        Specifies a snapshot as a VMSnapshot object. The cmdlet gets isolation settings for network adapters that belong to the snapshot that you specify. To obtain a snapshot, use the Get-VMSnapshot cmdlet.
    .PARAMETER VMName
        Specifies an array of names of virtual machines. The cmdlet gets isolation settings for adapters that belong to the virtual machines that you specify.
    .PARAMETER VMNetworkAdapter
        Specifies an array virtual machine network adapters as VMNetworkAdapterBase objects. The cmdlet gets isolation settings for the adapters that you specify. To obtain a network adapter, use the Get-VMNetworkAdapter cmdlet.
    .PARAMETER ManagementOS
        Indicates that the cmdlet operates on the parent or host operating system. If you specify this parameter, this cmdlet gets isolation settings for the parent or host operating system.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of a virtual network adapter. The cmdlet gets isolation settings for the adapters that you specify.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies an array of Hyper-V hosts. The cmdlet gets isolation settings for virtual machines hosted by the computers that you specify.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies an array of virtual machines. The cmdlet gets isolation settings for adapters that belong to the virtual machines that you specify. To obtain a virtual machine object, use the Get-VM cmdlet.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterIsolationSetting])]
    param (
        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='VMName', Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [string]
        ${VMNetworkAdapterName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMNetworkAdapterRdma {
    <#
    .SYNOPSIS
        Get-VMNetworkAdapterRdma [-VMName] <string> [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-Name <string>] [-Passthru] [<CommonParameters>]

Get-VMNetworkAdapterRdma -ManagementOS [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-Name <string>] [-SwitchName <string>] [-Passthru] [<CommonParameters>]

Get-VMNetworkAdapterRdma [-VMNetworkAdapter] <VMNetworkAdapterBase> [-Passthru] [<CommonParameters>]

Get-VMNetworkAdapterRdma [-VM] <VirtualMachine> [-Name <string>] [-Passthru] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterRdmaSetting])]
    param (
        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine]
        ${VM},

        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Alias('VMNetworkAdapterName')]
        [string]
        ${Name},

        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SwitchName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMNetworkAdapterRoutingDomainMapping {
    <#
    .SYNOPSIS
        Gets members of a routing domain.
    .PARAMETER RoutingDomainID
        Specifies the ID of a routing domain. The ID of a routing domain is a system-assigned GUID. The cmdlet gets the members of the routing domain that you specify.
    .PARAMETER RoutingDomainName
        Specifies the name of a routing domain. The cmdlet gets the members of the routing domain that you specify.
    .PARAMETER VMSnapshot
        Specifies a snapshot as a VMSnapshot object. The cmdlet gets the members of the routing domain for network adapters that belong to the snapshot that you specify. To obtain a snapshot object, use the Get-VMSnapshot cmdlet.
    .PARAMETER VMName
        Specifies an array of friendly names of virtual machines. The cmdlet gets the members of the routing domain from the network interfaces that belong to the virtual machines that you specify.
    .PARAMETER VMNetworkAdapter
        Specifies an array of virtual network adapters as a VMNetworkAdapterBase object. The cmdlet gets the members of the routing domain on the adapters that you specify. To obtain a network adapter, use the Get-VMNetworkAdapter cmdlet.
    .PARAMETER ManagementOS
        Indicates that the cmdlet operates on the parent partition or host operating system.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of a virtual network adapter. The cmdlet gets the members of the routing domain on the adapter that you specify.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies an array of Hyper-V hosts. The cmdlet gets the members of a routing domain on the Hyper-V hosts that you specify.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies an array of virtual machine objects. The cmdlet gets the members of the routing domain from the network interfaces that belong to the virtual machines that you specify. To obtain a virtual machine object, use the Get-VM cmdlet.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterRoutingDomainSetting])]
    param (
        [guid]
        ${RoutingDomainID},

        [string]
        ${RoutingDomainName},

        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='VMName', Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='ManagementOS')]
        [string]
        ${VMNetworkAdapterName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMNetworkAdapterTeamMapping {
    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterTeamMappingSetting])]
    param (
        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine]
        ${VM},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [Alias('VMNetworkAdapterName')]
        [string]
        ${Name},

        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SwitchName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMNetworkAdapterVlan {
    <#
    .SYNOPSIS
        Gets the virtual LAN settings configured on a virtual network adapter.
    .PARAMETER VMSnapshot
        Specifies the snapshot in which the virtual LAN settings are to be retrieved.
    .PARAMETER VMName
        Specifies the name of the virtual machine in which the virtual LAN settings configured on a virtual network adapter are to be retrieved.

        Friendly name of the virtual machine
    .PARAMETER VMNetworkAdapter
        Specifies the virtual network adapter for which the virtual LAN settings are to be retrieved.
    .PARAMETER ManagementOS
        Specifies that the virtual LAN settings are to be retrieved from the management (i.e. parent, or host) operating system.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of the virtual network adapter for which the virtual LAN settings are to be retrieved.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual LAN settings configured on a virtual network adapter are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine in which the virtual LAN settings configured on a virtual network adapter are to be retrieved.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterVlanSetting])]
    param (
        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='VMName', Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [string]
        ${VMNetworkAdapterName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMPartitionableGpu {
    <#
    .SYNOPSIS
        Get-VMPartitionableGpu [[-ComputerName] <string[]>] [[-Credential] <pscredential[]>] [-Name <string>] [<CommonParameters>]

Get-VMPartitionableGpu [-CimSession] <CimSession[]> [-Name <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='ComputerName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMPartitionableGpu])]
    param (
        [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ComputerName', Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ComputerName', Position=1)]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Name}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMPmemController {
    <#
    .SYNOPSIS
        Get-VMPmemController [-VMName] <string[]> [[-ControllerNumber] <int>] [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [<CommonParameters>]

Get-VMPmemController [-VMSnapshot] <VMSnapshot> [[-ControllerNumber] <int>] [<CommonParameters>]

Get-VMPmemController [-VM] <VirtualMachine[]> [[-ControllerNumber] <int>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMPmemController])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(Position=1)]
        [ValidateNotNull()]
        [ValidateRange(0, 0)]
        [System.Nullable[int]]
        ${ControllerNumber},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMProcessor {
    <#
    .SYNOPSIS
        Gets the processor of a virtual machine or snapshot.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the processor of a virtual machine or snapshot is to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMSnapshot
        Specifies the snapshot whose processor is to be retrieved.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose processor is to be retrieved.
    .PARAMETER VM
        Specifies the virtual machine whose processor is to be retrieved.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMProcessor])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMRemoteFx3dVideoAdapter {
    <#
    .SYNOPSIS
        Gets the RemoteFX video adapter of a virtual machine or snapshot.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the RemoteFX video adapter is to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose RemoteFX video adapter is to be retrieved.
    .PARAMETER VM
        Specifies the virtual machine whose RemoteFX video adapter is to be retrieved.
    .PARAMETER VMSnapshot
        Specifies the snapshot whose RemoteFX video adapter is to be retrieved.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMRemoteFx3DVideoAdapter])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMRemoteFXPhysicalVideoAdapter {
    <#
    .SYNOPSIS
        Gets the RemoteFX physical graphics adapters on one or more Hyper-V hosts.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies the names of one or more RemoteFX physical graphics adapters to be retrieved.
    #>

    [CmdletBinding(DefaultParameterSetName='ComputerName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMRemoteFXPhysicalVideoAdapter])]
    param (
        [Parameter(ParameterSetName='CimSession', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ComputerName', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ComputerName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMReplication {
    <#
    .SYNOPSIS
        Gets the replication settings for a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts from which virtual machine replication settings are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose replication settings are to be retrieved.
    .PARAMETER VM
        Specifies the virtual machine whose replication settings are to be retrieved.
    .PARAMETER ReplicaServerName
        Specifies the replica server name of the virtual machines whose replication settings are to be retrieved.
    .PARAMETER PrimaryServerName
        Specifies the primary server of the virtual machines whose replication settings are to be retrieved.
    .PARAMETER ReplicationState
        Gets replication settings for virtual machines with the specified replication state. Valid values are:

        - Error

        - FailOverWaitingCompletion

        - FailedOver

        - NotApplicable

        - ReadyForInitialReplication

        - Replicating

        - Resynchronizing

        - ResynchronizeSuspended

        - Suspended

        - SyncedReplicationComplete

        - WaitingForInitialReplication

        - WaitingForStartResynchronize
    .PARAMETER ReplicationHealth
        Gets replication settings for virtual machines with the specified replication health state. Valid values are Normal, Warning, and Critical.
    .PARAMETER ReplicationMode
        Gets the replication settings for virtual machines with the specified replication mode. Valid values are None, Primary, Replica, and TestReplica.
    .PARAMETER ReplicationRelationshipType
        Specifies the replication relationship type of the virtual machine. Specify whether the replication relationship is a simple primary to replica or is an extended replication chain. The cmdlet gets the replication settings for the virtual machines that have the replication type that you specify.
    .PARAMETER TrustGroup
        Specifies the trust group of the virtual machines whose replication settings you want to retrieve.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMReplication])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Position=0, ValueFromPipeline=$true)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName')]
        [Alias('ReplicaServer')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ReplicaServerName},

        [Parameter(ParameterSetName='VMName')]
        [Alias('PrimaryServer')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${PrimaryServerName},

        [Parameter(ParameterSetName='VMName')]
        [Alias('State')]
        [ValidateNotNullOrEmpty()]
        [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationState]]
        ${ReplicationState},

        [Parameter(ParameterSetName='VMName')]
        [Alias('Health')]
        [ValidateNotNullOrEmpty()]
        [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationHealthState]]
        ${ReplicationHealth},

        [Parameter(ParameterSetName='VMName')]
        [Alias('Mode')]
        [ValidateNotNullOrEmpty()]
        [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationMode]]
        ${ReplicationMode},

        [Alias('Relationship')]
        [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationRelationshipType]]
        ${ReplicationRelationshipType},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${TrustGroup}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMReplicationAuthorizationEntry {
    <#
    .SYNOPSIS
        Gets the authorization entries of a Replica server.
    .PARAMETER AllowedPrimaryServer
        Specifies the allowed primary server for which replication authorization entries are to be retrieved.
    .PARAMETER ReplicaStorageLocation
        Specifies the location where virtual hard disk files are stored when an authorized primary server sends replication data to the specified Replica server.
    .PARAMETER TrustGroup
        Gets the replication authorization entries that have the specified value for TrustGroup.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts from which replication authorization entries are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding()]
    [OutputType([Microsoft.HyperV.PowerShell.VMReplicationAuthorizationEntry])]
    param (
        [Parameter(Position=0, ValueFromPipeline=$true)]
        [Alias('AllowedPS')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${AllowedPrimaryServer},

        [Alias('StorageLoc')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ReplicaStorageLocation},

        [ValidateNotNullOrEmpty()]
        [string]
        ${TrustGroup},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMReplicationServer {
    <#
    .SYNOPSIS
        Gets the replication and authentication settings of a Replica server.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-v hosts which run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='ComputerName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMReplicationServer])]
    param (
        [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ComputerName', Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ComputerName', Position=1)]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMResourcePool {
    <#
    .SYNOPSIS
        Gets the resource pools on one or more virtual machine hosts.
    .PARAMETER Name
        Specifies the name of the resource pool or pools to be retrieved. Wildcards are allowed.
    .PARAMETER ResourcePoolType
        Specifies the type of the resource pool or pools to be retrieved.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the resource pools are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding()]
    [OutputType([Microsoft.HyperV.PowerShell.VMResourcePool])]
    param (
        [Parameter(Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(Position=1)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMResourcePoolType[]]
        ${ResourcePoolType},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMSan {
    <#
    .SYNOPSIS
        Gets the available virtual machine storage area networks on a Hyper-V host or hosts.
    .PARAMETER Name
        Specifies the friendly name of a virtual storage area network (SAN) to be retrieved.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts from which the available virtual machine storage area networks (SANs) are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding()]
    [OutputType([Microsoft.HyperV.PowerShell.VMSan])]
    param (
        [Parameter(Position=0, ValueFromPipelineByPropertyName=$true)]
        [Alias('SanName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMScsiController {
    <#
    .SYNOPSIS
        Gets the SCSI controllers of a virtual machine or snapshot.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the SCSI controllers are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMSnapshot
        Specifies the snapshot whose SCSI controllers are to be retrieved.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose SCSI controllers are to be retrieved.
    .PARAMETER ControllerNumber
        Specifies the number of the SCSI controller to be retrieved.
    .PARAMETER VM
        Specifies the virtual machine whose SCSI controllers are to be retrieved.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMScsiController])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(Position=1)]
        [ValidateNotNull()]
        [ValidateRange(0, 63)]
        [System.Nullable[int]]
        ${ControllerNumber},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMSecurity {
    <#
    .SYNOPSIS
        Gets security information about a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts to run the cmdlet. NetBIOS names, IP addresses, and fully-qualified domain names are allowable. The default is the local computer. Use "localhost" or a dot (".") to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies a user account that has permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of one or more virtual machines for which this cmdlet gets security settings.
    .PARAMETER VM
        Specifies one or more virtual machines for which this cmdlet gets security settings.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSecurity])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMSnapshot {
    <#
    .SYNOPSIS
        Gets the checkpoints associated with a virtual machine or checkpoint.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose checkpoints are to be retrieved.
    .PARAMETER VM
        Specifies the virtual machine whose checkpoints are to be retrieved.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which checkpoints are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Id
        Specifies the unique identifier of the virtual machine whose checkpoints are to be retrieved.
    .PARAMETER Name
        Specifies the name of the checkpoint to be retrieved.
    .PARAMETER ChildOf
        Specifies the checkpoint whose child checkpoints are to be retrieved. This retrieves immediate children only.
    .PARAMETER ParentOf
        Specifies the checkpoint whose immediate parent checkpoint is to be retrieved.
    .PARAMETER SnapshotType
        Specifies the type of the checkpoints to be retrieved. Allowed values are Standard , Recovery , Planned , Missing , Replica , AppConsistentReplica , and SyncedReplica .
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSnapshot])]
    param (
        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='Id')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='Id')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='Id')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Id', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [System.Nullable[guid]]
        ${Id},

        [Parameter(ParameterSetName='VMName', Position=1)]
        [Parameter(ParameterSetName='Parent', Position=0)]
        [Parameter(ParameterSetName='Child', Position=0)]
        [Parameter(ParameterSetName='VMObject', Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='Child', Mandatory=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${ChildOf},

        [Parameter(ParameterSetName='Parent', Mandatory=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VirtualMachineBase]
        ${ParentOf},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='Parent')]
        [Parameter(ParameterSetName='Child')]
        [Parameter(ParameterSetName='VMName')]
        [Alias('VMRecoveryCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.SnapshotType]
        ${SnapshotType}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMStoragePath {
    <#
    .SYNOPSIS
        Gets the storage paths in a storage resource pool.
    .PARAMETER Path
        Specifies the path for which matching storage paths are to be retrieved.
    .PARAMETER ResourcePoolName
        Specifies the name of the resource pool for which storage paths are to be retrieved.
    .PARAMETER ResourcePoolType
        Specifies the type of the resource pool for which storage paths are to be retrieved. Valid values are:

        - Memory

        - Processor

        - Ethernet

        - VHD

        - ISO

        - VFD

        - FibreChannelPort

        - FibreChannelConnection
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which storage paths are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding()]
    [OutputType([Microsoft.HyperV.PowerShell.VMStorageResourcePool])]
    param (
        [Parameter(Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Path},

        [Parameter(Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ResourcePoolName},

        [Parameter(Mandatory=$true, Position=2)]
        [Microsoft.HyperV.PowerShell.VMResourcePoolType]
        ${ResourcePoolType},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMStorageSettings {
    <#
    .SYNOPSIS
        Get-VMStorageSettings [-VMName] <string[]> [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [<CommonParameters>]

Get-VMStorageSettings [-VM] <VirtualMachine[]> [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMStorageSetting])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMSwitch {
    <#
    .SYNOPSIS
        Gets virtual switches from one or more virtual Hyper-V hosts.
    .PARAMETER Id
        Specifies the unique identifier of the virtual switch to be retrieved.
    .PARAMETER Name
        Specifies the name of the virtual switch to be retrieved.
    .PARAMETER ResourcePoolName
        Specifies the resource pool from which the virtual switches are to be retrieved.
    .PARAMETER SwitchType
        Specifies the type of the virtual switches to be retrieved. Allowed values are External , Internal , and Private .
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts from which virtual switches are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='Name')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitch])]
    param (
        [Parameter(ParameterSetName='Id', Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('SwitchId')]
        [ValidateNotNull()]
        [guid[]]
        ${Id},

        [Parameter(ParameterSetName='Name', Position=0)]
        [Alias('SwitchName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(Position=1)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ResourcePoolName},

        [Microsoft.HyperV.PowerShell.VMSwitchType[]]
        ${SwitchType},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMSwitchExtension {
    <#
    .SYNOPSIS
        Gets the extensions on one or more virtual switches.
    .PARAMETER VMSwitchName
        Specifies the name of the virtual switch from which the extensions are to be retrieved.
    .PARAMETER VMSwitch
        Specifies the virtual switch from which the extensions are to be retrieved.
    .PARAMETER Name
        Specifies the name of the extension to be retrieved.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the extensions are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='SwitchName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitchExtension])]
    param (
        [Parameter(ParameterSetName='SwitchName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMSwitchName},

        [Parameter(ParameterSetName='SwitchObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitch[]]
        ${VMSwitch},

        [Parameter(Position=1)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='SwitchName', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='SwitchName')]
        [Alias('PSComputerName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='SwitchName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMSwitchExtensionPortData {
    <#
    .SYNOPSIS
        Retrieves the status of a virtual switch extension feature applied to a virtual network adapter.
    .PARAMETER VMName
        Specifies the name of the virtual machine.
    .PARAMETER VMNetworkAdapter
        Specifies the virtual machine network adapter.
    .PARAMETER ManagementOS
        Specifies that the status is to be retrieved from the management (i.e. parent, or host) operating system.
    .PARAMETER ExternalPort
        Specifies the virtual switch port connected to the external network adapter.
    .PARAMETER SwitchName
        Specifies the name of the virtual switch.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of the virtual machine network adapter.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the status of a virtual switch extension applied to a virtual network adapter is to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies an array of virtual machine objects. The cmdlet gets the status of the virtual switch extension for the virtual machines that you specify. To obtain a virtual machine object, use the Get-VM cmdlet.
    .PARAMETER FeatureName
        Specifies the name of the feature supported by the virtual switch extension.
    .PARAMETER FeatureId
        Specifies the unique identifier of the feature supported by the virtual switch extension.
    .PARAMETER Extension
        Specifies the virtual switch extension for which status is to be retrieved.
    .PARAMETER ExtensionName
        Specifies the name of the virtual switch extension for which status is to be retrieved.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitchExtensionPortData])]
    param (
        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='ExternalPort', Mandatory=$true)]
        [switch]
        ${ExternalPort},

        [Parameter(ParameterSetName='ExternalPort')]
        [string]
        ${SwitchName},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [string]
        ${VMNetworkAdapterName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='ExternalPort')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ExternalPort')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='ExternalPort')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${FeatureName},

        [ValidateNotNullOrEmpty()]
        [guid[]]
        ${FeatureId},

        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitchExtension[]]
        ${Extension},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ExtensionName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMSwitchExtensionPortFeature {
    <#
    .SYNOPSIS
        Gets the features configured on a virtual network adapter.
    .PARAMETER VMName
        Specifies the name of the virtual machine on which the features configured on a virtual switch are to be retrieved.
    .PARAMETER VMNetworkAdapter
        Specifies the network adapter.
    .PARAMETER ManagementOS
        Specifies that the features are to be retrieved from the management (i.e. parent, or host) operating system.
    .PARAMETER ExternalPort
        Specifies the virtual switch port connected to the external network adapter.
    .PARAMETER SwitchName
        Specifies the name of the virtual switch.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of the network adapter.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more virtual machine hosts on which the features configured on a virtual network adapter are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine on which the features configured on a virtual switch are to be retrieved.
    .PARAMETER FeatureName
        Specifies the name of the feature supported by the virtual switch extension.
    .PARAMETER FeatureId
        Specifies the unique identifier of the feature supported by the virtual switch extension.
    .PARAMETER Extension
        Specifies the virtual switch extension.
    .PARAMETER ExtensionName
        Specifies the name of the virtual switch extension.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitchExtensionPortFeature])]
    param (
        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='ExternalPort', Mandatory=$true)]
        [switch]
        ${ExternalPort},

        [Parameter(ParameterSetName='ExternalPort')]
        [string]
        ${SwitchName},

        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [string]
        ${VMNetworkAdapterName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='ExternalPort')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='ExternalPort')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='ExternalPort')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${FeatureName},

        [ValidateNotNullOrEmpty()]
        [guid[]]
        ${FeatureId},

        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitchExtension[]]
        ${Extension},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ExtensionName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMSwitchExtensionSwitchData {
    <#
    .SYNOPSIS
        Gets the status of a virtual switch extension feature applied on a virtual switch.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the status of a virtual switch extension is to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER SwitchName
        Specifies the name of the virtual switch.
    .PARAMETER VMSwitch
        Specifies the virtual switch.
    .PARAMETER FeatureName
        Specifies the name of a feature supported by the virtual switch extension.
    .PARAMETER FeatureId
        Specifies the unique identifier of a feature supported by the virtual switch extension.
    .PARAMETER Extension
        Specifies the virtual switch extension for which status is to be retrieved.
    .PARAMETER ExtensionName
        Specifies the name of the virtual switch extension for which status is to be retrieved.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitchExtensionSwitchData])]
    param (
        [Parameter(ParameterSetName='SwitchName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='SwitchName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='SwitchName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='SwitchName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SwitchName},

        [Parameter(ParameterSetName='SwitchObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMSwitch[]]
        ${VMSwitch},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${FeatureName},

        [ValidateNotNullOrEmpty()]
        [guid[]]
        ${FeatureId},

        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitchExtension[]]
        ${Extension},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ExtensionName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMSwitchExtensionSwitchFeature {
    <#
    .SYNOPSIS
        Gets the features configured on a virtual switch.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the features configured on a virtual switch are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER SwitchName
        Specifies the name of the virtual switch.
    .PARAMETER VMSwitch
        Specifies the virtual switch.
    .PARAMETER FeatureName
        Specifies the name of the feature.
    .PARAMETER FeatureId
        Specifies the unique identifier of the feature.
    .PARAMETER Extension
        Specifies the virtual switch extension.
    .PARAMETER ExtensionName
        Specifies the name of the virtual switch extension.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitchExtensionSwitchFeature])]
    param (
        [Parameter(ParameterSetName='SwitchName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='SwitchName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='SwitchName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='SwitchName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SwitchName},

        [Parameter(ParameterSetName='SwitchObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMSwitch[]]
        ${VMSwitch},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${FeatureName},

        [ValidateNotNullOrEmpty()]
        [guid[]]
        ${FeatureId},

        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitchExtension[]]
        ${Extension},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ExtensionName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMSwitchTeam {
    <#
    .SYNOPSIS
        Gets virtual switch teams from Hyper-V hosts.
    .PARAMETER Name
        Specifies the name of the virtual switch team that this cmdlet gets.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='Name')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitchTeam])]
    param (
        [Parameter(ParameterSetName='Name', Position=0)]
        [Alias('SwitchName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='SwitchObject', Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitch[]]
        ${VMSwitch},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMSystemSwitchExtension {
    <#
    .SYNOPSIS
        Gets the switch extensions installed on a virtual machine host.
    .PARAMETER Name
        Specifies the name of the switch extension to be retrieved.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts from which the switch extensions are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding()]
    [OutputType([Microsoft.HyperV.PowerShell.VMSystemSwitchExtension])]
    param (
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMSystemSwitchExtensionPortFeature {
    <#
    .SYNOPSIS
        Gets the port-level features supported by virtual switch extensions on one or more Hyper-V hosts.
    .PARAMETER FeatureName
        Specifies the name of the feature to be retrieved.
    .PARAMETER FeatureId
        Specifies the unique identifier of the feature to be retrieved.
    .PARAMETER ExtensionName
        Specifies one or more extension names for which the features are to be retrieved.
    .PARAMETER SystemSwitchExtension
        Specifies one or more system extensions for which the features are to be retrieved.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts from which the available port-level features are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding()]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitchExtensionPortFeature])]
    param (
        [string[]]
        ${FeatureName},

        [guid[]]
        ${FeatureId},

        [string[]]
        ${ExtensionName},

        [Microsoft.HyperV.PowerShell.VMSystemSwitchExtension[]]
        ${SystemSwitchExtension},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMSystemSwitchExtensionSwitchFeature {
    <#
    .SYNOPSIS
        Gets the switch-level features on one or more Hyper-V hosts.
    .PARAMETER FeatureName
        Specifies the name of the switch-level features to be retrieved.
    .PARAMETER FeatureId
        Specifies the unique identifier of the features are to be retrieved.
    .PARAMETER ExtensionName
        Specifies the name of the extension from which the switch-level features are to be retrieved.
    .PARAMETER SystemSwitchExtension
        Specifies the extension from which the switch-level features are to be retrieved.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts from which the switch-level features in an extension are to be retrieved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding()]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitchExtensionSwitchFeature])]
    param (
        [string[]]
        ${FeatureName},

        [guid[]]
        ${FeatureId},

        [string[]]
        ${ExtensionName},

        [Microsoft.HyperV.PowerShell.VMSystemSwitchExtension[]]
        ${SystemSwitchExtension},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-VMVideo {
    <#
    .SYNOPSIS
        Gets video settings for virtual machines.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMSnapshot
        Specifies virtual machine checkpoint for which this cmdlet gets video settings. To obtain a VMSnapshot object, use the Get-VMSnapshot cmdlet.

        Checkpoint replaces the previous term, snapshot.
    .PARAMETER VMName
        Specifies an array of names of virtual machines for which this cmdlet gets video settings.
    .PARAMETER VM
        Specifies an array of virtual machines for which this cmdlet gets video settings. To obtain a VirtualMachine object, use the Get-VM cmdlet.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMVideo])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Grant-VMConnectAccess {
    <#
    .SYNOPSIS
        Grants a user or users access to connect to a virtual machine or machines.
    .PARAMETER VMId
        Specifies the unique identifier of a virtual machine to which connect access is to be granted.
    .PARAMETER VMName
        Specifies the name of a virtual machine to which connect access is to be granted.
    .PARAMETER UserName
        Specifies a user or users to whom access to connect to a virtual machine or machines is to be granted.
    .PARAMETER Passthru
        Indicates that this cmdlet returns a Microsoft.HyperV.PowerShell.VMConnectAce object. By default, this cmdlet does not return any output.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-v hosts which run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMConnectAce])]
    param (
        [Parameter(ParameterSetName='VMId', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [guid[]]
        ${VMId},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Alias('UserId','Sid')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${UserName},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Import-VM {
    <#
    .SYNOPSIS
        Imports a virtual machine from a file.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts from which the virtual machine is to be imported. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER CompatibilityReport
        Specifies a compatibility report which resolves any incompatibilities between the virtual machine and the Hyper-V host.
    .PARAMETER Path
        Specifies the path to the exported virtual machine to be imported.
    .PARAMETER VhdDestinationPath
        Specifies the folder to which the virtual machine's VHD files are to be copied.
    .PARAMETER Register
        Specifies that the imported virtual machine is to be registered in-place, as opposed to copying its files to the server's default locations. Choose this option if the virtual machines files are already in the location from which they are to run.
    .PARAMETER Copy
        Specifies that the imported virtual machine's files should be copied to the server's default locations, as opposed to registering the virtual machine in-place.
    .PARAMETER VirtualMachinePath
        Specifies the path where the virtual machine configuration files are to be stored.
    .PARAMETER SnapshotFilePath
        Specifies the path for any snapshot files associated with the virtual machine.
    .PARAMETER SmartPagingFilePath
        Specifies the new path to use for a smart paging file, if one is needed.
    .PARAMETER VhdSourcePath
        Specifies the folder from which the virtual machine's VHD files are to be copied.
    .PARAMETER GenerateNewId
        Specifies that the imported virtual machine should be copied and given a new unique identifier. (By default, Import-VM gives the new virtual machine the same unique identifier as the imported virtual machine.)
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    #>

    [CmdletBinding(DefaultParameterSetName='Register', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='Register')]
        [Parameter(ParameterSetName='Copy')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Register')]
        [Parameter(ParameterSetName='Copy')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Register')]
        [Parameter(ParameterSetName='Copy')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='CompatibilityReport', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMCompatibilityReport]
        ${CompatibilityReport},

        [Parameter(ParameterSetName='Register', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='Copy', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Path},

        [Parameter(ParameterSetName='Copy', Position=1)]
        [string]
        ${VhdDestinationPath},

        [Parameter(ParameterSetName='Register')]
        [switch]
        ${Register},

        [Parameter(ParameterSetName='Copy', Mandatory=$true)]
        [switch]
        ${Copy},

        [Parameter(ParameterSetName='Copy')]
        [string]
        ${VirtualMachinePath},

        [Parameter(ParameterSetName='Copy')]
        [Alias('CheckpointFileLocation','SnapshotFileLocation')]
        [string]
        ${SnapshotFilePath},

        [Parameter(ParameterSetName='Copy')]
        [string]
        ${SmartPagingFilePath},

        [Parameter(ParameterSetName='Copy')]
        [string]
        ${VhdSourcePath},

        [Parameter(ParameterSetName='Copy')]
        [switch]
        ${GenerateNewId},

        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Import-VMInitialReplication {
    <#
    .SYNOPSIS
        Imports initial replication files for a Replica virtual machine to complete the initial replication when using external media as the source.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which initial replication files are to be imported. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine for which the initial replication files are to be imported.
    .PARAMETER VM
        Specifies the virtual machine for which the initial replication files are to be imported.
    .PARAMETER VMReplication
        Specifies the virtual machine replication object for which initial replication files are to be imported.
    .PARAMETER Path
        Specifies the path of the initial replication files to import.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Indicates that this cmdlet returns a Microsoft.HyperV.PowerShell.VirtualMachine object. By default, this cmdlet does not generate any output.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMReplication])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMReplication', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMReplication[]]
        ${VMReplication},

        [Parameter(Mandatory=$true, Position=1)]
        [Alias('IRLoc')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Path},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Measure-VM {
    <#
    .SYNOPSIS
        Reports resource utilization data for one or more virtual machines.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more virtual machine hosts for which resource utilization is to be reported. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies the friendly name of the virtual machine whose resource utilization data will be reported.
    .PARAMETER VM
        Specifies the virtual machine whose resource utilization will be reported.
    #>

    [CmdletBinding(DefaultParameterSetName='Name')]
    [OutputType([Microsoft.HyperV.PowerShell.VMMeteringReportForVirtualMachine])]
    param (
        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Measure-VMReplication {
    <#
    .SYNOPSIS
        Gets replication statistics and information associated with a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts from which to get replication statistics. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine for which you want to get virtual machine replication statistics.
    .PARAMETER VM
        Specifies the virtual machine for which you want to get replication statistics.
    .PARAMETER ReplicaServerName
        Specifies the name of a Replica server of the virtual machines whose replication statistics you want to get.
    .PARAMETER PrimaryServerName
        Specifies the name of a primary server. Replication statistics are retrieved for all virtual machines from the specified primary server.
    .PARAMETER ReplicationState
        Specifies the replication state of the virtual machines for which you want to get replication statistics. Valid values are:

        - Error

        - FailOverWaitingCompletion

        - FailedOver

        - NotApplicable

        - ReadyForInitialReplication

        - Replicating

        - Resynchronizing

        - ResynchronizeSuspended

        - Suspended

        - SyncedReplicationComplete

        - WaitingForInitialReplication

        - WaitingForStartResynchronize
    .PARAMETER ReplicationHealth
        Specifies the replication health of the virtual machines whose replication statistics you want to get. Valid values are "Critical", "Warning", "Normal", and "NotApplicable".
    .PARAMETER ReplicationMode
        Specifies the replication mode of the virtual machines whose replication statistics you want to get. Valid values are "None", "Primary", "Replica" and "TestReplica".
    .PARAMETER ReplicationRelationshipType
        Specifies the replication relationship type of the virtual machine. Specify whether the replication relationship is a simple primary to replica or is an extended replication chain. The cmdlet gets replication statistics and information associated with the virtual machines that have the replication type that you specify.
    .PARAMETER TrustGroup
        Specifies a trust group associated with the virtual machines whose replication statistics you want to get.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMReplicationHealth])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Position=0, ValueFromPipeline=$true)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName')]
        [Alias('ReplicaServer')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ReplicaServerName},

        [Parameter(ParameterSetName='VMName')]
        [Alias('PrimaryServer')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${PrimaryServerName},

        [Parameter(ParameterSetName='VMName')]
        [Alias('State')]
        [ValidateNotNullOrEmpty()]
        [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationState]]
        ${ReplicationState},

        [Parameter(ParameterSetName='VMName')]
        [Alias('Health')]
        [ValidateNotNullOrEmpty()]
        [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationHealthState]]
        ${ReplicationHealth},

        [Parameter(ParameterSetName='VMName')]
        [Alias('Mode')]
        [ValidateNotNullOrEmpty()]
        [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationMode]]
        ${ReplicationMode},

        [Alias('Relationship')]
        [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationRelationshipType]]
        ${ReplicationRelationshipType},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${TrustGroup}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Measure-VMResourcePool {
    <#
    .SYNOPSIS
        Reports resource utilization data for one or more resource pools.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more virtual machine hosts for which resource utilization is to be reported. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies the friendly name of the resource pool for which resource utilization is to be reported.
    .PARAMETER ResourcePoolType
        Specifies the resource type of the virtual machine resource pool for which resource utilization is to be reported. Valid values are:

        - Ethernet

        - Memory

        - Processor

        - VHD
    #>

    [CmdletBinding()]
    [OutputType([Microsoft.HyperV.PowerShell.VMMeteringReportForResourcePool])]
    param (
        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Ethernet','Memory','Processor','VHD')]
        [Microsoft.HyperV.PowerShell.VMResourcePoolType[]]
        ${ResourcePoolType}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Merge-VHD {
    <#
    .SYNOPSIS
        Merges virtual hard disks.
    .PARAMETER Path
        Specifies the path to the child in the virtual hard disk chain that is the source for the merge command. If a filename or relative path is specified, the virtual hard disk path will be calculated relative to the current working directory.
    .PARAMETER DestinationPath
        Specifies the path to the child in the virtual hard disk chain that is the destination for the merge command.
    .PARAMETER Force
        Runs the cmdlet without prompting for confirmation.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the merged virtual hard disk.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which virtual hard disks are to be merged. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.Vhd.PowerShell.VirtualHardDisk])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('FullName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Path},

        [Parameter(Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DestinationPath},

        [switch]
        ${Force},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Mount-VHD {
    <#
    .SYNOPSIS
        Mounts one or more virtual hard disks.
    .PARAMETER Path
        Specifies the path to the virtual hard disk file for the virtual hard disk to be mounted. If a filename or relative path is specified, the virtual hard disk path is calculated relative to the current working directory.
    .PARAMETER NoDriveLetter
        Specifies that the virtual hard disk is to be mounted without assigning drive letters to the volumes contained within the virtual hard disk.
    .PARAMETER ReadOnly
        Specifies that the virtual hard disk is to be mounted in read-only mode.
    .PARAMETER SnapshotId
        Specifies the unique ID of a VHD set.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the virtual hard disk to be mounted.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which a virtual hard disk is to be mounted. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.Vhd.PowerShell.VirtualHardDisk])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('FullName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Path},

        [switch]
        ${NoDriveLetter},

        [switch]
        ${ReadOnly},

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [System.Nullable[guid]]
        ${SnapshotId},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Mount-VMHostAssignableDevice {
    <#
    .SYNOPSIS
        Mount-VMHostAssignableDevice [[-HostAssignableDevice] <VMHostAssignableDevice[]>] [[-InstancePath] <string>] [[-LocationPath] <string>] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='ComputerName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMHostAssignableDevice])]
    param (
        [Parameter(Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMHostAssignableDevice[]]
        ${HostAssignableDevice},

        [Parameter(Position=2)]
        [string]
        ${InstancePath},

        [Parameter(Position=3)]
        [string]
        ${LocationPath},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Move-VM {
    <#
    .SYNOPSIS
        Moves a virtual machine to a new Hyper-V host.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER CompatibilityReport
        Specifies a compatibility report which includes any adjustments required for the move.
    .PARAMETER Name
        Specifies the friendly name of the virtual machine to be moved.
    .PARAMETER VM
        Specifies the virtual machine to be moved.
    .PARAMETER DestinationCimSession
        Specifies the CIMSession on the Hyper-V host to which the virtual machine is to be moved.
    .PARAMETER DestinationHost
        Specifies the Hyper-V host to which the virtual machine is to be moved.
    .PARAMETER DestinationCredential
        Specifies a user account that has permission to perform this action. The default is the current user.
    .PARAMETER IncludeStorage
        Specifies that both the virtual machine and its storage are to be moved.
    .PARAMETER DestinationStoragePath
        Specifies a destination storage path to which all virtual machine storage is to be moved.
    .PARAMETER VirtualMachinePath
        Specifies the path where the virtual machine configuration files are to be stored.
    .PARAMETER SnapshotFilePath
        Specifies the path for any snapshot files associated with the virtual machine.
    .PARAMETER SmartPagingFilePath
        Specifies the new path to use for a smart paging file, if one is needed.
    .PARAMETER Vhds
        Specifies an array of hashtables that contain locations for each individual virtual hard disk to be moved. Each hashtable should have two entries. The first entry specifies the current location of the virtual hard disk to move, and has a key of SourceFilePath . The second entry specifies the new location for the virtual hard disk, and has a key of DestinationFilePath . The virtual hard disk name must be identical in both entries.
    .PARAMETER ResourcePoolName
        Specifies the name of the processor resource pool to be used.
    .PARAMETER RetainVhdCopiesOnSource
        Indicates that this cmdlet retains parent virtual hard disks on the source computer.
    .PARAMETER RemoveSourceUnmanagedVhds
        Indicates that Hyper-V deletes the parent virtual hard disk on the source after this cmdlet moves a differencing virtual hard disk, when the migration is finished.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to be pipeline representing the moved virtual machine.
    #>

    [CmdletBinding(DefaultParameterSetName='NameSingleDestination', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='NameSingleDestination')]
        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='NameSingleDestination')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='CompatibilityReport', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMCompatibilityReport]
        ${CompatibilityReport},

        [Parameter(ParameterSetName='NameSingleDestination', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='NameSingleDestinationAndCimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='NameMultipleDestinations', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='VMSingleDestination', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='VMSingleDestinationAndCimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='VMMultipleDestinations', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine]
        ${VM},

        [Parameter(ParameterSetName='NameSingleDestinationAndCimSession', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VMSingleDestinationAndCimSession', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [CimSession]
        ${DestinationCimSession},

        [Parameter(ParameterSetName='NameSingleDestination', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='NameMultipleDestinations', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VMSingleDestination', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VMMultipleDestinations', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DestinationHost},

        [Parameter(ParameterSetName='VMSingleDestination')]
        [Parameter(ParameterSetName='NameSingleDestination')]
        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [ValidateNotNullOrEmpty()]
        [pscredential]
        [System.Management.Automation.CredentialAttribute()]
        ${DestinationCredential},

        [Parameter(ParameterSetName='NameSingleDestination')]
        [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
        [Parameter(ParameterSetName='VMSingleDestination')]
        [Parameter(ParameterSetName='VMSingleDestinationAndCimSession')]
        [switch]
        ${IncludeStorage},

        [Parameter(ParameterSetName='VMSingleDestinationAndCimSession')]
        [Parameter(ParameterSetName='NameSingleDestination')]
        [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
        [Parameter(ParameterSetName='VMSingleDestination')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DestinationStoragePath},

        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession', Mandatory=$true)]
        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VirtualMachinePath},

        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
        [Alias('CheckpointFileLocation','SnapshotFileLocation')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SnapshotFilePath},

        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SmartPagingFilePath},

        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
        [ValidateNotNullOrEmpty()]
        [hashtable[]]
        ${Vhds},

        [Parameter(ParameterSetName='NameSingleDestination')]
        [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
        [Parameter(ParameterSetName='VMSingleDestination')]
        [Parameter(ParameterSetName='VMSingleDestinationAndCimSession')]
        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ResourcePoolName},

        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
        [Parameter(ParameterSetName='NameSingleDestination')]
        [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='VMSingleDestination')]
        [Parameter(ParameterSetName='VMSingleDestinationAndCimSession')]
        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
        [switch]
        ${RetainVhdCopiesOnSource},

        [Parameter(ParameterSetName='NameSingleDestinationAndCimSession')]
        [Parameter(ParameterSetName='NameSingleDestination')]
        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='NameMultipleDestinationsAndCimSession')]
        [Parameter(ParameterSetName='VMSingleDestination')]
        [Parameter(ParameterSetName='VMSingleDestinationAndCimSession')]
        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [Parameter(ParameterSetName='VMMultipleDestinationsAndCimSession')]
        [switch]
        ${RemoveSourceUnmanagedVhds},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Move-VMStorage {
    <#
    .SYNOPSIS
        Moves the storage of a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more virtual machine hosts on which the virtual machine storage is to be moved. NetBIOS names, IP addresses, and fully-qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies a name.
    .PARAMETER VM
        Specifies the virtual machine whose storage is to be moved.
    .PARAMETER DestinationStoragePath
        Specifies a destination storage path to which all virtual machine storage is to be moved.
    .PARAMETER VirtualMachinePath
        Specifies the path to the virtual machine configuration file and associated memory files.
    .PARAMETER SnapshotFilePath
        Specifies the new path for any snapshot files associated with the virtual machine.
    .PARAMETER SmartPagingFilePath
        Specifies the new path to use for a smart paging file, if one is needed.
    .PARAMETER Vhds
        Specifies an array of hashtables that contain locations for each individual virtual hard disk to be moved. Each hashtable should have two entries. The first entry specifies the current location of the virtual hard disk to move, and has a key of SourceFilePath. The second entry specifies the new location for the virtual hard disk, and has a key of DestinationFilePath. The virtual hard disk name must be identical in both entries.
    .PARAMETER ResourcePoolName
        Specifies the name of the storage resource pool to use after the move operation is complete.
    .PARAMETER RetainVhdCopiesOnSource
        Specify $true to keep any parent virtual hard disks on the source computer. If not specified, all virtual hard disks will be removed from the source computer once the virtual machine is successfully moved.
    .PARAMETER RemoveSourceUnmanagedVhds
        Indicates that Hyper-V deletes the parent virtual hard disk on the source after this cmdlet moves a differencing virtual hard disk, when the migration is finished.
    .PARAMETER AllowUnverifiedPaths
        Allows the move operation to be attempted even if the paths specified for the destination computer cannot be verified prior to attempting the move operation.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    #>

    [CmdletBinding(DefaultParameterSetName='NameSingleDestination', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [Parameter(ParameterSetName='NameSingleDestination')]
        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='NameSingleDestination')]
        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='NameSingleDestination')]
        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='NameSingleDestination', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='NameMultipleDestinations', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='VMSingleDestination', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='VMMultipleDestinations', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine]
        ${VM},

        [Parameter(ParameterSetName='VMSingleDestination', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='NameSingleDestination', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DestinationStoragePath},

        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VirtualMachinePath},

        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [Alias('CheckpointFileLocation','SnapshotFileLocation')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SnapshotFilePath},

        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SmartPagingFilePath},

        [Parameter(ParameterSetName='NameMultipleDestinations')]
        [Parameter(ParameterSetName='VMMultipleDestinations')]
        [ValidateNotNullOrEmpty()]
        [hashtable[]]
        ${Vhds},

        [ValidateNotNullOrEmpty()]
        [string]
        ${ResourcePoolName},

        [switch]
        ${RetainVhdCopiesOnSource},

        [switch]
        ${RemoveSourceUnmanagedVhds},

        [switch]
        ${AllowUnverifiedPaths},

        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function New-VFD {
    <#
    .SYNOPSIS
        Creates a virtual floppy disk.
    .PARAMETER Path
        Specifies the path to the new virtual floppy disk files to be created.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more virtual machine hosts on which the virtual floppy disk is to be created. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([System.IO.FileInfo])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Path},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function New-VHD {
    <#
    .SYNOPSIS
        Creates one or more new virtual hard disks.
    .PARAMETER Path
        Path to the new virtual hard disk file(s) that is being created as a result of a command. If a filename or relative path is specified, the new virtual hard disk path is calculated relative to the current working directory.
    .PARAMETER ParentPath
        Specifies the path to the parent of the differencing disk to be created (this parameter may be specified only for the creation of a differencing disk).
    .PARAMETER SizeBytes
        The maximum size, in bytes, of the virtual hard disk to be created.
    .PARAMETER SourceDisk
        Specifies the physical disk to be used as the source for the virtual hard disk to be created.
    .PARAMETER Dynamic
        Specifies that a dynamic virtual hard disk is to be created.
    .PARAMETER Fixed
        Specifies that a fixed virtual hard disk is to be created.
    .PARAMETER Differencing
        Specifies that a differencing virtual hard disk is to be created.
    .PARAMETER BlockSizeBytes
        Specifies the block size, in bytes, of the virtual hard disk to be created.
    .PARAMETER LogicalSectorSizeBytes
        Specifies the logical sector size, in bytes, of the virtual hard disk to be created. Valid values are 512 and 4096.
    .PARAMETER PhysicalSectorSizeBytes
        Specifies the physical sector size, in bytes. Valid values are 512 and 4096.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual hard disk file(s) are to be created. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='DynamicWithoutSource', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.Vhd.PowerShell.VirtualHardDisk])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Path},

        [Parameter(ParameterSetName='Differencing', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ParentPath},

        [Parameter(ParameterSetName='FixedWithoutSource', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='DynamicWithoutSource', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='Differencing', Position=2)]
        [ValidateNotNullOrEmpty()]
        [uint64]
        ${SizeBytes},

        [Parameter(ParameterSetName='FixedWithSource', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='DynamicWithSource', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('Number')]
        [ValidateNotNullOrEmpty()]
        [uint32]
        ${SourceDisk},

        [Parameter(ParameterSetName='DynamicWithSource', Mandatory=$true)]
        [Parameter(ParameterSetName='DynamicWithoutSource')]
        [switch]
        ${Dynamic},

        [Parameter(ParameterSetName='FixedWithSource', Mandatory=$true)]
        [Parameter(ParameterSetName='FixedWithoutSource', Mandatory=$true)]
        [switch]
        ${Fixed},

        [Parameter(ParameterSetName='Differencing')]
        [switch]
        ${Differencing},

        [ValidateNotNullOrEmpty()]
        [uint32]
        ${BlockSizeBytes},

        [Parameter(ParameterSetName='FixedWithoutSource')]
        [Parameter(ParameterSetName='DynamicWithoutSource')]
        [ValidateSet('512','4096')]
        [ValidateNotNullOrEmpty()]
        [uint32]
        ${LogicalSectorSizeBytes},

        [Parameter(ParameterSetName='Differencing')]
        [Parameter(ParameterSetName='FixedWithoutSource')]
        [Parameter(ParameterSetName='DynamicWithoutSource')]
        [ValidateSet('512','4096')]
        [ValidateNotNullOrEmpty()]
        [uint32]
        ${PhysicalSectorSizeBytes},

        [Parameter(ParameterSetName='FixedWithoutSource')]
        [ValidateSet('None','BTT')]
        [Microsoft.Virtualization.Client.Management.VirtualHardDiskPmemAddressAbstractionType]
        ${AddressAbstractionType},

        [Parameter(ParameterSetName='FixedWithoutSource')]
        [ValidateSet('0','1GB','1073741824')]
        [uint64]
        ${DataAlignmentBytes},

        [switch]
        ${AsJob},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function New-VM {
    <#
    .SYNOPSIS
        Creates a new virtual machine.
    .PARAMETER Name
        Specifies the name of the new virtual machine. The default name is New virtual machine.
    .PARAMETER MemoryStartupBytes
        Specifies the amount of memory, in bytes, to assign to the virtual machine. The default value is 512 MB.
    .PARAMETER BootDevice
        Specifies the device to use as the boot device for the new virtual machine. Allowed values are CD , Floppy , LegacyNetworkAdapter , IDE , NetworkAdapter, and VHD.

        When LegacyNetworkAdapter is specified, this configures the new virtual machine with a network adapter that can be used to perform a PXE boot and install an operating system from a network installation server.

        Note: Generation 2 virtual machines do not support Floppy, LegacyNetworkAdapter or IDE. Using these values with a Generation 2 virtual machine will cause an error.

        VHD and NetworkAdapter are new to Generation 2 virtual machines. If you specify them on a Generation 1 virtual machine, then they are interpreted to be IDE and LegacyNetworkAdapter, respectively.
    .PARAMETER NoVHD
        Creates a virtual machine without attaching any virtual hard disks.
    .PARAMETER SwitchName
        Specifies the friendly name of the virtual switch if you want to connect the new virtual machine to an existing virtual switch to provide connectivity to a network. Hyper-V automatically creates a virtual machine with one virtual network adapter, but connecting it to a virtual switch is optional.
    .PARAMETER NewVHDPath
        Creates a new virtual hard disk with the specified path and connects it to the new virtual machine. Absolute paths are allowed. If only a file name is specified, the virtual hard disk is created in the default path configured for the host.
    .PARAMETER NewVHDSizeBytes
        Specifies the size of the dynamic virtual hard disk that is created and attached to the new virtual machine.
    .PARAMETER VHDPath
        Specifies the path to a virtual hard disk file.
    .PARAMETER Path
        Specifies the directory to store the files for the new virtual machine.
    .PARAMETER Generation
        Specifies the generation, as an integer, for the virtual machine. The values that are valid in this version of Windows are 1 and 2.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual machine is to be created. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='No VHD', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(Position=1)]
        [ValidateNotNull()]
        [System.Nullable[long]]
        ${MemoryStartupBytes},

        [ValidateNotNullOrEmpty()]
        [System.Nullable[Microsoft.HyperV.PowerShell.BootDevice]]
        ${BootDevice},

        [Parameter(ParameterSetName='No VHD')]
        [switch]
        ${NoVHD},

        [ValidateNotNullOrEmpty()]
        [string]
        ${SwitchName},

        [Parameter(ParameterSetName='New VHD', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewVHDPath},

        [Parameter(ParameterSetName='New VHD', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [uint64]
        ${NewVHDSizeBytes},

        [Parameter(ParameterSetName='Existing VHD', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VHDPath},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Path},

        [ValidateNotNull()]
        [version]
        ${Version},

        [switch]
        ${Prerelease},

        [switch]
        ${Experimental},

        [Parameter(Position=2)]
        [ValidateSet('1','2')]
        [ValidateNotNullOrEmpty()]
        [System.Nullable[int16]]
        ${Generation},

        [switch]
        ${Force},

        [switch]
        ${AsJob},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function New-VMGroup {
    <#
    .SYNOPSIS
        Creates a virtual machine group.
    .PARAMETER Name
        Specifies the name for the group that this cmdlet creates.
    .PARAMETER GroupType
        Specifies the type of group that this cmdlet creates. The acceptable values for this parameter are: ManagementCollectionType and VMCollectionType.
    .PARAMETER Id
        Specifies the unique ID of the group that this cmdlet creates.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding()]
    [OutputType([Microsoft.HyperV.PowerShell.VMGroup])]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.GroupType]
        ${GroupType},

        [Parameter(Position=2)]
        [ValidateNotNullOrEmpty()]
        [guid]
        ${Id},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function New-VMReplicationAuthorizationEntry {
    <#
    .SYNOPSIS
        Creates a new authorization entry that allows one or more primary servers to replicate data to a specified Replica server.
    .PARAMETER AllowedPrimaryServer
        Specifies the server that is allowed to send replication data to the Replica server. Only fully-qualified domain names and fully qualified international domain names are supported. You can use a wildcard (for example, " ") in the first octect to specify a fully qualified domain name, such as .contoso.com.
    .PARAMETER ReplicaStorageLocation
        Specifies the location to store the Replica virtual hard disk files sent from the allowed server when a new Replica virtual machine is created.
    .PARAMETER TrustGroup
        Identifies a group of primary servers within which a given primary virtual machine can move so replications of the primary virtual machine are accepted by the Replica server only from primary servers that belong to the trust group. You can use any string to create a new trust group. Ensure all primary servers within a specific trust group use the same string as the value you specify for this parameter.

        Use of a trust group can help you keep virtual machines isolated by maintaining control over which primary servers are trusted to provide replication, while also allowing the virtual machines to move from one primary server to another (such as through live migration or failover from a cluster node).
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the authorization entry is to be created. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMReplicationAuthorizationEntry])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('AllowedPS')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${AllowedPrimaryServer},

        [Parameter(Mandatory=$true, Position=1)]
        [Alias('StorageLoc')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ReplicaStorageLocation},

        [Parameter(Mandatory=$true, Position=2)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${TrustGroup},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function New-VMResourcePool {
    <#
    .SYNOPSIS
        Creates a resource pool.
    .PARAMETER Name
        Specifies the name of the resource pool
    .PARAMETER ResourcePoolType
        Specifies the resource type of the resource pool.
    .PARAMETER ParentName
        Specifies the name of the parent resource pool for the new resource pool.
    .PARAMETER Paths
        Specifies an array of paths to be associated with a new storage resource pool.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the resource pool is to be created. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMResourcePool])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMResourcePoolType[]]
        ${ResourcePoolType},

        [Parameter(Position=2)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ParentName},

        [Parameter(Position=3)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Paths},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function New-VMSan {
    <#
    .SYNOPSIS
        Creates a new virtual storage area network (SAN) on a Hyper-V host.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies the friendly name of a Hyper-V host on which the new virtual storage area network (SAN) is to be created. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies the friendly name of the virtual storage area network (SAN) to be created.
    .PARAMETER Note
        Specifies a note to be associated with the virtual storage area network (SAN) to be created.
    .PARAMETER HostBusAdapter
        Specifies the host bus adapter (HBA) to be associated with the virtual storage area network (SAN) to be created. This can be retrieved by running the Get-InitiatorPort cmdlet.
    .PARAMETER WorldWideNodeName
        Specifies the world wide node name (WWNN) of the host bus adapters to be associated with the virtual storage area network (SAN) to be created.
    .PARAMETER WorldWidePortName
        Specifies the world wide port name (WWPN) of the host bus adapters to be associated with the virtual storage area network (SAN) to be created.
    #>

    [CmdletBinding(DefaultParameterSetName='HbaObject', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSan])]
    param (
        [ValidateNotNullOrEmpty()]
        [CimSession]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential]
        [System.Management.Automation.CredentialAttribute()]
        ${Credential},

        [Parameter(Mandatory=$true, Position=0)]
        [Alias('SanName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [ValidateNotNull()]
        [string]
        ${Note},

        [Parameter(ParameterSetName='HbaObject')]
        [ValidateNotNullOrEmpty()]
        [ciminstance[]]
        ${HostBusAdapter},

        [Parameter(ParameterSetName='StringWwn', Mandatory=$true)]
        [Alias('Wwnn','NodeName','Wwnns','NodeNames','WorldWideNodeNames','NodeAddress')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${WorldWideNodeName},

        [Parameter(ParameterSetName='StringWwn', Mandatory=$true)]
        [Alias('Wwpn','PortName','Wwpns','PortNames','WorldWidePortNames','PortAddress')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${WorldWidePortName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function New-VMSwitch {
    <#
    .SYNOPSIS
        Creates a new virtual switch on one or more virtual machine hosts.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual switch is to be created. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies the name of the switch to be created.
    .PARAMETER SwitchType
        Specifies the type of the switch to be created. Allowed values are Internal and Private . To create an External virtual switch, specify either the NetAdapterInterfaceDescription or the NetAdapterName parameter, which implicitly set the type of the virtual switch to External.
    .PARAMETER AllowManagementOS
        Specifies whether the parent partition (i.e. the management operating system) is to have access to the physical NIC bound to the virtual switch to be created.
    .PARAMETER NetAdapterName
        Specifies the name of the network adapter to be bound to the switch to be created. You can use the Get-NetAdapter cmdlet to get the interface description of a network adapter.
    .PARAMETER NetAdapterInterfaceDescription
        Specifies the interface description of the network adapter to be bound to the switch to be created. You can use the Get-NetAdapter cmdlet to get the interface description of a network adapter.
    .PARAMETER Notes
        Specifies a note to be associated with the switch to be created.
    .PARAMETER MinimumBandwidthMode
        Specifies how minimum bandwidth is to be configured on the virtual switch. Allowed values are Absolute , Default , None , or Weight . If Absolute is specified, minimum bandwidth is bits per second. If Weight is specified, minimum bandwidth is a value ranging from 1 to 100. If None is specified, minimum bandwidth is disabled on the switch - that is, users cannot configure it on any network adapter connected to the switch. If Default is specified, the system will set the mode to Weight , if the switch is not IOV-enabled, or None if the switch is IOV-enabled.
    .PARAMETER EnableIov
        Specifies that IO virtualization is to be enabled on the virtual switch to be created.
    .PARAMETER EnablePacketDirect
        Specifies whether this cmdlet enables the packet direct path through the virtual switch. The default value is $False.
    .PARAMETER EnableEmbeddedTeaming
        Specifies whether this cmdlet enables teaming for the virtual switch.
    #>

    [CmdletBinding(DefaultParameterSetName='NetAdapterName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitch])]
    param (
        [Parameter(ParameterSetName='NetAdapterName', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='SwitchType', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='SwitchType', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='NetAdapterName', ValueFromPipelineByPropertyName=$true)]
        [Alias('PSComputerName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='NetAdapterName', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='SwitchType', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(Mandatory=$true, Position=0)]
        [Alias('SwitchName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Alias('SwitchId')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Id},

        [Parameter(ParameterSetName='SwitchType', Mandatory=$true)]
        [ValidateSet('Internal','Private')]
        [Microsoft.HyperV.PowerShell.VMSwitchType]
        ${SwitchType},

        [Parameter(ParameterSetName='NetAdapterInterfaceDescription')]
        [Parameter(ParameterSetName='NetAdapterName')]
        [bool]
        ${AllowManagementOS},

        [Parameter(ParameterSetName='NetAdapterName', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('InterfaceAlias')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${NetAdapterName},

        [Parameter(ParameterSetName='NetAdapterInterfaceDescription', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('InterfaceDescription')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${NetAdapterInterfaceDescription},

        [ValidateNotNull()]
        [string]
        ${Notes},

        [Microsoft.HyperV.PowerShell.VMSwitchBandwidthMode]
        ${MinimumBandwidthMode},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${EnableIov},

        [System.Nullable[bool]]
        ${EnablePacketDirect},

        [System.Nullable[bool]]
        ${EnableEmbeddedTeaming}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Optimize-VHD {
    <#
    .SYNOPSIS
        Optimizes the allocation of space used by virtual hard disk files, except for fixed virtual hard disks.
    .PARAMETER Path
        Specifies one or more paths to the dynamic or differencing virtual hard disk files to be optimized.
    .PARAMETER Mode
        Specifies the mode in which the virtual hard disk is to be optimized. For a VHD disk, the default mode is Full . For a VHDX disk, the default mode is Quick . Valid modes are as follows:

        -- Full scans for zero blocks and reclaims unused blocks. (Allowable only if the virtual hard disk is mounted read-only.) -- Pretrimmed performs as Quick mode, but does not require the virtual hard disk to be mounted read-only. The detection of unused space is less effective than Quick mode (in which the virtual hard disk had been mounted read-only) because the scan cannot query information about free space in the NTFS file system within the virtual hard disk. Useful when the VHDX-format file has been used by operating system instances that are at least Windows 8 or Windows Server 2012, or when this cmdlet has already been run on a .vhdx file in Retrim mode. -- Prezeroed performs as Quick mode, but does not require the virtual hard disk to be mounted read-only. The unused space detection will be less effective than if the virtual hard disk had been mounted read-only as the scan will be unable to query information about free space in the NTFS file system within the virtual hard disk. Useful if a tool was run previously to zero all the free space on the virtual disk as this mode of compaction can then reclaim that space for subsequent block allocations. This form of compaction can also be useful in handling virtual hard disk containing file systems other than NTFS. -- Quick reclaims unused blocks, but does not scan for zero blocks. (Allowable only if the virtual hard disk is mounted read-only.) -- Retrim sends down retrims without scanning for zero blocks or reclaiming unused blocks. (Allowable only if the virtual hard disk is mounted read-only.)
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the virtual hard disk to be optimized.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which a virtual machine is to be optimized. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.Vhd.PowerShell.VirtualHardDisk])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('FullName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Path},

        [ValidateNotNullOrEmpty()]
        [Microsoft.Vhd.PowerShell.VhdCompactMode]
        ${Mode},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Optimize-VHDSet {
    <#
    .SYNOPSIS
        Optimizes VHD set files.
    .PARAMETER Path
        Specifies an array of paths of VHD sets that this cmdlet optimizes.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Indicates that this cmdlet returns the Microsoft.HyperV.PowerShell.VirtualHardDisk object that it optimizes.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.Vhd.PowerShell.VirtualHardDisk])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('FullName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Path},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VHDSnapshot {
    <#
    .SYNOPSIS
        Removes a checkpoint from a VHD set file.
    .PARAMETER Path
        Specifies an array of paths of VHD set files. This cmdlet removes a checkpoint from the files that this parameter specifies. If you specify a file name or relative path, the cmdlet determines the full path relative to the current working folder.
    .PARAMETER PersistReferencePoint
        Indicates that this cmdlet persists an RCT-only reference point after it deletes the checkpoint.
    .PARAMETER SnapshotId
        Specifies an array of unique IDs of VHD checkpoint that this cmdlet removes from the VHD set file.
    .PARAMETER VHDSnapshot
        Specifies an array of VHD checkpoints that this cmdlet removes from a VHD set file.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='Path', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [Parameter(ParameterSetName='Path', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('FullName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Path},

        [switch]
        ${PersistReferencePoint},

        [Parameter(ParameterSetName='Path', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [guid[]]
        ${SnapshotId},

        [Parameter(ParameterSetName='VHDSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.Vhd.PowerShell.VHDSnapshotInfo[]]
        ${VHDSnapshot},

        [switch]
        ${AsJob},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VM {
    <#
    .SYNOPSIS
        Deletes a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts from which the virtual machine is to be deleted. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies the name of the virtual machine to be deleted.
    .PARAMETER VM
        Specifies the virtual machine to be deleted.
    .PARAMETER Force
        Specifies that confirmation prompts are to be suppressed during deletion of the virtual machine.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the virtual machine to be deleted.
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [switch]
        ${Force},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMAssignableDevice {
    <#
    .SYNOPSIS
        Remove-VMAssignableDevice [-VMName] <string[]> [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-InstancePath <string>] [-LocationPath <string>] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-VMAssignableDevice [-VMAssignableDevice] <VMAssignedDevice[]> [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMAssignedDevice])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMAssignedDevice[]]
        ${VMAssignableDevice},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${InstancePath},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${LocationPath},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMDvdDrive {
    <#
    .SYNOPSIS
        Deletes a DVD drive from a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts from which the DVD drive is to be deleted. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine from which the DVD drive is to be deleted.
    .PARAMETER VMDvdDrive
        Specifies the DVD drive to be deleted.
    .PARAMETER ControllerNumber
        Specifies the number of the controller from which the DVD drive is to be deleted. If not specified, the first IDE controller on which the specified ControllerLocation is available is used.
    .PARAMETER ControllerLocation
        Specifies the number of the location on the controller at which the DVD drive is to be deleted. If not specified, the number of the first available location on the controller is used.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the DVD drive to be deleted.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.DvdDrive])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [Parameter(ParameterSetName='VMDvdDrive', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.DvdDrive[]]
        ${VMDvdDrive},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [System.Nullable[int]]
        ${ControllerNumber},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=2)]
        [ValidateNotNullOrEmpty()]
        [System.Nullable[int]]
        ${ControllerLocation},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMFibreChannelHba {
    <#
    .SYNOPSIS
        Removes a Fibre Channel host bus adapter from a virtual machine.
    .PARAMETER VMName
        Specifies the virtual machine from which the Fibre Channel host bus adapters are to be removed.
    .PARAMETER VMFibreChannelHba
        Specifies one or more Fibre Channel host bus adapters to be removed from a virtual machine.
    .PARAMETER WorldWideNodeNameSetA
        Specifies the World Wide Node name of address set A associated with the Fibre Channel host bus adapter to be removed.
    .PARAMETER WorldWidePortNameSetA
        Specifies the World Wide Port name of address set A associated with the Fibre Channel host bus adapter to be removed.
    .PARAMETER WorldWideNodeNameSetB
        Specifies the World Wide Node name of address set B associated with the Fibre Channel host bus adapter to be removed.
    .PARAMETER WorldWidePortNameSetB
        Specifies the World Wide Port name of address set B associated with the Fibre Channel host bus adapter to be removed.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to be pipeline representing the removed Fibre Channel host bus adapter.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the Fibre Channel host bus adapter is to be removed. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='VMFibreChannelHba', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMFibreChannelHba])]
    param (
        [Parameter(ParameterSetName='VMName and WWN', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [Parameter(ParameterSetName='VMFibreChannelHba', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMFibreChannelHba[]]
        ${VMFibreChannelHba},

        [Parameter(ParameterSetName='VMName and WWN', Mandatory=$true, Position=1)]
        [Alias('Wwnn1')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${WorldWideNodeNameSetA},

        [Parameter(ParameterSetName='VMName and WWN', Mandatory=$true, Position=2)]
        [Alias('Wwpn1')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${WorldWidePortNameSetA},

        [Parameter(ParameterSetName='VMName and WWN', Mandatory=$true, Position=3)]
        [Alias('Wwnn2')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${WorldWideNodeNameSetB},

        [Parameter(ParameterSetName='VMName and WWN', Mandatory=$true, Position=4)]
        [Alias('Wwpn2')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${WorldWidePortNameSetB},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMGpuPartitionAdapter {
    <#
    .SYNOPSIS
        Remove-VMGpuPartitionAdapter [-VMName] <string[]> [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-Passthru] [-AdapterId <string>] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-VMGpuPartitionAdapter [-VM] <VirtualMachine[]> [-Passthru] [-AdapterId <string>] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-VMGpuPartitionAdapter [-VMGpuPartitionAdapter] <VMGpuPartitionAdapter[]> [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMGpuPartitionAdapter])]
    param (
        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMGpuPartitionAdapter[]]
        ${VMGpuPartitionAdapter},

        [switch]
        ${Passthru},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${AdapterId}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMGroup {
    <#
    .SYNOPSIS
        Removes a virtual machine group.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies the name of an empty virtual machine group that this cmdlet removes.
    .PARAMETER Id
        Specifies the unique ID of an empty virtual machine group that this cmldet removes.
    .PARAMETER VMGroup
        Specifies an empty virtual machine group that this cmdlet removes. To obtain a VMGroup object, use the Get-VMGroup cmdlet.
    .PARAMETER Force
        Forces the command to run without asking for user confirmation.
    #>

    [CmdletBinding(DefaultParameterSetName='Name')]
    param (
        [Parameter(ParameterSetName='Name')]
        [Parameter(ParameterSetName='Id')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [Parameter(ParameterSetName='Id')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [Parameter(ParameterSetName='Id')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='Id', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [guid]
        ${Id},

        [Parameter(ParameterSetName='InputObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMGroup]
        ${VMGroup},

        [switch]
        ${Force}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMGroupMember {
    <#
    .SYNOPSIS
        Removes members from a virtual machine group.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies the name of the virtual machine group from which this cmdlet removes virtual machines or groups of virtual machines.
    .PARAMETER Id
        Specifies the unique ID of the virtual machine group from which this cmdlet removes virtual machines or groups of virtual machines.
    .PARAMETER VMGroup
        Specifies the virtual machine group from which this cmdlet removes virtual machines or groups of virtual machines. To obtain a VMGroup object, use the Get-VMGroup cmdlet.
    .PARAMETER VM
        Specifies an array of virtual machines that this cmdlet removes from a virtual machine group. To obtain a VirtualMachine object, use the Get-VM cmdlet.
    .PARAMETER VMGroupMember
        Specifies an array of groups of virtual machines that this cmdlet removes from a virtual machine group.
    .PARAMETER Passthru
        Indicates that this cmdlet returns the Microsoft.HyperV.PowerShell.VMGroup object that it configures.
    #>

    [CmdletBinding(DefaultParameterSetName='VM Using Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMGroup])]
    param (
        [Parameter(ParameterSetName='VMGroup Using ID')]
        [Parameter(ParameterSetName='VM Using Name')]
        [Parameter(ParameterSetName='VMGroup Using Name')]
        [Parameter(ParameterSetName='VM Using ID')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VM Using Name')]
        [Parameter(ParameterSetName='VMGroup Using Name')]
        [Parameter(ParameterSetName='VM Using ID')]
        [Parameter(ParameterSetName='VMGroup Using ID')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VM Using Name')]
        [Parameter(ParameterSetName='VMGroup Using Name')]
        [Parameter(ParameterSetName='VM Using ID')]
        [Parameter(ParameterSetName='VMGroup Using ID')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMGroup Using Name', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='VM Using Name', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='VM Using ID', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='VMGroup Using ID', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [guid]
        ${Id},

        [Parameter(ParameterSetName='VM Using InputObject', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='VMGroup Using InputObject', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMGroup]
        ${VMGroup},

        [Parameter(ParameterSetName='VM Using InputObject', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VM Using Name', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VM Using ID', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMGroup Using Name', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VMGroup Using ID', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VMGroup Using InputObject', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMGroup[]]
        ${VMGroupMember},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMHardDiskDrive {
    <#
    .SYNOPSIS
        Deletes a hard disk drive from a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts from which the virtual hard disk drive is to be deleted. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine from which the virtual hard disk is to be deleted.
    .PARAMETER VMHardDiskDrive
        Specifies the virtual hard disk drive to be deleted.
    .PARAMETER ControllerType
        Specifies the type of the controller where the virtual hard disk is to be deleted. Allowed values are IDE and SCSI .
    .PARAMETER ControllerNumber
        Specifies the number of the controller from which the virtual hard disk drive is to be deleted. If not specified, the first controller on which the specified ControllerLocation is available is used.
    .PARAMETER ControllerLocation
        Specifies the number of the location on the controller at which the virtual hard disk drive is to be deleted. If not specified, the number of the first available location on the controller is used.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to be pipeline representing the virtual hard disk drive to be deleted.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.HardDiskDrive])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [Parameter(ParameterSetName='VMHardDiskDrive', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.HardDiskDrive[]]
        ${VMHardDiskDrive},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [System.Nullable[Microsoft.HyperV.PowerShell.ControllerType]]
        ${ControllerType},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=2)]
        [ValidateNotNullOrEmpty()]
        [System.Nullable[int]]
        ${ControllerNumber},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=3)]
        [System.Nullable[int]]
        ${ControllerLocation},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMHostAssignableDevice {
    <#
    .SYNOPSIS
        Remove-VMHostAssignableDevice -ResourcePoolName <string[]> [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-InstancePath <string>] [-LocationPath <string>] [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-VMHostAssignableDevice [-VMHostAssignableDevice] <VMHostAssignableDevice[]> -ResourcePoolName <string[]> [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Path', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [Parameter(ParameterSetName='Path')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Path')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Path')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Path')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${InstancePath},

        [Parameter(ParameterSetName='Path')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${LocationPath},

        [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMHostAssignableDevice[]]
        ${VMHostAssignableDevice},

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ResourcePoolName},

        [switch]
        ${Force}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMKeyStorageDrive {
    <#
    .SYNOPSIS
        Remove-VMKeyStorageDrive [-VMName] <string> [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-VMKeyStorageDrive [-VMKeyStorageDrive] <KeyStorageDrive[]> [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.KeyStorageDrive])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [Parameter(ParameterSetName='VMKeyStorageDrive', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.KeyStorageDrive[]]
        ${VMKeyStorageDrive},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMMigrationNetwork {
    <#
    .SYNOPSIS
        Removes a network from use with migration.
    .PARAMETER Subnet
        Specifies a string representing an IPv4 or IPv6 subnet mask which identifies the network to be removed from use with migration.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the network is to be removed from use with migration. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.MigrationNetwork object is to be passed through to the pipeline representing the network removed from use with migration.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMMigrationNetwork])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Subnet},

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMNetworkAdapter {
    <#
    .SYNOPSIS
        Removes one or more virtual network adapters from a virtual machine.
    .PARAMETER VMNetworkAdapter
        Specifies the virtual machine network adapter to be removed.
    .PARAMETER ManagementOS
        Specifies the management operating system  of the virtual network adapter to be removed.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual network adapter is to be removed. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine that has the virtual network adapter you want to remove.
    .PARAMETER VM
        Specifies the virtual machine that has the virtual network adapter you want to remove.
    .PARAMETER Name
        Specifies the name of the virtual network adapter to be removed.
    .PARAMETER SwitchName
        Specifies the name of the virtual switch connected to the virtual network adapter to be removed.
    .PARAMETER Passthru
        Specifies that an object to be passed through to the pipeline representing the virtual machine network adapter to be removed. This is a Microsoft.HyperV.PowerShell.VMInternalNetworkAdapter object, if -ManagementOS is specified; otherwise it is a Microsoft.HyperV.PowerShell.VMNetworkAdapter object.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterBase])]
    param (
        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Alias('VMNetworkAdapterName')]
        [string]
        ${Name},

        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SwitchName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMNetworkAdapterAcl {
    <#
    .SYNOPSIS
        Removes an ACL applied to the traffic through a virtual network adapter.
    .PARAMETER VMNetworkAdapter
        Specifies the virtual machine network adapter from which ACL is to be removed.
    .PARAMETER ManagementOS
        Specifies that the ACL is to be removed from the management (e.g. the parent, or host) operating system.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of the virtual machine network adapter from which the ACL is to be removed.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the ACL applied to a virtual machine network adapter is to be removed. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine from which the ACL is to be removed.
    .PARAMETER VM
        Specifies the virtual machine from which the ACL is to be removed.
    .PARAMETER InputObject
        Specifies the ACL to be removed.
    .PARAMETER Action
        Specifies the action of the ACL to be removed. Allowed values are Allow , Deny , and Meter .
    .PARAMETER Direction
        The direction of the network traffic (from the perspective of the virtual machine) to which the ACL applies. Allowed values are Inbound , Outbound , or Both .
    .PARAMETER LocalIPAddress
        Specifies the local IP address. It can be either IPv4 or IPv6 address. It can be either a host address or a subnet address, e.g. 1.2.3.4, 2001::2008, 192.168.1.0/24, or f001:f002:f003:f004::1/64.the IP address can also be a wildcard, 0.0.0.0/0 for all IPv4 addresses, ::/0 for all IPv6 addresses, or ANY for all IPv4 and IPv6 addresses.
    .PARAMETER LocalMacAddress
        Specifies the local MAC address (e.g. 00-ab-00-11-22-33). Use the wildcard ANY to specify all MAC addresses.
    .PARAMETER RemoteIPAddress
        Specifies the remote IP address. . It can be either IPv4 or IPv6 address. It can be either a host address or a subnet address, e.g. 1.2.3.4, 2001::2008, 192.168.1.0/24, or f001:f002:f003:f004::1/64. the IP address can also be a wildcard, 0.0.0.0/0 for all IPv4 addresses, ::/0 for all IPv6 addresses, or ANY for all IPv4 and IPv6 addresses.
    .PARAMETER RemoteMacAddress
        Specifies the remote MAC address. . It can be a host MAC address, e.g. 00-ab-00-11-22-33, or a wildcard, ANY, for all MAC addresses.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.VMNetworkAdapterAclSetting object is to be passed through to the pipeline representing the ACL to be removed.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterAclSetting])]
    param (
        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [string]
        ${VMNetworkAdapterName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='InputObjectParameter', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterAclSetting[]]
        ${InputObject},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true)]
        [Parameter(ParameterSetName='VMName', Mandatory=$true)]
        [Parameter(ParameterSetName='VMObject', Mandatory=$true)]
        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterAclAction]
        ${Action},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [Parameter(ParameterSetName='VMName', Mandatory=$true)]
        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true)]
        [Parameter(ParameterSetName='VMObject', Mandatory=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterAclDirection]
        ${Direction},

        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ResourceObject')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${LocalIPAddress},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ResourceObject')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${LocalMacAddress},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='ResourceObject')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${RemoteIPAddress},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ResourceObject')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${RemoteMacAddress},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMNetworkAdapterExtendedAcl {
    <#
    .SYNOPSIS
        Removes an extended ACL for a virtual network adapter.
    .PARAMETER VMNetworkAdapter
        Specifies an array virtual machine network adapters as VMNetworkAdapterBase objects. The cmdlet removes an ACL for the network adapters that you specify. To obtain a network adapter, use the Get-VMNetworkAdapter cmdlet.
    .PARAMETER ManagementOS
        Indicates that the cmdlet operates on the parent or host operating system. If you specify this parameter, this cmdlet removes an ACL that applies in the parent or host operating system.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of a virtual network adapter. The cmdlet removes an ACL for the network adapter that you specify.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies an array of Hyper-V hosts. The cmdlet removes an ACL associated with a virtual network adapter on the Hyper-V hosts that you specify.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies an array of names of virtual machines. The cmdlet removes an ACL for network adapters that belong to the virtual machines that you specify.
    .PARAMETER VM
        Specifies an array of virtual machines as VirutalMachine objects. The cmdlet removes an ACL for network adapters that belong to the virtual machines that you specify. To obtain a virtual machine object, use the Get-VM cmdlet.
    .PARAMETER InputObject
        Specifies the input to this cmdlet. You can use this parameter, or you can pipe the input to this cmdlet.
    .PARAMETER Weight
        Specifies the weight of an ACL entry. Because weight is unique for each entry, if you specify a value for this parameter, the cmdlet removes a specific extended ACL entry.
    .PARAMETER Direction
        Specifies the direction of network traffic, from the perspective of the virtual machine, to which the ACL applies. The cmdlet removes an ACL that has the value that you specify. The acceptable values for this parameter are:

        -- Inbound

        -- Outbound
    .PARAMETER Passthru
        Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterExtendedAclSetting])]
    param (
        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [string]
        ${VMNetworkAdapterName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='InputObjectParameter', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterExtendedAclSetting[]]
        ${InputObject},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [Parameter(ParameterSetName='VMName', Mandatory=$true)]
        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true)]
        [Parameter(ParameterSetName='VMObject', Mandatory=$true)]
        [int]
        ${Weight},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true)]
        [Parameter(ParameterSetName='VMName', Mandatory=$true)]
        [Parameter(ParameterSetName='VMObject', Mandatory=$true)]
        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterExtendedAclDirection]
        ${Direction},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMNetworkAdapterRoutingDomainMapping {
    <#
    .SYNOPSIS
        Removes a routing domain from a virtual network adapter.
    .PARAMETER VMNetworkAdapter
        Specifies an array of virtual machine network adapters as VMNetworkAdapterBase objects. The cmdlet removes the virtual subnet for the adapters that you specify. To obtain a network adapter, use the Get-VMNetworkAdapter cmdlet.
    .PARAMETER ManagementOS
        Indicates that the cmdlet removes the virtual subnet on the parent partition or host operating system.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of a virtual network adapter. The cmdlet removes the virtual subnet for the adapter that you specify.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies an array of Hyper-V hosts. The cmdlet removes the virtual subnets from the Hyper-V hosts that you specify.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies an array of names of virtual machines. The cmdlet removes the virtual subnet from the virtual machines that you specify.
    .PARAMETER VM
        Specifies an array of virtual machines. The cmdlet removes the virtual subnet from the virtual machines that you specify. To obtain a virtual machine object, use the Get-VM cmdlet.
    .PARAMETER InputObject
        Specifies the input to this cmdlet. You can use this parameter, or you can pipe the input to this cmdlet.
    .PARAMETER RoutingDomainID
        Specifies the ID of a routing domain. The ID of a routing domain is a system-assigned GUID. The cmdlet removes the virtual subnet from the routing domain that you specify.
    .PARAMETER RoutingDomainName
        Specifies the name of a routing domain. The cmdlet removes the virtual subnet from the routing domain that you specify.
    .PARAMETER Passthru
        Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterRoutingDomainSetting])]
    param (
        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='ManagementOS')]
        [string]
        ${VMNetworkAdapterName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='InputObjectParameter', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterRoutingDomainSetting[]]
        ${InputObject},

        [Parameter(ParameterSetName='ResourceObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='ManagementOS')]
        [guid]
        ${RoutingDomainID},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ResourceObject')]
        [Parameter(ParameterSetName='ManagementOS')]
        [string]
        ${RoutingDomainName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMNetworkAdapterTeamMapping {
    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterTeamMappingSetting])]
    param (
        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine]
        ${VM},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [Alias('VMNetworkAdapterName')]
        [string]
        ${Name},

        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SwitchName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMPmemController {
    <#
    .SYNOPSIS
        Remove-VMPmemController [-VMName] <string[]> [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-VMPmemController [-VMPmemController] <VMPmemController[]> [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMPmemController])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMPmemController[]]
        ${VMPmemController},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMRemoteFx3dVideoAdapter {
    <#
    .SYNOPSIS
        Removes a RemoteFX 3D video adapter from a virtual machine.
    .PARAMETER VM
        Specifies the virtual machine from which the RemoteFX 3D video adapter to be removed.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which a RemoteFX 3D video adapter is to be removed. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine from which the RemoteFX 3D video adapter is to be removed.
    .PARAMETER VMRemoteFx3dVideoAdapter
        Specifies the RemoteFX 3D video adapater to be removed.
    .PARAMETER Passthru
        Specifies that a VMRemoteFxVideoAdapter object is to be to be passed through to the pipeline representing the RemoteFX 3D video adapter to be removed.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMRemoteFx3DVideoAdapter])]
    param (
        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='RemoteFXAdapter', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMRemoteFx3DVideoAdapter[]]
        ${VMRemoteFx3dVideoAdapter},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMReplication {
    <#
    .SYNOPSIS
        Removes the replication relationship of a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the replication relationship of a virtual machine is to be removed. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine for which the replication relationship is to be removed.
    .PARAMETER VM
        Specifies the virtual machine for which the replication relationship is to be removed.
    .PARAMETER VMReplication
        Specifies a virtual machine replication object associated with the virtual machine whose replication relationship is to be removed.
    .PARAMETER ReplicationRelationshipType
        Specifies the replication relationship type of the virtual machine. Specify whether the replication relationship is a simple primary to replica or is an extended replication chain. The cmdlet removes the replication relationship of the virtual machines that have the replication type that you specify.
    .PARAMETER Passthru
        Specifies that a VMReplication object is to be passed through to the pipeline representing the virtual machine for which the replication relationship will be removed.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMReplication])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMReplication', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMReplication[]]
        ${VMReplication},

        [Parameter(ParameterSetName='VMName')]
        [Alias('Relationship')]
        [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationRelationshipType]]
        ${ReplicationRelationshipType},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMReplicationAuthorizationEntry {
    <#
    .SYNOPSIS
        Removes an authorization entry from a Replica server.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the authorization entry is to be removed. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER AllowedPrimaryServer
        Specifies the allowed primary server for which the authorization entry is to be removed.
    .PARAMETER VMReplicationAuthorizationEntry
        Specifies the authorization entry to be removed.
    .PARAMETER TrustGroup
        Specifies the trust group for which the authorization entries are to be removed.
    .PARAMETER Passthru
        Specifies that a VMReplicationAuthorizationEntry object is to be passed through to the pipeline representing the authorization entry to be removed.
    #>

    [CmdletBinding(DefaultParameterSetName='PrimaryServerName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMReplicationAuthorizationEntry])]
    param (
        [Parameter(ParameterSetName='PrimaryServerName')]
        [Parameter(ParameterSetName='TrustGroup')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='PrimaryServerName')]
        [Parameter(ParameterSetName='TrustGroup')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='PrimaryServerName')]
        [Parameter(ParameterSetName='TrustGroup')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='PrimaryServerName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('AllowedPS')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${AllowedPrimaryServer},

        [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMRepAuthEntry')]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMReplicationAuthorizationEntry[]]
        ${VMReplicationAuthorizationEntry},

        [Parameter(ParameterSetName='TrustGroup', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${TrustGroup},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMResourcePool {
    <#
    .SYNOPSIS
        Deletes a resource pool from one or more virtual machine hosts.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies the name of the resource pool.
    .PARAMETER ResourcePoolType
        Specifies the type of the resource pool to be deleted.
    .PARAMETER Passthru
        Specifies that a VMResourcePool object is to be passed through to the pipeline representing the removed resource pool.
    #>

    [CmdletBinding(DefaultParameterSetName='ComputerName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMResourcePool])]
    param (
        [Parameter(ParameterSetName='CimSession', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ComputerName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ComputerName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMResourcePoolType[]]
        ${ResourcePoolType},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMSan {
    <#
    .SYNOPSIS
        Removes a virtual storage area network (SAN) from a Hyper-V host.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER Name
        Specifies the name of the virtual storage area network (SAN) to be removed from the Hyper-V host.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the removed virtual machine storage area network.
    .PARAMETER ComputerName
        Specifies a Hyper-V host from which the virtual storage area network (SAN) is to be removed. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSan])]
    param (
        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [Alias('SanName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMSavedState {
    <#
    .SYNOPSIS
        Deletes the saved state of a saved virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual machine saved state is to be deleted. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine whose saved state is to be deleted.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose saved state is to be deleted.
    .PARAMETER VMSnapshot
        Specifies the snapshot whose saved state is to be deleted.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMScsiController {
    <#
    .SYNOPSIS
        Removes a SCSI controller from a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts from which the SCSI controller is to be removed. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMScsiController
        Specifies the SCSI controller to be removed.
    .PARAMETER VMName
        Specifies an array of names of virtual machines. The cmdlet removes an SCSI controller from the virtual machines that you specify.
    .PARAMETER ControllerNumber
        Specifies the number of the controller. The cmdlet removes the SCSI controller that you specify.
    .PARAMETER Passthru
        Specifies that a VMScsiController object is to be passed through to the pipeline representing the SCSI controller to be removed.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMScsiController])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMScsiController[]]
        ${VMScsiController},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=1)]
        [int]
        ${ControllerNumber},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMSnapshot {
    <#
    .SYNOPSIS
        Deletes a virtual machine checkpoint.
    .PARAMETER VM
        Specifies the virtual machine of which the checkpoint is to be deleted.
    .PARAMETER VMName
        Specifies the name of the virtual machine of which the checkpoint is to be deleted.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which this cmdlet deletes a checkpoint. NetBIOS names, IP addresses, and fully-qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMSnapshot
        Specifies the checkpoint to be deleted.
    .PARAMETER Name
        Specifies the name of the checkpoint to be deleted.
    .PARAMETER IncludeAllChildSnapshots
        Specifies that the checkpoint's children are to be deleted along with the checkpoint.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Indicates that this cmdlet returns a Microsoft.HyperV.PowerShell.VirtualMachine object that represents the checkpoint that it deletes.
    #>

    [CmdletBinding(DefaultParameterSetName='SnapshotName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSnapshot])]
    param (
        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='SnapshotName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='SnapshotName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='SnapshotName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='SnapshotName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='SnapshotObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSnapshot[]]
        ${VMSnapshot},

        [Parameter(ParameterSetName='SnapshotName', Position=1, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='VMObject', Position=1)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Alias('IncludeAllChildCheckpoints')]
        [switch]
        ${IncludeAllChildSnapshots},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMStoragePath {
    <#
    .SYNOPSIS
        Removes a path from a storage resource pool.
    .PARAMETER Path
        Specifies the path to be removed from the storage resource pool.
    .PARAMETER ResourcePoolName
        Specifies the name of the resource pool from which the path is to be removed.
    .PARAMETER ResourcePoolType
        Specifies the type of the resource pool from which the path is to be removed. Allowed values are VFD , ISO , and VHD .
    .PARAMETER Passthru
        Specifies that a System.String is to be passed through to the pipeline representing the path to be removed from the resource pool.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which a path is to be removed from a resource pool. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding()]
    [OutputType([Microsoft.HyperV.PowerShell.VMStorageResourcePool])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Path},

        [Parameter(Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ResourcePoolName},

        [Parameter(Mandatory=$true, Position=2)]
        [ValidateSet('VHD','ISO','VFD')]
        [Microsoft.HyperV.PowerShell.VMResourcePoolType]
        ${ResourcePoolType},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMSwitch {
    <#
    .SYNOPSIS
        Deletes a virtual switch.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual switch is to be deleted. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies the name of the virtual switch to be deleted.
    .PARAMETER VMSwitch
        Specifies the virtual switch to be deleted.
    .PARAMETER ResourcePoolName
        Specifies the name of the resource pool from which the switch is to be deleted.
    .PARAMETER Force
        Forces the command to run without asking for user confirmation.
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('SwitchName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='SwitchObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMSwitch[]]
        ${VMSwitch},

        [Parameter(Position=1)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ResourcePoolName},

        [switch]
        ${Force}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMSwitchExtensionPortFeature {
    <#
    .SYNOPSIS
        Removes a feature from a virtual network adapter.
    .PARAMETER VMSwitchExtensionFeature
        Specifies the feature to be removed.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.VMSwitchExtensionPortFeature is to be passed through to the pipeline representing the feature to be removed.
    .PARAMETER VMName
        Specifies the name of the virtual machine from which the feature is to be removed.
    .PARAMETER VMNetworkAdapter
        Specifies the virtual machine network adapter from which the feature is to be removed.
    .PARAMETER ManagementOS
        Specifies that the feature is to be removed from the management (e.g. the parent, or host) operating system.
    .PARAMETER ExternalPort
        Specifies the external port on the virtual switch that binds to a physical network adapter.
    .PARAMETER SwitchName
        Specifies the name of the virtual switch from which the feature is to be removed.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of the virtual network adapter from which the feature is to be removed.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER VM
        Specifies the virtual machine from which the feature is to be removed.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitchExtensionPortFeature])]
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitchExtensionPortFeature[]]
        ${VMSwitchExtensionFeature},

        [switch]
        ${Passthru},

        [string[]]
        ${VMName},

        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [switch]
        ${ManagementOS},

        [switch]
        ${ExternalPort},

        [string]
        ${SwitchName},

        [string]
        ${VMNetworkAdapterName},

        [string[]]
        ${ComputerName},

        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMSwitchExtensionSwitchFeature {
    <#
    .SYNOPSIS
        Removes a feature from a virtual switch.
    .PARAMETER VMSwitchExtensionFeature
        Specifies the feature to be removed.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.VMSwitchExtensionSwitchFeature is to be passed through to the pipeline representing the feature to be removed.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER SwitchName
        Specifies the name of the virtual switch from which the feature is to be removed.
    .PARAMETER VMSwitch
        Specifies the virtual switch from which the feature is to be removed.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitchExtensionSwitchFeature])]
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitchExtensionSwitchFeature[]]
        ${VMSwitchExtensionFeature},

        [switch]
        ${Passthru},

        [string[]]
        ${ComputerName},

        [string[]]
        ${SwitchName},

        [Microsoft.HyperV.PowerShell.VMSwitch[]]
        ${VMSwitch},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMSwitchTeamMember {
    <#
    .SYNOPSIS
        Removes a member from a virtual machine switch team.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER VMSwitch
        Specifies an array of virtual switches from which this cmdlet removes network adapters. To obtain a VMSwitch object, use the Get-VMSwitch cmdlet.
    .PARAMETER VMSwitchName
        Specifies an array of names of virtual switches from which this cmdlet removes network adapters.
    .PARAMETER NetAdapterName
        Specifies an array of names of virtual network adapters that this cmdlet removes from a switch team.
    .PARAMETER NetAdapterInterfaceDescription
        Specifies an array of interface descriptions of virtual network adapters that this cmdlet removes from a switch team.
    .PARAMETER Passthru
        Indicates that this cmdlet returns the Microsoft.HyperV.PowerShell.VMSwitch object that it modifies.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='SwitchName_NetAdapterName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitch])]
    param (
        [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='SwitchName_NetAdapterName', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterName', ValueFromPipelineByPropertyName=$true)]
        [Alias('PSComputerName')]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='SwitchObject_NetAdapterName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitch[]]
        ${VMSwitch},

        [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='SwitchName_NetAdapterName', Mandatory=$true, Position=0)]
        [Alias('SwitchName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMSwitchName},

        [Parameter(ParameterSetName='SwitchName_NetAdapterName')]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterName')]
        [Alias('InterfaceAlias')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${NetAdapterName},

        [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription')]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${NetAdapterInterfaceDescription},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Rename-VM {
    <#
    .SYNOPSIS
        Renames a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which this cmdlet operates. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine to be renamed.
    .PARAMETER Name
        Specifies the name of the virtual machine to be renamed.
    .PARAMETER NewName
        Specifies the name to which the virtual machine is to be renamed.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the virtual machine to be renamed.
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Rename-VMGroup {
    <#
    .SYNOPSIS
        Renames virtual machine groups.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies an array of names of virtual machine groups that this cmdlet renames.
    .PARAMETER Id
        Specifies the unique ID of the virtual machine group that this cmdlet renames.
    .PARAMETER VMGroup
        Specifies an array of virtual machine groups that this cmdlet renames. To obtain a VMGroup object, use the Get-VMGroup cmdlet.
    .PARAMETER NewName
        Specifies the new name for the virtual machine group.
    .PARAMETER Passthru
        Indicates that this cmdlet returns the Microsoft.HyperV.PowerShell.VMGroup object that it renames.
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMGroup])]
    param (
        [Parameter(ParameterSetName='Name')]
        [Parameter(ParameterSetName='Id')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [Parameter(ParameterSetName='Id')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [Parameter(ParameterSetName='Id')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Id', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [guid]
        ${Id},

        [Parameter(ParameterSetName='InputObject', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMGroup[]]
        ${VMGroup},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='Id', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='InputObject', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Rename-VMNetworkAdapter {
    <#
    .SYNOPSIS
        Renames a virtual network adapter on a virtual machine or on the management operating system.
    .PARAMETER VMNetworkAdapter
        Specifies the virtual network adapter to be renamed.
    .PARAMETER ManagementOS
        Specifies that you want to rename a virtual network adapter that belongs to the management operating system.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual network adapter is to be renamed. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine that has the virtual network adapter you want to rename.
    .PARAMETER VMName
        Specifies the name of the virtual machine that has the virtual network adapter you want to rename.
    .PARAMETER Name
        Specifies the existing name of the virtual network adapter.
    .PARAMETER NewName
        Specifies the new name for the virtual network adapter.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the virtual network adapter to be renamed. This is a Microsoft.HyperV.PowerShell.VMInternalNetworkAdapter object, if ManagementOS is specified; otherwise it is a Microsoft.HyperV.PowerShell.VMNetworkAdapter object.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterBase])]
    param (
        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMName', Position=1)]
        [Parameter(ParameterSetName='VMObject', Position=1)]
        [Parameter(ParameterSetName='ManagementOS', Position=1)]
        [Alias('VMNetworkAdapterName')]
        [string]
        ${Name},

        [Parameter(Mandatory=$true, Position=2)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Rename-VMResourcePool {
    <#
    .SYNOPSIS
        Renames a resource pool on one or more Hyper-V hosts.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER Name
        Specifies the friendly name of the resource pool to be renamed.
    .PARAMETER ResourcePoolType
        Specifies the type of the resource pool to be renamed.
    .PARAMETER NewName
        Specifies the name to which the specified resource pool is to be renamed.
    .PARAMETER Passthru
        Specifies that a VMResourcePool object is to be passed through to the pipeline representing the resource pool to be renamed.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the resource pool is to be renamed. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMResourcePool])]
    param (
        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Microsoft.HyperV.PowerShell.VMResourcePoolType]
        ${ResourcePoolType},

        [Parameter(Mandatory=$true, Position=2)]
        [string]
        ${NewName},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Rename-VMSan {
    <#
    .SYNOPSIS
        Renames a virtual storage area network (SAN).
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER Name
        Specifies the current name of the virtual storage area network (SAN) to be renamed.
    .PARAMETER NewName
        Specifies the new name of the virtual storage area network (SAN) to be renamed.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the renamed virtual storage area network (SAN).
    .PARAMETER ComputerName
        Specifies the name of the Hyper-V host on which the virtual storage area network (SAN) is to be renamed. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSan])]
    param (
        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [Alias('SanName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewName},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Rename-VMSnapshot {
    <#
    .SYNOPSIS
        Renames a virtual machine checkpoint.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual machine checkpoint is to be renamed. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMSnapshot
        Specifies the virtual machine checkpoint to be renamed.
    .PARAMETER VM
        Specifies the virtual machine of which the checkpoint is to be renamed.
    .PARAMETER Name
        Specifies the name of the virtual machine checkpoint to be renamed.
    .PARAMETER VMName
        Specifies the name of the virtual machine of which the checkpoint is to be renamed.
    .PARAMETER NewName
        Specifies the name to which the virtual machine checkpoint is to be renamed.
    .PARAMETER Passthru
        Specifies that a VMSnapshot object is to be passed through to the pipeline representing the virtual machine checkpoint to be renamed.
    #>

    [CmdletBinding(DefaultParameterSetName='SnapshotName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSnapshot])]
    param (
        [Parameter(ParameterSetName='SnapshotName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='SnapshotName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='SnapshotName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='SnapshotObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='VM', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VirtualMachine]
        ${VM},

        [Parameter(ParameterSetName='SnapshotName', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='VM', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='SnapshotName', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [Parameter(Mandatory=$true, Position=2)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Rename-VMSwitch {
    <#
    .SYNOPSIS
        Renames a virtual switch.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual switch is to be renamed. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMSwitch
        Specifies the virtual switch to be renamed.
    .PARAMETER Name
        Specifies the name of the virtual switch to be renamed.
    .PARAMETER NewName
        Specifies the name to which the virtual switch is to be renamed.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.EthernetSwitch object is to be passed through to the pipeline representing the virtual switch to be renamed.
    #>

    [CmdletBinding(DefaultParameterSetName='SwitchName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitch])]
    param (
        [Parameter(ParameterSetName='SwitchName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='SwitchName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='SwitchName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='SwitchObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitch]
        ${VMSwitch},

        [Parameter(ParameterSetName='SwitchName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('SwitchName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(Mandatory=$true, Position=2)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Repair-VM {
    <#
    .SYNOPSIS
        Repairs one or more virtual machines.
    .PARAMETER CompatibilityReport
        Specifies a compatibility report which includes adjustments to be made during repair.
    .PARAMETER SnapshotFilePath
        Specifies the path to be search for virtual machine snapshots.
    .PARAMETER Path
        Specifies the path of the virtual machine to be repaired.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the newly modified compatibility report.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMCompatibilityReport])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMCompatibilityReport]
        ${CompatibilityReport},

        [Alias('CheckpointFileLocation','SnapshotFileLocation')]
        [string]
        ${SnapshotFilePath},

        [string]
        ${Path},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Reset-VMReplicationStatistics {
    <#
    .SYNOPSIS
        Resets the replication statistics of a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the replication statistics of a virtual machine are to be reset. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose replication statistics are to be reset.
    .PARAMETER VM
        Specifies the virtual machine whose replication statistics are to be reset.
    .PARAMETER VMReplication
        Specifies the virtual machine replication whose replication statistics are to be reset.
    .PARAMETER ReplicationRelationshipType
        Specifies the replication relationship type of the virtual machine. Specify whether the replication relationship is a simple primary to replica or is an extended replication chain. The cmdlet resets the replication statistics for the virtual machines that have the replication type that you specify.
    .PARAMETER Passthru
        Specifies that a VMReplication object is to be passed through to the pipeline representing the replication whose statistics are to be reset.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMReplication])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMReplication', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMReplication[]]
        ${VMReplication},

        [Parameter(ParameterSetName='VMName')]
        [Alias('Relationship')]
        [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationRelationshipType]]
        ${ReplicationRelationshipType},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Reset-VMResourceMetering {
    <#
    .SYNOPSIS
        Resets the resource utilization data collected by Hyper-V resource metering.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more virtual machine hosts for which resource utilization data is to be reset. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine for which resource utilization data is to be reset.
    .PARAMETER VMName
        Specifies the friendly name of the virtual machine for which resource utilization data is to be reset.
    .PARAMETER ResourcePoolName
        Specifies the friendly name of the virtual machine resource pool for which resource utilization data is to be reset.
    .PARAMETER ResourcePoolType
        Specifies the resource type of the virtual machine resource pool for which resource utilization data is to be reset.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName')]
    param (
        [Parameter(ParameterSetName='VMName', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='ResourcePool', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ResourcePool')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ResourcePool')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='ResourcePool', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ResourcePoolName},

        [Parameter(ParameterSetName='ResourcePool', Position=1, ValueFromPipelineByPropertyName=$true)]
        [ValidateSet('Ethernet','Memory','Processor','VHD')]
        [Microsoft.HyperV.PowerShell.VMResourcePoolType]
        ${ResourcePoolType}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Resize-VHD {
    <#
    .SYNOPSIS
        Resizes a virtual hard disk.
    .PARAMETER Path
        Specifies the path to the virtual hard disk that is to be resized.
    .PARAMETER SizeBytes
        Specifies the size to which the virtual hard disk is to be resized.
    .PARAMETER ToMinimumSize
        Specifies that the virtual hard disk is to be resized to its minimum possible size.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the virtual hard disk to be resized.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which a virtual hard disk is to be resized. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='Size', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.Vhd.PowerShell.VirtualHardDisk])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('FullName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Path},

        [Parameter(ParameterSetName='Size', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [uint64]
        ${SizeBytes},

        [Parameter(ParameterSetName='MinimumSize', Mandatory=$true)]
        [switch]
        ${ToMinimumSize},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Restart-VM {
    <#
    .SYNOPSIS
        Restarts a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual machine is to be restarted. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine to be restarted.
    .PARAMETER Name
        Specifies the name of the virtual machine to be restarted.
    .PARAMETER Force
        Specifies that no prompt for confirmation is to appear before the virtual machine is restarted.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the virtual machine to be restarted.
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='Name')]
        [Parameter(ParameterSetName='NameWait')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [Parameter(ParameterSetName='NameWait')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [Parameter(ParameterSetName='NameWait')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='VMObjectWait', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='NameWait', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [switch]
        ${Force},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru},

        [Parameter(ParameterSetName='VMObjectWait', Mandatory=$true)]
        [Parameter(ParameterSetName='NameWait', Mandatory=$true)]
        [switch]
        ${Wait},

        [Parameter(ParameterSetName='NameWait')]
        [Parameter(ParameterSetName='VMObjectWait')]
        [Microsoft.HyperV.PowerShell.Commands.RestartVM+WaitVMTypes]
        ${For},

        [Parameter(ParameterSetName='NameWait')]
        [Parameter(ParameterSetName='VMObjectWait')]
        [ValidateRange(1, 65535)]
        [uint16]
        ${Delay},

        [Parameter(ParameterSetName='NameWait')]
        [Parameter(ParameterSetName='VMObjectWait')]
        [Alias('TimeoutSec')]
        [ValidateRange(-1, 2147483647)]
        [System.Nullable[int]]
        ${Timeout},

        [Parameter(ParameterSetName='Name')]
        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='NameWait')]
        [Parameter(ParameterSetName='VMObjectWait')]
        [Microsoft.HyperV.PowerShell.Commands.RestartVM+RestartType]
        ${Type}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Restore-VMSnapshot {
    <#
    .SYNOPSIS
        Restores a virtual machine checkpoint.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual machine checkpoint is to be restored.  NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMSnapshot
        Specifies an array of VMSnapshot objects. To obtain a VMSnapshot object, use the Get-VMSnapshot cmdlet. The cmdlet restores the virtual machine checkpoints that you specify.
    .PARAMETER VM
        Specifies the virtual machine to be restored.
    .PARAMETER Name
        Specifies the name of the checkpoint to be restored.
    .PARAMETER VMName
        Specifies the name of the virtual machine to be restored.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that a VMSnapshot is to be passed through to the pipeline representing the checkpoint to be restored.
    #>

    [CmdletBinding(DefaultParameterSetName='SnapshotName', SupportsShouldProcess=$true, ConfirmImpact='High')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSnapshot])]
    param (
        [Parameter(ParameterSetName='SnapshotName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='SnapshotName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='SnapshotName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='SnapshotObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMCheckpoint')]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMSnapshot},

        [Parameter(ParameterSetName='VM', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VirtualMachine]
        ${VM},

        [Parameter(ParameterSetName='VM', Mandatory=$true)]
        [Parameter(ParameterSetName='SnapshotName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='SnapshotName', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Resume-VM {
    <#
    .SYNOPSIS
        Resumes a suspended (paused) virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual machine is to be resumed. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies an array of virtual machine objects. The cmdlet resumes the virtual machines that you specify. To obtain a virtual machine object, use the Get-VM cmdlet.
    .PARAMETER Name
        Specifies the name of the virtual machine to be resumed.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the virtual machine to be resumed.
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Resume-VMReplication {
    <#
    .SYNOPSIS
        Resumes a virtual machine replication that is in a state of Paused, Error, Resynchronization Required, or Suspended.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual machine replication is to be resumed. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose replication is to be resumed.
    .PARAMETER VM
        Specifies the virtual machine whose replication is to be resumed.
    .PARAMETER VMReplication
        Specifies a virtual machine replication object representing the virtual machine replication to be resumed.
    .PARAMETER ReplicationRelationshipType
        Specifies the replication relationship type of the virtual machine. Specify whether the replication relationship is a simple primary to replica or is an extended replication chain. The cmdlet resumes the replication of the virtual machines that have the replication type that you specify.
    .PARAMETER ResynchronizeStartTime
        Specifies when resynchronization should start. If not specified, resynchronization starts immediately. You can schedule the resynchronization to start up to 7 days later.
    .PARAMETER Resynchronize
        Specifies that resynchronization is to be started for the virtual machine. Resynchronization requires significant storage, processor, and network resources. We recommend running this process during off-peak hours. Use the Set-VMReplication cmdlet to specify whether to automatically resynchronize the virtual machine in the future.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Continue
        Indicates that Hyper-V Replica continues the resynchronization comparisons from where it left off when you resume the virtual machine replication.
    .PARAMETER Passthru
        Indicates that this cmdlet returns a VMReplication object.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMReplication])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMReplication', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMReplication[]]
        ${VMReplication},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Alias('Relationship')]
        [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationRelationshipType]]
        ${ReplicationRelationshipType},

        [Alias('ResyncStart')]
        [ValidateNotNull()]
        [System.Nullable[datetime]]
        ${ResynchronizeStartTime},

        [Alias('Resync')]
        [switch]
        ${Resynchronize},

        [switch]
        ${AsJob},

        [switch]
        ${Continue},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Revoke-VMConnectAccess {
    <#
    .SYNOPSIS
        Revokes access for one or more users to connect to a one or more virtual machines.
    .PARAMETER UserName
        Specifies the user or users to whom access to connect to a virtual machine or machines is to be revoked.
    .PARAMETER Passthru
        Specifies that a VMConnectAce is to be passed through to the pipeline for each revocation of access.
    .PARAMETER VMId
        Specifies the unique identifier of a virtual machine or machines to which connect access is to be revoked.
    .PARAMETER VMName
        Specifies the name or names of the virtual machine or machines to which access is being revoked.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which this cmdlet operates. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMConnectAce])]
    param (
        [Parameter(Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Alias('UserId','Sid')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${UserName},

        [switch]
        ${Passthru},

        [Parameter(ParameterSetName='VMId', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [guid[]]
        ${VMId},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Save-VM {
    <#
    .SYNOPSIS
        Saves a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual machine is to be saved. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine to be saved.
    .PARAMETER Name
        Specifies the name of the virtual machine to be saved.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VHD {
    <#
    .SYNOPSIS
        Sets properties associated with a virtual hard disk.
    .PARAMETER Path
        Specifies the path to the virtual hard disk file of the virtual hard disk drive whose parent in the virtual hard disk chain is to be set.
    .PARAMETER ParentPath
        Specifies the path to the parent disk of a differencing virtual hard disk. Can be performed regardless of whether the disk is online or offline.
    .PARAMETER LeafPath
        Specifies the path to the virtual hard disk file of the virtual hard disk representing the leaf node of the virtual hard disk chain. Required when performing the operation in online mode.
    .PARAMETER PhysicalSectorSizeBytes
        Specifies the physical sector size, in bytes. Valid values are 512 and 4096. This parameter is supported only on a VHDX-format disk that is not attached when the operation is initiated.
    .PARAMETER ResetDiskIdentifier
        Indicates that the cmdlet modifies the disk identifier of the virtual disk associated with the virtual hard disk file. The disk identifier is the SCSI Vital Product Data (VPD) Page 0x83h identifier associated with a disk. Use this parameter only for a VHDX-format disk.
    .PARAMETER Force
        Forces the command to run without asking for user confirmation.
    .PARAMETER IgnoreIdMismatch
        Specifies that the check for identifier mismatch between the parent and child virtual hard disk is to be skipped.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the virtual hard disk whose parent is to be set.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the parent of a virtual hard disk in a differencing hard disk chain is to be set. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='Parent', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.Vhd.PowerShell.VirtualHardDisk])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('FullName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Path},

        [Parameter(ParameterSetName='Parent', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ParentPath},

        [Parameter(ParameterSetName='Parent')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${LeafPath},

        [Parameter(ParameterSetName='PhysicalSectorSize', Mandatory=$true)]
        [ValidateSet('512','4096')]
        [ValidateNotNullOrEmpty()]
        [uint32]
        ${PhysicalSectorSizeBytes},

        [Parameter(ParameterSetName='DiskIdentifier', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [switch]
        ${ResetDiskIdentifier},

        [Parameter(ParameterSetName='DiskIdentifier')]
        [switch]
        ${Force},

        [Parameter(ParameterSetName='Parent')]
        [switch]
        ${IgnoreIdMismatch},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VM {
    <#
    .SYNOPSIS
        Configures a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual machine is to be configured. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine to be configured.
    .PARAMETER Name
        Specifies the name of the virtual machine to be configured.
    .PARAMETER GuestControlledCacheTypes
        Specifies whether this virtual machine uses guest controlled cache types.
    .PARAMETER ProcessorCount
        Specifies the number of virtual processors for the virtual machine.
    .PARAMETER DynamicMemory
        Specifies that the virtual machine is to be configured to use dynamic memory.
    .PARAMETER StaticMemory
        This cmdlet configures the virtual machine to use static memory. Specify the amount of static memory to allocate by using the MemoryStartupBytes parameter.
    .PARAMETER MemoryMinimumBytes
        Specifies the minimum amount of memory that the virtual machine is to be allocated. (Applies only to virtual machines using dynamic memory.)
    .PARAMETER MemoryMaximumBytes
        Specifies the maximum amount of memory that the virtual machine is to be allocated. (Applies only to virtual machines using dynamic memory.)
    .PARAMETER MemoryStartupBytes
        Specifies the amount of memory that the virtual machine is to be allocated upon startup. (If the virtual machine does not use dynamic memory, then this is the static amount of memory to be allocated.)
    .PARAMETER AutomaticStartAction
        Specifies the action the virtual machine is to take upon start. Allowed values are Nothing , StartIfRunning , and Start .
    .PARAMETER AutomaticStopAction
        Specifies the action the virtual machine is to take when the virtual machine host shuts down. Allowed values are TurnOff , Save , and ShutDown .
    .PARAMETER AutomaticStartDelay
        Specifies the number of seconds by which the virtual machine's start should be delayed.
    .PARAMETER AutomaticCriticalErrorAction
        Specifies the action to take when the VM encounters a critical error, and exceeds the timeout duration specified by the AutomaticCriticalErrorActionTimeout cmdlet. The acceptable values for this parameter are: Pause and None.
    .PARAMETER AutomaticCriticalErrorActionTimeout
        Specifies the amount of time, in minutes, to wait in critical pause before powering off the virtual machine.
    .PARAMETER LockOnDisconnect
        Specifies whether virtual machine connection in basic mode locks the console after a user disconnects.
    .PARAMETER Notes
        Specifies notes to be associated with the virtual machine.
    .PARAMETER NewVMName
        Specifies the name to which the virtual machine is to be renamed.
    .PARAMETER SnapshotFileLocation
        Specifies the folder in which the virtual machine is to store its snapshot files.
    .PARAMETER SmartPagingFilePath
        Specifies the folder in which the Smart Paging file is to be stored.
    .PARAMETER CheckpointType
        Allows you to configure the type of checkpoints created by Hyper-V. The acceptable values for this parameter are:

        - Disabled. Block creation of checkpoints.  - Standard. Create standard checkpoints.  - Production. Create production checkpoints if supported by guest operating system. Otherwise, create standard checkpoints. - ProductionOnly. Create production checkpoints if supported by guest operating system. Otherwise, the operation fails.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the virtual machine to be configured.
    .PARAMETER AllowUnverifiedPaths
        Specifies that no error is to be thrown if the specified path is not verified as accessible by the cluster. This parameter is applicable to clustered virtual machines.
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [bool]
        ${GuestControlledCacheTypes},

        [uint32]
        ${LowMemoryMappedIoSpace},

        [uint64]
        ${HighMemoryMappedIoSpace},

        [bool]
        ${BatteryPassthroughEnabled},

        [ValidateNotNull()]
        [System.Nullable[long]]
        ${ProcessorCount},

        [switch]
        ${DynamicMemory},

        [switch]
        ${StaticMemory},

        [ValidateNotNull()]
        [System.Nullable[long]]
        ${MemoryMinimumBytes},

        [ValidateNotNull()]
        [System.Nullable[long]]
        ${MemoryMaximumBytes},

        [ValidateNotNull()]
        [System.Nullable[long]]
        ${MemoryStartupBytes},

        [ValidateNotNullOrEmpty()]
        [System.Nullable[Microsoft.HyperV.PowerShell.StartAction]]
        ${AutomaticStartAction},

        [ValidateNotNullOrEmpty()]
        [System.Nullable[Microsoft.HyperV.PowerShell.StopAction]]
        ${AutomaticStopAction},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${AutomaticStartDelay},

        [ValidateNotNullOrEmpty()]
        [System.Nullable[Microsoft.HyperV.PowerShell.CriticalErrorAction]]
        ${AutomaticCriticalErrorAction},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${AutomaticCriticalErrorActionTimeout},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${AutomaticCheckpointsEnabled},

        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
        ${LockOnDisconnect},

        [ValidateNotNull()]
        [string]
        ${Notes},

        [ValidateNotNullOrEmpty()]
        [string]
        ${NewVMName},

        [ValidateNotNullOrEmpty()]
        [string]
        ${SnapshotFileLocation},

        [ValidateNotNullOrEmpty()]
        [string]
        ${SmartPagingFilePath},

        [System.Nullable[Microsoft.HyperV.PowerShell.CheckpointType]]
        ${CheckpointType},

        [System.Nullable[Microsoft.HyperV.PowerShell.EnhancedSessionTransportType]]
        ${EnhancedSessionTransportType},

        [switch]
        ${Passthru},

        [switch]
        ${AllowUnverifiedPaths}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMBios {
    <#
    .SYNOPSIS
        Configures the BIOS of a Generation 1 virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts for which the BIOS is to be configured. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine for which the BIOS is to be configured.
    .PARAMETER VM
        Specifies the virtual machine for which the BIOS is to be configured.
    .PARAMETER VMBios
        Specifies an array of BIOS objects. The cmdlet configures the BIOS that you specify for the virtual machines. To obtain a BIOS object, use the Get-VMBios cmdlet.
    .PARAMETER DisableNumLock
        Specifies that NumLock is to be disabled in the BIOS of the virtual machine to be configured.
    .PARAMETER EnableNumLock
        Specifies that NumLock is to be enabled in the BIOS of the virtual machine to be configured.
    .PARAMETER StartupOrder
        Specifies an array of boot devices representing the boot order in the BIOS of the virtual machine. The boot devices are specified as members of the BootDevices enumeration ( CD , IDE , LegacyNetworkAdapter , Floppy ).

        Note: The other BootDevices enumeration values of VHD and NetworkAdapter are for Generation 2 VMs only, and are not valid with this cmdlet.
    .PARAMETER Passthru
        Specifies that an Microsoft.HyperV.PowerShell.Bios object is to be passed through to the pipeline representing the BIOS to be configured.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMBios])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMBios', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMBios[]]
        ${VMBios},

        [switch]
        ${DisableNumLock},

        [switch]
        ${EnableNumLock},

        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.BootDevice[]]
        ${StartupOrder},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMComPort {
    <#
    .SYNOPSIS
        Configures the COM port of a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the COM port of a virtual machine is to be configured. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine for which the COM port is to be configured.
    .PARAMETER VM
        Specifies the virtual machine for which the COM port is to be configured.
    .PARAMETER VMComPort
        Specifies the COM port to be configured.
    .PARAMETER Number
        Specifies the Id (1 or 2) of the COM port to be configured.
    .PARAMETER Path
        Specifies a named pipe path for the COM port to be configured. Specify local pipes as "\\.\pipe\PipeName" and remote pipes as "\\RemoteServer\pipe\PipeName".
    .PARAMETER DebuggerMode
        Specifies the state of the COM port for use by debuggers. The acceptable values for this parameter are: On and Off.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.ComPort object is to be passed through to the pipeline representing the COM port to be configured.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMComPort])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMComPort', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMComPort[]]
        ${VMComPort},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true)]
        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=1)]
        [ValidateRange(1, 2)]
        [int]
        ${Number},

        [Parameter(Position=2)]
        [AllowEmptyString()]
        [AllowNull()]
        [string]
        ${Path},

        [Microsoft.HyperV.PowerShell.OnOffState]
        ${DebuggerMode},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMDvdDrive {
    <#
    .SYNOPSIS
        Configures a virtual DVD drive.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the DVD drive is to be configured. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMDvdDrive
        Specifies the virtual DVD drive to be configured.
    .PARAMETER VMName
        Specifies the name of the virtual machine on which the DVD drive is to be configured.
    .PARAMETER ControllerNumber
        Specifies the IDE controller of the DVD drives to be configured. If not specified, DVD drives attached to all controllers are configured.
    .PARAMETER ControllerLocation
        Specifies the IDE controller location of the DVD drives to be configured. If not specified, DVD drives in all controller locations are configured.
    .PARAMETER ToControllerNumber
        Specifies the controller number to which this VMDvdDrive should be moved.
    .PARAMETER ToControllerLocation
        Specifies the controller location to which this virtual DVD drive should be moved.
    .PARAMETER Path
        Specifies the path to the ISO file or physical DVD drive that will serve as media for the virtual DVD drive.
    .PARAMETER ResourcePoolName
        Specifies the friendly name of the ISO resource pool to which this DVD drive is to be associated.
    .PARAMETER AllowUnverifiedPaths
        Specifies that no error is to be thrown if the specified path is not verified as accessible by the cluster. This parameter is applicable to clustered virtual machines.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.DvdDrive object is to be passed through to the pipeline representing the virtual DVD drive to be configured.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.DvdDrive])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.DvdDrive[]]
        ${VMDvdDrive},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [Parameter(ParameterSetName='VMName', Position=1)]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ControllerNumber},

        [Parameter(ParameterSetName='VMName', Position=2)]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ControllerLocation},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ToControllerNumber},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ToControllerLocation},

        [Parameter(Position=3)]
        [string]
        ${Path},

        [ValidateNotNullOrEmpty()]
        [string]
        ${ResourcePoolName},

        [switch]
        ${AllowUnverifiedPaths},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMFibreChannelHba {
    <#
    .SYNOPSIS
        Configures a Fibre Channel host bus adapter on a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which a Fibre Channel host bus adapter is to be configured. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMFibreChannelHba
        Specifies the Fibre Channel host bus adapter to be configured.
    .PARAMETER VMName
        Specifies the name of the virtual machine to which the virtual Fibre Channel host bus adapter parameters are to be set.
    .PARAMETER WorldWideNodeNameSetA
        Specifies the World Wide Node name of address set A that is associated with the Fibre Channel host bus adapter.
    .PARAMETER WorldWidePortNameSetA
        Specifies the World Wide Port name of address set A that is associated with the Fibre Channel host bus adapter.
    .PARAMETER WorldWideNodeNameSetB
        Specifies the World Wide Node name of address set B that is associated with the Fibre Channel host bus adapter.
    .PARAMETER WorldWidePortNameSetB
        Specifies the World Wide Port name of address set B that is associated with the Fibre Channel host bus adapter.
    .PARAMETER GenerateWwn
        Specifies that the World Wide Names for sets A and B are to be generated automatically. When this parameter is specified, parameters WorldWideNodeNameSetA , WorldWideNodeNameSetB , WorldWidePortNameSetA , and WorldWidePortNameSetB cannot be used.
    .PARAMETER SanName
        Specifies the name of the virtual storage area network (SAN) to be associated with the Fibre Channel host bus adapter.
    .PARAMETER NewWorldWideNodeNameSetA
        Specifies the World Wide Node name of address set A to be associated with the Fibre Channel host bus adapter.
    .PARAMETER NewWorldWidePortNameSetA
        Specifies the World Wide Port name of address set A to be associated with the Fibre Channel host bus adapter.
    .PARAMETER NewWorldWideNodeNameSetB
        Specifies the World Wide Node name of address set B to be associated with the Fibre Channel host bus adapter.
    .PARAMETER NewWorldWidePortNameSetB
        Specifies the World Wide Port name of address set B to be associated with the Fibre Channel host bus adapter.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the configured Fibre Channel host bus adapter.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName And Only SAN', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMFibreChannelHba])]
    param (
        [Parameter(ParameterSetName='VMName And Generate WWN')]
        [Parameter(ParameterSetName='VMName And Manual WWN')]
        [Parameter(ParameterSetName='VMName And Only SAN')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName And Generate WWN')]
        [Parameter(ParameterSetName='VMName And Manual WWN')]
        [Parameter(ParameterSetName='VMName And Only SAN')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName And Generate WWN')]
        [Parameter(ParameterSetName='VMName And Manual WWN')]
        [Parameter(ParameterSetName='VMName And Only SAN')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Object And Generate WWN', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='Object And Manual WWN', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='Object And Only SAN', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMFibreChannelHba]
        ${VMFibreChannelHba},

        [Parameter(ParameterSetName='VMName And Only SAN', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='VMName And Manual WWN', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='VMName And Generate WWN', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [Parameter(ParameterSetName='VMName And Generate WWN', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VMName And Manual WWN', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='VMName And Only SAN', Mandatory=$true, Position=1)]
        [Alias('Wwnn1')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${WorldWideNodeNameSetA},

        [Parameter(ParameterSetName='VMName And Generate WWN', Mandatory=$true, Position=2)]
        [Parameter(ParameterSetName='VMName And Manual WWN', Mandatory=$true, Position=2)]
        [Parameter(ParameterSetName='VMName And Only SAN', Mandatory=$true, Position=2)]
        [Alias('Wwpn1')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${WorldWidePortNameSetA},

        [Parameter(ParameterSetName='VMName And Only SAN', Mandatory=$true, Position=3)]
        [Parameter(ParameterSetName='VMName And Generate WWN', Mandatory=$true, Position=3)]
        [Parameter(ParameterSetName='VMName And Manual WWN', Mandatory=$true, Position=3)]
        [Alias('Wwnn2')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${WorldWideNodeNameSetB},

        [Parameter(ParameterSetName='VMName And Generate WWN', Mandatory=$true, Position=4)]
        [Parameter(ParameterSetName='VMName And Manual WWN', Mandatory=$true, Position=4)]
        [Parameter(ParameterSetName='VMName And Only SAN', Mandatory=$true, Position=4)]
        [Alias('Wwpn2')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${WorldWidePortNameSetB},

        [Parameter(ParameterSetName='VMName And Generate WWN', Mandatory=$true)]
        [Parameter(ParameterSetName='Object And Generate WWN', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [switch]
        ${GenerateWwn},

        [Parameter(ParameterSetName='Object And Only SAN', Mandatory=$true)]
        [Parameter(ParameterSetName='VMName And Only SAN', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SanName},

        [Parameter(ParameterSetName='Object And Manual WWN')]
        [Parameter(ParameterSetName='VMName And Manual WWN')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewWorldWideNodeNameSetA},

        [Parameter(ParameterSetName='Object And Manual WWN')]
        [Parameter(ParameterSetName='VMName And Manual WWN')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewWorldWidePortNameSetA},

        [Parameter(ParameterSetName='Object And Manual WWN')]
        [Parameter(ParameterSetName='VMName And Manual WWN')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewWorldWideNodeNameSetB},

        [Parameter(ParameterSetName='Object And Manual WWN')]
        [Parameter(ParameterSetName='VMName And Manual WWN')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewWorldWidePortNameSetB},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMFirmware {
    <#
    .SYNOPSIS
        Sets the firmware configuration of a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies the names of the Hyper-V hosts whose firmware configuration you want to modify.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies an array of names of virtual machines for which you want to modify the firmware configuration.
    .PARAMETER VM
        Specifies the virtual machine objects for which want to modify the firmware configuration. To obtain a virtual machine object, use the Get-VM cmdlet.
    .PARAMETER VMFirmware
        Specifies an array of virtual machine firmware configurations. The cmdlet sets the firmware configurations you specify.
    .PARAMETER BootOrder
        Specifies an array of devices. The boot order determines the order of the devices from which to boot.  The acceptable values for this parameter are:

        -- VMBootSource

        -- VMNetworkAdapter

        -- HardDiskDrive

        -- DVDDrive
        The VMBootSource value describes a boot entry in firmware nonvolatile Random Access Memory (NVRAM).

    .PARAMETER FirstBootDevice
        Specifies the device from which to attempt to boot from first. The acceptable values for this parameter are:

        -- VMBootSource

        -- VMNetworkAdapter

        -- HardDiskDrive

        -- DVDDrive
        The VMBootSource value describes a boot entry in firmware NVRAM.

    .PARAMETER EnableSecureBoot
        Specifies whether to enable secure boot. The acceptable values for this parameter are:

        -- On

        -- Off
        Secure boot uses a public key infrastructure that protects the integrity of the operating system.

    .PARAMETER SecureBootTemplate
        Specifies the name of the secure boot template. If secure boot is enabled, you must have a valid secure boot template for the guest operating system to start.
    .PARAMETER SecureBootTemplateId
        Specifies the ID of the secure boot template.
    .PARAMETER PreferredNetworkBootProtocol
        Specifies the IP protocol version to use during a network boot.
    .PARAMETER ConsoleMode
        Specifies the console mode type for the virtual machine. This parameter allows a virtual machine to run without graphical user interface.
    .PARAMETER PauseAfterBootFailure
        Specifies the behavior of the virtual machine after a start failure. For a value of On, if the virtual machine fails to start correctly from a device, the virtual machine is paused.
    .PARAMETER Passthru
        Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMFirmware])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMFirmware', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMFirmware[]]
        ${VMFirmware},

        [Microsoft.HyperV.PowerShell.VMComponentObject[]]
        ${BootOrder},

        [Microsoft.HyperV.PowerShell.VMComponentObject]
        ${FirstBootDevice},

        [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
        ${EnableSecureBoot},

        [string]
        ${SecureBootTemplate},

        [System.Nullable[guid]]
        ${SecureBootTemplateId},

        [System.Nullable[Microsoft.HyperV.PowerShell.IPProtocolPreference]]
        ${PreferredNetworkBootProtocol},

        [System.Nullable[Microsoft.HyperV.PowerShell.ConsoleModeType]]
        ${ConsoleMode},

        [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
        ${PauseAfterBootFailure},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMFloppyDiskDrive {
    <#
    .SYNOPSIS
        Configures a virtual floppy disk drive.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual floppy disk drive is to be configured. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine on which the virtual floppy disk drive is to be configured.
    .PARAMETER VM
        Specifies the virtual machine in which the virtual floppy disk drive is to be configured.
    .PARAMETER VMFloppyDiskDrive
        Specifies the virtual floppy disk drive to be configured.
    .PARAMETER Path
        Specifies the path to the virtual floppy drive file. If specified as $null , the drive is set to contain no media.
    .PARAMETER ResourcePoolName
        Specifies the name of the virtual floppy disk resource pool to use for this virtual floppy disk.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.FloppyDiskDrive object is to be passed through to the pipeline representing the virtual floppy disk drive to be configured.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMFloppyDiskDrive])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMFloppyDiskDrive', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMFloppyDiskDrive[]]
        ${VMFloppyDiskDrive},

        [Parameter(Position=1, ValueFromPipelineByPropertyName=$true)]
        [Alias('FullName')]
        [string]
        ${Path},

        [ValidateNotNullOrEmpty()]
        [string]
        ${ResourcePoolName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMGpuPartitionAdapter {
    <#
    .SYNOPSIS
        Set-VMGpuPartitionAdapter [-VMName] <string[]> [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-Passthru] [-AdapterId <string>] [-MinPartitionVRAM <uint64>] [-MaxPartitionVRAM <uint64>] [-OptimalPartitionVRAM <uint64>] [-MinPartitionEncode <uint64>] [-MaxPartitionEncode <uint64>] [-OptimalPartitionEncode <uint64>] [-MinPartitionDecode <uint64>] [-MaxPartitionDecode <uint64>] [-OptimalPartitionDecode <uint64>] [-MinPartitionCompute <uint64>] [-MaxPartitionCompute <uint64>] [-OptimalPartitionCompute <uint64>] [-WhatIf] [-Confirm] [<CommonParameters>]

Set-VMGpuPartitionAdapter [-VM] <VirtualMachine[]> [-Passthru] [-AdapterId <string>] [-MinPartitionVRAM <uint64>] [-MaxPartitionVRAM <uint64>] [-OptimalPartitionVRAM <uint64>] [-MinPartitionEncode <uint64>] [-MaxPartitionEncode <uint64>] [-OptimalPartitionEncode <uint64>] [-MinPartitionDecode <uint64>] [-MaxPartitionDecode <uint64>] [-OptimalPartitionDecode <uint64>] [-MinPartitionCompute <uint64>] [-MaxPartitionCompute <uint64>] [-OptimalPartitionCompute <uint64>] [-WhatIf] [-Confirm] [<CommonParameters>]

Set-VMGpuPartitionAdapter [-VMGpuPartitionAdapter] <VMGpuPartitionAdapter[]> [-Passthru] [-MinPartitionVRAM <uint64>] [-MaxPartitionVRAM <uint64>] [-OptimalPartitionVRAM <uint64>] [-MinPartitionEncode <uint64>] [-MaxPartitionEncode <uint64>] [-OptimalPartitionEncode <uint64>] [-MinPartitionDecode <uint64>] [-MaxPartitionDecode <uint64>] [-OptimalPartitionDecode <uint64>] [-MinPartitionCompute <uint64>] [-MaxPartitionCompute <uint64>] [-OptimalPartitionCompute <uint64>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMGpuPartitionAdapter])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMGpuPartitionAdapter[]]
        ${VMGpuPartitionAdapter},

        [switch]
        ${Passthru},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${AdapterId},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${MinPartitionVRAM},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${MaxPartitionVRAM},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${OptimalPartitionVRAM},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${MinPartitionEncode},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${MaxPartitionEncode},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${OptimalPartitionEncode},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${MinPartitionDecode},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${MaxPartitionDecode},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${OptimalPartitionDecode},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${MinPartitionCompute},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${MaxPartitionCompute},

        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${OptimalPartitionCompute}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMHardDiskDrive {
    <#
    .SYNOPSIS
        Configures a virtual hard disk.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual hard drive is to be configured. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMHardDiskDrive
        Specifies one or more hard disks to be configured.
    .PARAMETER VMName
        Specifies the name of the virtual machine on which the virtual hard drive is to be configured.
    .PARAMETER ControllerType
        Specifies the type of the controller to which the virtual hard drive to be configured is attached. Allowed values are Floppy , IDE , and SCSI .
    .PARAMETER ControllerNumber
        Specifies the number of the controller to which the virtual hard drive to be configured is attached. If not specified, all hard drives are configured.
    .PARAMETER ControllerLocation
        Specifies the number of the location on the controller to which the virtual hard drive to be configured is attached. If not specified, all hard drives are configured.
    .PARAMETER Path
        Specifies the path to media the virtual hard disk is to use.
    .PARAMETER ToControllerType
        Specifies the type of controller to which this drive should be moved. Allowed values are IDE and SCSI.
    .PARAMETER ToControllerNumber
        Specifies the controller location to which this drive should be moved. Allowed values are 0 and 1 for IDE controllers, and from 0 to 3 for SCSI controllers.
    .PARAMETER ToControllerLocation
        Specifies the controller location to which this drive should be moved. Allowed values are 0 and 1 for IDE controllers, and from 0 to 63 for SCSI controllers.
    .PARAMETER DiskNumber
        Specifies the disk number of the offline physical hard drive that should be connected as a passthrough disk.
    .PARAMETER ResourcePoolName
        Specifies the name of the virtual hard disk resource pool to which this drive belongs.
    .PARAMETER SupportPersistentReservations
        Indicates whether the hard disk supports SCSI persistent reservation semantics. Specify this parameter when the hard disk is a shared disk that is used by multiple virtual machines.
    .PARAMETER AllowUnverifiedPaths
        Specifies that no error is to be thrown if the specified path is not verified as accessible by the cluster. This parameter is applicable to clustered virtual machines.
    .PARAMETER MaximumIOPS
        Specifies the maximum normalized I/O operations per second (IOPS) for the hard disk. Hyper-V calculates normalized IOPS as the total size of I/O per second divided by 8 KB.
    .PARAMETER MinimumIOPS
        Specifies the minimum normalized I/O operations per second (IOPS) for the hard disk. Hyper-V calculates normalized IOPS as the total size of I/O per second divided by 8 KB.
    .PARAMETER QoSPolicyID
        Specifies the ID for a storage QoS policy to associate with the hard disk drive.
    .PARAMETER QoSPolicy
        Specifies the storage Quality of Service (QoS) policy to associate with the hard disk drive.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.HardDiskDrive object is to be passed through to the pipeline representing the virtual hard drive to be configured.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.HardDiskDrive])]
    param (
        [Parameter(ParameterSetName='VMName', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='Object', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Object')]
        [Parameter(ParameterSetName='VMName')]
        [Alias('PSComputerName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='Object')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.HardDiskDrive[]]
        ${VMHardDiskDrive},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [Parameter(ParameterSetName='VMName', Position=1)]
        [Microsoft.HyperV.PowerShell.ControllerType]
        ${ControllerType},

        [Parameter(ParameterSetName='VMName', Position=2)]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ControllerNumber},

        [Parameter(ParameterSetName='VMName', Position=3)]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ControllerLocation},

        [Parameter(Position=4)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Path},

        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.ControllerType]]
        ${ToControllerType},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ToControllerNumber},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ToControllerLocation},

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [Alias('Number')]
        [uint32]
        ${DiskNumber},

        [ValidateNotNull()]
        [string]
        ${ResourcePoolName},

        [Alias('ShareVirtualDisk')]
        [ValidateNotNullOrEmpty()]
        [System.Nullable[bool]]
        ${SupportPersistentReservations},

        [switch]
        ${AllowUnverifiedPaths},

        [System.Nullable[uint64]]
        ${MaximumIOPS},

        [System.Nullable[uint64]]
        ${MinimumIOPS},

        [string]
        ${QoSPolicyID},

        [ciminstance]
        ${QoSPolicy},

        [switch]
        ${Passthru},

        [System.Nullable[Microsoft.HyperV.PowerShell.CacheAttributes]]
        ${OverrideCacheAttributes}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMHost {
    <#
    .SYNOPSIS
        Configures a Hyper-V host.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which this cmdlet operates. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER MaximumStorageMigrations
        Specifies the maximum number of storage migrations that can be performed at the same time on the Hyper-V host.
    .PARAMETER MaximumVirtualMachineMigrations
        Specifies the maximum number of live migrations that can be performed at the same time on the Hyper-V host.
    .PARAMETER VirtualMachineMigrationAuthenticationType
        Specifies the type of authentication to be used for live migrations. The acceptable values for this parameter are: Kerberos and CredSSP.
    .PARAMETER UseAnyNetworkForMigration
        Specifies how networks are selected for incoming live migration traffic. If set to $True, any available network on the host can be used for this traffic. If set to $False, incoming live migration traffic is transmitted only on the networks specified in the MigrationNetworks property of the host. The Get-VMMigrationNetwork cmdlet returns the list of networks that can be used for migration traffic.
    .PARAMETER VirtualMachineMigrationPerformanceOption
        Specifies the performance option to use for live migration. The acceptable values for this parameter are:

        - Compression. Compress data to speed up live migration on constrained networks.  - SMBTransport. Use server message block (SMB) to get the highest throughput possible.  - None. Perform standard live migration.
    .PARAMETER ResourceMeteringSaveInterval
        Specifies how often the Hyper-V host saves the data that tracks resource usage. The range is a minimum of 1 hour to a maximum of 24 hours. Time within that range can be specified using a format of hh:mm:ss, where hh indicates hours, mm indicates minutes, and ss indicates seconds. You also can use a Timespan object to specify the interval.
    .PARAMETER VirtualHardDiskPath
        Specifies the default folder to store virtual hard disks on the Hyper-V host.
    .PARAMETER VirtualMachinePath
        Specifies the default folder to store virtual machine configuration files on the Hyper-V host.
    .PARAMETER MacAddressMaximum
        Specifies the maximum MAC address using a valid hexadecimal value. Use with the MacAddressMinimum parameter to establish a range of MAC addresses that the specified Hyper-V host can assign to virtual machines configured to receive dynamic MAC addresses.
    .PARAMETER MacAddressMinimum
        Specifies the minimum MAC address using a valid hexadecimal value. Use with the MacAddressMaximum parameter to establish a range of MAC addresses that the specified Hyper-V host can assign to virtual machines configured to receive dynamic MAC addresses.
    .PARAMETER FibreChannelWwnn
        Specifies the default  value of the World Wide Node Name  on the Hyper-V host.
    .PARAMETER FibreChannelWwpnMaximum
        Specifies the maximum value that can be used to generate World Wide Port Names on the Hyper-V host. Use with the FibreChannelWwpnMinimum parameter to establish a range of WWPNs that the specified Hyper-V host can assign to virtual Fibre Channel adapters.
    .PARAMETER FibreChannelWwpnMinimum
        Specifies the minimum value that can be used to generate the World Wide Port Names on the Hyper-V host. Use with the FibreChannelWwpnMaximum parameter to establish a range of WWPNs that the specified Hyper-V host can assign to virtual Fibre Channel adapters.
    .PARAMETER NumaSpanningEnabled
        Specifies whether virtual machines on the Hyper-V host can use resources from more than one NUMA node.
    .PARAMETER EnableEnhancedSessionMode
        Indicates whether users can use enhanced mode when they connect to virtual machines on this server by using Virtual Machine Connection.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.Host is to be passed through to the pipeline representing the Hyper-V host to be configured.
    #>

    [CmdletBinding(DefaultParameterSetName='ComputerName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMHost])]
    param (
        [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ComputerName', Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ComputerName', Position=1)]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [uint32]
        ${MaximumStorageMigrations},

        [uint32]
        ${MaximumVirtualMachineMigrations},

        [Microsoft.HyperV.PowerShell.MigrationAuthenticationType]
        ${VirtualMachineMigrationAuthenticationType},

        [bool]
        ${UseAnyNetworkForMigration},

        [Microsoft.HyperV.PowerShell.VMMigrationPerformance]
        ${VirtualMachineMigrationPerformanceOption},

        [ValidateNotNull()]
        [System.Nullable[timespan]]
        ${ResourceMeteringSaveInterval},

        [ValidateNotNullOrEmpty()]
        [string]
        ${VirtualHardDiskPath},

        [ValidateNotNullOrEmpty()]
        [string]
        ${VirtualMachinePath},

        [ValidateNotNullOrEmpty()]
        [string]
        ${MacAddressMaximum},

        [ValidateNotNullOrEmpty()]
        [string]
        ${MacAddressMinimum},

        [ValidateNotNullOrEmpty()]
        [string]
        ${FibreChannelWwnn},

        [ValidateNotNullOrEmpty()]
        [string]
        ${FibreChannelWwpnMaximum},

        [ValidateNotNullOrEmpty()]
        [string]
        ${FibreChannelWwpnMinimum},

        [System.Nullable[bool]]
        ${NumaSpanningEnabled},

        [System.Nullable[bool]]
        ${EnableEnhancedSessionMode},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMHostCluster {
    <#
    .SYNOPSIS
        Configures a virtual machine host cluster.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ClusterName
        Specifies an array of names of the virtual machine host clusters that this cmdlet configures.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER InputObject
        Specifies an array of virtual machine host clusters that this cmdlet configures. To obtain a VMHostCluster object, use the Get-VMHostCluster cmdlet.
    .PARAMETER SharedStoragePath
        Specifies the location of the shared storage for the virtual machine host cluster.
    .PARAMETER Passthru
        Indicates that this cmdlet returns the Microsoft.HyperV.PowerShell.VMHostCluster object that it configures.
    #>

    [CmdletBinding(DefaultParameterSetName='ClusterName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMHostCluster])]
    param (
        [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ClusterName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ClusterName},

        [Parameter(ParameterSetName='ClusterName', Position=1, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='InputObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMHostCluster[]]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${SharedStoragePath},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMKeyProtector {
    <#
    .SYNOPSIS
        Configures a key protector for a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts to run the cmdlet. NetBIOS names, IP addresses, and fully-qualified domain names are allowable. The default is the local computer. Use "localhost" or a dot (".") to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies a user account that has permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies one or more virtual machines for which to set a key protector.
    .PARAMETER VMName
        Specifies the name of one or more virtual machines for which to set a key protector.
    .PARAMETER Passthru
        Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.
    .PARAMETER KeyProtector
        Specifies the key protector to use for the virtual machine.
    .PARAMETER NewLocalKeyProtector
        Specifies that this cmdlet generates a new local key protector.
    .PARAMETER RestoreLastKnownGoodKeyProtector
        Indicates that this cmdlet restores the last known good key protector.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [switch]
        ${Passthru},

        [byte[]]
        ${KeyProtector},

        [switch]
        ${NewLocalKeyProtector},

        [switch]
        ${RestoreLastKnownGoodKeyProtector}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMKeyStorageDrive {
    <#
    .SYNOPSIS
        Set-VMKeyStorageDrive [-VMName] <string> [[-ControllerNumber] <int>] [[-ControllerLocation] <int>] [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-ToControllerNumber <int>] [-ToControllerLocation <int>] [-ResourcePoolName <string>] [-AllowUnverifiedPaths] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]

Set-VMKeyStorageDrive [-VMKeyStorageDrive] <KeyStorageDrive[]> [-ToControllerNumber <int>] [-ToControllerLocation <int>] [-ResourcePoolName <string>] [-AllowUnverifiedPaths] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.KeyStorageDrive])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.KeyStorageDrive[]]
        ${VMKeyStorageDrive},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [Parameter(ParameterSetName='VMName', Position=1)]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ControllerNumber},

        [Parameter(ParameterSetName='VMName', Position=2)]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ControllerLocation},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ToControllerNumber},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${ToControllerLocation},

        [ValidateNotNullOrEmpty()]
        [string]
        ${ResourcePoolName},

        [switch]
        ${AllowUnverifiedPaths},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMMemory {
    <#
    .SYNOPSIS
        Configures the memory of a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the memory of a virtual machine is to be configured. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose memory is to be configured.
    .PARAMETER VM
        Specifies the virtual machine whose memory is to be configured.
    .PARAMETER VMMemory
        Specifies the virtual machine memory to be configured.
    .PARAMETER Buffer
        Specifies the percentage of memory to reserve as a buffer in the virtual machine to be configured. Allowed values range from 5 to 2000.
    .PARAMETER DynamicMemoryEnabled
        Specifies whether dynamic memory is to be enabled on the virtual machine to be configured.
    .PARAMETER MaximumBytes
        Specifies the maximum amount of memory to be used by a virtual machine which has dynamic memory enabled.
    .PARAMETER StartupBytes
        Specifies the initial amount of memory to be assigned to a virtual machine with dynamic memory enabled, or the total amount of memory to be assigned to a virtual machine with dynamic memory disabled.
    .PARAMETER MinimumBytes
        Specifies the minimum amount of memory to be used by a virtual machine which has dynamic memory enabled.
    .PARAMETER Priority
        Sets the priority for memory availability to this virtual machine relative to other virtual machines on the virtual machine host. Allowed values range from 0 to 100.
    .PARAMETER MaximumAmountPerNumaNodeBytes
        Specifies the maximum amount of memory per NUMA node in the virtual machine to be configured.
    .PARAMETER ResourcePoolName
        Specifies the name of the memory resource pool for this virtual machine.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.Memory object is to be passed through to the pipeline representing the virtual machine memory to be configured.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMMemory])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMMemory[]]
        ${VMMemory},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${Buffer},

        [bool]
        ${DynamicMemoryEnabled},

        [ValidateNotNull()]
        [System.Nullable[long]]
        ${MaximumBytes},

        [ValidateNotNull()]
        [System.Nullable[long]]
        ${StartupBytes},

        [ValidateNotNull()]
        [System.Nullable[long]]
        ${MinimumBytes},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${Priority},

        [ValidateNotNull()]
        [System.Nullable[long]]
        ${MaximumAmountPerNumaNodeBytes},

        [ValidateNotNull()]
        [string]
        ${ResourcePoolName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMMigrationNetwork {
    <#
    .SYNOPSIS
        Sets the subnet, subnet mask, and/or priority of a migration network.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which this cmdlet operates. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Subnet
        Specifies a string representing an IPv4 or IPv6 subnet mask which identifies the migration network whose properties are to be set. Wildcards are allowed.
    .PARAMETER NewSubnet
        Specifies a string representing the new subnet value to be set on the migration network.
    .PARAMETER NewPriority
        Specifies the new priority of the virtual machine migration network. Multiple networks can have the same priority.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.MigrationNetwork is to be passed through to the pipeline representing the migration network to be configured.
    #>

    [CmdletBinding(DefaultParameterSetName='ComputerName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMMigrationNetwork])]
    param (
        [Parameter(ParameterSetName='CimSession', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ComputerName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ComputerName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Subnet},

        [Parameter(Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewSubnet},

        [ValidateNotNullOrEmpty()]
        [uint32]
        ${NewPriority},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMNetworkAdapter {
    <#
    .SYNOPSIS
        Configures features of the virtual network adapter in a virtual machine or the management operating system.
    .PARAMETER ManagementOS
        Specifies the virtual network adapter in the management operating system to be configured.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which features of the network adapter are to be configured. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine that has the virtual network adapteryou want to configure.
    .PARAMETER VMNetworkAdapter
        Specifies the virtual network adapter.
    .PARAMETER VM
        Specifies the virtual machine that has the virtual network you want to configure.
    .PARAMETER Name
        Specifies the name for the virtual network adapter. The cmdlet changes the name to the value that you specify.
    .PARAMETER DynamicMacAddress
        Assigns a dynamically generated MAC address to the virtual network adapter..
    .PARAMETER StaticMacAddress
        Assigns a specific a MAC addresss to the virtual network adapter.
    .PARAMETER MacAddressSpoofing
        Specifies whether virtual machines may change the source MAC address in outgoing packets to one not assigned to them. Allowed values are On (allowing the virtual machine to use a different MAC address) and Off (allowing the virtual machine to use only the MAC address assigned to it).
    .PARAMETER DhcpGuard
        Specifies whether to drop DHCP messages from a virtual machine claiming to be a DHCP server. Allowed values are On , which drops DHCP messages because the virtualized DHCP server is considered untrusted) or Off , which allows the message to be received because the virtualized DHCP server is considered to be trustworthy.
    .PARAMETER RouterGuard
        Specifies whether to drop Router Advertisement and Redirection messages from unauthorized virtual machines. The value can be either On or Off . If On is specified, such messages are dropped. If Off is specified, such messages are sent.
    .PARAMETER PortMirroring
        Specifies the port mirroring mode for the network adapter to be configured. Allowed values are None , Source , and Destination . If a virtual network adapter is configured as Source , every packet it sends or receives is copied and forwarded to a virtual network adapter configured to receive the packets. If a virtual network adapter is configured as Destination , it receives copied packets from the source virtual network adapter. The source and destination virtual network adapters must be connected to the same virtual switch. Specify None to disable the feature.
    .PARAMETER IeeePriorityTag
        Specifies whether IEEE 802.1p tagged packets from the virtual machine should be trusted. The value should be either On (trusted) or Off (not trusted). If it is on, the IEEE 802.1p tagged packets will be let go as is. If it is off, the priority value is reset to 0.
    .PARAMETER VmqWeight
        Specifies whether virtual machine queue (VMQ) is to be enabled on the virtual network adapter. . The relative weight describes the affinity of the virtual network adapter to use VMQ. The range of value is from 0 through 100. Specify 0 to disable VMQ on the virtual network adapter.
    .PARAMETER IovQueuePairsRequested
        Specifies the number of hardware queue pairs to be allocated to an SR-IOV virtual function. If receive-side scaling (RSS) is required, and if the physical network adapter that binds to the virtual switch supports RSS on SR-IOV virtual functions, then more than one queue pair is required. Allowed values range from 1 to 4294967295.
    .PARAMETER IovInterruptModeration
        Specifies the interrupt moderation value for a single-root I/O virtualization (SR-IOV) virtual function assigned to a virtual network adapter. Allowed values are Default , Adaptive , Off , Low , Medium , and High . If Default is chosen, the value is determined by the physical network adapter vendor's setting. If Adaptive is chosen, the interrupt moderation rate will be based on the runtime traffic pattern.
    .PARAMETER IovWeight
        Specifies whether single-root I/O virtualization (SR-IOV) is to be enabled on this virtual network adapter. The relative weight sets the affinity of the virtual network adapter to the assigned SR-IOV virtual function. The range of the value is from 0 through 100. Specify 0 to disable SR-IOV on the virtual network adapter.
    .PARAMETER IPsecOffloadMaximumSecurityAssociation
        Specifies the maximum number of security associations that can be offloaded to the physical network adapter that is bound to the virtual switch and that supports IPSec Task Offload. Specify zero to disable the feature.
    .PARAMETER MaximumBandwidth
        Specifies the maximum bandwidth, in bits per second, for the virtual network adapter. The specified value is rounded to the nearest multiple of eight. Specify zero to disable the feature.
    .PARAMETER MinimumBandwidthAbsolute
        Specifies the minimum bandwidth, in bits per second, for the virtual network adapter. The specified value is rounded to the nearest multiple of eight. A value larger than 100 Mbps is recommended.
    .PARAMETER MinimumBandwidthWeight
        Specifies the minimum bandwidth, in terms of relative weight, for the virtual network adapter. The weight describes how much bandwidth to provide to the virtual network adapter relative to other virtual network adapters connected to the same virtual switch. The range of the value is from 0 through 100. Specify 0 to disable the feature.
    .PARAMETER MandatoryFeatureId
        Specifies the unique identifiers of the virtual switch extension features that are required for this virtual network adapter to operate.
    .PARAMETER ResourcePoolName
        Specifies the name of the resource pool.
    .PARAMETER TestReplicaPoolName
        This parameter applies only to virtual machines that are enabled for replication. It specifies the name of the network resource pool that will be used by this virtual network adapter when its virtual machine is created during a test failover.
    .PARAMETER TestReplicaSwitchName
        This parameter applies only to virtual machines that are enabled for replication. It specifies the name of the virtual switch to which the virtual network adapter should be connected when its virtual machine is created during a test failover.
    .PARAMETER VirtualSubnetId
        Specifies the virtual subnet ID to use with Hyper-V Network Virtualization. Allowed values range from 4096 to 16777215 (2^24 - 1), in addition to 0. Use 0 to clear this parameter.
    .PARAMETER AllowTeaming
        Specifies whether the virtual network adapter can be teamed with other network adapters connected to the same virtual switch. The value can be On (allowed) or Off (disallowed).
    .PARAMETER NotMonitoredInCluster
        Indicates whether to not monitor the network adapter if the virtual machine that it belongs to is part of a cluster. By default, network adapters for clustered virtual machines are monitored.
    .PARAMETER StormLimit
        Specifies the number of broadcast, multicast, and unknown unicast packets per second a virtual machine is allowed to send through the specified virtual network adapter. Broadcast, multicast, and unknown unicast packets beyond the limit during that one second interval are dropped. A value of zero (0) means there is no limit.
    .PARAMETER DynamicIPAddressLimit
        Specifies the dynamic IP address limit, an integer.
    .PARAMETER DeviceNaming
        Specifies whether this adapter uses device naming.
    .PARAMETER FixSpeed10G
        Specifies whether the adapter uses fix speed of 10G.
    .PARAMETER PacketDirectNumProcs
        Specifies the number of processors to use for virtual switch processing inside of the host.
    .PARAMETER PacketDirectModerationCount
        Specifies the number of packets to wait for before signaling an interrupt.
    .PARAMETER PacketDirectModerationInterval
        Specifies the amount of time, in milliseconds, to wait before signaling an interrupt after a packet arrives.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the virtual network adapter to be configured. This is a Microsoft.HyperV.PowerShell.VMInternalNetworkAdapter object, if ManagementOS is specified; or a Microsoft.HyperV.PowerShell.VMNetworkAdapter object otherwise.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterBase])]
    param (
        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine]
        ${VM},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [Alias('VMNetworkAdapterName')]
        [string]
        ${Name},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='ResourceObject')]
        [switch]
        ${DynamicMacAddress},

        [ValidateNotNull()]
        [uint32]
        ${MediaType},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${NumaAwarePlacement},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${InterruptModeration},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ResourceObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${StaticMacAddress},

        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
        ${MacAddressSpoofing},

        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
        ${DhcpGuard},

        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
        ${RouterGuard},

        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.VMNetworkAdapterPortMirroringMode]]
        ${PortMirroring},

        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
        ${IeeePriorityTag},

        [ValidateNotNull()]
        [System.Nullable[uint32]]
        ${VmqWeight},

        [ValidateNotNull()]
        [System.Nullable[uint32]]
        ${IovQueuePairsRequested},

        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.IovInterruptModerationValue]]
        ${IovInterruptModeration},

        [ValidateNotNull()]
        [System.Nullable[uint32]]
        ${IovWeight},

        [ValidateNotNull()]
        [System.Nullable[uint32]]
        ${IPsecOffloadMaximumSecurityAssociation},

        [ValidateNotNull()]
        [System.Nullable[long]]
        ${MaximumBandwidth},

        [ValidateNotNull()]
        [System.Nullable[long]]
        ${MinimumBandwidthAbsolute},

        [ValidateNotNull()]
        [System.Nullable[uint32]]
        ${MinimumBandwidthWeight},

        [string[]]
        ${MandatoryFeatureId},

        [ValidateNotNullOrEmpty()]
        [string]
        ${ResourcePoolName},

        [string]
        ${TestReplicaPoolName},

        [string]
        ${TestReplicaSwitchName},

        [ValidateNotNull()]
        [System.Nullable[uint32]]
        ${VirtualSubnetId},

        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
        ${AllowTeaming},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${NotMonitoredInCluster},

        [ValidateNotNull()]
        [System.Nullable[uint32]]
        ${StormLimit},

        [ValidateNotNull()]
        [System.Nullable[uint32]]
        ${DynamicIPAddressLimit},

        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
        ${DeviceNaming},

        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
        ${FixSpeed10G},

        [ValidateNotNull()]
        [System.Nullable[uint32]]
        ${PacketDirectNumProcs},

        [ValidateNotNull()]
        [System.Nullable[uint32]]
        ${PacketDirectModerationCount},

        [ValidateNotNull()]
        [System.Nullable[uint32]]
        ${PacketDirectModerationInterval},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${VrssEnabled},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${VmmqEnabled},

        [Alias('VmmqQueuePairs')]
        [ValidateNotNull()]
        [System.Nullable[uint32]]
        ${VrssMaxQueuePairs},

        [ValidateNotNull()]
        [System.Nullable[uint32]]
        ${VrssMinQueuePairs},

        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.VrssQueueSchedulingModeType]]
        ${VrssQueueSchedulingMode},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${VrssExcludePrimaryProcessor},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${VrssIndependentHostSpreading},

        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.VrssVmbusChannelAffinityPolicyType]]
        ${VrssVmbusChannelAffinityPolicy},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMNetworkAdapterFailoverConfiguration {
    <#
    .SYNOPSIS
        Configures the IP address of a virtual network adapter to be used when a virtual machine fails over.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the IP address configuration of a virtual network adapter is to be set. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMNetworkAdapter
        Specifies the virtual network adapter for which you want to configure the IP address.
    .PARAMETER VMName
        Specifies the friendly name of the virtual machine for which you want to configure the IP address.
    .PARAMETER VM
        Specifies the virtual machine for which you want to configure the IP address.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of the virtual network adapter for which you want to set the IP address.
    .PARAMETER IPv4Address
        Specifies the IPv4 address to set on the VMNetworkAdapter for use on failover of the virtual machine. You must also specify the IPv4SubnetMask parameter when you specify this parameter.
    .PARAMETER IPv6Address
        Specifies the IPv6 address to be set on VMNetworkAdapter for use on failover of the virtual machine. You must specify the IPv6SubnetPrefixLength parameter when you specify this parameter.
    .PARAMETER IPv4SubnetMask
        Specifies the IPv4 subnet mask to be set on VMNetworkAdapter for use on failover of the virtual machine. You must specify the IPv4Address parameter when you specify this parameter.
    .PARAMETER IPv6SubnetPrefixLength
        Specifies the IPv6 subnet prefix length to be set on VMNetworkAdapter for use on failover of the virtual machine. You must specify the IPv6Address parameter when you specify this parameter.
    .PARAMETER IPv4PreferredDNSServer
        Specifies the IPv4 preferred DNS server to be set on VMNetworkAdapter for use on failover of the virtual machine.
    .PARAMETER IPv4AlternateDNSServer
        Specifies the IPv4 alternate DNS server to be set on the VMNetworkAdapter for use on failover of the virtual machine.
    .PARAMETER IPv6PreferredDNSServer
        Specifies the IPv6 preferred DNS server to be set on VMNetworkAdapter for use on failover of the virtual machine.
    .PARAMETER IPv6AlternateDNSServer
        Specifies the IPv6 alternate DNS server to be set on VMNetworkAdapter for use on failover of the virtual machine.
    .PARAMETER IPv4DefaultGateway
        Specifies the IPv4 default gateway to be set on VMNetworkAdapter for use on failover of the virtual machine..
    .PARAMETER IPv6DefaultGateway
        Specifies the IPv6 default gateway to be set on VMNetworkAdapter for use on failover of the virtual machine.
    .PARAMETER ClearFailoverIPv4Settings
        Clears the configured IPv4 failover settings. The IPv4 address configured in the primary virtual machine (static or dynamic) will be used by the Replica virtual machine.
    .PARAMETER ClearFailoverIPv6Settings
        Clears the configured IPv6 failover settings. The IPv6 address configured in the primary virtual machine (static or dynamic) will be used by the Replica virtual machine.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.VMNetworkAdapterFailoverConfiguration object is to be passed through to the pipeline representing the IP address configuration to be set.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterFailoverSetting])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapter]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine]
        ${VM},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [string]
        ${VMNetworkAdapterName},

        [string]
        ${IPv4Address},

        [string]
        ${IPv6Address},

        [string]
        ${IPv4SubnetMask},

        [ValidateRange(0, 128)]
        [System.Nullable[int]]
        ${IPv6SubnetPrefixLength},

        [string]
        ${IPv4PreferredDNSServer},

        [string]
        ${IPv4AlternateDNSServer},

        [string]
        ${IPv6PreferredDNSServer},

        [string]
        ${IPv6AlternateDNSServer},

        [string]
        ${IPv4DefaultGateway},

        [string]
        ${IPv6DefaultGateway},

        [ValidateNotNull()]
        [switch]
        ${ClearFailoverIPv4Settings},

        [ValidateNotNull()]
        [switch]
        ${ClearFailoverIPv6Settings},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMNetworkAdapterIsolation {
    <#
    .SYNOPSIS
        Modifies isolation settings for a virtual network adapter.
    .PARAMETER VMNetworkAdapter
        Specifies an array VM network adapters as VMNetworkAdapterBase objects. The cmdlet modifies isolation settings for the adapters that you specify. To obtain a network adapter, use the Get-VMNetworkAdapter cmdlet.
    .PARAMETER ManagementOS
        Indicates that the cmdlet operates on the parent or host operating system. If you specify this parameter, this cmdlet modifies isolation settings for the parent or host operating system.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of a virtual network adapter. The cmdlet modifies isolation settings for the adapters that you specify.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies an array of Hyper-V hosts. The cmdlet modifies isolation settings for virtual machines hosted by the computers that you specify.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies an array of names of virtual machines. The cmdlet modifies isolation settings for adapters that belong to the virtual machines that you specify.
    .PARAMETER VM
        Specifies an array of virtual machine objects. The cmdlet modifies isolation settings for adapters that belong to the virtual machines that you specify. To obtain a virtual machine object, use the Get-VM cmdlet.
    .PARAMETER IsolationMode
        Specifies the isolation mode for the adapter. The acceptable values for this parameter are:

        - NativeVirtualSubnet. Hyper-V Network Virtualization. - ExternalVirtualSubnet. A third party network virtualization solution.  - VLAN.

        - None.

        If you specify a value of None, the network adapter uses its default isolation mode. Set the default isolation mode by using the Set-VMNetworkAdapterVlan cmdlet or the Set-VMNetworkAdapter cmdlet.

    .PARAMETER AllowUntaggedTraffic
        Indicates whether the virtual machine sends and receives untagged traffic.
    .PARAMETER DefaultIsolationID
        Specifies the ID of the network for traffic to the default compartment on virtual machines that have multitenancy enabled. The value that you specify applies only to untagged traffic. This parameter has an effect only if you specify a value of $True for the AllowUntaggedTraffic parameter.
    .PARAMETER MultiTenantStack
        Specifies whether to use multiple isolation IDs for the virtual machine. The acceptable values for this parameter are:

        - On. Indicate isolation IDs so that the virtual machine provides services to multiple tenants on different isolation subnets.  - Off. Do not indicate isolation IDs to virtual machine.
    .PARAMETER Passthru
        Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterIsolationSetting])]
    param (
        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='ManagementOS')]
        [string]
        ${VMNetworkAdapterName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.VMNetworkAdapterIsolationMode]]
        ${IsolationMode},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${AllowUntaggedTraffic},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${DefaultIsolationID},

        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.OnOffState]]
        ${MultiTenantStack},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMNetworkAdapterRdma {
    <#
    .SYNOPSIS
        Set-VMNetworkAdapterRdma [-VMName] <string> [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-Name <string>] [-RdmaWeight <uint32>] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]

Set-VMNetworkAdapterRdma -ManagementOS [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-Name <string>] [-RdmaWeight <uint32>] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]

Set-VMNetworkAdapterRdma [-VMNetworkAdapter] <VMNetworkAdapterBase> [-RdmaWeight <uint32>] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]

Set-VMNetworkAdapterRdma [-VM] <VirtualMachine> [-Name <string>] [-RdmaWeight <uint32>] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterRdmaSetting])]
    param (
        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine]
        ${VM},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [Alias('VMNetworkAdapterName')]
        [string]
        ${Name},

        [ValidateNotNull()]
        [System.Nullable[uint32]]
        ${RdmaWeight},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMNetworkAdapterRoutingDomainMapping {
    <#
    .SYNOPSIS
        Sets virtual subnets on a routing domain.
    .PARAMETER VMNetworkAdapter
        Specifies an array of virtual network adapters as a VMNetworkAdapterBase object. The cmdlet adds the virtual subnets to the routing domain on the adapters that you specify. To obtain a network adapter, use the Get-VMNetworkAdapter cmdlet.
    .PARAMETER ManagementOS
        Indicates that the cmdlet operates on the parent partition or host operating system.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of a virtual network adapter. The cmdlet adds the virtual subnets to the routing domain on the adapter that you specify.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies an array of Hyper-V hosts. The cmdlet adds the virtual subnets to the routing domain on the Hyper-V hosts that you specify.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies an array of names of virtual machines. The cmdlet adds the virtual subnets to the routing domain from the network interfaces that belong to the virtual machines that you specify. To obtain a virtual machine object, use the Get-VM cmdlet.
    .PARAMETER VM
        Specifies an array of virtual machine objects. The cmdlet adds the virtual subnets to the routing domain from the network interfaces that belong to the virtual machines that you specify. To obtain a virtual machine object, use the Get-VM cmdlet.
    .PARAMETER InputObject
        Specifies the input to this cmdlet. You can use this parameter, or you can pipe the input to this cmdlet.
    .PARAMETER RoutingDomainID
        Specifies the ID of a routing domain. The ID of a routing domain is a system-assigned GUID. The cmdlet adds the virtual subnets to the routing domain that you specify.
    .PARAMETER RoutingDomainName
        Specifies the name of a routing domain. The cmdlet adds the virtual subnets to the routing domain that you specify.
    .PARAMETER NewRoutingDomainName
        Specifies a new name for the routing domain.
    .PARAMETER IsolationID
        Specifies an array of IDs of virtual subnets. The cmdlet adds the virtual subnets that you specify to the routing domain. The subnets use VLAN or Hyper-V Network Virtualization. For more information about isolation IDs, see the Set-VmNetworkAdapterIsolation cmdlet.
    .PARAMETER IsolationName
        Specifies an array of names of virtual subnets. The cmdlet adds the virtual subnets that you specify to the routing domain. The subnets use VLAN or Hyper-V Network Virtualization.
    .PARAMETER Passthru
        Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterRoutingDomainSetting])]
    param (
        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='ManagementOS')]
        [string]
        ${VMNetworkAdapterName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='InputObjectParameter', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterRoutingDomainSetting]
        ${InputObject},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='ResourceObject')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [guid]
        ${RoutingDomainID},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ResourceObject')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${RoutingDomainName},

        [ValidateNotNullOrEmpty()]
        [string]
        ${NewRoutingDomainName},

        [ValidateNotNullOrEmpty()]
        [int[]]
        ${IsolationID},

        [string[]]
        ${IsolationName},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMNetworkAdapterTeamMapping {
    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterTeamMappingSetting])]
    param (
        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ManagementOS')]
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine]
        ${VM},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [string]
        ${VMNetworkAdapterName},

        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SwitchName},

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${PhysicalNetAdapterName},

        [ValidateNotNullOrEmpty()]
        [Microsoft.Virtualization.Client.Management.DisableOnFailoverFeature]
        ${DisableOnFailover},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMNetworkAdapterVlan {
    <#
    .SYNOPSIS
        Configures the virtual LAN settings for the traffic through a virtual network adapter.
    .PARAMETER VMNetworkAdapter
        Specifies the virtual machine network adapter.
    .PARAMETER ManagementOS
        Specifies the management (e.g. parent or host) operating system.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of the virtual machine network adapter.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual LAN settings on a virtual machine network adapter are to be configured. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine.
    .PARAMETER VM
        Specifies the virtual machine.
    .PARAMETER Untagged
        Specifies Untagged mode for the virtual machine network adapter.
    .PARAMETER Access
        Specifies Access mode for the virtual machine network adapter. This parameter must be specified in conjunction with parameter VlanId .
    .PARAMETER VlanId
        Specifies the virtual LAN identifier of a virtual machine network adapter. This parameter must be specified in conjunction with switch parameter Access .
    .PARAMETER Trunk
        Specifies Trunk mode for the virtual machine network adapter. This parameter must be used in conjunction with parameters AllowedVlanIdList and NativeVlanId .
    .PARAMETER NativeVlanId
        Specifies the native virtual LAN identifier for a virtual machine network adapter. This parameter must be specified in conjunction with the switch parameter Trunk .
    .PARAMETER AllowedVlanIdList
        Specifies a list of virtual LANs allowed on a virtual machine network adapter. This parameter must be specified in conjunction with the switch parameter Trunk .
    .PARAMETER Isolated
        Specifies Isolated mode for the virtual machine network adapter to be configured. This parameter must be specified in conjunction with parameters PrimaryVlanId and SecondaryVlanId .
    .PARAMETER Community
        Specifies Community mode for the virtual machine network adapter to be configured. This parameter must be specified in conjunction with parameters PrimaryVlanId and SecondaryVlanId .
    .PARAMETER Promiscuous
        Specifies Promiscuous mode for the virtual machine network adapter.

        This parameter must be specified in conjunction with parameters PrimaryVlanId and SecondaryVlanIdList .
    .PARAMETER PrimaryVlanId
        Specifies the primary virtual LAN identifier for a virtual network adapter in Community , Isolated , or Promiscuous mode.

        This parameter must be specified in conjunction with parameter SecondaryVlanId if the virtual machine network adapter is in Community or Isolated mode. It must be used in conjunction with parameter SecondaryVlanIdList if the virtual machine network adapter is in Promiscuous mode.
    .PARAMETER SecondaryVlanId
        Specifies the secondary virtual LAN identifier for a virtual network adapter in Community or Isolated mode.

        This parameter must be specified in conjunction with parameter PrimaryVlanId , along with switch parameter Community or Isolated .
    .PARAMETER SecondaryVlanIdList
        Specifies a list of private virtual LAN secondary virtual LANs on a virtual machine network adapter.This parameter must be specified in conjunction with parameter PrimaryVlanId and switch parameter Promiscuous .
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.VMNetworkAdapterVlanSetting object is to be passed through to the pipeline representing the virtual machine network adapter virtual LAN settings to be configured.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterVlanSetting])]
    param (
        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='ManagementOS', Mandatory=$true)]
        [switch]
        ${ManagementOS},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [string]
        ${VMNetworkAdapterName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ManagementOS')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Alias('u')]
        [switch]
        ${Untagged},

        [Alias('a')]
        [switch]
        ${Access},

        [Alias('AccessVlanId')]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${VlanId},

        [Alias('t')]
        [switch]
        ${Trunk},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${NativeVlanId},

        [string]
        ${AllowedVlanIdList},

        [Alias('i')]
        [switch]
        ${Isolated},

        [Alias('c')]
        [switch]
        ${Community},

        [Alias('p')]
        [switch]
        ${Promiscuous},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${PrimaryVlanId},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${SecondaryVlanId},

        [string]
        ${SecondaryVlanIdList},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMPartitionableGpu {
    <#
    .SYNOPSIS
        Set-VMPartitionableGpu [[-ComputerName] <string[]>] [[-Credential] <pscredential[]>] [-Passthru] [-PartitionCount <uint16>] [<CommonParameters>]

Set-VMPartitionableGpu [-CimSession] <CimSession[]> [-Passthru] [-PartitionCount <uint16>] [<CommonParameters>]

Set-VMPartitionableGpu [-PartitionableGpu] <VMPartitionableGpu[]> [-Passthru] [-PartitionCount <uint16>] [<CommonParameters>]

Set-VMPartitionableGpu [-Passthru] [-Name <string>] [-PartitionCount <uint16>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='ComputerName')]
    [OutputType([Microsoft.HyperV.PowerShell.VMPartitionableGpu])]
    param (
        [Parameter(ParameterSetName='CimSession', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='ComputerName', Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='ComputerName', Position=1)]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMPartitionableGpu[]]
        ${PartitionableGpu},

        [switch]
        ${Passthru},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [ValidateNotNullOrEmpty()]
        [System.Nullable[uint16]]
        ${PartitionCount}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMProcessor {
    <#
    .SYNOPSIS
        Configures one or more processors of a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which processors are to be configured. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine on which the processor is to be configured.
    .PARAMETER VM
        Specifies the virtual machine on which the processor is to be configured.
    .PARAMETER VMProcessor
        Specifies the virtual machine processor to be configured.
    .PARAMETER Count
        Specifies the number of processors for the virtual machine.
    .PARAMETER CompatibilityForMigrationEnabled
        Specifies whether the virtual processor's features are to be limited for compatibility when migrating the virtual machine to another host.
    .PARAMETER CompatibilityForOlderOperatingSystemsEnabled
        Specifies whether the virtual processor's features are to be limited for compatibility with older operating systems.
    .PARAMETER Maximum
        Specifies the maximum percentage of resources available to the virtual machine processor to be configured. Allowed values range from 0 to 100.
    .PARAMETER Reserve
        Specifies the percentage of processor resources to be reserved for this virtual machine. Allowed values range from 0 to 100.
    .PARAMETER RelativeWeight
        Specifies the priority for allocating the physical computer's processing power to this virtual machine relative to others. Allowed values range from 1 to 10000.
    .PARAMETER MaximumCountPerNumaNode
        Specifies the maximum number of processors per NUMA node to be configured for the virtual machine.
    .PARAMETER MaximumCountPerNumaSocket
        Specifies the maximum number of sockets per NUMA node to be configured for the virtual machine.
    .PARAMETER ResourcePoolName
        Specifies the name of the processor resource pool to be used.
    .PARAMETER EnableHostResourceProtection
        Specifies whether to enable host resource protection.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.Processor is to be passed through to the pipeline representing the processor to be configured.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMProcessor])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMProcessor', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMProcessor[]]
        ${VMProcessor},

        [ValidateNotNull()]
        [System.Nullable[long]]
        ${Count},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${CompatibilityForMigrationEnabled},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${CompatibilityForOlderOperatingSystemsEnabled},

        [ValidateNotNull()]
        [System.Nullable[long]]
        ${HwThreadCountPerCore},

        [ValidateNotNull()]
        [System.Nullable[long]]
        ${Maximum},

        [ValidateNotNull()]
        [System.Nullable[long]]
        ${Reserve},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${RelativeWeight},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${MaximumCountPerNumaNode},

        [ValidateNotNull()]
        [System.Nullable[int]]
        ${MaximumCountPerNumaSocket},

        [ValidateNotNull()]
        [string]
        ${ResourcePoolName},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${EnableHostResourceProtection},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${ExposeVirtualizationExtensions},

        [string[]]
        ${Perfmon},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${EnableLegacyApicMode},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${AllowACountMCount},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMRemoteFx3dVideoAdapter {
    <#
    .SYNOPSIS
        Configures the RemoteFX 3D video adapter of a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the RemoteFX 3D video adapter is to be configured. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine on which the adapter is to be configured.
    .PARAMETER VM
        Specifies the virtual machine on which the adapter is to be configured.
    .PARAMETER VMRemoteFx3dVideoAdapter
        Specifies the adapter to be configured.
    .PARAMETER MonitorCount
        Specifies the maximum number of monitors supported by this adapter.
    .PARAMETER MaximumResolution
        Specifies the maximum resolution supported by this adapter.
    .PARAMETER VRAMSizeBytes
        Specifies the size, in bytes, of VRAM supported that this adapter supports.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.RemoteFxVideoAdapter object is to be passed through to the pipeline representing the adapter to be configured.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMRemoteFx3DVideoAdapter])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMRemoteFx3DVideoAdapter[]]
        ${VMRemoteFx3dVideoAdapter},

        [Parameter(Position=1)]
        [ValidateNotNull()]
        [System.Nullable[byte]]
        ${MonitorCount},

        [Parameter(Position=2)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${MaximumResolution},

        [Parameter(Position=3)]
        [ValidateNotNull()]
        [System.Nullable[uint64]]
        ${VRAMSizeBytes},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMReplication {
    <#
    .SYNOPSIS
        Modifies the replication settings of a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which replication is to be enabled. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine for which the replication configuration is to be set.
    .PARAMETER VM
        Specifies the virtual machine for which the replication configuration is to be set.
    .PARAMETER VMReplication
        Specifies a virtual machine replication object for which the configuration is to be set.
    .PARAMETER ReplicaServerName
        Specifies the name of the Replica server to which this virtual machine will be replicated.
    .PARAMETER ReplicaServerPort
        Specifies the port on the Replica server to use for replication traffic. Make sure you specify a port that is configured on the Replica server to support the same authentication type you specify using the AuthenticationType parameter in this cmdlet. Run the Get-VMReplicationServer cmdlet on the Replica server to check the configuration of the port, or contact the administrator of the specified Replica server.
    .PARAMETER AuthenticationType
        Specifies the authentication type to use for virtual machine replication, either Kerberos or Certificate. The specified Replica server must support the chosen authentication type. Run the Get-VMReplicationServer cmdlet to verify the authentication configured for the specified Replica server, or contact the administrator of the specified Replica server.
    .PARAMETER CertificateThumbprint
        Specifies the certificate to use for mutual authentication of the replication data. This parameter is required only when "Certificate" is specified as the type of authentication. Specify the thumbprint of a valid computer certificate from the Personal store.

        The certificate must have all of the following properties to be valid:

        - It must not be expired.

        - It must include both client and server authentication extensions for extended key usage (EKU), and an associated private key.

        - It must terminate at a valid root certificate.

        - The requirement for the subject common name (CN) differs depending on whether the virtual machine belongs to a cluster. For virtual machines that do not belong to a cluster, the subject common name (CN) must be equal to, or subject alternative name (DNS Name) should contain, the FQDN of the host. For virtual machines that belong to a cluster, the subject common name (CN) must be equal to, or subject alternative name (DNS Name) must contain, the and fully-qualified domain name (FQDN) of the Hyper-V Replica Broker.

        To display a list of certificates in the computer's My store and the thumbprint of each certificate, type the following:

        `PS C:\> cd cert:\LocalMachine\My`

        `PS C:\> dir | format-list`
        For more information about certificate stores, see http://technet.microsoft.com//library/cc757138.aspx (http://technet.microsoft.com//library/cc757138.aspx).

    .PARAMETER CompressionEnabled
        Specifies whether replication data sent over the network is to be compressed.
    .PARAMETER ReplicateHostKvpItems
        Specifies whether to replicate host-only key value pairs (KVP) for this virtual machine.
    .PARAMETER BypassProxyServer
        Specifies whether to bypass a proxy server while replicating data to the Replica server.
    .PARAMETER EnableWriteOrderPreservationAcrossDisks
        Determines whether all virtual hard disks selected for replication are replicated to the same point in time. This is useful if the virtual machine runs an application that saves data across virtual hard disks (for example, one virtual hard disk dedicated for application data, and another virtual hard disk dedicated for application log files).
    .PARAMETER InitialReplicationStartTime
        Specifies the time to start the initial replication, when scheduling initial replication to occur later. You can specify a time up to 7 days later. When this parameter is not specified, initial replication occurs immediately.
    .PARAMETER DisableVSSSnapshotReplication
        Specifies whether to replicate volume shadow copy service (VSS) snapshots.
    .PARAMETER VSSSnapshotFrequencyHour
        Specifies the frequency, in hours, at which Volume Shadow Copy Service (VSS) performs a snapshot backup of the virtual machines. Specify this parameter only if application-consistent replication is enabled for the virtual is and the value you set for the RecoveryHistory parameter is not zero. The cmdlet sets a value of zero for this parameter if application-consistent replication is disabled. Do not specify this parameter if you are extending replication from the Replica virtual machine.
    .PARAMETER RecoveryHistory
        Specifies whether to store additional recovery points on the Replica virtual machine. Storing more than the most recent recovery point of the primary virtual machine allows you to recover to an earlier point in time. However, storing additional recovery points requires more storage and processing resources. You can configure as many as 24 recovery points to be stored.
    .PARAMETER ReplicationFrequencySec
        Specifies the frequency, in seconds, at which Hyper-V replicates changes to the Replica server.
    .PARAMETER ReplicatedDisks
        Specifies all virtual hard disks to include for replication. This parameter can include all the VHDs attached to the virtual mahine or a subset. Be sure to include virtual hard disks that are critical to the ability of the virtual machine to start, such as the guest operating system disk. Excluding a critical disk from this list could prevent the replica virtual machine from starting properly.
    .PARAMETER ReplicatedDiskPaths
        Specifies the fully qualified path names of all the virtual hard disks to include for replication. Be sure to include virtual hard disks that are critical to the ability of the virtual machine to start, such as the guest operating system disk. Excluding a critical disk from this list could prevent the replica virtual machine from starting properly.
    .PARAMETER Reverse
        Reverses the replication of the virtual machine, switching it from a primary virtual machine to a Replica virtual machine, or from a Replica virtual machine to a primary virtual machine.
    .PARAMETER AutoResynchronizeEnabled
        Enables replicating virtual machines that require resynchronization to be resynchronized automatically. (For example, a virtual machine requires resynchronization if the primary server shuts down abruptly). Resynchronization requires significant storage and processing resources. We recommended scheduling resynchronization during off-peak hours to reduce the impact to the host and other virtual machines running on the host. Use the AutoResynchronizeIntervalStart and AutoResynchronizeIntervalEnd parameters to specify an off-peak time to start the automatic resynchronization.
    .PARAMETER AutoResynchronizeIntervalStart
        Specifies the start of the time period in which you want resynchronization to start automatically.
    .PARAMETER AutoResynchronizeIntervalEnd
        Specifies the end of the time period in which you want resynchronization to start automatically.
    .PARAMETER AsReplica
        Specifies that the virtual machine is a replica virtual machine, enabling it to be used as the source for the initial replication of the primary virtual machine.
    .PARAMETER UseBackup
        Specifies that a restored copy of the virtual machine on the Replica server is to be used as the source of the initial replication.
    .PARAMETER AllowedPrimaryServer
        When you use the AsReplica parameter to specify a virtual machine as a Replica virtual machine, this parameter determines which primary servers can send replication to the Replica virtual machine. Replication is accepted only from the server specified in the chosen authentication entry, or any other authentication entry that has the same trust group.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that a VMReplication object is to be passed through to the pipeline representing the replication configuration to be set.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMReplication])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMReplication', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMReplication[]]
        ${VMReplication},

        [Parameter(Position=1)]
        [Alias('ReplicaServer')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ReplicaServerName},

        [Parameter(Position=2)]
        [Alias('ReplicaPort')]
        [ValidateNotNull()]
        [ValidateRange(1, 65535)]
        [System.Nullable[int]]
        ${ReplicaServerPort},

        [Parameter(Position=3)]
        [Alias('AuthType')]
        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.ReplicationAuthenticationType]]
        ${AuthenticationType},

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [Alias('Thumbprint','Cert')]
        [string]
        ${CertificateThumbprint},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${CompressionEnabled},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${ReplicateHostKvpItems},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${BypassProxyServer},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${EnableWriteOrderPreservationAcrossDisks},

        [Alias('IRTime')]
        [ValidateNotNull()]
        [System.Nullable[datetime]]
        ${InitialReplicationStartTime},

        [Alias('DisableVSS')]
        [switch]
        ${DisableVSSSnapshotReplication},

        [Alias('VSSFreq')]
        [ValidateRange(1, 12)]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${VSSSnapshotFrequencyHour},

        [Alias('RecHist')]
        [ValidateRange(0, 24)]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${RecoveryHistory},

        [Alias('RepFreq')]
        [ValidateRange(30, 900)]
        [System.Nullable[int]]
        ${ReplicationFrequencySec},

        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.HardDiskDrive[]]
        ${ReplicatedDisks},

        [ValidateNotNull()]
        [string[]]
        ${ReplicatedDiskPaths},

        [switch]
        ${Reverse},

        [Alias('AutoResync')]
        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${AutoResynchronizeEnabled},

        [Alias('AutoResyncStart')]
        [ValidateNotNull()]
        [System.Nullable[timespan]]
        ${AutoResynchronizeIntervalStart},

        [Alias('AutoResyncEnd')]
        [ValidateNotNull()]
        [System.Nullable[timespan]]
        ${AutoResynchronizeIntervalEnd},

        [switch]
        ${AsReplica},

        [switch]
        ${UseBackup},

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [Alias('AllowedPS')]
        [string]
        ${AllowedPrimaryServer},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMReplicationAuthorizationEntry {
    <#
    .SYNOPSIS
        Modifies an authorization entry on a Replica server.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the authorization entry is to be set. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMReplicationAuthorizationEntry
        Specifies the authorization entry to be set.
    .PARAMETER AllowedPrimaryServer
        Specifies the allowed primary server of the authorization entry to be modified.
    .PARAMETER ReplicaStorageLocation
        Specifies the location to store the Replica virtual hard disk files from the allowed server when a new Replica virtual machine is created. Modifying this location does not affect any existing virtual hard disk files on the Replica server.
    .PARAMETER TrustGroup
        Identifies a group of primary servers within which a given primary virtual machine can move so replications of the primary virtual machine are accepted by the Replica server only from primary servers that belong to the trust group. You can use any string to create a new trust group. Ensure all primary servers within a specific trust group use the same string as the value you specify for this parameter.

        Use of a trust group can help you keep virtual machines isolated by maintaining control over which primary servers are trusted to provide replication, while also allowing the virtual machines to move from one primary server to another (such as through live migration or failover from a cluster node).
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the replication authorization entry to be set.
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMReplicationAuthorizationEntry])]
    param (
        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMRepAuthEntry')]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMReplicationAuthorizationEntry[]]
        ${VMReplicationAuthorizationEntry},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('AllowedPS')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${AllowedPrimaryServer},

        [Parameter(Position=1)]
        [Alias('StorageLoc')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ReplicaStorageLocation},

        [Parameter(Position=2)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${TrustGroup},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMReplicationServer {
    <#
    .SYNOPSIS
        Configures a host as a Replica server.
    .PARAMETER ReplicationEnabled
        Specifies whether the host is enabled as a Replica server.
    .PARAMETER AllowedAuthenticationType
        Specifies which authentication types the Replica server will use. Allowed values are Kerberos, Certificate, or CertificateAndKerberos.
    .PARAMETER ReplicationAllowedFromAnyServer
        Specifies whether to accept replication requests from any server. When specified as true , DefaultStorageLocation must also be specified. The default storage location and DEFAULT trust group tag are used for virtual machine replicas.
    .PARAMETER CertificateThumbprint
        Specifies the certificate to use for mutual authentication of the replication data. This parameter is required only when Certificate is specified as the type of authentication. Specify the thumbprint of a valid computer certificate from the Personal store.

        The certificate must have all of the following properties to be valid:

        - It must not be expired.

        - It must include both client and server authentication extensions for extended key usage (EKU), and an associated private key.

        - It must terminate at a valid root certificate.

        - It must meet the requirements for the subject common name (CN):

        - For servers that are not clustered, the subject common name (CN) must be equal to, or subject alternative name (DNS Name) should contain, the FQDN of the host.  - For servers that are clustered, each node must have two certificates - one in which the subject common name (CN) or subject alternative name (DNS Name) is the name of the node, and the other in which subject common name (CN) or subject alternative name (DNS Name) is FQDN of the Hyper-V Replica Broker.

        To display a list of certificates in the computer's My store and the thumbprint of each certificate, run the following commands:

        `PS C:\> cd cert:\LocalMachine\My`

        `PS C:\> dir | format-list`

        For more information about certificate stores, see http://technet.microsoft.com//library/cc757138.aspx (http://technet.microsoft.com//library/cc757138.aspx).
    .PARAMETER DefaultStorageLocation
        Specifies the default location to store the virtual hard disk files when a Replica virtual machine is created. You must specify this parameter when ReplicationAllowedFromAnyServer is True.
    .PARAMETER KerberosAuthenticationPort
        Specifies the port that the HTTP listener uses on the Replica server host.
    .PARAMETER CertificateAuthenticationPort
        Specifies the port on which the Replica server will receive replication data using certificate-based authentication. This parameter can be set only when the value of the AllowedAuthType parameter is Certificate or CertificateAndKerberos.
    .PARAMETER KerberosAuthenticationPortMapping
        When using Hyper-V Replica with failover clustering and Kerberos authorization, you can use this parameter to specify a different port for each node of the cluster to receive replication. We recommend that you specify a unique port for each node of the cluster, and one unique port for the Hyper-V Replica Broker. This parameter can be set only when the Replica server is configured with an authentication type of either Kerberos or CertificateAndKerberos.
    .PARAMETER CertificateAuthenticationPortMapping
        When using Hyper-V Replica with failover clustering and certificate-based authorization, you can use this parameter to specify a different port for each node of the cluster to receive replication. We recommend that you specify a unique port for each node of the cluster, and one unique port for the Hyper-V Replica Broker. This parameter can be set only when the Replica server is configured with an authentication type of Certificate or CertificateAndKerberos.
    .PARAMETER MonitoringInterval
        Specifies how often (the monitoring interval) replication statistics are computed. Valid values are: 1 hour, 2 hours, 3 hours, 4 hours, 6 hours, 8 hours, 12 hours, 24 hours, 2 days, 3 days, 4 days, 5 days, 6 days, 7 days. Specify in the format days:hours:minutes:seconds, such as 01:00:00 for 1 hour, or 1.00:00:00 for 1 day.
    .PARAMETER MonitoringStartTime
        Specifies when the monitoring interval starts.
    .PARAMETER Force
        Specifies whether the command runs without requiring confirmation.
    .PARAMETER Passthru
        Specifies that a VMReplicationServer object is to be passed through to the pipeline representing the replication settings of the Replica server.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Configures Replica server settings for one or more Hyper-V hosts. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='AuthenticationPort', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMReplicationServer])]
    param (
        [Parameter(Position=0)]
        [Alias('RepEnabled')]
        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${ReplicationEnabled},

        [Parameter(Position=1)]
        [Alias('AuthType')]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.RecoveryAuthenticationType]
        ${AllowedAuthenticationType},

        [Parameter(Position=2)]
        [Alias('AllowAnyServer')]
        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${ReplicationAllowedFromAnyServer},

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [Alias('Thumbprint')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${CertificateThumbprint},

        [Alias('StorageLoc')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DefaultStorageLocation},

        [Parameter(ParameterSetName='AuthenticationPort')]
        [Alias('KerbAuthPort')]
        [ValidateRange(1, 65535)]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${KerberosAuthenticationPort},

        [Parameter(ParameterSetName='AuthenticationPort')]
        [Alias('CertAuthPort')]
        [ValidateRange(1, 65535)]
        [ValidateNotNull()]
        [System.Nullable[int]]
        ${CertificateAuthenticationPort},

        [Parameter(ParameterSetName='AuthenticationPortMapping')]
        [ValidateNotNull()]
        [hashtable]
        ${KerberosAuthenticationPortMapping},

        [Parameter(ParameterSetName='AuthenticationPortMapping')]
        [ValidateNotNull()]
        [hashtable]
        ${CertificateAuthenticationPortMapping},

        [ValidateNotNull()]
        [System.Nullable[timespan]]
        ${MonitoringInterval},

        [ValidateNotNull()]
        [System.Nullable[timespan]]
        ${MonitoringStartTime},

        [switch]
        ${Force},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMResourcePool {
    <#
    .SYNOPSIS
        Sets the parent resource pool for a selected resource pool.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER Name
        Specifies the resource pool whose parent resource pool is to be set.
    .PARAMETER ResourcePoolType
        Specifies the type of the resource pool whose parent is to be set.
    .PARAMETER ParentName
        Specifies the name of the resource pool to be set as a parent.
    .PARAMETER Passthru
        Specifies that a VMResourcePool object is to be passed through to the pipeline representing the resource pool whose parent is to be set.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which a resource pool's parent is to be set. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMResourcePool])]
    param (
        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Microsoft.HyperV.PowerShell.VMResourcePoolType]
        ${ResourcePoolType},

        [Parameter(Mandatory=$true, Position=2)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ParentName},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMSan {
    <#
    .SYNOPSIS
        Configures a virtual storage area network (SAN) on one or more Hyper-V hosts.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual storage area network (SAN) is to be configured. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies the name of the virtual storage area network (SAN) to be configured.
    .PARAMETER HostBusAdapter
        Specifies the host bus adapter (HBA) to associate with the virtual storage area network (SAN). You can use the Get-InitiatorPort cmdlet to get this object.
    .PARAMETER WorldWideNodeName
        The World Wide Node name of the Fibre Channel host bus adapter to be associated with this virtual storage area network (SAN).
    .PARAMETER WorldWidePortName
        The World Wide Port name of the Fibre Channel host bus adapter to be associated with this virtual storage area network (SAN).
    .PARAMETER Note
        Specifies the note to be associated with the virtual storage area network (SAN).
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the configured virtual storage area network (SAN).
    #>

    [CmdletBinding(DefaultParameterSetName='HbaObject', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSan])]
    param (
        [Parameter(ParameterSetName='StringWwn', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='StringWwn')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='StringWwn')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
        [Alias('SanName')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='HbaObject')]
        [ValidateNotNullOrEmpty()]
        [ciminstance[]]
        ${HostBusAdapter},

        [Parameter(ParameterSetName='StringWwn', Mandatory=$true)]
        [Alias('Wwnn','NodeName','Wwnns','NodeNames','WorldWideNodeNames','NodeAddress')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${WorldWideNodeName},

        [Parameter(ParameterSetName='StringWwn', Mandatory=$true)]
        [Alias('Wwpn','PortName','Wwpns','PortNames','WorldWidePortNames','PortAddress')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${WorldWidePortName},

        [ValidateNotNull()]
        [string]
        ${Note},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMSecurity {
    <#
    .SYNOPSIS
        Configures security settings for a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts to run the cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies a user account that has permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies an array of virtual machines.
    .PARAMETER VMName
        Specifies an array of virtual machine names.
    .PARAMETER Passthru
        Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.
    .PARAMETER EncryptStateAndVmMigrationTraffic
        Indicates that this cmdlet enables encryption of virtual machine state and migration traffic.
    .PARAMETER VirtualizationBasedSecurityOptOut
        Specifies whether to opt the virtual machine out of virtualization-based security. Specify a value of $True to opt out of virtualization-based security. If the guest operating system supports virtualization-based security, a value of $False allows it. The default value is $False.

        To change this setting, the virtual machine must be off.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [switch]
        ${Passthru},

        [bool]
        ${EncryptStateAndVmMigrationTraffic},

        [bool]
        ${VirtualizationBasedSecurityOptOut}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMSecurityPolicy {
    <#
    .SYNOPSIS
        Configures the security policy for a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts to on which to configure security policy. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that has permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies an array of virtual machine objects. This cmdlet configures the security policy for these objects. To obtain a virtual machine object, use the Get-VM cmdlet.
    .PARAMETER VMName
        Specifies an array of virtual machine names. This cmdlet configures the security policy for these virtual machines.
    .PARAMETER Passthru
        Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.
    .PARAMETER Shielded
        Configures the virtual machine as shielded.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [switch]
        ${Passthru},

        [bool]
        ${Shielded},

        [bool]
        ${BindToHostTpm}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMStorageSettings {
    <#
    .SYNOPSIS
        Set-VMStorageSettings [-VMName] <string[]> [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-Passthru] [-DisableInterruptBatching <bool>] [-ThreadCountPerChannel <ThreadCount>] [-VirtualProcessorsPerChannel <uint16>] [-WhatIf] [-Confirm] [<CommonParameters>]

Set-VMStorageSettings [-VM] <VirtualMachine[]> [-Passthru] [-DisableInterruptBatching <bool>] [-ThreadCountPerChannel <ThreadCount>] [-VirtualProcessorsPerChannel <uint16>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [switch]
        ${Passthru},

        [bool]
        ${DisableInterruptBatching},

        [Microsoft.HyperV.PowerShell.ThreadCount]
        ${ThreadCountPerChannel},

        [uint16]
        ${VirtualProcessorsPerChannel}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMSwitch {
    <#
    .SYNOPSIS
        Configures a virtual switch.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual switch is to be configured. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMSwitch
        Specifies the virtual switch to be configured.
    .PARAMETER Name
        Specifies the name of the virtual switch to be configured.
    .PARAMETER NetAdapterName
        Specifies the name of the physical network adapter to which an external virtual switch should be bound. If you specify this parameter to convert a virtual switch, the external virtual switch is configured to allow the management operating system to share access to the physical network adapter. To override this behavior, include AllowManagementOs $false in the command
    .PARAMETER NetAdapterInterfaceDescription
        Specifies the interface description of the physical network adapter to which an external virtual switch should be bound. If you specify this parameter to convert a virtual switch, the external virtual switch is configured to allow the management operating system to share access to the physical network adapter. To override this behavior, include AllowManagementOs $false in the command
    .PARAMETER SwitchType
        Converts a virtual switch from one type to another. Allowed values are Internal or Private . You can convert an internal or private virtual switch to an external virtual switch, by including either the NetAdapterInterfaceDescription or NetAdapterName parameter in the command. If you do this, the external virtual switch is configured to allow the management operating system to share access to the physical network adapter. To override this behavior, include AllowManagementOs $false in the command.
    .PARAMETER AllowManagementOS
        Specifies whether the management operating system can use the physical network adapter that is bound to the external virtual switch.
    .PARAMETER DefaultFlowMinimumBandwidthAbsolute
        Specifies the minimum bandwidth, in bits per second, that is allocated to a special category called "default flow." Any traffic sent by a virtual network adapter that is connected to this virtual switch and does not have minimum bandwidth allocated is filtered into this category. Specify a value for this parameter only if the minimum bandwidth mode on this virtual switch is absolute (See the New-VMSwitch cmdlet). By default, the virtual switch allocates 10% of the total bandwidth, which depends on the physical network adapter it binds to, to this category. For example, if a virtual switch binds to a 1 GbE network adapter, this special category can use at least 100 Mbps. If the value is not a multiple of 8, the value is rounded down to the nearest number that is a multiple of 8. For example, a value input as 1234567 is converted to 1234560.
    .PARAMETER DefaultFlowMinimumBandwidthWeight
        Specifies the minimum bandwidth, in relative weight, that is allocated to a special category called "default flow". Any traffic sent by a virtual network adapter that is connected to this virtual switch and doesn't have minimum bandwidth allocated is filtered into this category. Specify a value for this parameter only if the minimum bandwidth mode on this virtual switch is weight (See the New-VMSwitch cmdlet). By default, this special category has a weight of 1.
    .PARAMETER Extensions
        Specifies an ordered list of network extensions used to reorder the bindings on the virtual switch.
    .PARAMETER Notes
        Specifies notes to be associated with the virtual switch.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.EthernetSwitch object is to be passed through to the pipeline representing the virtual switch to be configured.
    #>

    [CmdletBinding(DefaultParameterSetName='SwitchName_SwitchType', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitch])]
    param (
        [Parameter(ParameterSetName='SwitchName_SwitchType', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='SwitchName_NetAdapterName', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription')]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterName')]
        [Parameter(ParameterSetName='SwitchObject_SwitchType')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='SwitchName_SwitchType')]
        [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription')]
        [Parameter(ParameterSetName='SwitchName_NetAdapterName')]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription')]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterName')]
        [Parameter(ParameterSetName='SwitchObject_SwitchType')]
        [Alias('PSComputerName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription')]
        [Parameter(ParameterSetName='SwitchName_SwitchType')]
        [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription')]
        [Parameter(ParameterSetName='SwitchName_NetAdapterName')]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterName')]
        [Parameter(ParameterSetName='SwitchObject_SwitchType')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='SwitchObject_SwitchType', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMSwitch[]]
        ${VMSwitch},

        [Parameter(ParameterSetName='SwitchName_SwitchType', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='SwitchName_NetAdapterName', Mandatory=$true, Position=0)]
        [Alias('SwitchName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='SwitchName_NetAdapterName', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterName', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
        [Alias('InterfaceAlias')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NetAdapterName},

        [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NetAdapterInterfaceDescription},

        [Parameter(ParameterSetName='SwitchName_SwitchType')]
        [Parameter(ParameterSetName='SwitchObject_SwitchType')]
        [System.Nullable[Microsoft.HyperV.PowerShell.VMSwitchType]]
        ${SwitchType},

        [System.Nullable[bool]]
        ${AllowManagementOS},

        [ValidateNotNull()]
        [System.Nullable[long]]
        ${DefaultFlowMinimumBandwidthAbsolute},

        [ValidateNotNull()]
        [System.Nullable[long]]
        ${DefaultFlowMinimumBandwidthWeight},

        [System.Nullable[bool]]
        ${DefaultQueueVrssEnabled},

        [System.Nullable[bool]]
        ${DefaultQueueVmmqEnabled},

        [Alias('DefaultQueueVmmqQueuePairs')]
        [ValidateNotNull()]
        [System.Nullable[uint32]]
        ${DefaultQueueVrssMaxQueuePairs},

        [ValidateNotNull()]
        [System.Nullable[uint32]]
        ${DefaultQueueVrssMinQueuePairs},

        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.VrssQueueSchedulingModeType]]
        ${DefaultQueueVrssQueueSchedulingMode},

        [System.Nullable[bool]]
        ${DefaultQueueVrssExcludePrimaryProcessor},

        [System.Nullable[bool]]
        ${EnableSoftwareRsc},

        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitchExtension[]]
        ${Extensions},

        [ValidateNotNull()]
        [string]
        ${Notes},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMSwitchExtensionPortFeature {
    <#
    .SYNOPSIS
        Configures a feature on a virtual network adapter.
    .PARAMETER VMSwitchExtensionFeature
        Specifies the feature to be configured.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.VMSwitchExtensionPortFeature object is to be passed through to the pipeline representing the feature to be configured.
    .PARAMETER VMName
        Specifies the name of the virtual machine on which the feature is to be configured.
    .PARAMETER VMNetworkAdapter
        Specifies the virtual network adapter.
    .PARAMETER ManagementOS
        Specifies the management (e.g. parent, or host) operating system.
    .PARAMETER ExternalPort
        Specifies the virtual switch port connected to the external network adapter.
    .PARAMETER SwitchName
        Specifies the name of the virtual switch.
    .PARAMETER VMNetworkAdapterName
        Specifies the name of the virtual network adapter.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which this cmdlet operates. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER VM
        Specifies the virtual machine on which the feature is to be configured.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitchExtensionPortFeature])]
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitchExtensionPortFeature[]]
        ${VMSwitchExtensionFeature},

        [switch]
        ${Passthru},

        [string[]]
        ${VMName},

        [Microsoft.HyperV.PowerShell.VMNetworkAdapterBase[]]
        ${VMNetworkAdapter},

        [switch]
        ${ManagementOS},

        [switch]
        ${ExternalPort},

        [string]
        ${SwitchName},

        [string]
        ${VMNetworkAdapterName},

        [string[]]
        ${ComputerName},

        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMSwitchExtensionSwitchFeature {
    <#
    .SYNOPSIS
        Configures a feature on a virtual switch.
    .PARAMETER VMSwitchExtensionFeature
        Specifies the feature to be configured.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.VMSwitchExtensionSwitchFeature is to be passed through to the pipeline representing the feature to be configured.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which this cmdlet operates. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER SwitchName
        Specifies the name of the virtual switch.
    .PARAMETER VMSwitch
        Specifies the virtual switch.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitchExtensionSwitchFeature])]
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitchExtensionSwitchFeature[]]
        ${VMSwitchExtensionFeature},

        [switch]
        ${Passthru},

        [string[]]
        ${ComputerName},

        [string[]]
        ${SwitchName},

        [Microsoft.HyperV.PowerShell.VMSwitch[]]
        ${VMSwitch},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMSwitchTeam {
    <#
    .SYNOPSIS
        Configures a virtual switch team.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER VMSwitch
        Specifies an array of virtual switches that this cmdlet configures for teaming. To obtain a VMSwitch object, use the Get-VMSwitch cmdlet.
    .PARAMETER Name
        Specifies an array of names of virtual switches that this cmdlet configures for teaming.
    .PARAMETER NetAdapterName
        Specifies an array of names of the virtual network adapters that this cmdlet includes in the switch team. This value replaces the existing members.
    .PARAMETER NetAdapterInterfaceDescription
        Specifies an array of interface descriptions of the virtual network adapters that this cmdlet includes in the switch team. This value replaces the existing members.
    .PARAMETER TeamingMode
        Specifies the teaming mode. Currently, the only option is SwitchIndependent.
    .PARAMETER LoadBalancingAlgorithm
        Specifies the load balancing algorithm that this switch team uses. The acceptable values for this parameter are: Dynamic and HyperVPort. The default value is Dynamic.
    .PARAMETER Passthru
        Indicates that this cmdlet returns the Microsoft.HyperV.PowerShell.VMSwitch object that it configures.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='SwitchName_NetAdapterName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMSwitch])]
    param (
        [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='SwitchName_NetAdapterName', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription', ValueFromPipelineByPropertyName=$true)]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterName', ValueFromPipelineByPropertyName=$true)]
        [Alias('PSComputerName')]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='SwitchObject_NetAdapterName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMSwitch[]]
        ${VMSwitch},

        [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription', Mandatory=$true, Position=0)]
        [Parameter(ParameterSetName='SwitchName_NetAdapterName', Mandatory=$true, Position=0)]
        [Alias('SwitchName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='SwitchObject_NetAdapterName')]
        [Parameter(ParameterSetName='SwitchName_NetAdapterName')]
        [Alias('InterfaceAlias')]
        [string[]]
        ${NetAdapterName},

        [Parameter(ParameterSetName='SwitchName_NetAdapterInterfaceDescription')]
        [Parameter(ParameterSetName='SwitchObject_NetAdapterInterfaceDescription')]
        [string[]]
        ${NetAdapterInterfaceDescription},

        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.VMSwitchTeamingMode]]
        ${TeamingMode},

        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.VMSwitchLoadBalancingAlgorithm]]
        ${LoadBalancingAlgorithm},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-VMVideo {
    <#
    .SYNOPSIS
        Configures video settings for virtual machines.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies an array of names of virtual machines for which this cmdlet configures video settings.
    .PARAMETER VM
        Specifies an array of virtual machines for which this cmdlet configures video settings. To obtain a VirtualMachine object, use the Get-VM cmdlet.
    .PARAMETER VMVideo
        Specifies an array of virtual machine video settings that this cmdlet configures. To obtain a VMVideo object, use the Get-VMVideo cmdlet.
    .PARAMETER ResolutionType
        Specifies the resolution type for the virtual machine display. The acceptable values for this parameter are:

        - Maximum.  The input HorizontalResolution * VerticalResolution is the maximum supported resolution. All standard resolutions smaller than HorizontalResolution * VerticalResolution are also supported.  - Single. The input HorizontalResolution * VerticalResolution is the only supported resolution.  - Default. The supported resolutions are those in the list of standard resolutions. Input HorizontalResolution * VerticalResolution is ignored.
    .PARAMETER HorizontalResolution
        Specifies the horizontal resolution for the virtual machine display.
    .PARAMETER VerticalResolution
        Specifies the vertical resolution for the virtual machine display.
    .PARAMETER Passthru
        Indicates that this cmdlet returns the Microsoft.HyperV.PowerShell.VMVideo object that it modifies.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMVideo])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMVideo', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VMVideo[]]
        ${VMVideo},

        [Parameter(Position=1)]
        [ValidateNotNull()]
        [System.Nullable[Microsoft.HyperV.PowerShell.ResolutionType]]
        ${ResolutionType},

        [Parameter(Position=2)]
        [ValidateNotNull()]
        [System.Nullable[uint16]]
        ${HorizontalResolution},

        [Parameter(Position=3)]
        [ValidateNotNull()]
        [System.Nullable[uint16]]
        ${VerticalResolution},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Start-VM {
    <#
    .SYNOPSIS
        Starts a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which a virtual machine is to be started. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine to be started.
    .PARAMETER Name
        Specifies the name of the virtual machine to be started.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.VirtualMachine object is to be passed through to the pipeline representing the virtual machine to be started.
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Start-VMFailover {
    <#
    .SYNOPSIS
        Starts failover on a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which failover is to be started. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine for which failover is to be started.
    .PARAMETER VM
        Specifies the virtual machine for which failover is to be started.
    .PARAMETER VMRecoverySnapshot
        Specifies the recovery snapshot to use during a failover. (This parameter is not required for a planned failover.)
    .PARAMETER AsTest
        Creates a test virtual machine using the chosen recovery point. You can use a test virtual machine to validate a Replica virtual machine. To stop a test failover, use the Stop-VMFailover cmdlet.
    .PARAMETER Prepare
        Starts the planned failover on the primary virtual machine and replicates any pending changes. To complete the planned failover, use the Set-VMReplication and Start-VM cmdlets as shown in Example 4.

        Note: The primary virtual machine must be shut down to prepare it for failover.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that a virtual machine object is to be passed through to the pipeline representing the virtual machine on which failover is to be started.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='High')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMName_Test')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMName_Test')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMName_Test')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='VMName_Test', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject_Test', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMSnapshot', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Parameter(ParameterSetName='VMSnapshot_Test', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMRecoveryCheckpoint')]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMSnapshot]
        ${VMRecoverySnapshot},

        [Parameter(ParameterSetName='VMName_Test', Mandatory=$true)]
        [Parameter(ParameterSetName='VMObject_Test', Mandatory=$true)]
        [Parameter(ParameterSetName='VMSnapshot_Test', Mandatory=$true)]
        [switch]
        ${AsTest},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [switch]
        ${Prepare},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Start-VMInitialReplication {
    <#
    .SYNOPSIS
        Starts replication of a virtual machine.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which replication of a virtual machine is to be started. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER VMName
        Specifies the name of the virtual machine on which replication is to be started.
    .PARAMETER VM
        Specifies the virtual machine on which replication is to be started.
    .PARAMETER VMReplication
        Specifies an object that represents the replication to be started. You can get this object from the Get-VMReplication cmdlet.
    .PARAMETER DestinationPath
        Specifies the path to use when copying the files for initial replication; assumes use of external media as the method for initial replication. External media is typically a removable drive that is shipped to the location of the Replica server. When the external media arrives at the Replica site, use the Import-InitialVMReplication cmdlet on the Replica virtual machine to copy the files.
    .PARAMETER InitialReplicationStartTime
        Specifies the time to start the initial replication, when scheduling initial replication to occur later. You can specify a time up to 7 days later. When this parameter is not specified, initial replication occurs immediately.
    .PARAMETER UseBackup
        Indicates that you want to use a copy of this virtual machine on the Replica server as the basis for the initial replication. Specify this option only if it was specified when replication was enabled on the primary virtual machine.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that a virtual machine object is to be passed through to the pipeline representing the virtual machine on which replication is to be started.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMReplication])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMReplication', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMReplication[]]
        ${VMReplication},

        [Alias('IRLoc')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DestinationPath},

        [Alias('IRTime')]
        [ValidateNotNullOrEmpty()]
        [System.Nullable[datetime]]
        ${InitialReplicationStartTime},

        [switch]
        ${UseBackup},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Start-VMTrace {
    <#
    .SYNOPSIS
        Starts tracing to a file.
    .PARAMETER Level
        Specifies the level of tracing. The acceptable values for this parameter are:

        - Off

        - Error

        - Warning

        - Info

        - Verbose
    .PARAMETER TraceVerboseObjects
        Specifies that tracing uses verbose objects.
    .PARAMETER Path
        Specifies the path of the file where this cmdlet stores the trace information.
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateSet('Error','Warning','Info','Verbose')]
        [System.Diagnostics.TraceLevel]
        ${Level},

        [switch]
        ${TraceVerboseObjects},

        [string]
        ${Path}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Stop-VM {
    <#
    .SYNOPSIS
        Shuts down, turns off, or saves a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which a virtual machine is to be shut down. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine to be shut down.
    .PARAMETER Name
        Specifies the name of the virtual machine to be shut down.
    .PARAMETER Save
        Specifies that the virtual machine is to be saved.
    .PARAMETER TurnOff
        Specifies that the virtual machine is to be turned off.
    .PARAMETER Force
        Specifies that the shutdown of the virtual machine is to be forced. If the virtual machine has applications with unsaved data, the virtual machine has five minutes to save data and shut down. If the virtual machine is locked, it is shut down immediately.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.VirtualMachine object is to be passed through to the pipeline representing the virtual machine to be shut down.
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [switch]
        ${Save},

        [switch]
        ${TurnOff},

        [switch]
        ${Force},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Stop-VMFailover {
    <#
    .SYNOPSIS
        Stops failover of a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more hosts on which to cancel the failover of a virtual machine. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose you want to cancel.
    .PARAMETER VM
        Specifies the virtual machine whose failover you want to cancel.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the virtual machine whose initial replication is to be stopped.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Stop-VMInitialReplication {
    <#
    .SYNOPSIS
        Stops an ongoing initial replication.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which an ongoing initial replication is to be stopped. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose initial replication is to be stopped.
    .PARAMETER VM
        Specifies the virtual machine whose initial replication is to be stopped.
    .PARAMETER VMReplication
        Specifies the virtual machine replication to be stopped.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the virtual machine whose initial replication is to be stopped.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMReplication])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMReplication', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMReplication[]]
        ${VMReplication},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Stop-VMReplication {
    <#
    .SYNOPSIS
        Cancels an ongoing virtual machine resynchronization.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the ongoing virtual machine resynchronization is to be stopped. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose resynchronization is to be stopped.
    .PARAMETER VM
        Specifies the virtual machine whose resychronization is to be stopped.
    .PARAMETER VMReplication
        Specifies the resynchronization to be stopped.
    .PARAMETER ReplicationRelationshipType
        Specifies the replication relationship type of the virtual machine. Specify whether the replication relationship is a simple primary to replica or is an extended replication chain. The cmdlet cancels the ongoing resynchronization of the virtual machines that have the replication type that you specify.
    .PARAMETER Passthru
        Specifies that an object is to be passed through to the pipeline representing the virtual machine on which the ongoing virtual machine resynchronization is to be stopped.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMReplication])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMReplication', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMReplication[]]
        ${VMReplication},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Alias('Relationship')]
        [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationRelationshipType]]
        ${ReplicationRelationshipType},

        [switch]
        ${Passthru},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Stop-VMTrace {
    <#
    .SYNOPSIS
        Stops tracing to file.
    #>

    [CmdletBinding()]
    param ( )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Suspend-VM {
    <#
    .SYNOPSIS
        Suspends, or pauses, a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which a virtual machine is to be suspended. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VM
        Specifies the virtual machine to be suspended.
    .PARAMETER Name
        Specifies the name of the virtual machine to be suspended.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Specifies that a Microsoft.HyperV.PowerShell.VirtualMachine object is to be passed through to the pipeline representing the virtual machine to be suspended.
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Suspend-VMReplication {
    <#
    .SYNOPSIS
        Suspends replication of a virtual machine.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which replication of a virtual machine is to be suspended. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of the virtual machine whose replication is to be suspended.
    .PARAMETER VM
        Specifies the virtual machine whose replication is to be suspended.
    .PARAMETER VMReplication
        Specifies the virtual machine replication to be suspended.
    .PARAMETER ReplicationRelationshipType
        Specifies the replication relationship type of the virtual machine. Specify whether the replication relationship is a simple primary to replica or is an extended replication chain. The cmdlet suspends replication of the virtual machines that have the replication type that you specify.
    .PARAMETER Passthru
        Specifies that a VMReplication object is to be passed through to the pipeline representing the replication to be suspended.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMReplication])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VMName},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='VMReplication', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [Microsoft.HyperV.PowerShell.VMReplication[]]
        ${VMReplication},

        [Parameter(ParameterSetName='VMName')]
        [Alias('Relationship')]
        [System.Nullable[Microsoft.HyperV.PowerShell.VMReplicationRelationshipType]]
        ${ReplicationRelationshipType},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Test-VHD {
    <#
    .SYNOPSIS
        Tests a virtual hard disk for any problems that would make it unusable.
    .PARAMETER Path
        Specifies the path to the virtual hard disk file of the virtual hard disk to be tested. If a filename or relative path is specified, the new virtual hard disk path is calculated relative to the current working directory.
    .PARAMETER SupportPersistentReservations
        Indicates that the cmdlet tests for SCSI persistent reservation support semantics. Specify this parameter to test whether a virtual hard disk or path supports shared virtual disks.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which the virtual hard disk is to be tested. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding(DefaultParameterSetName='ExistingVHD')]
    [OutputType([System.Boolean])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias('FullName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Path},

        [Parameter(ParameterSetName='SharedDisk', Mandatory=$true)]
        [Alias('ShareVirtualDisk')]
        [switch]
        ${SupportPersistentReservations},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Test-VMNetworkAdapter {
    <#
    .SYNOPSIS
        Tests connectivity between virtual machines.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts on which this cmdlet operates. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER VMName
        Specifies the name of a virtual machine.
    .PARAMETER VMNetworkAdapter
        Specifies a virtual machine network adapter as a VMNetworkAdapterBase object. The cmdlet tests connectivity for the adapters that you specify. To obtain a network adapter, use the Get-VMNetworkAdapter cmdlet.
    .PARAMETER VM
        Specifies a virtual machine. The cmdlet tests connectivity for adapters that belong to the virtual machines that you specify.
    .PARAMETER Name
        Specifies the name of the virtual machine.
    .PARAMETER Sender
        Indicates that the cmdlet targets the sender virtual machine.
    .PARAMETER Receiver
        Indicates that the cmdlet targets the receiver virtual machine.
    .PARAMETER SenderIPAddress
        Specifies the IP address of the sender virtual machine.
    .PARAMETER ReceiverIPAddress
        Specifies the IP address of the receiver virtual machine.
    .PARAMETER NextHopMacAddress
        Specified the MAC address for the next hop VM required for non-Hyper-V Network Virtualization configurations.
    .PARAMETER IsolationId
        Specifies the ID of a virtual subnet.
    .PARAMETER SequenceNumber
        Specifies the sequence number to use to generate ICMP Ping packets. The default value is 100.
    .PARAMETER Passthru
        Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.
    #>

    [CmdletBinding(DefaultParameterSetName='VMName', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    [OutputType([Microsoft.HyperV.PowerShell.VMNetworkAdapterConnectionTestResult])]
    param (
        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='VMName')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VMName},

        [Parameter(ParameterSetName='ResourceObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Microsoft.HyperV.PowerShell.VMNetworkAdapter]
        ${VMNetworkAdapter},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine]
        ${VM},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Alias('VMNetworkAdapterName')]
        [string]
        ${Name},

        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='ResourceObject')]
        [switch]
        ${Sender},

        [Parameter(ParameterSetName='VMObject')]
        [Parameter(ParameterSetName='VMName')]
        [Parameter(ParameterSetName='ResourceObject')]
        [switch]
        ${Receiver},

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SenderIPAddress},

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ReceiverIPAddress},

        [string]
        ${NextHopMacAddress},

        [System.Nullable[int]]
        ${IsolationId},

        [Parameter(Mandatory=$true)]
        [int]
        ${SequenceNumber},

        [System.Nullable[int]]
        ${PayloadSize},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Test-VMReplicationConnection {
    <#
    .SYNOPSIS
        Tests the connection between a primary server and a Replica server.
    .PARAMETER ReplicaServerName
        Specifies the name of the Replica server to test for connectivity with the virtual machine to be replicated.
    .PARAMETER ReplicaServerPort
        Specifies the port on the Replica server to use to test connectivity. Make sure you specify a port that is configured on the Replica server to support the same authentication type you specify using the AuthenticationType parameter in this cmdlet. Run the Get-VMReplicationServer cmdlet on the Replica server to check the configuration of the port, or contact the administrator of the specified Replica server.
    .PARAMETER AuthenticationType
        Specifies the authentication type to use to test the connection, either "Kerberos" or "Certificate". The specified Replica server must support the chosen authentication type. Run the Get-VMReplicationServer cmdlet to verify the authentication configured for the specified Replica server, or contact the administrator of the specified Replica server.
    .PARAMETER CertificateThumbprint
        Specifies the certificate to use for mutual authentication of the replication data. This parameter is required only when "Certificate" is the specified as the type of authentication. Specify the thumbprint of a valid computer certificate from the Personal store.

        The certificate must have all of the following properties to be valid:

        It must not be expired.

        It must include both client and server authentication extensions for extended key usage (EKU), and an associated private key.

        It must terminate at a valid root certificate.

        The requirement for the subject common name (CN) differs depending on whether the virtual machine belongs to a cluster. For virtual machines that do not belong to a cluster, the subject common name (CN) must be equal to, or subject alternative name (DNS Name) should contain, the FQDN of the host. For virtual machines that belong to a cluster, the subject common name (CN) must be equal to, or subject alternative name (DNS Name) must contain, the FQDN of the Hyper-V Replica Broker.

        To display a list certificates in the computer's My store and the thumbprint of each certificate, type the following:

        `PS C:\> cd cert:\LocalMachine\My`

        `PS C:\> dir | format-list`

        For more information about certificate stores, see http://technet.microsoft.com//library/cc757138.aspx (http://technet.microsoft.com//library/cc757138.aspx).
    .PARAMETER BypassProxyServer
        Specifies whether to bypass a proxy server when testing the connectivity.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that have the virtual machines for which you want to test the connection for replication. NetBIOS names, IP addresses, and fully qualified domain names (FQDN) are allowed. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    #>

    [CmdletBinding()]
    [OutputType([System.String])]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [Alias('ReplicaServer')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ReplicaServerName},

        [Parameter(Mandatory=$true, Position=1)]
        [Alias('ReplicaPort')]
        [ValidateRange(1, 65535)]
        [int]
        ${ReplicaServerPort},

        [Parameter(Mandatory=$true, Position=2)]
        [Alias('AuthType')]
        [Microsoft.HyperV.PowerShell.ReplicationAuthenticationType]
        ${AuthenticationType},

        [Parameter(Position=3, ValueFromPipelineByPropertyName=$true)]
        [Alias('Thumbprint')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${CertificateThumbprint},

        [ValidateNotNull()]
        [System.Nullable[bool]]
        ${BypassProxyServer},

        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Update-VMVersion {
    <#
    .SYNOPSIS
        Updates the version of virtual machines.
    .PARAMETER CimSession
        Runs the cmdlet in a remote session or on a remote computer. Enter a computer name or a session object, such as the output of a New-CimSession (http://go.microsoft.com/fwlink/p/?LinkId=227967) or [Get-CimSession](http://go.microsoft.com/fwlink/p/?LinkId=227966)cmdlet. The default is the current session on the local computer.
    .PARAMETER ComputerName
        Specifies one or more Hyper-V hosts that run this cmdlet. NetBIOS names, IP addresses, and fully qualified domain names are allowable. The default is the local computer. Use localhost or a dot (.) to specify the local computer explicitly.
    .PARAMETER Credential
        Specifies one or more user accounts that have permission to perform this action. The default is the current user.
    .PARAMETER Name
        Specifies an array of names of the virtual machines that this cmdlet updates.
    .PARAMETER VM
        Specifies an array of virtual machines that this cmdlet updates. To obtain a VirtualMachine object, use the Get-VM cmdlet.
    .PARAMETER Force
        Forces the command to run without asking for user confirmation.
    .PARAMETER AsJob
        Runs the cmdlet as a background job.
    .PARAMETER Passthru
        Indicates that this cmdlet returns the Microsoft.HyperV.VirtualMachine object that it modifies.
    #>

    [CmdletBinding(DefaultParameterSetName='Name', SupportsShouldProcess=$true, ConfirmImpact='High')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [switch]
        ${Force},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Wait-VM {
    <#
    .SYNOPSIS
        Wait-VM [-Name] <string[]> [-CimSession <CimSession[]>] [-ComputerName <string[]>] [-Credential <pscredential[]>] [-AsJob] [-Passthru] [-For <WaitVMTypes>] [-Delay <uint16>] [-Timeout <int>] [<CommonParameters>]

Wait-VM [-VM] <VirtualMachine[]> [-AsJob] [-Passthru] [-For <WaitVMTypes>] [-Delay <uint16>] [-Timeout <int>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Name')]
    [OutputType([Microsoft.HyperV.PowerShell.VirtualMachine])]
    param (
        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ComputerName},

        [Parameter(ParameterSetName='Name')]
        [ValidateNotNullOrEmpty()]
        [pscredential[]]
        ${Credential},

        [Parameter(ParameterSetName='VMObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        ${VM},

        [Parameter(ParameterSetName='Name', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [Alias('VMName')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [switch]
        ${AsJob},

        [switch]
        ${Passthru},

        [Microsoft.HyperV.PowerShell.WaitVMTypes]
        ${For},

        [ValidateRange(1, 65535)]
        [uint16]
        ${Delay},

        [Alias('TimeoutSec')]
        [ValidateRange(-1, 2147483647)]
        [int]
        ${Timeout}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}
