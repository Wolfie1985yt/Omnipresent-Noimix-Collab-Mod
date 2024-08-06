// Write the output to a temporary file in the batch file
@echo off
powershell.exe -File "%~dp0get_total_ram.ps1" > "%~dp0output.txt"