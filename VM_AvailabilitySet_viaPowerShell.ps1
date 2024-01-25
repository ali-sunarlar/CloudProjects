$cred=get-credential
New-AzVm `
    -ResourceGroupName "RG1-lod37271352" `
    -Name "VM2" `
    -Location "East US" `
    -Size "Standard_DS1_v2" `
    -Image "Win2019Datacenter" `
    -VirtualNetworkName "labnet" `
    -SubnetName "default" `
    -SecurityGroupName "VM2-nsg" `
    -PublicIpAddressName "VM2-ip" `
    -PublicIPSku "Standard" `
    -OpenPorts 80,3389 `
    -AvailabilitySetName "BackEndAvSet" `
    -Credential $cred

    