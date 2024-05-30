# Liste des serveurs
$servers = @("Server1", "Server2", "Server3")


$sourceFile = "C:\path\to\source\file.txt"
$destinationPath = "C:\path\to\destination"

function Invoke-Deployment {
    param (
        [string]$server
    )
    Invoke-Command -ComputerName $server -ScriptBlock {
        #commande a exécuter
        Copy-Item -Path $sourceFile -Destination "\\$Server\$destinationPath" -Force

    }
}

foreach ($server in $servers) {
    Invoke-Deployment -server $server
}

# Read a text file
$fileContent = Get-Content -Path "C:\Users\karib\Downloads\file.txt"

# Process the file content
foreach ($line in $fileContent) {
    # Do something with each line
    Write-Host $line
}




# Import the Active Directory module
Import-Module ActiveDirectory

# Function to get the creation date of an AD user
function Get-ADUserCreationDate {
    param (
        [string]$username
    )
    $user = Get-ADUser -Identity $username -Properties whenCreated
    return $user.whenCreated
}

# Usage example
$username = "your_username"
$creationDate = Get-ADUserCreationDate -username $username
Write-Host "Creation date of $username: $creationDate"