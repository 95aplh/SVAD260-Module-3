# Get all services that are set to start automatically
$autoStartServices = Get-Service | Where-Object { $_.StartType -eq 'Automatic' }

# Display the services with their current status
$autoStartServices | Select-Object Name, DisplayName, Status | Format-Table -AutoSize

Write-Host "Auto start services identified successfully."

# Pause the script and wait for the user to press Enter
Read-Host -Prompt "Press Enter to continue"