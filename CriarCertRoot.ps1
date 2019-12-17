﻿#
# Script.ps1
#
$cert = New-SelfSignedCertificate -Type Custom -KeySpec Signature `
	-Subject "CN=VPN-Server" -KeyExportPolicy Exportable -HashAlgorithm sha256 `
	-KeyLength 2048 -CertStoreLocation "Cert:\CurrentUser\My" -KeyUsageProperty Sign `
	-KeyUsage CertSign


New-SelfSignedCertificate -Type Custom -DnsName vpn -KeySpec Signature `
	-Subject "VPN-Client" -KeyExportPolicy Exportable  -HashAlgorithm sha256 `
	-KeyLength 2048 -CertStoreLocation "Cert:\CurrentUser\My" `
	-Signer $cert -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.2")