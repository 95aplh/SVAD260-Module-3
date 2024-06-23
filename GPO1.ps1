# Import the GroupPolicy module
Import-Module GroupPolicy

# Define the GPO name and description
$GPOName = "PasswordHistoryPolicy"
$GPODescription = "Enforces password history policy of 24 or more passwords"

# Create a new GPO
New-GPO -Name $GPOName -Comment $GPODescription -Domain "CalmChaos.com" -Verbose

# Get the GPO by name
$GPO = Get-GPO -Name $GPOName

# Configure password history policy
$PasswordHistoryPolicy = @{
    "PasswordHistorySize" = 24
}

# Set the password history policy
Set-GPRegistryValue -Name $GPOName -Key "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SeCEdit" -ValueName "PasswordHistorySize" -Type DWORD -Value 24 -Verbose

# Link the GPO to the desired Organizational Unit (OU)
# Replace "OU=YourOU,DC=yourdomain,DC=com" with the desired OU's distinguished name
New-GPLink -Name PasswordHistoryPolicy -Target "DC=CalmChaos,DC=com" -Verbose

# Pause to see error messages
Read-Host -Prompt "Press Enter to exit"