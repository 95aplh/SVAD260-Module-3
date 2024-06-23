# Define the folder path
$folderPath = "C:\catphotos"

# Define users/groups to remove read permissions from
$usersToRemoveRead = @("calmchaos\aphillips", "calmchaos\sphillips")

# Function to remove read permissions from a user/group
function Remove-ReadPermissions {
    param (
        [string]$Path,
        [string]$UserToRemove
    )
    $acl = Get-Acl -Path $Path
    $acl | ForEach-Object {
        if ($_.IdentityReference -eq $UserToRemove) {
            $_ | ForEach-Object {
                if ($_.FileSystemRights -band [System.Security.AccessControl.FileSystemRights]::Read) {
                    $_.FileSystemRights -= [System.Security.AccessControl.FileSystemRights]::Read
                }
            }
        }
    }
    Set-Acl -Path $Path -AclObject $acl
}

# Check if the folder exists
if (-Not (Test-Path -Path $folderPath)) {
    Write-Output "The folder at $folderPath does not exist."
} else {
    # Remove read permissions for each user/group
    foreach ($user in $usersToRemoveRead) {
        Remove-ReadPermissions -Path $folderPath -UserToRemove $user
        Write-Output "Read permissions removed from $user on $folderPath"
    }
}

# Rest of your script (if any) can continue here...
Write-Output "Continuing with the script..."