param(
    [Parameter(Mandatory=$true)]
    [string]$ServerGroupName
    )
    
    # Chemin du fichier YAML contenant les groupes de serveurs et les configurations
    $yamlFilePath = "C:\Users\karib\Downloads\servers.json"

    
    # Installer le module PowerYAML si nécessaire
    if (-not (Get-Module -ListAvailable -Name powershell-yaml)) {
        Install-Module -Name powershell-yaml -Scope CurrentUser -Force
    }
    
    # Importer le module PowerYAML
    Import-Module powershell-yaml
    
    # Lire le contenu du fichier YAML
    $yamlContent = Get-Content -Path $yamlFilePath -Raw
    $yamlData = $yamlContent | ConvertFrom-Yaml
    
    # Trouver le groupe de serveurs correspondant
    $serverGroup = $yamlData.server_groups | Where-Object { $_.name -eq $ServerGroupName }
    
    if ($serverGroup) {
        # Récupérer la configuration nr.conf pour ce groupe
    $nrConfig = $serverGroup.nr_config
    
    # Itérer sur chaque serveur du groupe
    foreach ($server in $serverGroup.servers) {
        $serverName = $server.name
        $serverIP = $server.ip
   
        # Copier le fichier nr.conf sur le serveur distant
        # Copy-Item -Path "C:\temp\$serverName-nr.conf" -Destination "\\$serverIP\C$\path\to\nr.conf"
        Copy-Item -Path $nrConfig  -Destination "C:\\Users\\karib\\Downloads\\test.txt" -Force
    }
} else {
    Write-Warning "Groupe de serveurs '$ServerGroupName' introuvable."
}


# ./deploy_yaml.ps1 -ServerGroupName groupe1
