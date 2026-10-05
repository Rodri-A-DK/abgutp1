# OpenClaw en una "VM" (contenedor Docker con escritorio)

Un escritorio Linux aislado, con OpenClaw instalado, Chromium y WhatsApp Web,
al que entras desde el navegador de Windows (`http://localhost:6080`).

## Uso (Windows)
1. Instala **Docker Desktop** (WSL2).
2. En PowerShell: `PowerShell -ExecutionPolicy Bypass -File start.ps1`
   (la primera vez crea `.env`; pon tu `VNC_PASSWORD` y vuelve a ejecutarlo).
3. Se abre el escritorio. Escanea el QR de WhatsApp Web en Chromium si quieres usarlo como navegador de trabajo.
4. En la terminal de la VM: `~/scripts/setup-openclaw.sh` (onboarding + vincular WhatsApp).
5. `stop.ps1` para apagar. Los datos persisten en el volumen `openclaw-home`.

## Seguridad
- Puerto solo en `127.0.0.1`; sin carpetas de Windows montadas.
- Empieza con lista blanca de contactos y modo "pedir aprobación".
- Usar un número de prueba reduce el riesgo de baneo de WhatsApp.

## Pendiente de verificar
Los comandos de OpenClaw (`onboard`, `channels login`) salen de su documentación
pública vista parcialmente; no pude abrir docs.openclaw.ai desde este entorno ni
probar el build de Docker. Revisa que coincidan con tu versión.
