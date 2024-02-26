Get-NetAdapter

#yeniden adlandirma
Rename-NetAdapter -Name "Ethernet0" -NewName "internal1"
Rename-NetAdapter -Name "Ethernet2" -NewName "iscsi1"
Rename-NetAdapter -Name "Ethernet6" -NewName "livemigration"
Rename-NetAdapter -Name "Ethernet7" -NewName "heartbeat"

#static ip belirleme
Remove-NetIPAddress -InterfaceAlias Internal2 -confirm:$False
Remove-NetIPAddress -InterfaceAlias iscsi1 -confirm:$False
Remove-NetIPAddress -InterfaceAlias iscsi2 -confirm:$False
Remove-NetIPAddress -InterfaceAlias livemigration -confirm:$False
Remove-NetIPAddress -InterfaceAlias heartbeat -confirm:$False

New-NetIPAddress -InterfaceAlias Internal2 -IPAddress 172.16.24.130 -PrefixLength 24 -DefaultGateway 172.16.24.1
New-NetIPAddress -InterfaceAlias iscsi1 -IPAddress 172.16.51.12 -PrefixLength 24 -DefaultGateway 172.16.51.1
New-NetIPAddress -InterfaceAlias iscsi2 -IPAddress 172.16.52.12 -PrefixLength 24 -DefaultGateway 172.16.52.1
New-NetIPAddress -InterfaceAlias iscsi3 -IPAddress 172.16.53.12 -PrefixLength 24 -DefaultGateway 172.16.53.1
New-NetIPAddress -InterfaceAlias iscsi4 -IPAddress 172.16.54.12 -PrefixLength 24 -DefaultGateway 172.16.54.1
New-NetIPAddress -InterfaceAlias livemigration -IPAddress 172.16.130.12 -PrefixLength 24 -DefaultGateway 172.16.130.1
New-NetIPAddress -InterfaceAlias heartbeat -IPAddress 172.16.140.12 -PrefixLength 24 -DefaultGateway 172.16.140.1


#gateway kaldirma
Get-NetAdapter -Name internal2 | Remove-NetRoute
Get-NetAdapter -Name iscsi2 | Remove-NetRoute

