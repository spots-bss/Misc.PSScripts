# Optionally enable required Windows features if needed
Enable-WindowsOptionalFeature -Online -FeatureName containers –All
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V –All

curl.exe -o "c:\Temp\Docker.zip" -LO "https://download.docker.com/win/static/stable/x86_64/docker-24.0.5.zip"
Expand-Archive "c:\Temp\Docker.zip" -DestinationPath "C:\Program Files" -Force
[Environment]::SetEnvironmentVariable("Path", "$($env:path);C:\Program Files\Docker", [System.EnvironmentVariableTarget]::Machine)
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

New-Item -Path "C:\Program Files\Docker\" -Name "config" -ItemType Directory -Force
New-Item -Path "C:\Program Files\Docker\config\" -Name "daemon.json" -ItemType File -Force -Value "{
  `"experimental`": false
}"

cd "C:\Program Files\Docker\"
dockerd --config-file "C:\Program Files\docker\config\daemon.json" --register-service
Start-Service docker
docker run hello-world