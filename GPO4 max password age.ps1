# Import the GroupPolicy module
Import-Module GroupPolicy

# Define the GPO name and description
$GPOName = "MaxPasswordAgePolicyGPO"
$GPODescription = "Ensures 'Maximum password age' is set to '60 or fewer days, but not 0'"

# Create a new GPO
New-GPO -Name $GPOName -Comment $GPODescription -Domain "CalmChaos.com" -Verbose

# Get the GPO by name
$GPO = Get-GPO -Name $GPOName

# Define the Maximum Password Age setting
$MaximumPasswordAge = 60

# Configure the 'Maximum password age' setting
Set-GPRegistryValue -Name $GPOName -Key "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SeCEdit" -ValueName "MaximumPasswordAge" -Type DWORD -Value $MaximumPasswordAge -Verbose

# Link the GPO to the desired Organizational Unit (OU)
# Replace "OU=YourOU,DC=yourdomain,DC=com" with the desired OU's distinguished name
New-GPLink -Name $GPOName -Target "DC=CalmChaos,DC=com" -Verbose

# Pause to see error messages
Read-Host -Prompt "Press Enter to exit"
