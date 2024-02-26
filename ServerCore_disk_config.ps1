

Initialize-Disk -Number 1

New-Partition -DiskNumber 1 -UseMaximumSize -DriveLetter E

Format-Volume -DriveLetter E -FileSystem ReFS


