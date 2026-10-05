#!/bin/bash
# Ejecuta esto DENTRO del escritorio (terminal de la VM) la primera vez.
set -e
echo "1) Asistente de OpenClaw: elige modelo, pega tu API key, define instrucciones."
openclaw onboard
echo
echo "2) Vincular WhatsApp (escanea el QR con tu celular):"
openclaw channels login
echo
echo "Listo. Revisa 'openclaw --help' para iniciar el gateway/agente."
