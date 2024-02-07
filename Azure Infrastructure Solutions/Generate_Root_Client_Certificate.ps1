#Generate Root Certificate

$cert = New-SelfSignedCertificate -Type Custom -KeySpec Signature -Subject "CN=RootCert" `
-KeyExportPolicy Exportable -HashAlgorithm sha256 -KeyLength 2048 `
-CertStoreLocation "Cert:\CurrentUser\My" -KeyUsageProperty Sign -KeyUsage CertSign

#Generate VPN Client Certificate

New-SelfSignedCertificate -Type Custom -DnsName ClientCert -KeySpec Signature `
-Subject "CN=ClientCert" -KeyExportPolicy Exportable `
-HashAlgorithm sha256 -KeyLength 2048 -CertStoreLocation "Cert:\CurrentUser\My" `
-Signer $cert -TextExtension @("2.5.29.37={test}1.3.6.1.5.5.7.3.2")


