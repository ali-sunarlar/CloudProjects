# Ref: https://timw.info/2jy
Import-Module AzureAD
Connect-AzureAD
$adGroupId = "<Azure AD Group Id here>"
$users = Get-AzureADGroupMember -ObjectId $adGroupId
foreach ($u in $users) 
{
Write-Host $u.DisplayName
Set-AzureADUser -ObjectId $u.Mail -Department "<New Value>"
}