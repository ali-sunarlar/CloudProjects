Get-AzStorageShare

$ctx=Get-AzStorageShare -r RG1 -Name storacctyh1
$ctx

$ctx=$ctx.Context

New-AzStorageShare -Name "fileshare2" -Context $ctx

Get-AzStorageShare -Name "fileshare2" -Context $ctx

Set-AzStorageFileContent -ShareName "fileshare2" -Source "./Budget2.txt" -Context $ctx


