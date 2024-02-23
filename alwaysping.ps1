$computers = "192.168.2.4","192.168.2.6"
foreach ($computer in $computers){
$ports= Import-Csv  C:\Temp\portlist.csv -Verbose
foreach ($port in $ports){
Test-NetConnection -ComputerName $computer -Port $port.ports |Select-Object ComputerName,RemoteAddress,RemotePort,TcpTestSucceeded,PingSucceeded,NameResolutionSucceeded,PingReplyDetails | Export-Csv -Append c:\temp\portcheck.csv
}
}





while($true) {
    Test-NetConnection -ComputerName 192.168.2.6 -Port 445
    Start-Sleep -s 5
   }