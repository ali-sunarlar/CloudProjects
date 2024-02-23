set-vMProcessor -VMName DEMOCLS1 -ExposeVirtualizationExtensions $True
set-vMProcessor -VMName DEMOCLS2 -ExposeVirtualizationExtensions $True

Get-VMNetworkAdapter -VMName DEMOCLS1 | Set-VMNetworkAdapter -MacAddressSpoofing On
Get-VMNetworkAdapter -VMName DEMOCLS2 | Set-VMNetworkAdapter -MacAddressSpoofing On