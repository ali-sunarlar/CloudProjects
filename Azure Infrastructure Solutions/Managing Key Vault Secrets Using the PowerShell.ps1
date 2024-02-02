New-AzKeyVault -name kvyhz5 -ResourceGroupName RG1 -Location "East US"
Get-AzKeyVault
Set-AzKeyVaultAccessPolicy -VaultName kvyhz5 -UserPrincipalName "<UserPrincipalName>" -PermissionsToSecrets all -PermissionsToKeys all -PermissionsToCertificates all

$secretvalue=ConvertTo-SecureString "secretvalue" -AsPlainText -Force
Set-AzKeyVaultSecret -VaultName kvyhz5 -Name password1 -SecretValue $secretvalue

$policy= New-AzKeyVaultCertificatePolicy -SecretContentType "application/x-pkcs12" -SubjectName "CN=quick24x7.com" -IssuerName "Self" -ValidityInMonths 6 -ReuseKeyOnRenewal
Add-AzKeyVaultCertificate -VaultName kvyhz5 -Name "Quick24x7Certificate" -CertificatePolicy $policy

Add-AzKeyVaultKey -VaultName kvyhz5 -Name key2 -Destination "Software" 