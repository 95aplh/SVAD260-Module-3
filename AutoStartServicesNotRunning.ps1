# Get all services that are set to start automatically but are not currently running
$autoStartServicesNotRunning = Get-Service | Where-Object { $_.StartType -eq 'Automatic' -and $_.Status -ne 'Running' }

# Display the services with their current status
$autoStartServicesNotRunning | Select-Object Name, DisplayName, Status | Format-Table -AutoSize

Write-Host "Services set to auto start but not running identified successfully."

# Pause the script and wait for the user to press Enter
Read-Host -Prompt "Press Enter to continue"