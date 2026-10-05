#!/bin/bash
set -e
export DISPLAY=:1
mkdir -p ~/.vnc
echo "${VNC_PASSWORD:?Falta VNC_PASSWORD en .env}" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

rm -f /tmp/.X1-lock /tmp/.X11-unix/X1
vncserver :1 -geometry 1440x900 -depth 24 -localhost yes \
  -xstartup /home/claw/scripts/xstartup.sh
websockify --web=/usr/share/novnc 6080 localhost:5901 &

# Mantiene el contenedor vivo.
wait
