ConvertFrom-StringData @'
    SETServer2016Error = Embedded teaming is only supported on Windows Server 2016
    HyperVNotInstalledError = Please ensure that the Hyper-V role is installed with its PowerShell module
    BandwidthReservationModeError = The BandwidthReservationMode cannot be set on a Hyper-V version lower than 2012
    NetAdapterNameRequiredError = For external switch type, NetAdapterName must be specified
    NetAdapterNameNotRequiredError = For Internal or Private switch type, NetAdapterName should not be specified
'@
