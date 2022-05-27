# Change log for xHyper-V

The format is based on and uses the types of changes according to [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

For older change log history see the [historic changelog](HISTORIC_CHANGELOG.md).

## [Unreleased]
- xHyper-V
  - BREAKING CHANGE
    - Renamed _xHyper-V_ to _HyperVDsc - fixes [Issue #69](https://github.com/PowerShell/xHyper-V/issues/213).
    - Changed all MSFT_xResourceName to DSC_ResourceName.
    - Updated DSCResources, Examples, Modules and Tests for new naming.
    - Updated README.md from _xHyper-V_ to _HyperVDsc
    - Removed deprecated resource `xIISHandler`
    - Removed deprecated resource `xWebConfigKeyValue`

### Added

- xHyper-V
  - Added automatic release with a new CI pipeline.
  - Added stubs for the powershell module Hyper-V that are used for
    all unit tests.
- xVhdFileDirectory
  - Added initial set of unit tests

### Deprecated

- xHyper-V
  - The resource will not be tested for Windows Server 2008 R2 since
    that operating system has reach end-of-life.

### Removed

- xVMSwitch
  - Removed the unit test that simulated functionality on Windows Server 2008 R2
    since that operating system has reach end-of-life. No functionality was
    removed from the resource, but in a future release the resource might stop
    working for Windows Server 2008 R2.

### Fixed

- xVMDvdDrive
  - Fixed VMName property in example.
- xVMNetworkAdapter
  - Fixed MacAddress sample data.
- xVMSwitch
  - Correctly return the state as `$true` or `$false` depending on the
    `Ensure` property when the switch does not exist.
