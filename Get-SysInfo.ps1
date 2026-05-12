Write-Host "Starting System Information Check..."
Get-ComputerInfo | Select-Object CsName, OsOperatingSystemSKU, OsArchitecture
Write-Host "Script execution finished."
