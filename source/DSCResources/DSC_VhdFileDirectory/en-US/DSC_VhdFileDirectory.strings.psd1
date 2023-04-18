ConvertFrom-StringData @'
GetCurrentValue = Getting the current value at {0}...
GetDriveLetter = Drive letter of mounted drive is {0}.
NoDiskMounted = {0} was not mounted. Ensure it is not attached to a running VM.
TestRelativePath = Testing the file with relative VHD destination {0}.
TestFileExists = Checking if {0} exist under {1}.
TestFileExistsInDestination = File exist on the destination under {0} :- {1}.
TestResult = Test returned {0}.
EnsureEntry = Ensuring that {0} is {1}.
DiskDetails = Disk {0}, attached: {1}, disk number {2}.
SkippingAttachedDisk = Disk {0} is attached to a running VM. Skipping file operations as they would fail.
UnableToMount = Unable to mount {0} when it is attached to a running VM.
Mounting = Attempting to mount {0}.
Dismounting = Attempting to dismount {0}.
AlreadyMounted = {0} is already mounted.
AlreadyDismounted = {0} is already dismounted.
FailedToMount = Mounting {0} failed. Attempting to dismount and mount it back.
SetVhdFileContent = Setting the VHD file {0}.
SetFileAttributes = Attempting to change the attribute of the file {0} to value {1}.
'@
