$resourceGroupName = Read-Host -Prompt "Enter the Resource Group Name"
$adminUser = Read-Host -Prompt "Enter the SQL server administrator username"
$adminPassword = Read-Host -Prompt "Enter the SQl server administrator password" -AsSecureString
$templateUri = "https://raw.githubusercontent.com/ali-sunarlar/Arm-Templates/main/vm-simple-windows/azuredeploy.json"

New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateUri $templateUri  -administratorLogin $adminUser -administratorLoginPassword $adminPassword