Get-ChildItem -Recurse -path C:\Temp1 |Select-Object Name,Exists,Extension,Length,CreationTime,LastAccessTime,LastWriteTime,Directory,FullName |export-csv .\temp1.csv
$temp1 = Get-Content .\temp1.csv
Get-ChildItem -Recurse -path C:\Temp2 |Select-Object Name,Exists,Extension,Length,CreationTime,LastAccessTime,LastWriteTime,Directory,FullName |Export-Csv .\temp2.csv
$temp2  = Get-Content .\temp2.csv

Compare-Object -ReferenceObject $temp1 -DifferenceObject $temp2

