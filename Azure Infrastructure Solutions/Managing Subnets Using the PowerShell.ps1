$vnet=Get-AzVirtualNetwork -Name vnet2
$vnet

Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet
Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet |Select-Object name,AddressPrefix
Add-AzVirtualNetworkSubnetConfig -Name subnet4 -VirtualNetwork $vnet -AddressPrefix "13.0.1.0/24"

#gui'de gozukmezse update yapmak icin
$vnet | Set-AzVirtualNetwork

