# Hermes Agent en una "VM" (contenedor Docker con escritorio)

Igual que la versión OpenClaw, pero con [Hermes Agent](https://github.com/NousResearch/hermes-agent) (Nous Research).
Escritorio en `http://localhost:6081` (puerto distinto, pueden correr las dos a la vez).

1. Docker Desktop (WSL2).
2. `cd hermes` y `PowerShell -ExecutionPolicy Bypass -File start.ps1` (la 1ª vez crea `.env`; pon `VNC_PASSWORD`).
3. En la terminal de la VM: `~/scripts/setup-hermes.sh` (modelo + QR de WhatsApp + gateway).
4. Para limitar quién le escribe: `WHATSAPP_ALLOWED_USERS=<numero con codigo de pais>` en `~/.hermes/.env`.

Probado: instalador oficial y `hermes --version`/`hermes whatsapp` en Linux. El build Docker no se pudo probar aquí.
