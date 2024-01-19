$Servers = 'DEMOSRV-1','DEMOSRV-2'
$Servers | ForEach { Install-WindowsFeature -ComputerName $_ -Name Storage-Replica,FS-FileServer -IncludeManagementTools -restart }

MD c:\temp

#For example, to validate the proposed nodes that each have a F: and G: volume and run the test for 30 minutes:
Test-SRTopology -SourceComputerName DEMOSRV-1 -SourceVolumeName e: -SourceLogVolumeName l:`
                 -DestinationComputerName DEMOSRV-2 -DestinationVolumeName e: -DestinationLogVolumeName l: -DurationInMinutes 30 -ResultPath c:\temp

#Configure the server-to-server replication, specifying the source and destination disks, 
#the source and destination logs, the source and destination nodes, and the log size.
New-SRPartnership -SourceComputerName DEMOSRV-1 -SourceRGName rg01 -SourceVolumeName e: -SourceLogVolumeName l: `
                 -DestinationComputerName DEMOSRV-2 -DestinationRGName rg02 -DestinationVolumeName e: -DestinationLogVolumeName l:


#To get replication source and destination state, use Get-SRGroup and Get-SRPartnership as follows:
Get-SRGroup
Get-SRPartnership
(Get-SRGroup).replicas


#On the source server, run the following command and examine events 5015, 5002, 5004, 1237, 5001, and 2200:
Get-WinEvent -ProviderName Microsoft-Windows-StorageReplica -max 20

#On the destination server, run the following command to see 
#the Storage Replica events that show creation of the partnership. 
#This event states the number of copied bytes and the time taken. Example:
Get-WinEvent -ProviderName Microsoft-Windows-StorageReplica | Where-Object {$_.ID -eq "1215"} | fl

#Alternatively, the destination server group for the replica 
#states the number of byte remaining to copy at all times, 
#and can be queried through PowerShell. For example:
(Get-SRGroup).Replicas | Select-Object numofbytesremaining


#As a progress sample (that will not terminate):
while($true) {

 $v = (Get-SRGroup -Name "RG02").replicas | Select-Object numofbytesremaining
 [System.Console]::Write("Number of bytes remaining: {0}`r", $v.numofbytesremaining)
 Start-Sleep -s 5
}

#On the destination server, run the following command and examine events 5009, 
#1237, 5001, 5015, 5005, and 2200 to understand the processing progress. 
#There should be no warnings of errors in this sequence. There will be many 1237 events; these indicate progress.
Get-WinEvent -ProviderName Microsoft-Windows-StorageReplica | FL


#To move the replication direction from one site, use the Set-SRPartnership cmdlet.
Set-SRPartnership -NewSourceComputerName sr-srv06 -SourceRGName rg02 -DestinationComputerName sr-srv05 -DestinationRGName rg01

#To remove replication, use Get-SRGroup, Get-SRPartnership, Remove-SRGroup, 
#and Remove-SRPartnership on each node. Ensure you run the Remove-SRPartnership 
#cmdlet on the current source of replication only, not on the destination server. 
#Run Remove-SRGroup on both servers. For example, to remove all replication from two servers:
Get-SRPartnership
Get-SRPartnership | Remove-SRPartnership
Get-SRGroup | Remove-SRGroup