# Import the GroupPolicy module
Import-Module GroupPolicy

# Define the GPO name and description
$GPOName = "PasswordComplexityPolicyGPO"
$GPODescription = "Ensures 'Password must meet complexity requirements' is set to 'Enabled'"

# Create a new GPO
New-GPO -Name $GPOName -Comment $GPODescription -Domain "CalmChaos.com" -Verbose

# Get the GPO by name
$GPO = Get-GPO -Name $GPOName

# Define the Password Complexity setting
$PasswordComplexity = 1  # 1 means Enabled

# Configure the 'Password must meet complexity requirements' setting
Set-GPRegistryValue -Name $GPOName -Key "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SeCEdit" -ValueName "PasswordComplexity" -Type DWORD -Value $PasswordComplexity -Verbose

# Link the GPO to the desired Organizational Unit (OU)
# Replace "OU=YourOU,DC=yourdomain,DC=com" with the desired OU's distinguished name
New-GPLink -Name $GPOName -Target "DC=CalmChaos,DC=com" -Verbose

# Pause to see error messages
Read-Host -Prompt "Press Enter to exit"