# Lanzador para Windows: PowerShell -ExecutionPolicy Bypass -File start.ps1
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
  Write-Host "Instala Docker Desktop (con WSL2): https://www.docker.com/products/docker-desktop/"
  exit 1
}
if (-not (Test-Path .env)) {
  Copy-Item .env.example .env
  Write-Host "Se creo .env. Edita VNC_PASSWORD y vuelve a ejecutar."
  notepad .env
  exit 0
}
docker compose up -d --build
Start-Process "http://localhost:6081/vnc.html?autoconnect=1&resize=scale"
Write-Host "Escritorio: http://localhost:6081  (usa la contrasena de .env)"
Write-Host "Dentro de la VM abre la terminal y ejecuta: ~/scripts/setup-hermes.sh"
