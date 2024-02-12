Get-AzRecoveryServicesVault
Get-AzRecoveryServicesVault -Name "AZ300-RecoveryServicesVault-37856182" | Set-AzRecoveryServicesVaultContext

$policy = Get-AzRecoveryServicesBackupProtectionPolicy -Name "DefaultPolicy"

Enable-AzRecoveryServicesBackupProtection -ResourceGroupName "AZ300-RGlod37856182" -Name "VM2" -Policy $policy
