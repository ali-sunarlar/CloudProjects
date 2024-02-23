w32tm /query /configuration
w32tm /query /source

#The following values are allowed for synchronization parameters with external NTP servers:

#0x1 — SpecialInterval, use of a special polling interval;
#0x2 — UseAsFallbackOnly mode;
#0x4 — SymmetricActive, symmetric active mode;
#0x8 — Client, send request in client mode.

w32tm.exe /config /manualpeerlist:"0.pool.ntp.org,0x8 1.pool.ntp.org,0x8 2.pool.ntp.org,0x8" /syncfromflags:manual /update

#Now you need to advertise the PDC-Emulator as a reliable source of time for domain client:
w32tm /config /reliable:yes

#Now you need to restart the W32Time service on the PDC:
net stop w32time && net start w32time

#To synchronize the time immediately run the command:
w32tm /resync

