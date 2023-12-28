$result= Compare-Object -ReferenceObject $(Get-Content text1.txt) -DifferenceObject $(Get-Content text2.txt) | Select-Object -Property InputObject 
$result.InputObject



#Compare-Object -referenceObject $(Get-Content text1.txt) -differenceObject $(Get-Content text1.txt) | %{$_.Inputobject + $_.SideIndicator} | ft -auto #| out-file $Location -width 5000