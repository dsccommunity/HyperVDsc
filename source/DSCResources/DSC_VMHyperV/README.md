# Description

Manages VMs in a Hyper-V host.

The following properties **cannot** be changed after VM creation:

* VhdPath
* Path
* Generation

If IsClustered is enabled, please use PsDscRunAsCredential with a
privileged account in order to add a VM to the cluster that the
Hyper-V host is a member of.

## Requirements

* The Hyper-V Role has to be installed on the machine.
* The Hyper-V PowerShell module has to be installed on the machine.
* If VMs should be added to a Failover Cluster, the FailoverClusters module needs to be installed on the machine.
