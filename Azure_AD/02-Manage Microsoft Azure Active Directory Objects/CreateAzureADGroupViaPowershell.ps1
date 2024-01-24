Install-Module -Name AzureAD
Connect-AzureAD

New-AzureADGroup -Description "Marketing" -DisplayName "Marketing" `
-MailEnabled $false -SecurityEnabled $true -MailNickName "Marketing"


Add-AzureADGroupMember -ObjectId "62438306-7c37-4638-a72d-0ee8d9217680" `
-RefObjectId "0a1068c0-dbb6-4537-9db3-b48f3e31dd76"
