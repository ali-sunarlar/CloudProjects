Get-NetAdapter

Remove-NetIPAddress -InterfaceAlias Internal2 -confirm:$False
New-NetIPAddress -InterfaceAlias Internal2 -IPAddress 172.16.1.2 -PrefixLength 24 -DefaultGateway 172.16.1.1