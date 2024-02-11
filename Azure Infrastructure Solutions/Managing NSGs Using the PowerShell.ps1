$rdp_allow_rule= New-AzNetworkSecurityRuleConfig -Name "allow-inbound-rdp" `
-SourcePortRange * -Protocol Tcp -SourceAddressPrefix Internet -Access Allow -Priority 110 `
-Direction Inbound -DestinationPortRange 3389 -DestinationAddressPrefix *

$nsg= New-AzNetworkSecurityGroup -ResourceGroupName RG1 -Location eastus -Name `
"WindowsManagement_Rules" -SecurityRules $rdp_allow_rule

$nsg

Get-AzNetworkSecurityGroup |Select-Object Name