# Variables
$domainName = "CalmChaos.com"
$safeModeAdminPassword = ConvertTo-SecureString "YourSafeModePassword" -AsPlainText -Force

# Promote the server to a new forest
Install-ADDSForest `
    -DomainName $domainName `
    -SafeModeAdministratorPassword $safeModeAdminPassword `
    -InstallDns `
    -Force