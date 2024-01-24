Get-Command *az*user*

Get-Help NewAzADUser -detail

$SecureStringPassword = ConvertTo-SecureString -String ‘Password’ -AsPlainText -Force

New-AzADUser -DisplayName "User Name" -UserPrincipalName "user@test.onmicrosoft.com"  -Password $SecureStringPassword -MailNickname "User"

Get-AzADUser
Get-azaduser | Select-Object displayname
Get-azaduser -DisplayName "User Name"

$upn = “user@test.onmicrosoft.com”
$city = “City”
Update-AzADUser -UPNOrObjectId $upn -City $city 
(Show the city attribute in the portal GUI)

New-AzADGroup -DisplayName ProjectB_Members -MailNickname ProjectB_Members

Get-azadgroup | Select-Object displayname, id
(Copy-Item the ID for ProjectB_Members)

$members = @()
$members += (Get-AzADUser -DisplayName “User Name”).Id
$members += (Get-AzADUser -DisplayName “User Name”).Id

Add-AzADGroupMember -TargetGroupObjectID af6f5fe1-bf41-440a-943e-fdbf0de5d653  -MemberObjectID $members

