# Path to the CSV file
$csvFilePath = "C:\Users\95apl\Desktop\FakeEmployees.csv"

# Import the CSV file
$userList = Import-Csv -Path $csvFilePath

# Iterate through each user in the CSV
foreach ($user in $userList) {
    # Create the username
    $username = "$($user.FirstName).$($user.LastName)".ToLower()
    
    # Check if the user already exists
    $userExists = Get-LocalUser -Name $username -ErrorAction SilentlyContinue

    if ($userExists -eq $null) {
        # Generate a default password (you may want to modify this to a more secure method)
        $password = "P@ssw0rd" + $user.EmployeeID
        
        # Create the new local user
        New-LocalUser -Name $username `
                      -Password (ConvertTo-SecureString $password -AsPlainText -Force) `
                      -FullName "$($user.FirstName) $($user.LastName)" `
                      -Description $user.EmployeeID
        
        Write-Host "User $username created successfully."
    } else {
        Write-Host "User $username already exists."
    }
}

Write-Host "User creation process completed."

# Pause the script and wait for the user to press Enter.
Read-Host -Prompt "Press Enter to continue."