# Define variables
$folderPath = "C:\catphotos"
$shareName = "CatPhotos"
$description = "Shared folder for cat photos"
$writeUser = "calmchaos\sphillips"
$readOnlyGroup = "Everyone"

# Create the folder if it does not exist
if (-Not (Test-Path -Path $folderPath)) {
    New-Item -ItemType Directory -Path $folderPath
    Write-Output "Folder created at $folderPath"
} else {
    Write-Output "Folder already exists at $folderPath"
}

# Set NTFS permissions
$acl = Get-Acl $folderPath

# Remove existing permissions
$acl.SetAccessRuleProtection($true, $false)
$acl.Access | ForEach-Object { $acl.RemoveAccessRule($_) }

# Create new access rules
$writeAccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($writeUser, "Modify", "ContainerInherit, ObjectInherit", "None", "Allow")
$readAccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($readOnlyGroup, "Read", "ContainerInherit, ObjectInherit", "None", "Allow")

# Add the access rules to the ACL
$acl.AddAccessRule($writeAccessRule)
$acl.AddAccessRule($readAccessRule)

# Apply the updated ACL to the folder
Set-Acl $folderPath $acl
Write-Output "NTFS permissions set: $writeUser has write access, $readOnlyGroup has read-only access"

# Create the share
New-SmbShare -Name $shareName -Path $folderPath -Description $description -FullAccess $writeUser -ReadAccess $readOnlyGroup
Write-Output "Shared folder $shareName created with specific access permissions"