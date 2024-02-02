Get-command *storageaccount*key*

Get-help new-azstorageaccountkey -detail

Get-azstorageAccountKey -resourceGroupName RG1 -Name storacctyhz1 

Get-azstorageAccountKey -resourceGroupName RG1 -Name storacctyh1 | get-member  -type  property

(Get-azstorageAccountKey -resourceGroupName RG1 -Name storacctyh1).Value
(Get-azstorageAccountKey -resourceGroupName RG1 -Name storacctyh1).Value[0]

New-AzStorageAccountKey -ResourceGroupName RG1 -Name storacctyhz1 -KeyName key2


$acc= Get-AzStorageAccount -name "storageaccount" -ResourceGroupName "RG1"
Get-AzStorageContainer -Context $acc.Context -Name projects | Get-AzStorageBlob


Get-AzStorageAccount
Get-ChildItem ./
$ctx=Get-AzStorageAccount -r RG1 -Name storacctyh1
$ctx=$ctx.Context
$ctx
New-AzStorageContainer -Name "hqbudgets" -Context $ctx
Set-AzStorageBlobContent -File "./budget1.txt" -Container hqbudgets -Blob budget1.txt -Context $ctx

#To allow traffic from all networks, use the Update-AzStorageAccountNetworkRuleSet command and set the -DefaultAction parameter to Allow:

Update-AzStorageAccountNetworkRuleSet -ResourceGroupName "myresourcegroup" -Name "mystorageaccount" -DefaultAction Allow

#To allow traffic only from specific virtual networks, use the Update-AzStorageAccountNetworkRuleSet command and set the -DefaultAction parameter to Deny:

Update-AzStorageAccountNetworkRuleSet -ResourceGroupName "myresourcegroup" -Name "mystorageaccount" -DefaultAction Deny

#To block traffic from all networks, use the Set-AzStorageAccount command and set the -PublicNetworkAccess parameter to Disabled. 
#Traffic will be allowed only through a private endpoint. You'll have to create that private endpoint.

Set-AzStorageAccount -ResourceGroupName "myresourcegroup" -Name "mystorageaccount" -PublicNetworkAccess Disabled


#List virtual network rules:

(Get-AzStorageAccountNetworkRuleSet -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount").VirtualNetworkRules

#Enable a service endpoint for Azure Storage on an existing virtual network and subnet:

Get-AzVirtualNetwork -ResourceGroupName "myresourcegroup" -Name "myvnet" | Set-AzVirtualNetworkSubnetConfig -Name "mysubnet" -AddressPrefix "10.0.0.0/24" -ServiceEndpoint "Microsoft.Storage.Global" | Set-AzVirtualNetwork

#Add a network rule for a virtual network and subnet:

$subnet = Get-AzVirtualNetwork -ResourceGroupName "myresourcegroup" -Name "myvnet" | Get-AzVirtualNetworkSubnetConfig -Name "mysubnet"
Add-AzStorageAccountNetworkRule -ResourceGroupName "myresourcegroup" -Name "mystorageaccount" -VirtualNetworkResourceId $subnet.Id

#To add a network rule for a subnet in a virtual network that belongs to another Microsoft Entra tenant, 
#use a fully qualified VirtualNetworkResourceId parameter in the form 
#/subscriptions/subscription-ID/resourceGroups/resourceGroup-Name/providers/Microsoft.Network/virtualNetworks/vNet-name/subnets/subnet-name.

#Remove a network rule for a virtual network and subnet:

$subnet = Get-AzVirtualNetwork -ResourceGroupName "myresourcegroup" -Name "myvnet" | Get-AzVirtualNetworkSubnetConfig -Name "mysubnet"
Remove-AzStorageAccountNetworkRule -ResourceGroupName "myresourcegroup" -Name "mystorageaccount"