#!/bin/bash
# Ejecuta esto DENTRO del escritorio (terminal de la VM) la primera vez.
set -e
echo "1) Elige proveedor/modelo y pega tu API key:"
hermes model
echo
echo "2) Vincular WhatsApp (escanea el QR con tu celular):"
hermes whatsapp
echo
echo "3) Iniciando el gateway (Ctrl+C para parar; 'hermes gateway install' lo deja como servicio):"
hermes gateway
