# Import the GroupPolicy module
Import-Module GroupPolicy

# Define the GPO name and description
$GPOName = "AuditPolicyChangeGPO"
$GPODescription = "Ensures 'Audit Audit Policy Change' is set to include 'Success'"

# Create a new GPO
New-GPO -Name $GPOName -Comment $GPODescription -Domain "CalmChaos.com" -Verbose

# Get the GPO by name
$GPO = Get-GPO -Name $GPOName

# Define the Audit Policy Change settings
$AuditPolicyChangeSettings = @{
    'AuditPolicyChange' = 'Success'
}

# Configure the 'Audit Audit Policy Change' setting to include 'Success'
foreach ($setting in $AuditPolicyChangeSettings.Keys) {
    Set-GPRegistryValue -Name $GPOName -Key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit" -ValueName $setting -Type String -Value $AuditPolicyChangeSettings[$setting] -Verbose
}

# Link the GPO to the desired Organizational Unit (OU)
# Replace "OU=YourOU,DC=yourdomain,DC=com" with the desired OU's distinguished name
New-GPLink -Name $GPOName -Target "DC=CalmChaos,DC=com" -Verbose

# Pause to see error messages
Read-Host -Prompt "Press Enter to exit"