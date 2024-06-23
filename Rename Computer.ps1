# Define the new computer name
$newComputerName = "Sasha"

# Rename the computer
Rename-Computer -NewName $newComputerName -Force -Verbose

# Restart the computer to apply the changes
Restart-Computer -Force