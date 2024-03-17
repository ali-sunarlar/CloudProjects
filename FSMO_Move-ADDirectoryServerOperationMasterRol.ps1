Move-ADDirectoryServerOperationMasterRole -Identity $env:COMPUTERNAME –OperationMasterRole DomainNamingMaster,PDCEmulator,RIDMaster,SchemaMaster,InfrastructureMaster




Get-ADObject -Identity "CN=SYSVOL Subscription,CN=Domain System Volume,CN=DFSR-LocalSettings,CN=JVSRVZEUS,OU=Domain Controllers,DC=jverne,DC=com" -Properties * |

Set-ADObject -Replace @{'msDFSR-Enabled'=$false; 'msDFSR-options'=1}

Start-Service DFSR

Get-ADObject -Identity "CN=SYSVOL Subscription,CN=Domain System Volume,CN=DFSR-LocalSettings,CN=JVSRVZEUS-1,OU=Domain Controllers,DC=jverne,DC=com" -Properties * |

 Set-ADObject -Replace @{'msDFSR-Enabled'=$false}


Get-ADDomainController -Server $env:COMPUTERNAME -Filter * | % { Update-DfsrConfigurationFromAD -ComputerName $_.name -Verbose }

Dfsrmig /getmigrationstate

Dfsrmig /getglobalstate

GPUPDATE /FORCE

DFSRMIG.EXE /CREATEGLOBALOBJECTS

DFSRDIAG.EXE POLLAD
DFSRMIG.EXE /GETMIGRATIONSTATE

Dfsrmig /getmigrationstate

Dcdiag /e /test:sysvolcheck /test:advertising

Get-ADDomainController -Server $env:COMPUTERNAME -Filter * | % { Update-DfsrConfigurationFromAD -ComputerName $_.name -Verbose }

Repadmin /syncall /force /APed

Dfsrmig /getmigrationstate

dfsrdiag /pollad

DFSRMIG.EXE /GetMigrationState

net stop netlogon
net start netlogon
net stop DFSR
net start DFSR

GPUPDATE /FORCE

DFSRMIG.EXE /CREATEGLOBALOBJECTS


Restart-Service -Name Dfs
Restart-Service -Name DFSR
Restart-Service -Name Netlogon

dfsrmig /getglobalstate

dfsrmig /pollad

dfsrmig /CreateGlobalObjects

repadmin /syncall /force /APed

Get-ADDomainController -Server JVSRVZEUS -Filter * | %{Update-DfsrConfigurationFromAD -ComputerName $_.name -Verbose}

dfsrmig /setglobalstate 0

dfsrmig /setglobalstate 1

dfsrmig /setglobalstate 2

dfsrmig /setglobalstate 3

dfsrmig /getmigrationstate

dcdiag /e /test:sysvolcheck /test:advertising
