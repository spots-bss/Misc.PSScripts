## Install Docker onPrem for development

1) Run "ExecutionPolicy.ps1"
2) Run "Docker without Docker Desktop.ps1"

## Container
When creating container with BCContainerHelper the following images are available:
- mcr.microsoft.com/businesscentral:ltsc2016
- mcr.microsoft.com/businesscentral:ltsc2019
- mcr.microsoft.com/businesscentral:ltsc2022

BcContainerHelpers Get-BestGenericImage always return one of the 3 images.


- Windows 10 will always get ltsc2019 -> need HyperV isolation
- Windows 11 will always get ltsc2022 -> still run process isolation
- Windows Server 2019 -> process isolation
- Windows Server 2022 -> process isolation
