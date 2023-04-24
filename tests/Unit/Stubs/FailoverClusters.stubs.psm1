# Name: FailoverClusters
# Version: 2.0.0.0
# CreatedOn: 2023-04-17 14:27:35Z

Add-Type -IgnoreWarnings -TypeDefinition @'
namespace Microsoft.FailoverClusters.NativeHelp
{
    public class NativeGroupHelp
    {
        // Constructor
        public NativeGroupHelp() { }

    }


    public enum VmMigrationType : int
    {
        TurnOff = 0,
        Quick = 1,
        Shutdown = 2,
        ShutdownForce = 3,
        Live = 4,
    }
}

namespace Microsoft.FailoverClusters.PowerShell
{
    public enum AdminAccessPoint : int
    {
        None = 0,
        ActiveDirectoryAndDns = 1,
        Dns = 2,
        ActiveDirectory = 3,
    }

    public enum AdminAccessPointResType : int
    {
        Automatic = 0,
        Singleton = 1,
        Distributed = 2,
    }

    public class Cluster
    {
        // Property
        public System.UInt32 AddEvictDelay { get; set; }
        public Microsoft.FailoverClusters.PowerShell.AdminAccessPoint AdministrativeAccessPoint { get; set; }
        public System.UInt32 AutoAssignNodeSite { get; set; }
        public System.UInt32 AutoBalancerMode { get; set; }
        public System.UInt32 AutoBalancerLevel { get; set; }
        public System.UInt32 BackupInProgress { get; set; }
        public System.UInt32 BlockCacheSize { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterCloudType DetectedCloudPlatform { get; set; }
        public System.UInt32 DetectManagedEvents { get; set; }
        public System.UInt32 DetectManagedEventsThreshold { get; set; }
        public System.UInt32 ClusSvcHangTimeout { get; set; }
        public System.UInt32 ClusSvcRegroupStageTimeout { get; set; }
        public System.UInt32 ClusSvcRegroupTickInMilliseconds { get; set; }
        public System.UInt32 ClusterEnforcedAntiAffinity { get; set; }
        public System.UInt32 ClusterFunctionalLevel { get; set; }
        public System.UInt32 ClusterUpgradeVersion { get; set; }
        public System.UInt32 ClusterGroupWaitDelay { get; set; }
        public System.UInt32 ClusterLogLevel { get; set; }
        public System.UInt32 ClusterLogSize { get; set; }
        public System.UInt32 CrossSiteDelay { get; set; }
        public System.UInt32 CrossSiteThreshold { get; set; }
        public System.UInt32 CrossSubnetDelay { get; set; }
        public System.UInt32 CrossSubnetThreshold { get; set; }
        public System.UInt32 CsvBalancer { get; set; }
        public System.UInt32 CsvTimeToWait { get; set; }
        public System.UInt32 DatabaseReadWriteMode { get; set; }
        public System.UInt32 DefaultNetworkRole { get; set; }
        public System.String Description { get; set; }
        public System.String Domain { get; set; }
        public System.UInt32 DrainOnShutdown { get; set; }
        public System.UInt64 DumpPolicy { get; set; }
        public System.UInt32 DynamicQuorum { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterSharedVolumesSetting EnableSharedVolumes { get; set; }
        public System.UInt32 FixQuorum { get; set; }
        public System.UInt32 GroupDependencyTimeout { get; set; }
        public System.UInt32 HangRecoveryAction { get; set; }
        public System.String Id { get; set; }
        public System.UInt32 IgnorePersistentStateOnStartup { get; set; }
        public System.UInt32 LogResourceControls { get; set; }
        public System.UInt32 LowerQuorumPriorityNodeId { get; set; }
        public System.UInt32 MessageBufferLength { get; set; }
        public System.UInt32 MinimumNeverPreemptPriority { get; set; }
        public System.UInt32 MinimumPreemptorPriority { get; set; }
        public System.String Name { get; set; }
        public System.UInt32 NetftIPSecEnabled { get; set; }
        public System.UInt32 PlacementOptions { get; set; }
        public System.UInt32 PlumbAllCrossSubnetRoutes { get; set; }
        public System.String PreferredSite { get; set; }
        public System.UInt32 PreventQuorum { get; set; }
        public System.UInt32 QuarantineDuration { get; set; }
        public System.UInt32 QuarantineThreshold { get; set; }
        public System.UInt32 QuorumArbitrationTimeMax { get; set; }
        public System.DateTime RecentEventsResetTime { get; set; }
        public System.UInt32 RequestReplyTimeout { get; set; }
        public System.UInt32 ResiliencyDefaultPeriod { get; set; }
        public System.Nullable<Microsoft.FailoverClusters.PowerShell.ClusterResiliencyLevel> ResiliencyLevel { get; set; }
        public System.UInt32 RouteHistoryLength { get; set; }
        public System.UInt32 S2DBusTypes { get; set; }
        public Microsoft.FailoverClusters.PowerShell.S2DCacheBehavior S2DCacheBehavior { get; set; }
        public Microsoft.FailoverClusters.PowerShell.S2DCacheState S2DCacheDesiredState { get; set; }
        public System.UInt64 S2DCacheMetadataReserveBytes { get; set; }
        public System.UInt32 S2DCachePageSizeKBytes { get; set; }
        public System.UInt32 S2DEnabled { get; set; }
        public System.UInt32 S2DIOLatencyThreshold { get; set; }
        public System.UInt32 S2DOptimizations { get; set; }
        public System.UInt32 WprSessionCount { get; set; }
        public System.UInt32 WprSessionCoolOffTime { get; set; }
        public System.UInt32 RolloutAudience { get; set; }
        public System.UInt32 DpcWatchdogProfileSingleDpcThreshold { get; set; }
        public System.UInt32 DpcWatchdogProfileCumulativeDpcThreshold { get; set; }
        public System.Object GlobalWprSessionConfig { get; set; }
        public System.UInt32 SameSubnetDelay { get; set; }
        public System.UInt32 SameSubnetThreshold { get; set; }
        public System.UInt32 SecurityLevel { get; set; }
        public System.UInt32 SecurityLevelForStorage { get; set; }
        public System.UInt32 SetSMBBandwidthLimit { get; set; }
        public System.UInt32 SMBBandwidthLimitFactor { get; set; }
        public System.Object SharedVolumeCompatibleFilters { get; set; }
        public System.Object SharedVolumeIncompatibleFilters { get; set; }
        public System.Byte[] SharedVolumeSecurityDescriptor { get; set; }
        public System.String SharedVolumesRoot { get; set; }
        public System.UInt32 SharedVolumeVssWriterOperationTimeout { get; set; }
        public System.UInt32 ShutdownTimeoutInMinutes { get; set; }
        public System.UInt32 UseClientAccessNetworksForSharedVolumes { get; set; }
        public System.UInt32 WitnessDatabaseWriteTimeout { get; set; }
        public System.UInt32 WitnessDynamicWeight { get; set; }
        public System.UInt32 WitnessRestartInterval { get; set; }
        public System.Object EnabledEventLogs { get; set; }
        public System.UInt32 UseRdmaForStorage { get; set; }

        // Fabricated constructor
        private Cluster() { }
        public static Cluster CreateTypeInstance()
        {
            return new Cluster();
        }
    }

    public class ClusterAccessRule
    {
        // Constructor
        public ClusterAccessRule(Microsoft.FailoverClusters.PowerShell.Cluster cluster, MS.Internal.ServerClusters.ClusterAccessRule rule) { }

        // Property
        public Microsoft.FailoverClusters.PowerShell.Cluster Cluster { get; set; }
        public System.Security.AccessControl.AccessControlType AccessControlType { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterRights ClusterRights { get; set; }
        public System.Security.Principal.IdentityReference IdentityReference { get; set; }

        // Fabricated constructor
        private ClusterAccessRule() { }
        public static ClusterAccessRule CreateTypeInstance()
        {
            return new ClusterAccessRule();
        }
    }

    [System.Flags]
    public enum ClusterApplicationStatusInformation : ulong
    {
        Locked = 1,
        Preempted = 2,
        Queued = 4,
        PhysicalResourcesLacking = 8,
        WaitingToStart = 16,
        EmbeddedFailure = 32,
        OfflineAntiAffinityConflict = 64,
        NetworkFailure = 128,
        Unmonitored = 256,
        WaitingForDependencies = 4096,
    }

    public enum ClusterCloudType : int
    {
        None = 0,
        Azure = 1,
        Mixed = 128,
        Unknown = -1,
    }

    public class ClusterCryptoCheckpoint
    {
        // Property
        public Microsoft.FailoverClusters.PowerShell.ClusterResource Resource { get; set; }
        public System.String Key { get; set; }
        public System.String CryptoType { get; set; }
        public System.String Name { get; set; }

        // Fabricated constructor
        private ClusterCryptoCheckpoint() { }
        public static ClusterCryptoCheckpoint CreateTypeInstance()
        {
            return new ClusterCryptoCheckpoint();
        }
    }

    public class ClusterDiskInfo
    {
        // Property
        public Microsoft.FailoverClusters.PowerShell.Cluster Cluster { get; set; }
        public System.String Id { get; set; }
        public System.String Name { get; set; }
        public System.UInt32 Number { get; set; }
        public System.UInt64 Size { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterDiskPartitionInfo[] Partitions { get; set; }

        // Fabricated constructor
        private ClusterDiskInfo() { }
        public static ClusterDiskInfo CreateTypeInstance()
        {
            return new ClusterDiskInfo();
        }
    }

    public class ClusterDiskPartitionInfo
    {
        public bool IsSecondaryStubType = true;

        public ClusterDiskPartitionInfo() { }
    }

    public class ClusterGroup
    {
        // Property
        public System.Object AntiAffinityClassNames { get; set; }
        public System.UInt32 AutoFailbackType { get; set; }
        public System.UInt32 ColdStartSetting { get; set; }
        public Microsoft.FailoverClusters.PowerShell.Cluster Cluster { get; set; }
        public System.UInt32 DefaultOwner { get; set; }
        public System.String Description { get; set; }
        public Microsoft.FailoverClusters.PowerShell.GroupType GroupType { get; set; }
        public System.UInt32 FailoverPeriod { get; set; }
        public System.UInt32 FailoverThreshold { get; set; }
        public System.UInt32 FailbackWindowEnd { get; set; }
        public System.UInt32 FailbackWindowStart { get; set; }
        public System.UInt32 FaultDomain { get; set; }
        public System.Boolean IsCoreGroup { get; set; }
        public System.UInt32 LockedFromMoving { get; set; }
        public System.String Name { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterNode OwnerNode { get; set; }
        public System.UInt32 PersistentState { get; set; }
        public System.UInt32 PlacementOptions { get; set; }
        public System.Object PreferredSite { get; set; }
        public System.UInt32 Priority { get; set; }
        public System.UInt32 ResiliencyPeriod { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterGroupState State { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterApplicationStatusInformation StatusInformation { get; set; }
        public System.UInt32 UpdateDomain { get; set; }
        public System.String Id { get; set; }

        // Fabricated constructor
        private ClusterGroup() { }
        public static ClusterGroup CreateTypeInstance()
        {
            return new ClusterGroup();
        }
    }

    public enum ClusterGroupState : int
    {
        Online = 0,
        Offline = 1,
        Failed = 2,
        PartialOnline = 3,
        Pending = 4,
        Unknown = -1,
    }

    public class ClusterNetwork
    {
        // Property
        public System.String Address { get; set; }
        public System.String AddressMask { get; set; }
        public System.Boolean AutoMetric { get; set; }
        public Microsoft.FailoverClusters.PowerShell.Cluster Cluster { get; set; }
        public System.String Description { get; set; }
        public System.String Id { get; set; }
        public System.Object Ipv4Addresses { get; set; }
        public System.Object Ipv4PrefixLengths { get; set; }
        public System.Object Ipv6Addresses { get; set; }
        public System.Object Ipv6PrefixLengths { get; set; }
        public System.UInt32 Metric { get; set; }
        public System.String Name { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterNetworkRole Role { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterNetworkState State { get; set; }

        // Fabricated constructor
        private ClusterNetwork() { }
        public static ClusterNetwork CreateTypeInstance()
        {
            return new ClusterNetwork();
        }
    }

    public class ClusterNetworkInterface
    {
        // Property
        public System.String Adapter { get; set; }
        public System.String AdapterId { get; set; }
        public System.String Address { get; set; }
        public Microsoft.FailoverClusters.PowerShell.Cluster Cluster { get; set; }
        public System.String Description { get; set; }
        public System.UInt32 DhcpEnabled { get; set; }
        public System.String Id { get; set; }
        public System.Object Ipv4Addresses { get; set; }
        public System.Object Ipv6Addresses { get; set; }
        public System.String Name { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterNetwork Network { get; set; }
        public System.String Node { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterNetworkInterfaceState State { get; set; }

        // Fabricated constructor
        private ClusterNetworkInterface() { }
        public static ClusterNetworkInterface CreateTypeInstance()
        {
            return new ClusterNetworkInterface();
        }
    }

    public enum ClusterNetworkInterfaceState : int
    {
        Unavailable = 0,
        Failed = 1,
        Unreachable = 2,
        Up = 3,
        Unknown = -1,
    }

    public enum ClusterNetworkRole : int
    {
        None = 0,
        Cluster = 1,
        Client = 2,
        ClusterAndClient = 3,
    }

    public enum ClusterNetworkState : int
    {
        Unavailable = 0,
        Down = 1,
        Partitioned = 2,
        Up = 3,
        Unknown = -1,
    }

    public class ClusterNode
    {
        // Property
        public System.UInt32 BuildNumber { get; set; }
        public Microsoft.FailoverClusters.PowerShell.Cluster Cluster { get; set; }
        public System.String CSDVersion { get; set; }
        public System.String Description { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterNodeDrainStatus DrainStatus { get; set; }
        public System.UInt32 DrainTarget { get; set; }
        public System.UInt32 DynamicWeight { get; set; }
        public System.String Id { get; set; }
        public System.UInt32 MajorVersion { get; set; }
        public System.UInt32 MinorVersion { get; set; }
        public System.String Name { get; set; }
        public System.UInt32 NeedsPreventQuorum { get; set; }
        public System.UInt32 NodeHighestVersion { get; set; }
        public System.String NodeInstanceID { get; set; }
        public System.UInt32 NodeLowestVersion { get; set; }
        public System.String NodeName { get; set; }
        public System.UInt32 NodeWeight { get; set; }
        public System.Object FaultDomain { get; set; }
        public System.String Model { get; set; }
        public System.String Manufacturer { get; set; }
        public System.String SerialNumber { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterNodeState State { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterNodeStatusInformation StatusInformation { get; set; }
        public Microsoft.FailoverClusters.PowerShell.NodeType Type { get; set; }
        public System.String UniqueID { get; set; }
        public Microsoft.FailoverClusters.PowerShell.NodeCloudType DetectedCloudPlatform { get; set; }

        // Fabricated constructor
        private ClusterNode() { }
        public static ClusterNode CreateTypeInstance()
        {
            return new ClusterNode();
        }
    }

    public enum ClusterNodeDrainStatus : int
    {
        NotInitiated = 0,
        InProgress = 1,
        Completed = 2,
        Failed = 3,
    }

    public enum ClusterNodeState : int
    {
        Up = 0,
        Down = 1,
        Paused = 2,
        Joining = 3,
        Unknown = -1,
    }

    [System.Flags]
    public enum ClusterNodeStatusInformation : int
    {
        Normal = 0,
        Isolated = 1,
        Quarantined = 2,
        DrainInProgress = 4,
        DrainCompleted = 8,
        DrainFailed = 16,
        AvoidPlacement = 32,
        Unknown = -2147483648,
    }

    public class ClusterObject
    {
        public bool IsSecondaryStubType = true;

        public ClusterObject() { }
    }

    public class ClusterOwnerNodeList
    {
        // Property
        public Microsoft.FailoverClusters.PowerShell.ClusterObject ClusterObject { get; set; }
        public System.Collections.Generic.ICollection<Microsoft.FailoverClusters.PowerShell.ClusterNode> OwnerNodes { get; set; }

        // Fabricated constructor
        private ClusterOwnerNodeList() { }
        public static ClusterOwnerNodeList CreateTypeInstance()
        {
            return new ClusterOwnerNodeList();
        }
    }

    public class ClusterParameter
    {
        // Constructor
        public ClusterParameter(Microsoft.FailoverClusters.PowerShell.ClusterObject clusterObject, System.String name, System.Object value) { }
        public ClusterParameter(Microsoft.FailoverClusters.PowerShell.ClusterObject clusterObject, System.String name, System.Object value, Microsoft.FailoverClusters.PowerShell.ClusterParameterType type) { }
        public ClusterParameter(Microsoft.FailoverClusters.PowerShell.ClusterObject clusterObject, System.String name, System.Object value, System.Boolean isReadOnly, Microsoft.FailoverClusters.PowerShell.ClusterParameterType type) { }

        // Property
        public Microsoft.FailoverClusters.PowerShell.ClusterObject ClusterObject { get; set; }
        public System.String Name { get; set; }
        public System.Boolean IsReadOnly { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterParameterType ParameterType { get; set; }
        public System.Object Value { get; set; }

        // Fabricated constructor
        private ClusterParameter() { }
        public static ClusterParameter CreateTypeInstance()
        {
            return new ClusterParameter();
        }
    }

    public enum ClusterParameterType : int
    {
        Unknown = 0,
        ByteArray = 1,
        UInt32 = 2,
        String = 3,
        ExpandString = 4,
        StringCollection = 5,
        UInt64 = 6,
        Int32 = 7,
        ExpandedString = 8,
        Int64 = 10,
        UInt16 = 11,
        DateTime = 12,
    }

    public class ClusterQuorumSettings
    {
        // Property
        public Microsoft.FailoverClusters.PowerShell.Cluster Cluster { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterResource QuorumResource { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterQuorumType QuorumType { get; set; }

        // Fabricated constructor
        private ClusterQuorumSettings() { }
        public static ClusterQuorumSettings CreateTypeInstance()
        {
            return new ClusterQuorumSettings();
        }
    }

    public enum ClusterQuorumType : int
    {
        Unknown = 0,
        Majority = 1,
        DiskOnly = 2,
    }

    public class ClusterRegistryCheckpoint
    {
        // Property
        public Microsoft.FailoverClusters.PowerShell.ClusterResource Resource { get; set; }
        public System.String Name { get; set; }

        // Fabricated constructor
        private ClusterRegistryCheckpoint() { }
        public static ClusterRegistryCheckpoint CreateTypeInstance()
        {
            return new ClusterRegistryCheckpoint();
        }
    }

    public enum ClusterResiliencyLevel : int
    {
        IsolateOnSpecialHeartbeat = 1,
        AlwaysIsolate = 2,
    }

    public class ClusterResource
    {
        // Property
        public Microsoft.FailoverClusters.PowerShell.ClusterResourceAndResourceTypeCharacteristics Characteristics { get; set; }
        public Microsoft.FailoverClusters.PowerShell.Cluster Cluster { get; set; }
        public System.UInt32 DeadlockTimeout { get; set; }
        public System.String Description { get; set; }
        public System.String Id { get; set; }
        public System.Boolean IsCoreResource { get; set; }
        public System.UInt32 EmbeddedFailureAction { get; set; }
        public System.UInt32 IsAlivePollInterval { get; set; }
        public System.Boolean IsNetworkClassResource { get; set; }
        public System.Boolean IsStorageClassResource { get; set; }
        public System.UInt64 LastOperationStatusCode { get; set; }
        public System.UInt32 LooksAlivePollInterval { get; set; }
        public System.Boolean MaintenanceMode { get; set; }
        public System.UInt32 MonitorProcessId { get; set; }
        public System.String Name { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterGroup OwnerGroup { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterNode OwnerNode { get; set; }
        public System.UInt32 PendingTimeout { get; set; }
        public System.UInt32 PersistentState { get; set; }
        public System.UInt64 ResourceSpecificData1 { get; set; }
        public System.UInt64 ResourceSpecificData2 { get; set; }
        public System.String ResourceSpecificStatus { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterResourceType ResourceType { get; set; }
        public System.UInt32 RestartAction { get; set; }
        public System.UInt32 RestartDelay { get; set; }
        public System.UInt32 RestartPeriod { get; set; }
        public System.UInt32 RestartThreshold { get; set; }
        public System.UInt32 RetryPeriodOnFailure { get; set; }
        public System.Boolean SeparateMonitor { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterResourceState State { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterResourceStatusInformation StatusInformation { get; set; }

        // Fabricated constructor
        private ClusterResource() { }
        public static ClusterResource CreateTypeInstance()
        {
            return new ClusterResource();
        }
    }

    [System.Flags]
    public enum ClusterResourceAndResourceTypeCharacteristics : int
    {
        Quorum = 1,
        DeleteRequiresAllNodes = 2,
        LocalQuorum = 4,
        LocalQuorumDebug = 8,
        RequiresStateChangeReason = 16,
        BroadcastDelete = 32,
        SingleClusterInstance = 64,
        SingleGroupInstance = 128,
        SharedVolumeCompatible = 256,
        PlacementAware = 512,
        MonitorDetach = 1024,
        MonitorReattach = 2048,
        OperationContext = 4096,
        Clones = 8192,
        NotPreemptable = 16384,
        NotifyNewOwner = 32768,
        SupportsUnmonitoredState = 65536,
        Infrastructure = 131072,
        CheckDrainVeto = 262144,
    }

    public class ClusterResourceDependency
    {
        // Property
        public Microsoft.FailoverClusters.PowerShell.ClusterResource Resource { get; set; }
        public System.String DependencyExpression { get; set; }

        // Fabricated constructor
        private ClusterResourceDependency() { }
        public static ClusterResourceDependency CreateTypeInstance()
        {
            return new ClusterResourceDependency();
        }
    }

    public enum ClusterResourceState : int
    {
        Inherited = 0,
        Initializing = 1,
        Online = 2,
        Offline = 3,
        Failed = 4,
        Pending = 128,
        OnlinePending = 129,
        OfflinePending = 130,
        Unknown = -1,
    }

    [System.Flags]
    public enum ClusterResourceStatusInformation : ulong
    {
        Locked = 1,
        EmbeddedFailure = 2,
        InsufficientCpu = 4,
        InsufficientMemory = 8,
        InsufficientResources = 16,
        NetworkFailure = 32,
        Unmonitored = 64,
    }

    public class ClusterResourceType
    {
        // Property
        public System.Object AdminExtensions { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterResourceAndResourceTypeCharacteristics Characteristics { get; set; }
        public Microsoft.FailoverClusters.PowerShell.Cluster Cluster { get; set; }
        public System.UInt32 DeadlockTimeout { get; set; }
        public System.String Description { get; set; }
        public System.String DisplayName { get; set; }
        public System.String DllName { get; set; }
        public System.Object DumpLogQuery { get; set; }
        public System.UInt64 DumpPolicy { get; set; }
        public System.Object DumpServices { get; set; }
        public System.Object EnabledEventLogs { get; set; }
        public System.UInt64 WprStartAfter { get; set; }
        public System.Object WprProfiles { get; set; }
        public System.String Id { get; set; }
        public System.UInt32 IsAlivePollInterval { get; set; }
        public System.UInt32 LooksAlivePollInterval { get; set; }
        public System.UInt32 MaximumMonitors { get; set; }
        public System.String Name { get; set; }
        public System.UInt32 PendingTimeout { get; set; }

        // Fabricated constructor
        private ClusterResourceType() { }
        public static ClusterResourceType CreateTypeInstance()
        {
            return new ClusterResourceType();
        }
    }

    public enum ClusterRights : int
    {
        None = 0,
        Read = 1,
        Full = 2,
    }

    public class ClusterSharedVolume
    {
        // Property
        public System.String Id { get; set; }
        public System.String Name { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterNode OwnerNode { get; set; }
        public System.Collections.Generic.ICollection<Microsoft.FailoverClusters.PowerShell.ClusterSharedVolumeInfo> SharedVolumeInfo { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterResourceState State { get; set; }

        // Fabricated constructor
        private ClusterSharedVolume() { }
        public static ClusterSharedVolume CreateTypeInstance()
        {
            return new ClusterSharedVolume();
        }
    }

    [System.Flags]
    public enum ClusterSharedVolumeBlockRedirectedIOReason : int
    {
        NotBlockRedirected = 0,
        NoDiskConnectivity = 1,
        StorageSpaceNotAttached = 2,
        VolumeReplicationEnabled = 4,
    }

    [System.Flags]
    public enum ClusterSharedVolumeFileSystemRedirectedIOReasons : int
    {
        NotFileSystemRedirected = 0,
        UserRequest = 1,
        IncompatibleFileSystemFilter = 2,
        IncompatibleVolumeFilter = 4,
        FileSystemTiering = 8,
        BitLockerInitializing = 16,
        FileSystemReFs = 32,
    }

    public class ClusterSharedVolumeInfo
    {
        public bool IsSecondaryStubType = true;

        public ClusterSharedVolumeInfo() { }
    }

    public enum ClusterSharedVolumesSetting : int
    {
        Disabled = 0,
        Enabled = 1,
    }

    public enum ClusterSharedVolumeState : int
    {
        Unavailable = 0,
        Paused = 1,
        Direct = 2,
        FileSystemRedirected = 3,
        BlockRedirected = 4,
    }

    public class ClusterSharedVolumeStateInfo
    {
        // Constructor
        public ClusterSharedVolumeStateInfo() { }

        // Property
        public Microsoft.FailoverClusters.PowerShell.ClusterSharedVolumeBlockRedirectedIOReason BlockRedirectedIOReason { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterSharedVolumeFileSystemRedirectedIOReasons FileSystemRedirectedIOReason { get; set; }
        public System.String Name { get; set; }
        public System.String Node { get; set; }
        public Microsoft.FailoverClusters.PowerShell.ClusterSharedVolumeState StateInfo { get; set; }
        public System.String VolumeFriendlyName { get; set; }
        public System.String VolumeName { get; set; }

    }

    public class ClusterTestInfo
    {
        // Property
        public System.String Category { get; set; }
        public System.String DisplayName { get; set; }
        public System.String Description { get; set; }

        // Fabricated constructor
        private ClusterTestInfo() { }
        public static ClusterTestInfo CreateTypeInstance()
        {
            return new ClusterTestInfo();
        }
    }

    public class ClusterVMMonitoredItem
    {
        // Property
        public System.String VMName { get; set; }
        public System.String Name { get; set; }

        // Fabricated constructor
        private ClusterVMMonitoredItem() { }
        public static ClusterVMMonitoredItem CreateTypeInstance()
        {
            return new ClusterVMMonitoredItem();
        }
    }

    public enum GroupType : uint
    {
        Cluster = 1,
        AvailableStorage = 2,
        Temporary = 3,
        ClusterSharedVolume = 4,
        ClusterStoragePool = 5,
        FileServer = 100,
        DhcpServer = 102,
        Dtc = 103,
        Msmq = 104,
        Wins = 105,
        StandAloneDfs = 106,
        GenericApplication = 107,
        GenericService = 108,
        GenericScript = 109,
        IScsiNameService = 110,
        VirtualMachine = 111,
        TsSessionBroker = 112,
        IScsiTarget = 113,
        ScaleoutFileServer = 114,
        VMReplicaBroker = 115,
        TaskScheduler = 116,
        InfrastructureFileServer = 122,
        Unknown = 9999,
    }

    public enum NodeCloudType : int
    {
        None = 0,
        Azure = 1,
        Unknown = -1,
    }

    public enum NodeType : int
    {
        Node = 0,
        StorageNode = 1,
    }

    public enum ResumeClusterNodeFailbackType : int
    {
        NoFailback = 0,
        Immediate = 1,
        Policy = 2,
    }

    [System.Flags]
    public enum S2DCacheBehavior : ulong
    {
        Dormant = 1,
        SkipSpindlePartitionsRemovalOnDisable = 2,
        SkipFlashPartitionsRemovalOnDisable = 4,
        CacheModeHddRead = 8,
        CacheModeHddWrite = 16,
        CacheModeSsdread = 32,
        CacheModeSsdWrite = 64,
        Default = 88,
        UseScmForCapacity = 128,
    }

    public enum S2DCacheState : int
    {
        Disabled = 0,
        Enabled = 2,
        ReadOnly = 4,
        ReadWrite = 12,
        Provisioning = 14,
        ProvisioningFlash = 15,
        ProvisioningSpinningMedia = 20,
        Disabling = 120,
        Dormant = 200,
        IneligibleNoDisks = 1001,
        IneligibleNoFlash = 1002,
        IneligibleNotMixedMedia = 1003,
    }

}

namespace Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_AffinityRule
{
    public enum RuleType : uint
    {
        SameFaultDomain = 1,
        SameNode = 2,
        DifferentFaultDomain = 3,
        DifferentNode = 4,
    }

}

namespace Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_FaultDomain
{
    public enum FaultDomainType : uint
    {
        Unknown = 0,
        Site = 1000,
        Rack = 2000,
        Chassis = 3000,
        Node = 4000,
        StorageNode = 5000,
    }

}

namespace Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_GroupSet
{
    public enum StartupSettingType : uint
    {
        Delay = 1,
        Online = 2,
    }

}

namespace Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_StorageSpacesDirect
{
    public enum CacheModeType : uint
    {
        ReadOnly = 4,
        WriteOnly = 8,
        ReadWrite = 12,
    }

    public enum CacheStateType : uint
    {
        Disabled = 0,
        Enabled = 2,
    }

    public enum S2DBusType : ushort
    {
        Sas = 10,
        Sata = 11,
        Nvme = 17,
        SCM = 18,
    }

    public enum ScmUse : uint
    {
        Cache = 0,
        Capacity = 1,
    }

    public enum SedProtectionStateType : uint
    {
        Disabled = 0,
        Provisioned = 1,
        Protected = 2,
    }

}

namespace MS.Internal.ServerClusters
{
    public class ClusterAccessRule
    {
        public bool IsSecondaryStubType = true;

        public ClusterAccessRule() { }
    }

}

namespace SetClusterStorageSpacesDirectDisk
{
    [System.Flags]
    public enum S2DDiskUsage : int
    {
        NonHybrid = 0,
        Capacity = 1,
        Cache = 2,
        Auto = 3,
    }

}

'@

function Add-VMToCluster {
    <#
    .SYNOPSIS
        Add-ClusterVirtualMachineRole [[-VMName] <string>] [-Name <string>] [-VirtualMachine <string>] [-VMId <guid>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(HelpUri='https://go.microsoft.com/fwlink/?LinkId=216198')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterGroup])]
    param (
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(Position=0, ValueFromPipelineByPropertyName=$true)]
        [string]
        ${VMName},

        [Alias('VM')]
        [string]
        ${VirtualMachine},

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [guid]
        ${VMId},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Disable-ClusterS2D {
    <#
    .SYNOPSIS
        Disable-ClusterStorageSpacesDirect [-CleanupCache <bool>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='High', PositionalBinding=$false, HelpUri='https://go.microsoft.com/fwlink/?LinkId=615933')]
    param (
        [Parameter(ParameterSetName='DefaultParameterSet')]
        [bool]
        ${CleanupCache},

        [Parameter(ParameterSetName='DefaultParameterSet')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='DefaultParameterSet')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='DefaultParameterSet')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Enable-ClusterS2D {
    <#
    .SYNOPSIS
        Enable-ClusterStorageSpacesDirect [-PoolFriendlyName <string>] [-Autoconfig <bool>] [-CacheState <CacheStateType>] [-CacheMetadataReserveBytes <uint64>] [-CachePageSizeKBytes <uint32>] [-SkipEligibilityChecks] [-CollectPerformanceHistory <bool>] [-BusTypesToUse <S2DBusType[]>] [-SedProtectionState <SedProtectionStateType>] [-UseSedExclusively <bool>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Enable-ClusterStorageSpacesDirect -XML <string> [-PoolFriendlyName <string>] [-Autoconfig <bool>] [-CacheState <CacheStateType>] [-CacheMetadataReserveBytes <uint64>] [-CachePageSizeKBytes <uint32>] [-SkipEligibilityChecks] [-CollectPerformanceHistory <bool>] [-BusTypesToUse <S2DBusType[]>] [-SedProtectionState <SedProtectionStateType>] [-UseSedExclusively <bool>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Enable-ClusterStorageSpacesDirect -CacheDeviceModel <string[]> [-PoolFriendlyName <string>] [-Autoconfig <bool>] [-CacheState <CacheStateType>] [-CacheMetadataReserveBytes <uint64>] [-CachePageSizeKBytes <uint32>] [-SkipEligibilityChecks] [-CollectPerformanceHistory <bool>] [-BusTypesToUse <S2DBusType[]>] [-SedProtectionState <SedProtectionStateType>] [-UseSedExclusively <bool>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='High', PositionalBinding=$false, HelpUri='https://go.microsoft.com/fwlink/?LinkId=615932')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCluster/MSCluster_StorageSpacesDirectEnable')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCluster/MSCluster_StorageSpacesDirectEnable')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCluster/MSCluster_StorageSpacesDirectEnable')]
    param (
        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${PoolFriendlyName},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [bool]
        ${Autoconfig},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_StorageSpacesDirect.CacheStateType]
        ${CacheState},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [uint64]
        ${CacheMetadataReserveBytes},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [ValidateSet('8','16','32','64')]
        [uint32]
        ${CachePageSizeKBytes},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [switch]
        ${SkipEligibilityChecks},

        [Parameter(ParameterSetName='WithCacheDeviceModel', Mandatory=$true)]
        [string[]]
        ${CacheDeviceModel},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [bool]
        ${CollectPerformanceHistory},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_StorageSpacesDirect.S2DBusType[]]
        ${BusTypesToUse},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_StorageSpacesDirect.SedProtectionStateType]
        ${SedProtectionState},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [bool]
        ${UseSedExclusively},

        [Parameter(ParameterSetName='WithXML', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${XML},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterPerf {
    <#
    .SYNOPSIS
        Get-ClusterPerformanceHistory [[-ClusterSeriesName] <Object>] [[-TimeFrame] <string>] [[-Cluster] <Cluster>] [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]

Get-ClusterPerformanceHistory -SeriesKeyName <string> -Stream <string> [-UsePattern] [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]

Get-ClusterPerformanceHistory [[-ClusterNodeSeriesName] <Object>] [[-TimeFrame] <string>] [-ClusterNode] <ClusterNode[]> [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]

Get-ClusterPerformanceHistory [[-VMSeriesName] <Object>] [[-TimeFrame] <string>] [-VM] <VirtualMachine[]> [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]

Get-ClusterPerformanceHistory [[-VHDSeriesName] <Object>] [[-TimeFrame] <string>] [-VHD] <VirtualHardDisk[]> [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]

Get-ClusterPerformanceHistory [[-PhysicalDiskSeriesName] <Object>] [[-TimeFrame] <string>] [-PhysicalDisk] <CimInstance#MSFT_PhysicalDisk[]> [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]

Get-ClusterPerformanceHistory [[-VolumeSeriesName] <Object>] [[-TimeFrame] <string>] [-Volume] <CimInstance#MSFT_Volume[]> [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]

Get-ClusterPerformanceHistory [[-NetAdapterSeriesName] <Object>] [[-TimeFrame] <string>] [-NetworkAdapter] <CimInstance#MSFT_NetAdapter[]> [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='ByCluster', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [Parameter(ParameterSetName='Api', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SeriesKeyName},

        [Parameter(ParameterSetName='Api', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Stream},

        [Parameter(ParameterSetName='Api')]
        [switch]
        ${UsePattern},

        [Parameter(ParameterSetName='ByCluster', Position=0)]
        [System.Object]
        ${ClusterSeriesName},

        [Parameter(ParameterSetName='ByClusterNode', Position=0)]
        [System.Object]
        ${ClusterNodeSeriesName},

        [Parameter(ParameterSetName='ByVM', Position=0)]
        [System.Object]
        ${VMSeriesName},

        [Parameter(ParameterSetName='ByVHD', Position=0)]
        [System.Object]
        ${VHDSeriesName},

        [Parameter(ParameterSetName='ByPhysicalDisk', Position=0)]
        [System.Object]
        ${PhysicalDiskSeriesName},

        [Parameter(ParameterSetName='ByVolume', Position=0)]
        [System.Object]
        ${VolumeSeriesName},

        [Parameter(ParameterSetName='ByNetAdapter', Position=0)]
        [System.Object]
        ${NetAdapterSeriesName},

        [Parameter(ParameterSetName='ByNetAdapter', Position=1)]
        [Parameter(ParameterSetName='ByVolume', Position=1)]
        [Parameter(ParameterSetName='ByPhysicalDisk', Position=1)]
        [Parameter(ParameterSetName='ByVHD', Position=1)]
        [Parameter(ParameterSetName='ByVM', Position=1)]
        [Parameter(ParameterSetName='ByClusterNode', Position=1)]
        [Parameter(ParameterSetName='ByCluster', Position=1)]
        [ValidateNotNullOrEmpty()]
        [ValidateSet('MostRecent','LastHour','LastDay','LastWeek','LastMonth','LastYear')]
        [string]
        ${TimeFrame},

        [Parameter(ParameterSetName='ByCluster', Position=2, ValueFromPipeline=$true)]
        [Microsoft.FailoverClusters.PowerShell.Cluster]
        ${Cluster},

        [Parameter(ParameterSetName='ByClusterNode', Mandatory=$true, Position=2, ValueFromPipeline=$true)]
        [Microsoft.FailoverClusters.PowerShell.ClusterNode[]]
        ${ClusterNode},

        [Parameter(ParameterSetName='ByVM', Mandatory=$true, Position=2, ValueFromPipeline=$true)]
        [PSTypeName('Microsoft.HyperV.PowerShell.VirtualMachine')]
        [psobject[]]
        ${VM},

        [Parameter(ParameterSetName='ByVHD', Mandatory=$true, Position=2, ValueFromPipeline=$true)]
        [PSTypeName('Microsoft.Vhd.PowerShell.VirtualHardDisk')]
        [psobject[]]
        ${VHD},

        [Parameter(ParameterSetName='ByPhysicalDisk', Mandatory=$true, Position=2, ValueFromPipeline=$true)]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#root/microsoft/windows/storage/MSFT_PhysicalDisk')]
        [ciminstance[]]
        ${PhysicalDisk},

        [Parameter(ParameterSetName='ByVolume', Mandatory=$true, Position=2, ValueFromPipeline=$true)]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#root/microsoft/windows/storage/MSFT_Volume')]
        [ciminstance[]]
        ${Volume},

        [Parameter(ParameterSetName='ByNetAdapter', Mandatory=$true, Position=2, ValueFromPipeline=$true)]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/StandardCimv2/MSFT_NetAdapter')]
        [ciminstance[]]
        ${NetworkAdapter},

        [CimSession]
        ${CimSession}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterS2D {
    <#
    .SYNOPSIS
        Get-ClusterStorageSpacesDirect [-Node <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false, HelpUri='https://go.microsoft.com/fwlink/?LinkId=691107')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCluster/MSCluster_StorageSpacesDirect')]
    param (
        [Parameter(ParameterSetName='DefaultParameterSet')]
        [string]
        ${Node},

        [Parameter(ParameterSetName='DefaultParameterSet')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='DefaultParameterSet')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='DefaultParameterSet')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-VMFromCluster {
    <#
    .SYNOPSIS
        Remove-ClusterGroup [[-Name] <StringCollection>] [-VMId <guid>] [-Force] [-RemoveResources] [-Reason <string>] [-InputObject <psobject>] [-Cluster <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216234')]
    param (
        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [guid]
        ${VMId},

        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [switch]
        ${Force},

        [switch]
        ${RemoveResources},

        [string]
        ${Reason},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Repair-ClusterS2D {
    <#
    .SYNOPSIS
        Repair-ClusterStorageSpacesDirect [-DisableStorageMaintenanceMode] [-RecoverUnboundDrives] [-Node <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Repair-ClusterStorageSpacesDirect [-DisableStorageMaintenanceMode] [-Node <string>] [-SkipDiskRecovery] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='DefaultParameterSet', SupportsShouldProcess=$true, ConfirmImpact='High', PositionalBinding=$false)]
    param (
        [Parameter(ParameterSetName='SkipDiskRecoverySet')]
        [Parameter(ParameterSetName='DefaultParameterSet')]
        [switch]
        ${DisableStorageMaintenanceMode},

        [Parameter(ParameterSetName='DefaultParameterSet')]
        [switch]
        ${RecoverUnboundDrives},

        [Parameter(ParameterSetName='SkipDiskRecoverySet')]
        [Parameter(ParameterSetName='DefaultParameterSet')]
        [string]
        ${Node},

        [Parameter(ParameterSetName='SkipDiskRecoverySet')]
        [switch]
        ${SkipDiskRecovery},

        [Parameter(ParameterSetName='SkipDiskRecoverySet')]
        [Parameter(ParameterSetName='DefaultParameterSet')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='SkipDiskRecoverySet')]
        [Parameter(ParameterSetName='DefaultParameterSet')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='SkipDiskRecoverySet')]
        [Parameter(ParameterSetName='DefaultParameterSet')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-ClusterS2D {
    <#
    .SYNOPSIS
        Set-ClusterStorageSpacesDirect [-CacheState <CacheStateType>] [-CacheModeHDD <CacheModeType>] [-CacheModeSSD <CacheModeType>] [-Nodes <string[]>] [-ScmUse <ScmUse>] [-SkipEligibilityChecks] [-SedProtectionState <SedProtectionStateType>] [-UseSedExclusively <bool>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false, HelpUri='https://go.microsoft.com/fwlink/?LinkId=691106')]
    param (
        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_StorageSpacesDirect.CacheStateType]
        ${CacheState},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_StorageSpacesDirect.CacheModeType]
        ${CacheModeHDD},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_StorageSpacesDirect.CacheModeType]
        ${CacheModeSSD},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [string[]]
        ${Nodes},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_StorageSpacesDirect.ScmUse]
        ${ScmUse},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [switch]
        ${SkipEligibilityChecks},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_StorageSpacesDirect.SedProtectionStateType]
        ${SedProtectionState},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [bool]
        ${UseSedExclusively},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-ClusterS2DDisk {
    <#
    .SYNOPSIS
        Set-ClusterStorageSpacesDirectDisk -PhysicalDiskGuid <string[]> [-CanBeClaimed <bool>] [-Reset] [-CacheUsage <S2DDiskUsage>] [-CimSession <CimSession>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Set-ClusterStorageSpacesDirectDisk -PhysicalDisk <CimInstance#MSFT_PhysicalDisk[]> [-CanBeClaimed <bool>] [-Reset] [-CacheUsage <S2DDiskUsage>] [-CimSession <CimSession>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='ByPhysicalDiskGuid', SupportsShouldProcess=$true, ConfirmImpact='High')]
    param (
        [Parameter(ParameterSetName='ByPhysicalDiskGuid', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${PhysicalDiskGuid},

        [Parameter(ParameterSetName='ByPhysicalDisk', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_PhysicalDisk')]
        [ciminstance[]]
        ${PhysicalDisk},

        [Parameter(ParameterSetName='ByPhysicalDisk')]
        [Parameter(ParameterSetName='ByPhysicalDiskGuid')]
        [bool]
        ${CanBeClaimed},

        [Parameter(ParameterSetName='ByPhysicalDisk')]
        [Parameter(ParameterSetName='ByPhysicalDiskGuid')]
        [switch]
        ${Reset},

        [Parameter(ParameterSetName='ByPhysicalDisk')]
        [Parameter(ParameterSetName='ByPhysicalDiskGuid')]
        [hasthable]
        ${CacheUsage},

        [CimSession]
        ${CimSession},

        [int]
        ${ThrottleLimit},

        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Start-ClusterPerf {
    <#
    .SYNOPSIS
        Start-ClusterPerformanceHistory [[-CimSession] <CimSession>] [<CommonParameters>]
    #>

    [CmdletBinding()]
    param (
        [Parameter(Position=0)]
        [CimSession]
        ${CimSession}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Stop-ClusterPerf {
    <#
    .SYNOPSIS
        Stop-ClusterPerformanceHistory [[-CimSession] <CimSession>] [-DeleteHistory] [<CommonParameters>]
    #>

    [CmdletBinding()]
    param (
        [switch]
        ${DeleteHistory},

        [Parameter(Position=0)]
        [CimSession]
        ${CimSession}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterGroupSetDependency {
    <#
    .SYNOPSIS
        Add-ClusterGroupSetDependency [[-Name] <string[]>] [-Provider] <string> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]

Add-ClusterGroupSetDependency [-Provider] <string> -InputObject <CimInstance#MSCluster_GroupSet[]> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_GroupSet')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_GroupSet')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='Query (cdxml)', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string]
        ${Provider},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterGroupToAffinityRule {
    <#
    .SYNOPSIS
        Add-ClusterGroupToAffinityRule [[-Name] <string[]>] [-Groups] <string[]> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]

Add-ClusterGroupToAffinityRule [-Groups] <string[]> -InputObject <CimInstance#MSCluster_AffinityRule[]> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_AffinityRule')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_AffinityRule')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='Query (cdxml)', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${Groups},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterGroupToSet {
    <#
    .SYNOPSIS
        Add-ClusterGroupToSet [[-Name] <string[]>] [-Group] <string> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]

Add-ClusterGroupToSet [-Group] <string> -InputObject <CimInstance#MSCluster_GroupSet[]> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_GroupSet')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_GroupSet')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='Query (cdxml)', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string]
        ${Group},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterScaleoutZone {
    <#
    .SYNOPSIS
        Add-ClusterScaleoutZone -VolumeName <string> -ZoneId <string> -ZoneSize <long> [-GroupId <string>] [-TargetPath <string>] [-WhatIf] [-Confirm] [<CommonParameters>]

Add-ClusterScaleoutZone -Vol <Object> -ZoneId <string> -ZoneSize <long> [-GroupId <string>] [-TargetPath <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='High')]
    param (
        [Parameter(ParameterSetName='WithVolId', Mandatory=$true, HelpMessage='Supply a valid Scaleout Volume GUID')]
        [string]
        ${VolumeName},

        [Parameter(ParameterSetName='WithVolObj', Mandatory=$true, HelpMessage='Supply a valid Scaleout Volume Object')]
        [System.Object]
        ${Vol},

        [Parameter(Mandatory=$true, HelpMessage='Supply a valid data zone GUID')]
        [string]
        ${ZoneId},

        [Parameter(HelpMessage='Supply a group ID')]
        [string]
        ${GroupId},

        [Parameter(Mandatory=$true, HelpMessage='The size of the zone to be added in bytes')]
        [long]
        ${ZoneSize},

        [Parameter(HelpMessage='Supply a zone target path')]
        [string]
        ${TargetPath}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterSharedVolumeToAffinityRule {
    <#
    .SYNOPSIS
        Add-ClusterSharedVolumeToAffinityRule [[-Name] <string[]>] [-ClusterSharedVolumes] <string[]> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]

Add-ClusterSharedVolumeToAffinityRule [-ClusterSharedVolumes] <string[]> -InputObject <CimInstance#MSCluster_AffinityRule[]> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_AffinityRule')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_AffinityRule')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='Query (cdxml)', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${ClusterSharedVolumes},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterStorageNode {
    <#
    .SYNOPSIS
        Add-ClusterStorageNode -Name <string> [-Description <string>] [-Location <string>] [-Flags <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCluster/MSCluster_StorageNode')]
    param (
        [Parameter(ParameterSetName='AddStorageNode0', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='AddStorageNode0')]
        [string]
        ${Description},

        [Parameter(ParameterSetName='AddStorageNode0')]
        [string]
        ${Location},

        [Parameter(ParameterSetName='AddStorageNode0')]
        [uint32]
        ${Flags},

        [Parameter(ParameterSetName='AddStorageNode0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='AddStorageNode0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='AddStorageNode0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Disable-ClusterScaleoutZone {
    <#
    .SYNOPSIS
        Disable-ClusterScaleoutZone -VolumeName <string> -ZoneId <string> [-WhatIf] [-Confirm] [<CommonParameters>]

Disable-ClusterScaleoutZone -Vol <Object> -ZoneId <string> [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='High')]
    param (
        [Parameter(ParameterSetName='WithVolId', Mandatory=$true, HelpMessage='Supply a valid Scaleout Volume GUID')]
        [string]
        ${VolumeName},

        [Parameter(ParameterSetName='WithVolObj', Mandatory=$true, HelpMessage='Supply a valid Scaleout Volume Object')]
        [System.Object]
        ${Vol},

        [Parameter(Mandatory=$true, HelpMessage='Supply a valid existing data zone GUID')]
        [string]
        ${ZoneId}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Disable-ClusterStorageSpacesDirect {
    <#
    .SYNOPSIS
        Disable-ClusterStorageSpacesDirect [-CleanupCache <bool>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='High', PositionalBinding=$false, HelpUri='https://go.microsoft.com/fwlink/?LinkId=615933')]
    param (
        [Parameter(ParameterSetName='DefaultParameterSet')]
        [bool]
        ${CleanupCache},

        [Parameter(ParameterSetName='DefaultParameterSet')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='DefaultParameterSet')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='DefaultParameterSet')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Enable-ClusterStorageSpacesDirect {
    <#
    .SYNOPSIS
        Enable-ClusterStorageSpacesDirect [-PoolFriendlyName <string>] [-Autoconfig <bool>] [-CacheState <CacheStateType>] [-CacheMetadataReserveBytes <uint64>] [-CachePageSizeKBytes <uint32>] [-SkipEligibilityChecks] [-CollectPerformanceHistory <bool>] [-BusTypesToUse <S2DBusType[]>] [-SedProtectionState <SedProtectionStateType>] [-UseSedExclusively <bool>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Enable-ClusterStorageSpacesDirect -XML <string> [-PoolFriendlyName <string>] [-Autoconfig <bool>] [-CacheState <CacheStateType>] [-CacheMetadataReserveBytes <uint64>] [-CachePageSizeKBytes <uint32>] [-SkipEligibilityChecks] [-CollectPerformanceHistory <bool>] [-BusTypesToUse <S2DBusType[]>] [-SedProtectionState <SedProtectionStateType>] [-UseSedExclusively <bool>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Enable-ClusterStorageSpacesDirect -CacheDeviceModel <string[]> [-PoolFriendlyName <string>] [-Autoconfig <bool>] [-CacheState <CacheStateType>] [-CacheMetadataReserveBytes <uint64>] [-CachePageSizeKBytes <uint32>] [-SkipEligibilityChecks] [-CollectPerformanceHistory <bool>] [-BusTypesToUse <S2DBusType[]>] [-SedProtectionState <SedProtectionStateType>] [-UseSedExclusively <bool>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='High', PositionalBinding=$false, HelpUri='https://go.microsoft.com/fwlink/?LinkId=615932')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCluster/MSCluster_StorageSpacesDirectEnable')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCluster/MSCluster_StorageSpacesDirectEnable')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCluster/MSCluster_StorageSpacesDirectEnable')]
    param (
        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${PoolFriendlyName},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [bool]
        ${Autoconfig},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_StorageSpacesDirect.CacheStateType]
        ${CacheState},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [uint64]
        ${CacheMetadataReserveBytes},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [ValidateSet('8','16','32','64')]
        [uint32]
        ${CachePageSizeKBytes},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [switch]
        ${SkipEligibilityChecks},

        [Parameter(ParameterSetName='WithCacheDeviceModel', Mandatory=$true)]
        [string[]]
        ${CacheDeviceModel},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [bool]
        ${CollectPerformanceHistory},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_StorageSpacesDirect.S2DBusType[]]
        ${BusTypesToUse},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_StorageSpacesDirect.SedProtectionStateType]
        ${SedProtectionState},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [bool]
        ${UseSedExclusively},

        [Parameter(ParameterSetName='WithXML', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${XML},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Auto')]
        [Parameter(ParameterSetName='WithXML')]
        [Parameter(ParameterSetName='WithCacheDeviceModel')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Export-HealthAgentConfig {
    <#
    .SYNOPSIS
        Export-HealthAgentConfig [-Type] <string> [-FilePath] <string> [[-CimSession] <CimSession>] [<CommonParameters>]
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=0, HelpMessage='Valid values are: MAConfig, HADefinition')]
        [ValidateSet('MAConfig','HADefinition')]
        [string]
        ${Type},

        [Parameter(Mandatory=$true, Position=1, HelpMessage='Output file path for the configuration file')]
        [string]
        ${FilePath},

        [Parameter(Position=2, HelpMessage='CimSession')]
        [CimSession]
        ${CimSession}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterAffinityRule {
    <#
    .SYNOPSIS
        Get-ClusterAffinityRule [[-Name] <string[]>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_AffinityRule')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterDiagnosticInfo {
    <#
    .SYNOPSIS
        Get-ClusterDiagnosticInfo [[-WriteToPath] <string>] [[-Cluster] <string>] [[-ZipPrefix] <string>] [-HoursOfEvents <int>] [-IncludeEvents] [<CommonParameters>]

Get-ClusterDiagnosticInfo -ReadFromPath <string> [<CommonParameters>]
    #>

    [CmdletBinding()]
    param (
        [Parameter(ParameterSetName='Write', Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${WriteToPath},

        [Parameter(ParameterSetName='Write', Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster},

        [Parameter(ParameterSetName='Write', Position=2)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ZipPrefix},

        [Parameter(ParameterSetName='Write')]
        [ValidateNotNullOrEmpty()]
        [int]
        ${HoursOfEvents},

        [Parameter(ParameterSetName='Write')]
        [ValidateNotNullOrEmpty()]
        [switch]
        ${IncludeEvents},

        [Parameter(ParameterSetName='Read', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ReadFromPath}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterFaultDomain {
    <#
    .SYNOPSIS
        Get-ClusterFaultDomain [[-Name] <string[]>] [-Type <FaultDomainType[]>] [-Id <string[]>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_FaultDomain')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('FaultDomainType')]
        [ValidateNotNull()]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_FaultDomain.FaultDomainType[]]
        ${Type},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [ValidateNotNull()]
        [string[]]
        ${Id},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterFaultDomainXML {
    <#
    .SYNOPSIS
        Get-ClusterFaultDomainXML [-Flags <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([System.String])]
    param (
        [Parameter(ParameterSetName='GetFaultDomainXML2')]
        [uint32]
        ${Flags},

        [Parameter(ParameterSetName='GetFaultDomainXML2')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='GetFaultDomainXML2')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='GetFaultDomainXML2')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterGroupSet {
    <#
    .SYNOPSIS
        Get-ClusterGroupSet [[-Name] <string[]>] [-IsGlobal <bool[]>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_GroupSet')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [ValidateNotNull()]
        [bool[]]
        ${IsGlobal},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterGroupSetDependency {
    <#
    .SYNOPSIS
        Get-ClusterGroupSetDependency [-ContainedGroup <string>] [-Name <string>] [-Provider <string>] [-DependentGroup <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCluster/MSCluster_GroupSet')]
    param (
        [Parameter(ParameterSetName='GetSetFrom3')]
        [string]
        ${ContainedGroup},

        [Parameter(ParameterSetName='GetSetFrom3')]
        [string]
        ${Name},

        [Parameter(ParameterSetName='GetSetFrom3')]
        [string]
        ${Provider},

        [Parameter(ParameterSetName='GetSetFrom3')]
        [string]
        ${DependentGroup},

        [Parameter(ParameterSetName='GetSetFrom3')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='GetSetFrom3')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='GetSetFrom3')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterHCSVM {
    <#
    .SYNOPSIS
        Get-ClusterHCSVM [[-Name] <string[]>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_HCSVM')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterNodeSupportedVersion {
    <#
    .SYNOPSIS
        Get-ClusterNodeSupportedVersion [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance[]])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCluster/MSCluster_NodeSupportedVersion')]
    param (
        [Parameter(ParameterSetName='GetNodeSupportedVersions0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='GetNodeSupportedVersions0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='GetNodeSupportedVersions0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterPerformanceHistory {
    <#
    .SYNOPSIS
        Get-ClusterPerformanceHistory [[-ClusterSeriesName] <Object>] [[-TimeFrame] <string>] [[-Cluster] <Cluster>] [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]

Get-ClusterPerformanceHistory -SeriesKeyName <string> -Stream <string> [-UsePattern] [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]

Get-ClusterPerformanceHistory [[-ClusterNodeSeriesName] <Object>] [[-TimeFrame] <string>] [-ClusterNode] <ClusterNode[]> [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]

Get-ClusterPerformanceHistory [[-VMSeriesName] <Object>] [[-TimeFrame] <string>] [-VM] <VirtualMachine[]> [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]

Get-ClusterPerformanceHistory [[-VHDSeriesName] <Object>] [[-TimeFrame] <string>] [-VHD] <VirtualHardDisk[]> [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]

Get-ClusterPerformanceHistory [[-PhysicalDiskSeriesName] <Object>] [[-TimeFrame] <string>] [-PhysicalDisk] <CimInstance#MSFT_PhysicalDisk[]> [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]

Get-ClusterPerformanceHistory [[-VolumeSeriesName] <Object>] [[-TimeFrame] <string>] [-Volume] <CimInstance#MSFT_Volume[]> [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]

Get-ClusterPerformanceHistory [[-NetAdapterSeriesName] <Object>] [[-TimeFrame] <string>] [-NetworkAdapter] <CimInstance#MSFT_NetAdapter[]> [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='ByCluster', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [Parameter(ParameterSetName='Api', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SeriesKeyName},

        [Parameter(ParameterSetName='Api', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Stream},

        [Parameter(ParameterSetName='Api')]
        [switch]
        ${UsePattern},

        [Parameter(ParameterSetName='ByCluster', Position=0)]
        [System.Object]
        ${ClusterSeriesName},

        [Parameter(ParameterSetName='ByClusterNode', Position=0)]
        [System.Object]
        ${ClusterNodeSeriesName},

        [Parameter(ParameterSetName='ByVM', Position=0)]
        [System.Object]
        ${VMSeriesName},

        [Parameter(ParameterSetName='ByVHD', Position=0)]
        [System.Object]
        ${VHDSeriesName},

        [Parameter(ParameterSetName='ByPhysicalDisk', Position=0)]
        [System.Object]
        ${PhysicalDiskSeriesName},

        [Parameter(ParameterSetName='ByVolume', Position=0)]
        [System.Object]
        ${VolumeSeriesName},

        [Parameter(ParameterSetName='ByNetAdapter', Position=0)]
        [System.Object]
        ${NetAdapterSeriesName},

        [Parameter(ParameterSetName='ByNetAdapter', Position=1)]
        [Parameter(ParameterSetName='ByVolume', Position=1)]
        [Parameter(ParameterSetName='ByPhysicalDisk', Position=1)]
        [Parameter(ParameterSetName='ByVHD', Position=1)]
        [Parameter(ParameterSetName='ByVM', Position=1)]
        [Parameter(ParameterSetName='ByClusterNode', Position=1)]
        [Parameter(ParameterSetName='ByCluster', Position=1)]
        [ValidateNotNullOrEmpty()]
        [ValidateSet('MostRecent','LastHour','LastDay','LastWeek','LastMonth','LastYear')]
        [string]
        ${TimeFrame},

        [Parameter(ParameterSetName='ByCluster', Position=2, ValueFromPipeline=$true)]
        [Microsoft.FailoverClusters.PowerShell.Cluster]
        ${Cluster},

        [Parameter(ParameterSetName='ByClusterNode', Mandatory=$true, Position=2, ValueFromPipeline=$true)]
        [Microsoft.FailoverClusters.PowerShell.ClusterNode[]]
        ${ClusterNode},

        [Parameter(ParameterSetName='ByVM', Mandatory=$true, Position=2, ValueFromPipeline=$true)]
        [PSTypeName('Microsoft.HyperV.PowerShell.VirtualMachine')]
        [psobject[]]
        ${VM},

        [Parameter(ParameterSetName='ByVHD', Mandatory=$true, Position=2, ValueFromPipeline=$true)]
        [PSTypeName('Microsoft.Vhd.PowerShell.VirtualHardDisk')]
        [psobject[]]
        ${VHD},

        [Parameter(ParameterSetName='ByPhysicalDisk', Mandatory=$true, Position=2, ValueFromPipeline=$true)]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#root/microsoft/windows/storage/MSFT_PhysicalDisk')]
        [ciminstance[]]
        ${PhysicalDisk},

        [Parameter(ParameterSetName='ByVolume', Mandatory=$true, Position=2, ValueFromPipeline=$true)]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#root/microsoft/windows/storage/MSFT_Volume')]
        [ciminstance[]]
        ${Volume},

        [Parameter(ParameterSetName='ByNetAdapter', Mandatory=$true, Position=2, ValueFromPipeline=$true)]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/StandardCimv2/MSFT_NetAdapter')]
        [ciminstance[]]
        ${NetworkAdapter},

        [CimSession]
        ${CimSession}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterScaleoutVolume {
    <#
    .SYNOPSIS
        Get-ClusterScaleoutVolume [-VolumeName <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [Parameter(ParameterSetName='WithVolId', HelpMessage='Supply a valid Scaleout Volume GUID')]
        [string]
        ${VolumeName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterScaleoutZone {
    <#
    .SYNOPSIS
        Get-ClusterScaleoutZone -VolumeName <string> -ZoneId <string> [-WhatIf] [-Confirm] [<CommonParameters>]

Get-ClusterScaleoutZone -Vol <Object> -ZoneId <string> [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [Parameter(ParameterSetName='WithVolId', Mandatory=$true, HelpMessage='Supply a valid Scaleout Volume GUID')]
        [string]
        ${VolumeName},

        [Parameter(ParameterSetName='WithVolObj', Mandatory=$true, HelpMessage='Supply a valid Scaleout Volume Object')]
        [System.Object]
        ${Vol},

        [Parameter(Mandatory=$true, HelpMessage='Supply a valid existing data zone GUID')]
        [string]
        ${ZoneId}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterStorageNode {
    <#
    .SYNOPSIS
        Get-ClusterStorageNode [[-Name] <string[]>] [-Id <string[]>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_StorageNode')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Id},

        [Parameter(ParameterSetName='Query (cdxml)', Position=0)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterStorageSpacesDirect {
    <#
    .SYNOPSIS
        Get-ClusterStorageSpacesDirect [-Node <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false, HelpUri='https://go.microsoft.com/fwlink/?LinkId=691107')]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCluster/MSCluster_StorageSpacesDirect')]
    param (
        [Parameter(ParameterSetName='DefaultParameterSet')]
        [string]
        ${Node},

        [Parameter(ParameterSetName='DefaultParameterSet')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='DefaultParameterSet')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='DefaultParameterSet')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-HealthFault {
    <#
    .SYNOPSIS
        Get-HealthFault [[-Cluster] <Cluster>] [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]

Get-HealthFault [-ReportingType] <Object> [-ReportingKey] <Object> [-CimSession <CimSession>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='ByCluster', SupportsShouldProcess=$true, ConfirmImpact='None')]
    param (
        [Parameter(ParameterSetName='ByCluster', Position=0, ValueFromPipeline=$true)]
        [Microsoft.FailoverClusters.PowerShell.Cluster]
        ${Cluster},

        [Parameter(ParameterSetName='ByApi', Mandatory=$true, Position=0)]
        [System.Object]
        ${ReportingType},

        [Parameter(ParameterSetName='ByApi', Mandatory=$true, Position=1)]
        [System.Object]
        ${ReportingKey},

        [CimSession]
        ${CimSession}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Import-HealthAgentConfig {
    <#
    .SYNOPSIS
        Import-HealthAgentConfig [-Type] <string> [-FilePath] <string> [[-CimSession] <CimSession>] [<CommonParameters>]
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=0, HelpMessage='Valid values are: MAConfig, HADefinition')]
        [ValidateSet('MAConfig','HADefinition')]
        [string]
        ${Type},

        [Parameter(Mandatory=$true, Position=1, HelpMessage='Input file path for the configuration file')]
        [string]
        ${FilePath},

        [Parameter(Position=2, HelpMessage='CimSession')]
        [CimSession]
        ${CimSession}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Invoke-HealthCommand {
    <#
    .SYNOPSIS
        Invoke-HealthCommand [-Name] <string> [[-Flags] <uint32>] [[-Parameters] <string[]>] [[-Timeout] <uint32>] [[-CimSession] <CimSession>] [<CommonParameters>]
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(Position=1)]
        [uint32]
        ${Flags},

        [Parameter(Position=2)]
        [string[]]
        ${Parameters},

        [Parameter(Position=3)]
        [uint32]
        ${Timeout},

        [Parameter(Position=4)]
        [CimSession]
        ${CimSession}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function New-ClusterAffinityRule {
    <#
    .SYNOPSIS
        New-ClusterAffinityRule [-Name] <string> [-RuleType <RuleType>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCluster/MSCluster_AffinityRule')]
    param (
        [Parameter(ParameterSetName='CreateAffinityRule0', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='CreateAffinityRule0')]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_AffinityRule.RuleType]
        ${RuleType},

        [Parameter(ParameterSetName='CreateAffinityRule0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='CreateAffinityRule0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='CreateAffinityRule0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function New-ClusterAvailabilitySet {
    <#
    .SYNOPSIS
        New-ClusterAvailabilitySet [-Name] <string> -UpdateDomains <uint32> -FaultDomains <uint32> [-Group <string[]>] [-ReserveSpareNode <bool>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCluster/MSCluster_GroupSet')]
    param (
        [Parameter(ParameterSetName='CreateAvailabilitySet1', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='CreateAvailabilitySet1')]
        [string[]]
        ${Group},

        [Parameter(ParameterSetName='CreateAvailabilitySet1', Mandatory=$true)]
        [uint32]
        ${UpdateDomains},

        [Parameter(ParameterSetName='CreateAvailabilitySet1', Mandatory=$true)]
        [uint32]
        ${FaultDomains},

        [Parameter(ParameterSetName='CreateAvailabilitySet1')]
        [bool]
        ${ReserveSpareNode},

        [Parameter(ParameterSetName='CreateAvailabilitySet1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='CreateAvailabilitySet1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='CreateAvailabilitySet1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function New-ClusterFaultDomain {
    <#
    .SYNOPSIS
        New-ClusterFaultDomain -Name <string> -FaultDomainType <FaultDomainType> [-FaultDomain <string>] [-Description <string>] [-Location <string>] [-Flags <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCluster/MSCluster_FaultDomain')]
    param (
        [Parameter(ParameterSetName='CreateFaultDomain0', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='CreateFaultDomain0')]
        [Alias('Parent')]
        [string]
        ${FaultDomain},

        [Parameter(ParameterSetName='CreateFaultDomain0', Mandatory=$true)]
        [Alias('Type')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_FaultDomain.FaultDomainType]
        ${FaultDomainType},

        [Parameter(ParameterSetName='CreateFaultDomain0')]
        [string]
        ${Description},

        [Parameter(ParameterSetName='CreateFaultDomain0')]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string]
        ${Location},

        [Parameter(ParameterSetName='CreateFaultDomain0')]
        [uint32]
        ${Flags},

        [Parameter(ParameterSetName='CreateFaultDomain0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='CreateFaultDomain0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='CreateFaultDomain0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function New-ClusterGroupSet {
    <#
    .SYNOPSIS
        New-ClusterGroupSet [-Name] <string> [-Group <string[]>] [-Providers <string[]>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCluster/MSCluster_GroupSet')]
    param (
        [Parameter(ParameterSetName='CreateSet0', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='CreateSet0')]
        [string[]]
        ${Group},

        [Parameter(ParameterSetName='CreateSet0')]
        [string[]]
        ${Providers},

        [Parameter(ParameterSetName='CreateSet0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='CreateSet0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='CreateSet0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function New-ClusterHCSVM {
    <#
    .SYNOPSIS
        New-ClusterHCSVM [-Name] <string> [-SwitchName <string>] [-ExtendedVmConfiguration <string>] [-MemorySizeInMb <uint32>] [-CpuCount <uint32>] [-VhdPath <string>] [-VmName <string>] [-OfflineAction <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCluster/MSCluster_HCSVM')]
    param (
        [Parameter(ParameterSetName='NewClusterHCSVM0', Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='NewClusterHCSVM0')]
        [string]
        ${SwitchName},

        [Parameter(ParameterSetName='NewClusterHCSVM0')]
        [string]
        ${ExtendedVmConfiguration},

        [Parameter(ParameterSetName='NewClusterHCSVM0')]
        [uint32]
        ${MemorySizeInMb},

        [Parameter(ParameterSetName='NewClusterHCSVM0')]
        [uint32]
        ${CpuCount},

        [Parameter(ParameterSetName='NewClusterHCSVM0')]
        [string]
        ${VhdPath},

        [Parameter(ParameterSetName='NewClusterHCSVM0')]
        [string]
        ${VmName},

        [Parameter(ParameterSetName='NewClusterHCSVM0')]
        [uint32]
        ${OfflineAction},

        [Parameter(ParameterSetName='NewClusterHCSVM0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='NewClusterHCSVM0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='NewClusterHCSVM0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function New-ClusterScaleoutVolume {
    <#
    .SYNOPSIS
        New-ClusterScaleoutVolume -VolumeName <string> [-GroupId <string>] [-FriendlyName <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [Parameter(ParameterSetName='WithVolId', Mandatory=$true, HelpMessage='Supply a valid volume GUID')]
        [string]
        ${VolumeName},

        [Parameter(HelpMessage='Supply a group ID')]
        [string]
        ${GroupId},

        [Parameter(HelpMessage='Supply a group ID')]
        [string]
        ${FriendlyName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterAffinityRule {
    <#
    .SYNOPSIS
        Remove-ClusterAffinityRule [[-Name] <string[]>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-ClusterAffinityRule -InputObject <CimInstance#MSCluster_AffinityRule[]> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', SupportsShouldProcess=$true, ConfirmImpact='High', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_AffinityRule')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_AffinityRule')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterFaultDomain {
    <#
    .SYNOPSIS
        Remove-ClusterFaultDomain [[-Name] <string[]>] [-Id <string[]>] [-Flags <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-ClusterFaultDomain -InputObject <CimInstance#MSCluster_FaultDomain[]> [-Flags <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', SupportsShouldProcess=$true, ConfirmImpact='High', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_FaultDomain')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [ValidateNotNull()]
        [string[]]
        ${Id},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_FaultDomain')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [uint32]
        ${Flags},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterGroupFromAffinityRule {
    <#
    .SYNOPSIS
        Remove-ClusterGroupFromAffinityRule [[-Name] <string[]>] [-Groups] <string[]> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]

Remove-ClusterGroupFromAffinityRule [-Groups] <string[]> -InputObject <CimInstance#MSCluster_AffinityRule[]> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_AffinityRule')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [Alias('Set')]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_AffinityRule')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='Query (cdxml)', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${Groups},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterGroupFromSet {
    <#
    .SYNOPSIS
        Remove-ClusterGroupFromSet [[-Name] <string[]>] [-Group] <string> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]

Remove-ClusterGroupFromSet [-Group] <string> -InputObject <CimInstance#MSCluster_GroupSet[]> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_GroupSet')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [Alias('Set')]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_GroupSet')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='Query (cdxml)', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string]
        ${Group},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterGroupSet {
    <#
    .SYNOPSIS
        Remove-ClusterGroupSet [[-Name] <string[]>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-ClusterGroupSet -InputObject <CimInstance#MSCluster_GroupSet[]> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', SupportsShouldProcess=$true, ConfirmImpact='High', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_GroupSet')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_GroupSet')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterGroupSetDependency {
    <#
    .SYNOPSIS
        Remove-ClusterGroupSetDependency [[-Name] <string[]>] [-Provider] <string> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]

Remove-ClusterGroupSetDependency [-Provider] <string> -InputObject <CimInstance#MSCluster_GroupSet[]> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_GroupSet')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_GroupSet')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='Query (cdxml)', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string]
        ${Provider},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterHCSVM {
    <#
    .SYNOPSIS
        Remove-ClusterHCSVM [[-Name] <string[]>] [-Force <bool>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-ClusterHCSVM -InputObject <CimInstance#MSCluster_HCSVM[]> [-Force <bool>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', SupportsShouldProcess=$true, ConfirmImpact='High', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_HCSVM')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_HCSVM')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [bool]
        ${Force},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterScaleoutVolume {
    <#
    .SYNOPSIS
        Remove-ClusterScaleoutVolume -VolumeName <string> [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='High')]
    param (
        [Parameter(ParameterSetName='WithVolId', Mandatory=$true, HelpMessage='Supply a valid volume GUID')]
        [string]
        ${VolumeName}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterScaleoutZone {
    <#
    .SYNOPSIS
        Remove-ClusterScaleoutZone -VolumeName <string> -ZoneId <string> [-Force <bool>] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-ClusterScaleoutZone -Vol <Object> -ZoneId <string> [-Force <bool>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='High')]
    param (
        [Parameter(ParameterSetName='WithVolId', Mandatory=$true, HelpMessage='Supply a valid Scaleout Volume GUID')]
        [string]
        ${VolumeName},

        [Parameter(ParameterSetName='WithVolObj', Mandatory=$true, HelpMessage='Supply a valid Scaleout Volume Object')]
        [System.Object]
        ${Vol},

        [Parameter(Mandatory=$true, HelpMessage='Supply a valid existing data zone GUID')]
        [string]
        ${ZoneId},

        [Parameter(HelpMessage='Force removal')]
        [bool]
        ${Force}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterSharedVolumeFromAffinityRule {
    <#
    .SYNOPSIS
        Remove-ClusterSharedVolumeFromAffinityRule [[-Name] <string[]>] [-ClusterSharedVolumes] <string[]> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]

Remove-ClusterSharedVolumeFromAffinityRule [-ClusterSharedVolumes] <string[]> -InputObject <CimInstance#MSCluster_AffinityRule[]> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_AffinityRule')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [Alias('Set')]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_AffinityRule')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, Position=1)]
        [Parameter(ParameterSetName='Query (cdxml)', Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string[]]
        ${ClusterSharedVolumes},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterStorageNode {
    <#
    .SYNOPSIS
        Remove-ClusterStorageNode [[-Name] <string[]>] [-Id <string[]>] [-Flags <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]

Remove-ClusterStorageNode -InputObject <CimInstance#MSCluster_StorageNode[]> [-Flags <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', SupportsShouldProcess=$true, ConfirmImpact='High', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_StorageNode')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Id},

        [Parameter(ParameterSetName='Query (cdxml)', Position=0)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_StorageNode')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [uint32]
        ${Flags},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Repair-ClusterStorageSpacesDirect {
    <#
    .SYNOPSIS
        Repair-ClusterStorageSpacesDirect [-DisableStorageMaintenanceMode] [-RecoverUnboundDrives] [-Node <string>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Repair-ClusterStorageSpacesDirect [-DisableStorageMaintenanceMode] [-Node <string>] [-SkipDiskRecovery] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='DefaultParameterSet', SupportsShouldProcess=$true, ConfirmImpact='High', PositionalBinding=$false)]
    param (
        [Parameter(ParameterSetName='SkipDiskRecoverySet')]
        [Parameter(ParameterSetName='DefaultParameterSet')]
        [switch]
        ${DisableStorageMaintenanceMode},

        [Parameter(ParameterSetName='DefaultParameterSet')]
        [switch]
        ${RecoverUnboundDrives},

        [Parameter(ParameterSetName='SkipDiskRecoverySet')]
        [Parameter(ParameterSetName='DefaultParameterSet')]
        [string]
        ${Node},

        [Parameter(ParameterSetName='SkipDiskRecoverySet')]
        [switch]
        ${SkipDiskRecovery},

        [Parameter(ParameterSetName='SkipDiskRecoverySet')]
        [Parameter(ParameterSetName='DefaultParameterSet')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='SkipDiskRecoverySet')]
        [Parameter(ParameterSetName='DefaultParameterSet')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='SkipDiskRecoverySet')]
        [Parameter(ParameterSetName='DefaultParameterSet')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-ClusterAffinityRule {
    <#
    .SYNOPSIS
        Set-ClusterAffinityRule [[-Name] <string[]>] [-RuleType <RuleType>] [-Enabled <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]

Set-ClusterAffinityRule -InputObject <CimInstance#MSCluster_AffinityRule[]> [-RuleType <RuleType>] [-Enabled <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_AffinityRule')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_AffinityRule')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_AffinityRule.RuleType]
        ${RuleType},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [uint32]
        ${Enabled},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-ClusterFaultDomain {
    <#
    .SYNOPSIS
        Set-ClusterFaultDomain [[-Name] <string[]>] [-Id <string[]>] [-NewName <string>] [-Location <string>] [-Description <string>] [-FaultDomain <string>] [-Flags <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]

Set-ClusterFaultDomain -InputObject <CimInstance#MSCluster_FaultDomain[]> [-NewName <string>] [-Location <string>] [-Description <string>] [-FaultDomain <string>] [-Flags <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_FaultDomain')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [ValidateNotNull()]
        [string[]]
        ${Id},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_FaultDomain')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [string]
        ${NewName},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [string]
        ${Location},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [string]
        ${Description},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Parent')]
        [string]
        ${FaultDomain},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [uint32]
        ${Flags},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-ClusterFaultDomainXML {
    <#
    .SYNOPSIS
        Set-ClusterFaultDomainXML [-XML] <string> [-Flags <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false)]
    param (
        [Parameter(ParameterSetName='SetFaultDomainXML1', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateNotNull()]
        [string]
        ${XML},

        [Parameter(ParameterSetName='SetFaultDomainXML1')]
        [uint32]
        ${Flags},

        [Parameter(ParameterSetName='SetFaultDomainXML1')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='SetFaultDomainXML1')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='SetFaultDomainXML1')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-ClusterGroupSet {
    <#
    .SYNOPSIS
        Set-ClusterGroupSet [[-Name] <string[]>] [-StartupDelayTrigger <StartupSettingType>] [-StartupCount <uint32>] [-IsGlobal <bool>] [-StartupDelay <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]

Set-ClusterGroupSet -InputObject <CimInstance#MSCluster_GroupSet[]> [-StartupDelayTrigger <StartupSettingType>] [-StartupCount <uint32>] [-IsGlobal <bool>] [-StartupDelay <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_GroupSet')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_GroupSet')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_GroupSet.StartupSettingType]
        ${StartupDelayTrigger},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Count')]
        [uint32]
        ${StartupCount},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [bool]
        ${IsGlobal},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Delay')]
        [uint32]
        ${StartupDelay},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-ClusterHCSVM {
    <#
    .SYNOPSIS
        Set-ClusterHCSVM [[-Name] <string[]>] [-NewName <string>] [-ExtendedVmConfiguration <string>] [-OfflineAction <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]

Set-ClusterHCSVM -InputObject <CimInstance#MSCluster_HCSVM[]> [-NewName <string>] [-ExtendedVmConfiguration <string>] [-OfflineAction <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_HCSVM')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_HCSVM')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [string]
        ${NewName},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [string]
        ${ExtendedVmConfiguration},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [uint32]
        ${OfflineAction},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-ClusterScaleoutVolumeZoneTargetPath {
    <#
    .SYNOPSIS
        Set-ClusterScaleoutVolumeZoneTargetPath -VolumeName <string> -ZoneId <string> -ZoneTarget <string> [-WhatIf] [-Confirm] [<CommonParameters>]

Set-ClusterScaleoutVolumeZoneTargetPath -Vol <Object> -ZoneId <string> -ZoneTarget <string> [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [Parameter(ParameterSetName='WithVolId', Mandatory=$true, HelpMessage='Supply a valid Scaleout Volume GUID')]
        [string]
        ${VolumeName},

        [Parameter(ParameterSetName='WithVolObj', Mandatory=$true, HelpMessage='Supply a valid Scaleout Volume Object')]
        [System.Object]
        ${Vol},

        [Parameter(Mandatory=$true, HelpMessage='Supply a valid existing data zone GUID')]
        [string]
        ${ZoneId},

        [Parameter(Mandatory=$true, HelpMessage='Supply a target zone')]
        [string]
        ${ZoneTarget}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-ClusterScaleoutZoneGroupId {
    <#
    .SYNOPSIS
        Set-ClusterScaleoutZoneGroupId -VolumeName <string> -ZoneId <string> -GroupId <string> [-WhatIf] [-Confirm] [<CommonParameters>]

Set-ClusterScaleoutZoneGroupId -Vol <Object> -ZoneId <string> -GroupId <string> [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [Parameter(ParameterSetName='WithVolId', Mandatory=$true, HelpMessage='Supply a valid Scaleout Volume GUID')]
        [string]
        ${VolumeName},

        [Parameter(ParameterSetName='WithVolObj', Mandatory=$true, HelpMessage='Supply a valid Scaleout Volume Object')]
        [System.Object]
        ${Vol},

        [Parameter(Mandatory=$true, HelpMessage='Supply a valid existing data zone GUID')]
        [string]
        ${ZoneId},

        [Parameter(Mandatory=$true, HelpMessage='Supply a new group ID')]
        [string]
        ${GroupId}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-ClusterStorageNode {
    <#
    .SYNOPSIS
        Set-ClusterStorageNode [[-Name] <string[]>] [-Id <string[]>] [-NewName <string>] [-Description <string>] [-Location <string>] [-Flags <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]

Set-ClusterStorageNode -InputObject <CimInstance#MSCluster_StorageNode[]> [-NewName <string>] [-Description <string>] [-Location <string>] [-Flags <uint32>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_StorageNode')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='Query (cdxml)')]
        [ValidateNotNull()]
        [string[]]
        ${Id},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_StorageNode')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [string]
        ${NewName},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [string]
        ${Description},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [string]
        ${Location},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [uint32]
        ${Flags},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-ClusterStorageSpacesDirect {
    <#
    .SYNOPSIS
        Set-ClusterStorageSpacesDirect [-CacheState <CacheStateType>] [-CacheModeHDD <CacheModeType>] [-CacheModeSSD <CacheModeType>] [-Nodes <string[]>] [-ScmUse <ScmUse>] [-SkipEligibilityChecks] [-SedProtectionState <SedProtectionStateType>] [-UseSedExclusively <bool>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [<CommonParameters>]
    #>

    [CmdletBinding(PositionalBinding=$false, HelpUri='https://go.microsoft.com/fwlink/?LinkId=691106')]
    param (
        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_StorageSpacesDirect.CacheStateType]
        ${CacheState},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_StorageSpacesDirect.CacheModeType]
        ${CacheModeHDD},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_StorageSpacesDirect.CacheModeType]
        ${CacheModeSSD},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [string[]]
        ${Nodes},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_StorageSpacesDirect.ScmUse]
        ${ScmUse},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [switch]
        ${SkipEligibilityChecks},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MSCLUSTER.MSCluster_StorageSpacesDirect.SedProtectionStateType]
        ${SedProtectionState},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [bool]
        ${UseSedExclusively},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='SetStorageSpacesDirect0')]
        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-ClusterStorageSpacesDirectDisk {
    <#
    .SYNOPSIS
        Set-ClusterStorageSpacesDirectDisk -PhysicalDiskGuid <string[]> [-CanBeClaimed <bool>] [-Reset] [-CacheUsage <S2DDiskUsage>] [-CimSession <CimSession>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]

Set-ClusterStorageSpacesDirectDisk -PhysicalDisk <CimInstance#MSFT_PhysicalDisk[]> [-CanBeClaimed <bool>] [-Reset] [-CacheUsage <S2DDiskUsage>] [-CimSession <CimSession>] [-ThrottleLimit <int>] [-AsJob] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='ByPhysicalDiskGuid', SupportsShouldProcess=$true, ConfirmImpact='High')]
    param (
        [Parameter(ParameterSetName='ByPhysicalDiskGuid', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${PhysicalDiskGuid},

        [Parameter(ParameterSetName='ByPhysicalDisk', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_PhysicalDisk')]
        [ciminstance[]]
        ${PhysicalDisk},

        [Parameter(ParameterSetName='ByPhysicalDisk')]
        [Parameter(ParameterSetName='ByPhysicalDiskGuid')]
        [bool]
        ${CanBeClaimed},

        [Parameter(ParameterSetName='ByPhysicalDisk')]
        [Parameter(ParameterSetName='ByPhysicalDiskGuid')]
        [switch]
        ${Reset},

        [Parameter(ParameterSetName='ByPhysicalDisk')]
        [Parameter(ParameterSetName='ByPhysicalDiskGuid')]
        [hasthable]
        ${CacheUsage},

        [CimSession]
        ${CimSession},

        [int]
        ${ThrottleLimit},

        [switch]
        ${AsJob}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Start-ClusterHCSVM {
    <#
    .SYNOPSIS
        Start-ClusterHCSVM [[-Name] <string[]>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]

Start-ClusterHCSVM -InputObject <CimInstance#MSCluster_HCSVM[]> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_HCSVM')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_HCSVM')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Start-ClusterPerformanceHistory {
    <#
    .SYNOPSIS
        Start-ClusterPerformanceHistory [[-CimSession] <CimSession>] [<CommonParameters>]
    #>

    [CmdletBinding()]
    param (
        [Parameter(Position=0)]
        [CimSession]
        ${CimSession}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Stop-ClusterHCSVM {
    <#
    .SYNOPSIS
        Stop-ClusterHCSVM [[-Name] <string[]>] [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]

Stop-ClusterHCSVM -InputObject <CimInstance#MSCluster_HCSVM[]> [-CimSession <CimSession[]>] [-ThrottleLimit <int>] [-AsJob] [-PassThru] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Query (cdxml)', PositionalBinding=$false)]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    [OutputType('Microsoft.Management.Infrastructure.CimInstance#root/MSCLUSTER/MSCluster_HCSVM')]
    param (
        [Parameter(ParameterSetName='Query (cdxml)', Position=0, ValueFromPipelineByPropertyName=$true)]
        [ValidateNotNull()]
        [string[]]
        ${Name},

        [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSCluster_HCSVM')]
        [ciminstance[]]
        ${InputObject},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [Alias('Session')]
        [ValidateNotNullOrEmpty()]
        [CimSession[]]
        ${CimSession},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [int]
        ${ThrottleLimit},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${AsJob},

        [Parameter(ParameterSetName='InputObject (cdxml)')]
        [Parameter(ParameterSetName='Query (cdxml)')]
        [switch]
        ${PassThru}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Stop-ClusterPerformanceHistory {
    <#
    .SYNOPSIS
        Stop-ClusterPerformanceHistory [[-CimSession] <CimSession>] [-DeleteHistory] [<CommonParameters>]
    #>

    [CmdletBinding()]
    param (
        [switch]
        ${DeleteHistory},

        [Parameter(Position=0)]
        [CimSession]
        ${CimSession}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Suspend-ClusterScaleoutZone {
    <#
    .SYNOPSIS
        Suspend-ClusterScaleoutZone -VolumeName <string> -ZoneId <string> [-WhatIf] [-Confirm] [<CommonParameters>]

Suspend-ClusterScaleoutZone -Vol <Object> -ZoneId <string> [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
    param (
        [Parameter(ParameterSetName='WithVolId', Mandatory=$true, HelpMessage='Supply a valid Scaleout Volume GUID')]
        [string]
        ${VolumeName},

        [Parameter(ParameterSetName='WithVolObj', Mandatory=$true, HelpMessage='Supply a valid Scaleout Volume Object')]
        [System.Object]
        ${Vol},

        [Parameter(Mandatory=$true, HelpMessage='Supply a valid existing data zone GUID')]
        [string]
        ${ZoneId}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterCheckpoint {
    <#
    .SYNOPSIS
        Add-ClusterCheckpoint [[-ResourceName] <string>] [-CryptoCheckpointName <string>] [-CryptoCheckpointType <string>] [-CryptoCheckpointKey <string>] [-RegistryCheckpoint <string>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216179')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterRegistryCheckpoint])]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterCryptoCheckpoint])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ResourceName},

        [Parameter(HelpMessage='Name of crypto checkpoint to add.')]
        [string]
        ${CryptoCheckpointName},

        [Parameter(HelpMessage='Type of crypto checkpoint to add.')]
        [string]
        ${CryptoCheckpointType},

        [Parameter(HelpMessage='Key of crypto checkpoint to add.')]
        [string]
        ${CryptoCheckpointKey},

        [Parameter(HelpMessage='Name of registry checkpoint to add.')]
        [string]
        ${RegistryCheckpoint},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterDisk {
    <#
    .SYNOPSIS
        Add-ClusterDisk [-InputObject] <psobject[]> [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(HelpUri='https://go.microsoft.com/fwlink/?LinkId=216180')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResource])]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject[]]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterFileServerRole {
    <#
    .SYNOPSIS
        Add-ClusterFileServerRole [[-Name] <string>] -Storage <StringCollection> [-StaticAddress <StringCollection>] [-IgnoreNetwork <StringCollection>] [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216183')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterGroup])]
    param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Storage},

        [ValidateNotNull()]
        [System.Collections.Specialized.StringCollection]
        ${StaticAddress},

        [ValidateNotNull()]
        [System.Collections.Specialized.StringCollection]
        ${IgnoreNetwork},

        [Parameter(Position=0)]
        [string]
        ${Name},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterGenericApplicationRole {
    <#
    .SYNOPSIS
        Add-ClusterGenericApplicationRole [[-Name] <string>] -CommandLine <string> [-Parameters <string>] [-CheckpointKey <StringCollection>] [-Storage <StringCollection>] [-StaticAddress <StringCollection>] [-IgnoreNetwork <StringCollection>] [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216184')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterGroup])]
    param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${CommandLine},

        [string]
        ${Parameters},

        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${CheckpointKey},

        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Storage},

        [ValidateNotNull()]
        [System.Collections.Specialized.StringCollection]
        ${StaticAddress},

        [ValidateNotNull()]
        [System.Collections.Specialized.StringCollection]
        ${IgnoreNetwork},

        [Parameter(Position=0)]
        [string]
        ${Name},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterGenericScriptRole {
    <#
    .SYNOPSIS
        Add-ClusterGenericScriptRole [[-Name] <string>] -ScriptFilePath <string> [-Storage <StringCollection>] [-StaticAddress <StringCollection>] [-IgnoreNetwork <StringCollection>] [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216186')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterGroup])]
    param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ScriptFilePath},

        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Storage},

        [ValidateNotNull()]
        [System.Collections.Specialized.StringCollection]
        ${StaticAddress},

        [ValidateNotNull()]
        [System.Collections.Specialized.StringCollection]
        ${IgnoreNetwork},

        [Parameter(Position=0)]
        [string]
        ${Name},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterGenericServiceRole {
    <#
    .SYNOPSIS
        Add-ClusterGenericServiceRole [[-Name] <string>] -ServiceName <string> [-CheckpointKey <StringCollection>] [-Storage <StringCollection>] [-StaticAddress <StringCollection>] [-IgnoreNetwork <StringCollection>] [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216187')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterGroup])]
    param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ServiceName},

        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${CheckpointKey},

        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Storage},

        [ValidateNotNull()]
        [System.Collections.Specialized.StringCollection]
        ${StaticAddress},

        [ValidateNotNull()]
        [System.Collections.Specialized.StringCollection]
        ${IgnoreNetwork},

        [Parameter(Position=0)]
        [string]
        ${Name},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterGroup {
    <#
    .SYNOPSIS
        Add-ClusterGroup [-Name] <StringCollection> [[-GroupType] <GroupType>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216189')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterGroup])]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [Parameter(Position=1)]
        [Microsoft.FailoverClusters.PowerShell.GroupType]
        ${GroupType},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusteriSCSITargetServerRole {
    <#
    .SYNOPSIS
        Add-ClusteriSCSITargetServerRole [[-Name] <string>] -Storage <StringCollection> [-StaticAddress <StringCollection>] [-IgnoreNetwork <StringCollection>] [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=229636')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterGroup])]
    param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Storage},

        [ValidateNotNull()]
        [System.Collections.Specialized.StringCollection]
        ${StaticAddress},

        [ValidateNotNull()]
        [System.Collections.Specialized.StringCollection]
        ${IgnoreNetwork},

        [Parameter(Position=0)]
        [string]
        ${Name},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterNode {
    <#
    .SYNOPSIS
        Add-ClusterNode [[-Name] <StringCollection>] [-Type <NodeType>] [-NoStorage] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216190')]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [Microsoft.FailoverClusters.PowerShell.NodeType]
        ${Type},

        [switch]
        ${NoStorage},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterResource {
    <#
    .SYNOPSIS
        Add-ClusterResource [-Name] <string> [[-Group] <string>] [-ResourceType] <string> [-SeparateMonitor] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216192')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResource])]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Group},

        [Parameter(Mandatory=$true, Position=2)]
        [Alias('ResType','Type')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ResourceType},

        [switch]
        ${SeparateMonitor},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterResourceDependency {
    <#
    .SYNOPSIS
        Add-ClusterResourceDependency [[-Resource] <string>] [[-Provider] <string>] [-Reason <string>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216193')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResource])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Resource},

        [Parameter(Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Provider},

        [string]
        ${Reason},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterResourceType {
    <#
    .SYNOPSIS
        Add-ClusterResourceType [-Name] <string> [-Dll] <string> [[-DisplayName] <string>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216194')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResourceType])]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(Mandatory=$true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Dll},

        [Parameter(Position=2)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DisplayName},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterScaleOutFileServerRole {
    <#
    .SYNOPSIS
        Add-ClusterScaleOutFileServerRole [[-Name] <string>] [-Infrastructure] [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216200')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterGroup])]
    param (
        [Parameter(HelpMessage='Create Cluster Infrastructure Scale Out File Server.')]
        [Alias('Infra')]
        [switch]
        ${Infrastructure},

        [Parameter(Position=0)]
        [string]
        ${Name},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterServerRole {
    <#
    .SYNOPSIS
        Add-ClusterServerRole [[-Name] <string>] [-DnsName <string>] [-NetworkNameName <string>] [-Storage <StringCollection>] [-StaticAddress <StringCollection>] [-IgnoreNetwork <StringCollection>] [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216195')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterGroup])]
    param (
        [string]
        ${DnsName},

        [string]
        ${NetworkNameName},

        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Storage},

        [ValidateNotNull()]
        [System.Collections.Specialized.StringCollection]
        ${StaticAddress},

        [ValidateNotNull()]
        [System.Collections.Specialized.StringCollection]
        ${IgnoreNetwork},

        [Parameter(Position=0)]
        [string]
        ${Name},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterSharedVolume {
    <#
    .SYNOPSIS
        Add-ClusterSharedVolume [[-Name] <StringCollection>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216196')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterSharedVolume])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterVirtualMachineRole {
    <#
    .SYNOPSIS
        Add-ClusterVirtualMachineRole [[-VMName] <string>] [-Name <string>] [-VirtualMachine <string>] [-VMId <guid>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(HelpUri='https://go.microsoft.com/fwlink/?LinkId=216198')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterGroup])]
    param (
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(Position=0, ValueFromPipelineByPropertyName=$true)]
        [string]
        ${VMName},

        [Alias('VM')]
        [string]
        ${VirtualMachine},

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [guid]
        ${VMId},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Add-ClusterVMMonitoredItem {
    <#
    .SYNOPSIS
        Add-ClusterVMMonitoredItem [[-VirtualMachine] <string>] [-Service <StringCollection>] [-EventLog <string>] [-EventSource <string>] [-EventId <int>] [-OverrideServiceRecoveryActions] [-Wait <int>] [-Cluster <string>] [<CommonParameters>]

Add-ClusterVMMonitoredItem [-Service <StringCollection>] [-EventLog <string>] [-EventSource <string>] [-EventId <int>] [-OverrideServiceRecoveryActions] [-VMId <guid>] [-Wait <int>] [-Cluster <string>] [<CommonParameters>]

Add-ClusterVMMonitoredItem [-Service <StringCollection>] [-EventLog <string>] [-EventSource <string>] [-EventId <int>] [-OverrideServiceRecoveryActions] [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VirtualMachine', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216199')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterVMMonitoredItem])]
    param (
        [System.Collections.Specialized.StringCollection]
        ${Service},

        [string]
        ${EventLog},

        [string]
        ${EventSource},

        [int]
        ${EventId},

        [switch]
        ${OverrideServiceRecoveryActions},

        [Parameter(ParameterSetName='VirtualMachine', Position=0)]
        [Alias('VM')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VirtualMachine},

        [Parameter(ParameterSetName='VMId', ValueFromPipelineByPropertyName=$true)]
        [guid]
        ${VMId},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Block-ClusterAccess {
    <#
    .SYNOPSIS
        Block-ClusterAccess [-User] <StringCollection> [-InputObject <psobject>] [-Cluster <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216202')]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${User},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Clear-ClusterDiskReservation {
    <#
    .SYNOPSIS
        Clear-ClusterDiskReservation [[-Node] <StringCollection>] -Disk <uint32[]> [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216203')]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Node},

        [Parameter(Mandatory=$true)]
        [uint32[]]
        ${Disk},

        [switch]
        ${Force}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Clear-ClusterNode {
    <#
    .SYNOPSIS
        Clear-ClusterNode [[-Name] <StringCollection>] [-Force] [-Wait <int>] [-CleanupDisks] [-InputObject <psobject>] [-Cluster <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216205')]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [switch]
        ${Force},

        [int]
        ${Wait},

        [switch]
        ${CleanupDisks},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-Cluster {
    <#
    .SYNOPSIS
        Get-Cluster [[-Name] <string>] [-Domain <string>] [<CommonParameters>]

Get-Cluster [-ClusterSet <ciminstance>] [-Domain <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Name', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216206')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.Cluster])]
    param (
        [Parameter(ParameterSetName='Name', Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='ClusterSet', ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [ciminstance]
        ${ClusterSet},

        [string]
        ${Domain}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterAccess {
    <#
    .SYNOPSIS
        Get-ClusterAccess [[-User] <StringCollection>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216207')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterAccessRule])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${User},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterAvailableDisk {
    <#
    .SYNOPSIS
        Get-ClusterAvailableDisk [[-Cluster] <string>] [-Disk <ciminstance>] [-All] [-InputObject <psobject>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216208')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterDiskInfo])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster},

        [Parameter(ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [ciminstance]
        ${Disk},

        [switch]
        ${All},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterBitLockerProtector {
    <#
    .SYNOPSIS
        Get-ClusterBitLockerProtector [[-Name] <string>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216245')]
    [OutputType([System.Collections.Generic.IEnumerable`1[System.String]])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterCheckpoint {
    <#
    .SYNOPSIS
        Get-ClusterCheckpoint [[-ResourceName] <StringCollection>] [-CheckpointName <string>] [-RegistryCheckpoint] [-CryptoCheckpoint] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216209')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterRegistryCheckpoint])]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterCryptoCheckpoint])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${ResourceName},

        [Parameter(HelpMessage='Searches for checkpoints with a specific name, wildcard expressions are accepted.')]
        [string]
        ${CheckpointName},

        [Parameter(HelpMessage='If specified, command will output registry checkpoints.')]
        [switch]
        ${RegistryCheckpoint},

        [Parameter(HelpMessage='If specified, command will output crypto checkpoints.')]
        [switch]
        ${CryptoCheckpoint},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterGroup {
    <#
    .SYNOPSIS
        Get-ClusterGroup [[-Name] <StringCollection>] [-VMId <guid>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216210')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterGroup])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [guid]
        ${VMId},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterLog {
    <#
    .SYNOPSIS
        Get-ClusterLog [[-Node] <StringCollection>] [-Destination <string>] [-PerformanceHistoryTimeFrame <string>] [-TimeSpan <uint32>] [-UseLocalTime] [-SkipClusterState] [-Health] [-Netft] [-ExportClusterPerformanceHistory] [-NetworkDiagnostics] [-NetworkDiagnosticsLevel <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216212')]
    [OutputType([System.IO.FileInfo])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNull()]
        [System.Collections.Specialized.StringCollection]
        ${Node},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Destination},

        [ValidateNotNullOrEmpty()]
        [string]
        ${PerformanceHistoryTimeFrame},

        [Alias('Span')]
        [uint32]
        ${TimeSpan},

        [Parameter(HelpMessage='Generate the cluster log using local time instead of GMT.')]
        [Alias('lt')]
        [switch]
        ${UseLocalTime},

        [Parameter(HelpMessage='Generate the cluster log without retrieving cluster state information.')]
        [Alias('scs')]
        [switch]
        ${SkipClusterState},

        [Parameter(HelpMessage='Generate the cluster health logs.')]
        [switch]
        ${Health},

        [Parameter(HelpMessage='Generate the cluster netft logs.')]
        [switch]
        ${Netft},

        [Parameter(HelpMessage='Export the ClusterPorformanceHistory data.')]
        [switch]
        ${ExportClusterPerformanceHistory},

        [Parameter(HelpMessage='Generate the cluster network diagnotics logs.')]
        [switch]
        ${NetworkDiagnostics},

        [Parameter(HelpMessage='Specifies the level of depth of the network diagnotics logs.')]
        [int]
        ${NetworkDiagnosticsLevel},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterNetwork {
    <#
    .SYNOPSIS
        Get-ClusterNetwork [[-Name] <StringCollection>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216213')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterNetwork])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterNetworkInterface {
    <#
    .SYNOPSIS
        Get-ClusterNetworkInterface [[-Name] <StringCollection>] [-Node <StringCollection>] [-Network <StringCollection>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216214')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterNetworkInterface])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Node},

        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Network},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterNode {
    <#
    .SYNOPSIS
        Get-ClusterNode [[-Name] <StringCollection>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216215')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterNode])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterOwnerNode {
    <#
    .SYNOPSIS
        Get-ClusterOwnerNode [-Resource <string>] [-Group <string>] [-ResourceType <string>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216216')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterOwnerNodeList])]
    param (
        [Alias('Res')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Resource},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Group},

        [Alias('ResType')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ResourceType},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterParameter {
    <#
    .SYNOPSIS
        Get-ClusterParameter [[-Name] <StringCollection>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(HelpUri='https://go.microsoft.com/fwlink/?LinkId=216217')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterParameter])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterQuorum {
    <#
    .SYNOPSIS
        Get-ClusterQuorum [[-Cluster] <string>] [-InputObject <psobject>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216218')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterQuorumSettings])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterResource {
    <#
    .SYNOPSIS
        Get-ClusterResource [[-Name] <StringCollection>] [-VMId <guid>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216219')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResource])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [guid]
        ${VMId},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterResourceDependency {
    <#
    .SYNOPSIS
        Get-ClusterResourceDependency [[-Resource] <StringCollection>] [-Guid] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216220')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResourceDependency])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Resource},

        [switch]
        ${Guid},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterResourceDependencyReport {
    <#
    .SYNOPSIS
        Get-ClusterResourceDependencyReport [-Resource <string>] [-Group <string>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216221')]
    [OutputType([System.IO.FileInfo])]
    param (
        [ValidateNotNullOrEmpty()]
        [string]
        ${Resource},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Group},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterResourceType {
    <#
    .SYNOPSIS
        Get-ClusterResourceType [[-Name] <StringCollection>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216222')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResourceType])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterSharedVolume {
    <#
    .SYNOPSIS
        Get-ClusterSharedVolume [[-Name] <StringCollection>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216223')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterSharedVolume])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterSharedVolumeState {
    <#
    .SYNOPSIS
        Get-ClusterSharedVolumeState [[-Name] <StringCollection>] [-Node <StringCollection>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding()]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterSharedVolumeStateInfo])]
    param (
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Node},

        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Get-ClusterVMMonitoredItem {
    <#
    .SYNOPSIS
        Get-ClusterVMMonitoredItem [[-VirtualMachine] <string>] [-Wait <int>] [-Cluster <string>] [<CommonParameters>]

Get-ClusterVMMonitoredItem [-VMId <guid>] [-Wait <int>] [-Cluster <string>] [<CommonParameters>]

Get-ClusterVMMonitoredItem [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VirtualMachine', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216224')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterVMMonitoredItem])]
    param (
        [Parameter(ParameterSetName='VirtualMachine', Position=0)]
        [Alias('VM')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VirtualMachine},

        [Parameter(ParameterSetName='VMId', ValueFromPipelineByPropertyName=$true)]
        [guid]
        ${VMId},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Grant-ClusterAccess {
    <#
    .SYNOPSIS
        Grant-ClusterAccess [-User] <StringCollection> [-Full] [-ReadOnly] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216225')]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${User},

        [switch]
        ${Full},

        [switch]
        ${ReadOnly},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Move-ClusterGroup {
    <#
    .SYNOPSIS
        Move-ClusterGroup [[-Name] <string>] [[-Node] <string>] [-IgnoreLocked] [-IgnoreAffinityRule] [-Reason <string>] [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216226')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterGroup])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Node},

        [switch]
        ${IgnoreLocked},

        [switch]
        ${IgnoreAffinityRule},

        [string]
        ${Reason},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Move-ClusterResource {
    <#
    .SYNOPSIS
        Move-ClusterResource [[-Name] <string>] [[-Group] <string>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216227')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResource])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNull()]
        [string]
        ${Name},

        [Parameter(Position=1)]
        [ValidateNotNull()]
        [string]
        ${Group},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Move-ClusterSharedVolume {
    <#
    .SYNOPSIS
        Move-ClusterSharedVolume [[-Name] <string>] [[-Node] <string>] [-Reason <string>] [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216228')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterSharedVolume])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Node},

        [string]
        ${Reason},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Move-ClusterVirtualMachineRole {
    <#
    .SYNOPSIS
        Move-ClusterVirtualMachineRole [[-Name] <string>] [[-Node] <string>] [-Cancel] [-MigrationType <NativeGroupHelp+VmMigrationType>] [-IgnoreLocked] [-IgnoreAffinityRule] [-VMId <guid>] [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(HelpUri='https://go.microsoft.com/fwlink/?LinkId=216229')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterGroup])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Node},

        [switch]
        ${Cancel},

        [Microsoft.FailoverClusters.NativeHelp.NativeGroupHelp+VmMigrationType]
        ${MigrationType},

        [switch]
        ${IgnoreLocked},

        [switch]
        ${IgnoreAffinityRule},

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [guid]
        ${VMId},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function New-Cluster {
    <#
    .SYNOPSIS
        New-Cluster [-Name] <string> [-Node <StringCollection>] [-StaticAddress <StringCollection>] [-IgnoreNetwork <StringCollection>] [-NoStorage] [-AdministrativeAccessPoint <AdminAccessPoint>] [-Force] [-ManagementPointNetworkType <AdminAccessPointResType>] [<CommonParameters>]
    #>

    [CmdletBinding(HelpUri='https://go.microsoft.com/fwlink/?LinkId=216230')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.Cluster])]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Node},

        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${StaticAddress},

        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${IgnoreNetwork},

        [switch]
        ${NoStorage},

        [Alias('aap')]
        [Microsoft.FailoverClusters.PowerShell.AdminAccessPoint]
        ${AdministrativeAccessPoint},

        [switch]
        ${Force},

        [Alias('apnt')]
        [Microsoft.FailoverClusters.PowerShell.AdminAccessPointResType]
        ${ManagementPointNetworkType}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function New-ClusterNameAccount {
    <#
    .SYNOPSIS
        New-ClusterNameAccount -Name <string> [-Credentials <pscredential>] [-Domain <string>] [-ManagementPointNetworkType <AdminAccessPointResType>] [-UpgradeVCOs] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]

New-ClusterNameAccount -Name <string> -Credentials <pscredential> -Domain <string> [-ManagementPointNetworkType <AdminAccessPointResType>] [-UpgradeVCOs] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject')]
    param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='Credentials', Mandatory=$true)]
        [Parameter(ParameterSetName='InputObject')]
        [pscredential]
        ${Credentials},

        [Parameter(ParameterSetName='Credentials', Mandatory=$true)]
        [Parameter(ParameterSetName='InputObject')]
        [string]
        ${Domain},

        [Microsoft.FailoverClusters.PowerShell.AdminAccessPointResType]
        ${ManagementPointNetworkType},

        [switch]
        ${UpgradeVCOs},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-Cluster {
    <#
    .SYNOPSIS
        Remove-Cluster [[-Cluster] <string>] [-CleanupAD] [-Force] [-InputObject <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216231')]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster},

        [switch]
        ${CleanupAD},

        [switch]
        ${Force},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterAccess {
    <#
    .SYNOPSIS
        Remove-ClusterAccess [[-User] <StringCollection>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216232')]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${User},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterCheckpoint {
    <#
    .SYNOPSIS
        Remove-ClusterCheckpoint [[-ResourceName] <string>] [-Force] [-CheckpointName <string>] [-RegistryCheckpoint] [-CryptoCheckpoint] [-InputObject <psobject>] [-Cluster <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216233')]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ResourceName},

        [switch]
        ${Force},

        [Parameter(HelpMessage='Searches for checkpoints with a specific name, regular expressions are accepted.')]
        [string]
        ${CheckpointName},

        [Parameter(HelpMessage='If specified, command will remove registry checkpoints.')]
        [switch]
        ${RegistryCheckpoint},

        [Parameter(HelpMessage='If specified, command will remove crypto checkpoints.')]
        [switch]
        ${CryptoCheckpoint},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterGroup {
    <#
    .SYNOPSIS
        Remove-ClusterGroup [[-Name] <StringCollection>] [-VMId <guid>] [-Force] [-RemoveResources] [-Reason <string>] [-InputObject <psobject>] [-Cluster <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216234')]
    param (
        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [guid]
        ${VMId},

        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [switch]
        ${Force},

        [switch]
        ${RemoveResources},

        [string]
        ${Reason},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterNameAccount {
    <#
    .SYNOPSIS
        Remove-ClusterNameAccount [-DeleteComputerObjects] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject')]
    param (
        [switch]
        ${DeleteComputerObjects},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterNode {
    <#
    .SYNOPSIS
        Remove-ClusterNode [[-Name] <StringCollection>] [-Force] [-Wait <int>] [-IgnoreStorageConnectivityLoss] [-CleanupDisks] [-Reason <string>] [-InputObject <psobject>] [-Cluster <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216235')]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [switch]
        ${Force},

        [int]
        ${Wait},

        [switch]
        ${IgnoreStorageConnectivityLoss},

        [switch]
        ${CleanupDisks},

        [string]
        ${Reason},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterResource {
    <#
    .SYNOPSIS
        Remove-ClusterResource [[-Name] <StringCollection>] [-Force] [-Reason <string>] [-InputObject <psobject>] [-Cluster <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216236')]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [switch]
        ${Force},

        [string]
        ${Reason},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterResourceDependency {
    <#
    .SYNOPSIS
        Remove-ClusterResourceDependency [[-Resource] <string>] [[-Provider] <string>] [-Reason <string>] [-InputObject <psobject>] [-Cluster <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216237')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResource])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Resource},

        [Parameter(Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Provider},

        [string]
        ${Reason},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterResourceType {
    <#
    .SYNOPSIS
        Remove-ClusterResourceType [[-Name] <StringCollection>] [-Reason <string>] [-InputObject <psobject>] [-Cluster <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216238')]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [string]
        ${Reason},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterSharedVolume {
    <#
    .SYNOPSIS
        Remove-ClusterSharedVolume [[-Name] <StringCollection>] [-InputObject <psobject>] [-Cluster <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216239')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResource])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Remove-ClusterVMMonitoredItem {
    <#
    .SYNOPSIS
        Remove-ClusterVMMonitoredItem [[-VirtualMachine] <string>] [-InputObject <psobject>] [-Service <StringCollection>] [-EventLog <string>] [-EventSource <string>] [-EventId <int>] [-Wait <int>] [-Cluster <string>] [<CommonParameters>]

Remove-ClusterVMMonitoredItem [-InputObject <psobject>] [-Service <StringCollection>] [-EventLog <string>] [-EventSource <string>] [-EventId <int>] [-VMId <guid>] [-Wait <int>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='VirtualMachine', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216240')]
    param (
        [Parameter(ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [System.Collections.Specialized.StringCollection]
        ${Service},

        [string]
        ${EventLog},

        [string]
        ${EventSource},

        [int]
        ${EventId},

        [Parameter(ParameterSetName='VirtualMachine', Position=0)]
        [Alias('VM')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VirtualMachine},

        [Parameter(ParameterSetName='VMId', ValueFromPipelineByPropertyName=$true)]
        [guid]
        ${VMId},

        [int]
        ${Wait},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Rename-ClusterSharedVolume {
    <#
    .SYNOPSIS
        Rename-ClusterSharedVolume [-Name] <string> [[-VolumeName] <string>] -NewVolumeName <string> [-NewVolumeGuid <string>] [<CommonParameters>]
    #>

    [CmdletBinding(HelpUri='https://go.microsoft.com/fwlink/?LinkId=216242')]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(Position=1)]
        [string]
        ${VolumeName},

        [Parameter(ParameterSetName='NewVolumeName', Mandatory=$true)]
        [string]
        ${NewVolumeName},

        [Parameter(ParameterSetName='NewVolumeName')]
        [string]
        ${NewVolumeGuid}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Reset-ClusterVMMonitoredState {
    <#
    .SYNOPSIS
        Reset-ClusterVMMonitoredState [-Wait <int>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216243')]
    param (
        [int]
        ${Wait}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Resume-ClusterNode {
    <#
    .SYNOPSIS
        Resume-ClusterNode [[-Name] <StringCollection>] [[-Failback] <ResumeClusterNodeFailbackType>] [-FailbackStorage] [-FailbackVMs] [-FailbackPinnedVMsOnly] [-Reason <string>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216244')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterNode])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [Parameter(Position=1)]
        [ValidateNotNullOrEmpty()]
        [Microsoft.FailoverClusters.PowerShell.ResumeClusterNodeFailbackType]
        ${Failback},

        [switch]
        ${FailbackStorage},

        [switch]
        ${FailbackVMs},

        [switch]
        ${FailbackPinnedVMsOnly},

        [string]
        ${Reason},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Resume-ClusterPhysicalDiskResource {
    <#
    .SYNOPSIS
        Resume-ClusterPhysicalDiskResource [[-Name] <string>] [-RecoveryPassword <StringCollection>] [-RecoveryKeyPath <StringCollection>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216245')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResource])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [System.Collections.Specialized.StringCollection]
        ${RecoveryPassword},

        [System.Collections.Specialized.StringCollection]
        ${RecoveryKeyPath},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Resume-ClusterResource {
    <#
    .SYNOPSIS
        Resume-ClusterResource [[-Name] <string>] [-VolumeName <string>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216245')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResource])]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterSharedVolume])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [string]
        ${VolumeName},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-ClusterBitLockerProtector {
    <#
    .SYNOPSIS
        Set-ClusterBitLockerProtector [[-Name] <string>] [-ProtectorId <string>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216245')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResource])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [ValidateNotNullOrEmpty()]
        [string]
        ${ProtectorId},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-ClusterLog {
    <#
    .SYNOPSIS
        Set-ClusterLog [-Size <int>] [-Level <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216246')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.Cluster])]
    param (
        [int]
        ${Size},

        [int]
        ${Level},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-ClusterOwnerNode {
    <#
    .SYNOPSIS
        Set-ClusterOwnerNode -Owners <StringCollection> [-Resource <string>] [-Group <string>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(HelpUri='https://go.microsoft.com/fwlink/?LinkId=216247')]
    param (
        [ValidateNotNullOrEmpty()]
        [string]
        ${Resource},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Group},

        [Parameter(Mandatory=$true, ValueFromRemainingArguments=$true)]
        [ValidateNotNull()]
        [System.Collections.Specialized.StringCollection]
        ${Owners},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-ClusterParameter {
    <#
    .SYNOPSIS
        Set-ClusterParameter [-InputObject <psobject>] [-Create] [-Delete] [-Cluster <string>] [<CommonParameters>]

Set-ClusterParameter [[-Name] <string>] [[-Value] <psobject>] [-InputObject <psobject>] [-Create] [-Delete] [-Cluster <string>] [<CommonParameters>]

Set-ClusterParameter [[-Multiple] <hashtable>] [-InputObject <psobject>] [-Create] [-Delete] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='NoMultiple', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216248')]
    param (
        [Parameter(ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [Parameter(ParameterSetName='Single Parameter', Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='Multiple Parameter', Position=0)]
        [ValidateNotNull()]
        [hashtable]
        ${Multiple},

        [Parameter(ParameterSetName='Single Parameter', Position=1)]
        [psobject]
        ${Value},

        [switch]
        ${Create},

        [switch]
        ${Delete},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-ClusterQuorum {
    <#
    .SYNOPSIS
        Set-ClusterQuorum [-DiskOnly <string>] [-NoWitness] [-DiskWitness <string>] [-FileShareWitness <string>] [-CloudWitness] [-AccountName <string>] [-Endpoint <string>] [-AccessKey <string>] [-SASToken <string>] [-ContainerName <string>] [-Credential <pscredential>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216249')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterQuorumSettings])]
    param (
        [ValidateNotNullOrEmpty()]
        [string]
        ${DiskOnly},

        [Alias('NodeMajority')]
        [switch]
        ${NoWitness},

        [Alias('NodeAndDiskMajority')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DiskWitness},

        [Alias('NodeAndFileShareMajority')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${FileShareWitness},

        [switch]
        ${CloudWitness},

        [ValidateNotNullOrEmpty()]
        [string]
        ${AccountName},

        [string]
        ${Endpoint},

        [ValidateNotNullOrEmpty()]
        [string]
        ${AccessKey},

        [ValidateNotNullOrEmpty()]
        [string]
        ${SASToken},

        [ValidateNotNullOrEmpty()]
        [string]
        ${ContainerName},

        [pscredential]
        ${Credential},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Set-ClusterResourceDependency {
    <#
    .SYNOPSIS
        Set-ClusterResourceDependency [[-Resource] <string>] [[-Dependency] <string>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216250')]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Resource},

        [Parameter(Position=1)]
        [string]
        ${Dependency},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Show-ClusterExpectedNetworkTopology {
    <#
    .SYNOPSIS
        Show-ClusterExpectedNetworkTopology [[-Node] <StringCollection>] [<CommonParameters>]
    #>

    [CmdletBinding()]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Node}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Start-Cluster {
    <#
    .SYNOPSIS
        Start-Cluster [[-Name] <string>] [-IgnorePersistentState] [-Wait <int>] [<CommonParameters>]
    #>

    [CmdletBinding(HelpUri='https://go.microsoft.com/fwlink/?LinkId=216251')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.Cluster])]
    param (
        [Parameter(Position=0)]
        [Alias('Cluster')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Alias('ips')]
        [switch]
        ${IgnorePersistentState},

        [int]
        ${Wait}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Start-ClusterGroup {
    <#
    .SYNOPSIS
        Start-ClusterGroup [[-Name] <string>] [-IgnoreLocked] [-ChooseBestNode] [-IgnoreAffinityRule] [-Reason <string>] [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216252')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterGroup])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [switch]
        ${IgnoreLocked},

        [switch]
        ${ChooseBestNode},

        [switch]
        ${IgnoreAffinityRule},

        [string]
        ${Reason},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Start-ClusterNode {
    <#
    .SYNOPSIS
        Start-ClusterNode [[-Name] <StringCollection>] [-ForceQuorum] [-ClearQuarantine] [-IgnorePersistentState] [-PreventQuorum] [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216253')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterNode])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [Parameter(HelpMessage='Specifies if the cluster is in a force quorum state.')]
        [Alias('fq','FixQuorum')]
        [switch]
        ${ForceQuorum},

        [Parameter(HelpMessage='Specifies whether to clear quarantine state when starting the cluster node')]
        [Alias('cq')]
        [switch]
        ${ClearQuarantine},

        [Parameter(HelpMessage='Specifies whether the cluster will bring online groups that were online when the cluster was shut down.')]
        [Alias('ips')]
        [switch]
        ${IgnorePersistentState},

        [Alias('pq')]
        [switch]
        ${PreventQuorum},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Start-ClusterPhysicalDiskResource {
    <#
    .SYNOPSIS
        Start-ClusterPhysicalDiskResource [[-Name] <string>] [-RecoveryPassword <StringCollection>] [-RecoveryKeyPath <StringCollection>] [-Reason <string>] [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216254')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterSharedVolume])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [System.Collections.Specialized.StringCollection]
        ${RecoveryPassword},

        [System.Collections.Specialized.StringCollection]
        ${RecoveryKeyPath},

        [string]
        ${Reason},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Start-ClusterResource {
    <#
    .SYNOPSIS
        Start-ClusterResource [[-Name] <string>] [-IgnoreLocked] [-ChooseBestNode] [-IgnoreAffinityRule] [-Reason <string>] [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216254')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterSharedVolume])]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResource])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [switch]
        ${IgnoreLocked},

        [switch]
        ${ChooseBestNode},

        [switch]
        ${IgnoreAffinityRule},

        [string]
        ${Reason},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Stop-Cluster {
    <#
    .SYNOPSIS
        Stop-Cluster [[-Cluster] <string>] [-Force] [-Wait <int>] [-WhatIf] [-Confirm] [<CommonParameters>]

Stop-Cluster [-Force] [-Wait <int>] [-InputObject <psobject>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='Cluster name', SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216255')]
    param (
        [Parameter(ParameterSetName='Cluster name', Position=0)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster},

        [switch]
        ${Force},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Stop-ClusterGroup {
    <#
    .SYNOPSIS
        Stop-ClusterGroup [[-Name] <string>] [-IgnoreLocked] [-Reason <string>] [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216256')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterGroup])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [switch]
        ${IgnoreLocked},

        [string]
        ${Reason},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Stop-ClusterNode {
    <#
    .SYNOPSIS
        Stop-ClusterNode [[-Name] <StringCollection>] [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216257')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterNode])]
    param (
        [Parameter(Position=0)]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Stop-ClusterResource {
    <#
    .SYNOPSIS
        Stop-ClusterResource [[-Name] <string>] [-IgnoreLocked] [-Reason <string>] [-Wait <int>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216258')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterSharedVolume])]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResource])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [switch]
        ${IgnoreLocked},

        [string]
        ${Reason},

        [int]
        ${Wait},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Suspend-ClusterNode {
    <#
    .SYNOPSIS
        Suspend-ClusterNode [[-Name] <StringCollection>] [[-TargetNode] <string>] [-Drain] [-ForceDrain] [-RetryDrainOnFailure] [-AvoidPlacement] [-Wait] [-Reason <string>] [-InputObject <psobject>] [-Cluster <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216259')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterNode])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [switch]
        ${Drain},

        [switch]
        ${ForceDrain},

        [switch]
        ${RetryDrainOnFailure},

        [switch]
        ${AvoidPlacement},

        [switch]
        ${Wait},

        [Parameter(Position=1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${TargetNode},

        [string]
        ${Reason},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Suspend-ClusterPhysicalDiskResource {
    <#
    .SYNOPSIS
        Suspend-ClusterPhysicalDiskResource [[-Name] <string>] [-CleanupClusterProtector] [-Force] [-InputObject <psobject>] [-Cluster <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216260')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResource])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [switch]
        ${CleanupClusterProtector},

        [switch]
        ${Force},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Suspend-ClusterResource {
    <#
    .SYNOPSIS
        Suspend-ClusterResource [[-Name] <string>] [-VolumeName <string>] [-RedirectedAccess] [-Force] [-InputObject <psobject>] [-Cluster <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216260')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterSharedVolume])]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResource])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [string]
        ${VolumeName},

        [Alias('FileSystemRedirectedAccess')]
        [switch]
        ${RedirectedAccess},

        [switch]
        ${Force},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Test-Cluster {
    <#
    .SYNOPSIS
        Test-Cluster [[-Node] <StringCollection>] [-Disk <Object[]>] [-Pool <Object[]>] [-ReportName <string>] [-List] [-Include <StringCollection>] [-Ignore <StringCollection>] [-Force] [-KeepLocalStoragePoolsOnline] [-InputObject <psobject>] [-Cluster <string>] [-WhatIf] [-Confirm] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216261')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterTestInfo])]
    [OutputType([System.IO.FileInfo])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Node},

        [ValidateNotNullOrEmpty()]
        [System.Object[]]
        ${Disk},

        [ValidateNotNullOrEmpty()]
        [System.Object[]]
        ${Pool},

        [ValidateNotNullOrEmpty()]
        [string]
        ${ReportName},

        [switch]
        ${List},

        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Include},

        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Ignore},

        [switch]
        ${Force},

        [switch]
        ${KeepLocalStoragePoolsOnline},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Test-ClusterResourceFailure {
    <#
    .SYNOPSIS
        Test-ClusterResourceFailure [[-Name] <string>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216262')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterSharedVolume])]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResource])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Update-ClusterFunctionalLevel {
    <#
    .SYNOPSIS
        Update-ClusterFunctionalLevel [-Force] [-WhatIf] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.Cluster])]
    param (
        [switch]
        ${Force},

        [switch]
        ${WhatIf},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Update-ClusterIPResource {
    <#
    .SYNOPSIS
        Update-ClusterIPResource [[-Name] <string>] [-Renew] [-Release] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(HelpUri='https://go.microsoft.com/fwlink/?LinkId=216264')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResource])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [switch]
        ${Renew},

        [switch]
        ${Release},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Update-ClusterNetworkNameResource {
    <#
    .SYNOPSIS
        Update-ClusterNetworkNameResource [[-Name] <StringCollection>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(DefaultParameterSetName='InputObject', HelpUri='https://go.microsoft.com/fwlink/?LinkId=216265')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResource])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Specialized.StringCollection]
        ${Name},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}

function Update-ClusterVirtualMachineConfiguration {
    <#
    .SYNOPSIS
        Update-ClusterVirtualMachineConfiguration [[-Name] <string>] [-VMId <guid>] [-InputObject <psobject>] [-Cluster <string>] [<CommonParameters>]
    #>

    [CmdletBinding(HelpUri='https://go.microsoft.com/fwlink/?LinkId=216266')]
    [OutputType([Microsoft.FailoverClusters.PowerShell.ClusterResource])]
    param (
        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [guid]
        ${VMId},

        [Parameter(ParameterSetName='InputObject', ValueFromPipeline=$true)]
        [ValidateNotNull()]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Cluster}
    )
    end {
        throw '{0}: StubNotImplemented' -f $MyInvocation.MyCommand
    }
}
