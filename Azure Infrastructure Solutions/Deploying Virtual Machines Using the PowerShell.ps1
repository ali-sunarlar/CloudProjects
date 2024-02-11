$creds= Get-Credential

New-AzVM `
-ResourceGroupName "RG1" `
-Name "WinSrv2022-2" `
-VirtualNetworkName "vnet2" `
-SubnetName "Subnet1" `
-SecurityGroupName "winsrv-nsg" `
-Image Win2022AzureEditionCore `
-Credential $creds

Get-AzVM

New-AzVM -ResourceGroupName "AZ300-RGlod37805416" -Name "PublicVM" -Location "East US 2" -VirtualNetworkName "MyVNet" -SubnetName "Public" -Size "Standard_D3_v2" -SecurityGroupName "PublicSG-37805416" -PublicIpAddressName "PublicVMPIP-37805416" -OpenPorts 80,3389 -SecurityType "Standard"

New-AzVM -ResourceGroupName "AZ300-RGlod37805416" -Name "PrivateVM" -Location "East US 2" -VirtualNetworkName "MyVNet" -SubnetName "Private" -Size "Standard_D3_v2" -SecurityGroupName "PrivateSG-37805416" -PublicIpAddressName "PrivateVMPIP-37805416" -OpenPorts 80,3389 -SecurityType "Standard"

New-AzVM -ResourceGroupName "AZ300-RGlod37805416" -Name "NvaVM" -Location "East US 2" -VirtualNetworkName "MyVNet" -SubnetName "Firewall" -Size "Standard_D3_v2" -SecurityGroupName "FirewallSG-37805416" -PublicIpAddressName "NvaVMPIP-37805416" -OpenPorts 80,3389 -SecurityType "Standard"

