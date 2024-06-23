# Define the folder path
$folderPath = "C:\catphotos"

# Function to display the permissions
function Display-Permissions {
    param (
        [string]$Path
    )
    Write-Output "Permissions for folder: $Path"
    $acl = Get-Acl -Path $Path
    foreach ($access in $acl.Access) {
        Write-Output "User/Group: $($access.IdentityReference)"
        Write-Output "Permissions: $($access.FileSystemRights)"
        Write-Output "Access Control Type: $($access.AccessControlType)"
        Write-Output "Inheritance Flags: $($access.InheritanceFlags)"
        Write-Output "Propagation Flags: $($access.PropagationFlags)"
        Write-Output "-------------------------------"
    }
}

# Check if the folder exists
if (-Not (Test-Path -Path $folderPath)) {
    Write-Output "The folder at $folderPath does not exist."
} else {
    # Display the permissions
    Display-Permissions -Path $folderPath

    # Prompt the user to press Enter to continue
    Write-Output "Press Enter to continue..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

# Rest of your script (if any) can continue here...
Write-Output "Continuing with the script..."