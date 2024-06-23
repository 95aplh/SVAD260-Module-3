# Import the Active Directory module
Import-Module ActiveDirectory

# Define users to remove
$usersToRemove = @("calmchaos\aphillips", "calmchaos\sphillips")

# Define groups to remove users from
$groups = @("Group1", "Group2")  # Replace "Group1" and "Group2" with actual group names

# Remove users from groups
foreach ($user in $usersToRemove) {
    foreach ($group in $groups) {
        Remove-ADGroupMember -Identity $group -Members $user -Confirm:$false
        Write-Output "Removed user $user from group $group"
    }
}