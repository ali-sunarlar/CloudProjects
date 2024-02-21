# Cluster Sets

Ref: https://timw.info/7kc

# Create a cluster set
New-ClusterSet -Name CSMASTER -NamespaceRoot SOFS-CLUSTERSET -CimSession SET-CLUSTER

# Add cluster members to cluster set
Add-ClusterSetMember -ClusterName CLUSTER1 -CimSession CSMASTER -InfraSOFSName SOFS-CLUSTER1

Add-ClusterSetMember -ClusterName CLUSTER2 -CimSession CSMASTER -InfraSOFSName SOFS-CLUSTER2

# Enumerate all member clusteres including the management nodes
Get-ClusterSet -CimSession CSMASTER | Get-Cluster | Get-ClusterNode

# Add management cluster to the local Administrators group on each cluster member server node in the cluster set
foreach ($h in $hosts) { Invoke-Command -ComputerName $h -ScriptBlock { Net localgroup administrators /add clustername $ } }

# Identify the optimal node to create a new virtual machine
$memoryinMB = 4096
$vpcount = 1
$targetnode = Get-ClusterSetOptimalNodeForVM -CimSession CSMASTER -VMMemory $memoryinMB -VMVirtualCoreCount $vpcount -VMCpuReservation 10
$secure_string_pwd = convertto-securestring "<password>" -asplaintext -force
$cred = new-object -typename System.Management.Automation.PSCredential ("<domain\account>", $secure_string_pwd)

# Deploy the virtual machine on the optimal node
Invoke-Command -ComputerName $targetnode.name -scriptblock { param([String]$storagepath); New-VM CSVM1 -MemoryStartupBytes 3072MB -path $storagepath -NewVHDPath CSVM.vhdx -NewVHDSizeBytes 4194304 } -ArgumentList @("\\SOFS-CLUSTER1\VOLUME1") -Credential $cred | Out-Null

Start-VM CSVM1 -ComputerName $targetnode.name | Out-Null

Get-VM CSVM1 -ComputerName $targetnode.name | Select-Object State, ComputerName

Register-ClusterSetVM -CimSession CSMASTER -MemberName $targetnode.Member -VMName CSVM1

# Add SoFS role to the cluster
Add-ClusterScaleoutFileServerRole -Name "my_infra_sofs_name" -Infrastructure

# Create fault domains
New-ClusterSetFaultDomain -Name FD1 -FdType Logical -CimSession CSMASTER -MemberCluster CLUSTER1, CLUSTER2 -Description "First fault domain"

New-ClusterSetFaultDomain -Name FD2 -FdType Logical -CimSession CSMASTER -MemberCluster CLUSTER3, CLUSTER4 -Description "Second fault domain"

# Create availability set
New-ClusterSetAvailabilitySet -Name CSMASTER-AS -FdType Logical -CimSession CSMASTER -ParticipantName FD1, FD2

# Remove a cluster from the cluster set
Remove-ClusterSetMember -ClusterName CLUSTER1 -CimSession CSMASTER

