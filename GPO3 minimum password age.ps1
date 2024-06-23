# Import the GroupPolicy module
Import-Module GroupPolicy

# Define the GPO name and description
$GPOName = "PasswordPolicyGPO"
$GPODescription = "Ensures 'Minimum password age' is set to '1 or more day(s)'"

# Create a new GPO
New-GPO -Name $GPOName -Comment $GPODescription -Domain "CalmChaos.com" -Verbose

# Get the GPO by name
$GPO = Get-GPO -Name $GPOName

# Define the Minimum Password Age setting
$MinimumPasswordAge = 1

# Configure the 'Minimum password age' setting
Set-GPRegistryValue -Name $GPOName -Key "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SeCEdit" -ValueName "MinimumPasswordAge" -Type DWORD -Value $MinimumPasswordAge -Verbose

# Link the GPO to the desired Organizational Unit (OU)
# Replace "OU=YourOU,DC=yourdomain,DC=com" with the desired OU's distinguished name
New-GPLink -Name $GPOName -Target "DC=CalmChaos,DC=com" -Verbose

# Pause to see error messages
Read-Host -Prompt "Press Enter to exit"