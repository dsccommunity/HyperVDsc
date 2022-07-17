# Changelog for HyperVDsc

The format is based on and uses the types of changes according to [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

For older change log history see the [historic changelog](HISTORIC_CHANGELOG.md).

## [Unreleased]

- HyperVDsc
  - BREAKING CHANGE
    - Renamed _xHyper-V_ to _HyperVDsc - fixes [Issue #69](https://github.com/dsccommunity/HyperVDsc/issues/213).
    - Changed all MSFT_xResourceName to DSC_ResourceName.
    - Updated DSCResources, Examples, Modules and Tests for new naming.
    - Updated README.md from _xHyper-V_ to _HyperVDsc
  - Renamed default branch to `main` - Fixes [Issue #198](https://github.com/dsccommunity/HyperVDsc/issues/198).
  - Moved documentation to the HyperVDsc GitHub Wiki.
  - Updated all examples to correct folders and naming so they show up
    in the GitHub Wiki documentation and conceptual help.
  - VMNetworkAdapter
    - BREAKING CHANGE: Rename embedded instance class #203
    - Fix multiple DNS IP adresses does not work #190
    - NetworkSetting parameter is now optional and no default actions are taken if not specified

## [3.18.0] - 2022-06-04

### Added

- xHyper-V
  - Added automatic release with a new CI pipeline.
  - Added stubs for the powershell module Hyper-V that are used for
    all unit tests.
- xVhdFileDirectory
  - Added initial set of unit tests

### Deprecated

- **The module _xHyper-V_ will be renamed to _HyperVDsc_
  ([issue #62](https://github.com/dsccommunity/HyperVDsc/issues/62)).
  The version `v3.18.0` will be the the last release of _xHyper-V_.
  Version `v4.0.0` will be released as _HyperVDsc_, it will be
  released shortly after the `v3.18.0` release to be able to start transition
  to the new module. The prefix 'x' will be removed from all resources in
  _HyperVDsc_.**
- xHyper-V
  - The resource will not be tested for Windows Server 2008 R2 since
    that operating system has reach end-of-life.

### Removed

- xVMSwitch
  - Removed the unit test that simulated functionality on Windows Server 2008 R2
    since that operating system has reach end-of-life. No functionality was
    removed from the resource, but in a future release the resource might stop
    working for Windows Server 2008 R2.

### Changed

- Update the pipeline files to the lates from Sampler.

### Fixed

- xVMDvdDrive
  - Fixed VMName property in example.
- xVMNetworkAdapter
  - Fixed MacAddress sample data.
- xVMSwitch
  - Correctly return the state as `$true` or `$false` depending on the
    `Ensure` property when the switch does not exist.
