$totalMemory = (Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory
[System.IO.File]::WriteAllText("shared/data/output.txt", $totalMemory)
