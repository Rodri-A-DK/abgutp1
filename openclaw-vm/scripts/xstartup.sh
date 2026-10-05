#!/bin/bash
unset SESSION_MANAGER DBUS_SESSION_BUS_ADDRESS
# Abre WhatsApp Web y una terminal para configurar OpenClaw.
chromium --no-sandbox --user-data-dir=$HOME/chromium-profile https://web.whatsapp.com &
xfce4-terminal &
exec startxfce4
