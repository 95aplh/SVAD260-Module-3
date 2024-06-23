# Import the GroupPolicy module
Import-Module GroupPolicy

# Define the GPO name and description
$GPOName = "AccountLockoutDurationPolicyGPO"
$GPODescription = "Ensures 'Account lockout duration' is set to '15 or more minute(s)'"

# Create a new GPO
New-GPO -Name $GPOName -Comment $GPODescription -Domain "CalmChaos.com" -Verbose

# Get the GPO by name
$GPO = Get-GPO -Name $GPOName

# Define the Account Lockout Duration setting
$AccountLockoutDuration = 15

# Configure the 'Account lockout duration' setting
Set-GPRegistryValue -Name $GPOName -Key "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SeCEdit" -ValueName "AccountLockoutDuration" -Type DWORD -Value $AccountLockoutDuration -Verbose

# Link the GPO to the desired Organizational Unit (OU)
# Replace "OU=YourOU,DC=yourdomain,DC=com" with the desired OU's distinguished name
New-GPLink -Name $GPOName -Target "DC=CalmChaos,DC=com" -Verbose

# Pause to see error messages
Read-Host -Prompt "Press Enter to exit"