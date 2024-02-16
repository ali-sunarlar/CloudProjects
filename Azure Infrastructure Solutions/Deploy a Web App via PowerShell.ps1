New-AzureRmAppServicePlan -Name "ASP-PowerShell" -Location EastUS -ResourceGroupName WebAppslod37998077 -Tier Standard -WorkerSize Small

New-AzureRmWebApp -Name waps37998077 -Location EastUS -AppServicePlan "ASP-PowerShell" -ResourceGroupName WebAppslod37998077

$PropertiesObject = @{ repoUrl="https://github.com/notlods/mms-platform.git"; branch = "master"; isManualIntegration = "true"; }
Set-AzureRMResource -PropertyObject $PropertiesObject -ResourceGroupName WebAppslod37998077 `
-ResourceType Microsoft.Web/sites/sourcecontrols -ResourceName waps37998077/web `
-ApiVersion 2015-08-01 -Force -Verbose