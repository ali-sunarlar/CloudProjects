#iSCSI Initiator Service
get-service msiscsi
set-service -name msiscsi -startuptype automatic
start-service msiscsi

new-iscsitargetportal -TargetPortalAddress 172.16.51.10

#ISCSI server 
new-iscsitargetportal -TargetPortalAddress 172.16.51.10
new-iscsitargetportal -TargetPortalAddress 172.16.52.10
new-iscsitargetportal -TargetPortalAddress 172.16.53.10
new-iscsitargetportal -TargetPortalAddress 172.16.54.10

#ISCSI NodeAddress ogrenilir
Get-IscsiTarget

#Connect
Connect-IscsiTarget -nodeaddress iqn.1991-05.com.microsoft:demoiscsi1-storagelun1target-target `
-IsPersistent $true -IsMultipathEnabled $true -InitiatorPortalAddress 172.16.51.12 -TargetPortalAddress 172.16.51.10

Connect-IscsiTarget -nodeaddress iqn.1991-05.com.microsoft:demoiscsi1-storagelun2target-target `
-IsPersistent $true -IsMultipathEnabled $true -InitiatorPortalAddress 172.16.52.12 -TargetPortalAddress 172.16.52.10

Connect-IscsiTarget -nodeaddress iqn.1991-05.com.microsoft:demoiscsi1-storagelun3target-target `
-IsPersistent $true -IsMultipathEnabled $true -InitiatorPortalAddress 172.16.53.12 -TargetPortalAddress 172.16.53.10

Connect-IscsiTarget -nodeaddress iqn.1991-05.com.microsoft:demoiscsi1-storagelunquorumtarget-target `
-IsPersistent $true -IsMultipathEnabled $true -InitiatorPortalAddress 172.16.54.12 -TargetPortalAddress 172.16.54.10

#list iscsi connection
Get-IscsiConnection