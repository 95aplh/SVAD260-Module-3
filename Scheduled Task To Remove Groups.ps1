# Define the task name and description
$taskName = "RemoveUsersFromGroups"
$taskDescription = "Scheduled task to remove users from groups every night."

# Define the path to the PowerShell script
$scriptPath = "C:\Scripts\RemoveUsersFromGroups.ps1"  # Replace with the actual path to the script

# Register the scheduled task
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -File $scriptPath"
$trigger = New-ScheduledTaskTrigger -Daily -At "01:00 AM"
$principal = New-ScheduledTaskPrincipal -UserID "Domain\TheHammer$" -LogonType ServiceAccount
Register-ScheduledTask -TaskName $taskName -Description $taskDescription -Action $action -Trigger $trigger -Principal $principal