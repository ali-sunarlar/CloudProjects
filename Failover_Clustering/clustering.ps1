# Failover Clustering

# Install the role
# Fill in these variables with your values
#$ServerList = "server2.contoso.com", "server3.contoso.com"
$ServerList="DEMOCLS-1.demo.local", "DEMOCLS-2.demo.local"
#$FeatureList = "Hyper-V", "Failover-Clustering", "Data-Center-Bridging", "RSAT-Clustering-PowerShell", "Hyper-V-PowerShell", "FS-FileServer"
$FeatureList = "Failover-Clustering","FS-FileServer","RSAT-Clustering-PowerShell"
Invoke-Command ($ServerList) {
  Install-WindowsFeature -Name $Using:Featurelist -Restart -IncludeManagementTools
}

# Validate the cluster
Test-Cluster -Node $ServerList -Include "Storage Spaces Direct", "Inventory", "Network", "System Configuration"

# Create the cluster
New-Cluster -Name "vmcluster" -Node $ServerList -NoStorage -StaticAddress 192.168.86.123

# Create cloud witness
Set-ClusterQuorum -CloudWitness -AccountName "account-name" -AccessKey ""

# Enable S2D
Enable-ClusterStorageSpacesDirect -CimSession "az801cluster" -PoolFriendlyName "S2D-Pool1"

# Enable CSV cache
$ClusterName = "vmcluster1"
$CSVCacheSize = 2048 #Size in MB

Write-Output "Setting the CSV cache..."
(Get-Cluster $ClusterName).BlockCacheSize = $CSVCacheSize

$CSVCurrentCacheSize = (Get-Cluster $ClusterName).BlockCacheSize
Write-Output "$ClusterName CSV cache size: $CSVCurrentCacheSize MB"

Get-PhysicalDisk | Select-Object -Property FriendlyName, ClassName, CanPool, CannotPoolReason | Format-Table -AutoSize

Get-PhysicalDisk | Format-List *

Start-Process

#old school
#cluster /prop
#cluster /quorum

#New School
get-cluster -name "democluster1" |Format-List -Property *
Get-ClusterQuorum -Cluster "democluster1"


