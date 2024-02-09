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

