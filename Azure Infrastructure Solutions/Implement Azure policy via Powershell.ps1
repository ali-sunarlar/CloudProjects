# Get a reference to the resource group that is the scope of the assignment
$rg = Get-AzResourceGroup -Name 'AZ300-RG'

# Get a reference to the built-in policy definition to assign
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Allowed locations' }

# Create the policy assignment with the built-in definition against your resource group
New-AzPolicyAssignment -Name 'audit-vm-manageddisks' -DisplayName 'Allowed locations' -Scope $rg.ResourceId -PolicyDefinition $definition