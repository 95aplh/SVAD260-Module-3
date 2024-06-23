# Import the Active Directory module
Import-Module ActiveDirectory

# Define the gMSA name
$gMSAName = "TheHammer"

# Create the gMSA
try {
    New-ADServiceAccount -Name $gMSAName -PrincipalsAllowedToRetrieveManagedPassword "Domain Computers"
    Write-Host "Group Managed Service Account '$gMSAName' created successfully."
} catch {
    Write-Host "Error occurred while creating the Group Managed Service Account '$gMSAName':"
    Write-Host $_.Exception.Message
}

# Keep PowerShell open
Write-Host "Press Enter to exit..."
$null = Read-Host
