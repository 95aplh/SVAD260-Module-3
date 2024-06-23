# Get and display all running tasks
Get-Process | Sort-Object -Property ProcessName | Format-Table -AutoSize

# Keep the window open
Read-Host "Press Enter to exit"