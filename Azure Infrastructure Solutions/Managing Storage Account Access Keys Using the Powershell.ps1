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