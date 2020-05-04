param(
    [Parameter(Mandatory)]
    [String]$dockerHost,

    [Parameter()]
    [String]$force
)

#  check if docker cli is insalled
if ((Get-Command "docker.exe" -ErrorAction SilentlyContinue) -eq $null) 
{
   Write-Host "Downloading docker cli and docker-compose cli"
   mkdir "$HOME\docker-client"
   cd "$HOME\docker-client"
   wget https://github.com/Jessie365/docker-workshop/raw/develop/bin/docker.exe -OutFile docker.exe
   wget https://github.com/Jessie365/docker-workshop/raw/develop/bin/docker-compose.exe -OutFile docker-compose.exe
   $envPath = [System.Environment]::GetEnvironmentVariable('PATH', [System.EnvironmentVariableTarget]::User)
   $envPath += "$HOME\docker-client"
   [System.Environment]::SetEnvironmentVariable('PATH', $envPath, [System.EnvironmentVariableTarget]::User)
}

if (([System.Environment]::GetEnvironmentVariable('DOCKER_HOST', [System.EnvironmentVariableTarget]::User)) -eq $null -OR $force  -eq "force")
{
    [System.Environment]::SetEnvironmentVariable('DOCKER_HOST', $dockerHost, [System.EnvironmentVariableTarget]::User)
}
else
{
    Write-Host "WARNING! DOCKER_HOST is already set!"
    Write-Host "Usage:"
    Write-Host".\setup-docker-win.ps1 IP_ADDRESS:PORT [force]"
}
