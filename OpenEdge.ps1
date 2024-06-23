# Define the action to open a website with Microsoft Edge
$action = New-ScheduledTaskAction -Execute 'msedge.exe' -Argument 'https://cataas.com/cat'

# Define the trigger to run every five minutes
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).Date.AddMinutes(1) -RepetitionInterval (New_Timespan -Minutes 5) -RepetitionDuration (New-TimeSpan -Days 1)

# Register the scheduled task
$taskName = "OpenWebsiteEveryFiveMinutes"
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description "Opens https://cataas.com/cat every five minutes"

# Output confirmation message
Write-Output "Scheduled task '$taskName' has been created to open https://cataas.com/cat every five minutes."