$subnet =New-AzVirtualNetworkSubnetConfig -Name subnet1 -AddressPrefix 30.0.10.0/24
Get-AzVirtualNetwork
Get-AzVirtualNetwork |Select-Object Name
New-AzVirtualNetwork -ResourceGroupName RG2 -Location CanadaEast -Name vnet2 -AddressPrefix 30.0.0.0/16 -Subnet $subnet
$vnet =Get-AzVirtualNetwork -name vnet2
$vnet
Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet | Select-Object name, AddressPrefix
Get-Command *virtualnetwork*

$subnet =New-AzVirtualNetworkSubnetConfig -Name Production -AddressPrefix 10.1.0.0/24
New-AzVirtualNetwork -ResourceGroupName AZ300-RGlod37844694 -Location eastus2 -Name NewVNet -AddressPrefix 10.1.0.0/16 -Subnet $subnet
