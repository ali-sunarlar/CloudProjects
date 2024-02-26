

Initialize-Disk -Number 1

New-Partition -DiskNumber 1 -UseMaximumSize -DriveLetter E

Format-Volume -DriveLetter E -FileSystem ReFS

Initialize-Disk -Number 2

New-Partition -DiskNumber 2 -UseMaximumSize -DriveLetter F

Format-Volume -DriveLetter F -FileSystem ReFS

Initialize-Disk -Number 3

New-Partition -DiskNumber 3 -UseMaximumSize -DriveLetter G

Format-Volume -DriveLetter G -FileSystem ReFS

Initialize-Disk -Number 4

New-Partition -DiskNumber 4 -UseMaximumSize -DriveLetter Q

Format-Volume -DriveLetter Q -FileSystem ReFS
