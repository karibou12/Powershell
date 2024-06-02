param(
    [Parameter(Mandatory=$true)]
    [string]$ServerGroupName
)

# Chemin du fichier JSON contenant les groupes de serveurs et les configurations
$jsonFilePath = "C:\Users\karib\Downloads\servers.json"

# Lire le contenu du fichier JSON
$jsonContent = Get-Content -Path $jsonFilePath -Raw
$jsonData = $jsonContent | ConvertFrom-Json

# Trouver le groupe de serveurs correspondant
$serverGroup = $jsonData.server_groups | Where-Object { $_.name -eq $ServerGroupName }

if ($serverGroup) {
    # Récupérer la configuration nr.conf pour ce groupe
    $nrConfig = $serverGroup.nr_config

    # Itérer sur chaque serveur du groupe
    foreach ($server in $serverGroup.servers) {
        $serverName = $server.name
        $serverIP = $server.ip

        Copy-Item -Path $nrConfig  -Destination "C:\\Users\\karib\\Downloads\\test.txt" -Force
    }
} else {
    Write-Warning "Groupe de serveurs '$ServerGroupName' introuvable."
}



# ./deploy.ps1 -ServerGroupName groupe1


