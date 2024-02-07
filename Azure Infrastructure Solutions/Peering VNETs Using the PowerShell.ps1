$vnet1 =Get-AzVirtualNetwork -Name $vnet1 -ResourceGroupName RG1
$vnet2 =Get-AzVirtualNetwork -Name $vnet2 -ResourceGroupName RG1

Add-AzVirtualNetworkPeering -Name Vnet1-Vnet2 -VirtualNetwork $vnet1 -RemoteVirtualNetworkId $vnet2.Id |Out-Null
Add-AzVirtualNetworkPeering -Name Vnet2-Vnet1 -VirtualNetwork $vnet2 -RemoteVirtualNetworkId $vnet1.Id |Out-Null

(Get-AzVirtualNetworkPeering -ResourceGroupName RG1 -VirtualNetworkName Vnet1 |Select-Object PeeringState).PeeringState
(Get-AzVirtualNetworkPeering -ResourceGroupName RG1 -VirtualNetworkName Vnet2 |Select-Object PeeringState).PeeringState


