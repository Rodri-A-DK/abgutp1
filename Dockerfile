# Escritorio Linux aislado (XFCE + noVNC + Chromium) con OpenClaw instalado.
FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive LANG=es_ES.UTF-8 DISPLAY=:1

RUN apt-get update && apt-get install -y --no-install-recommends \
      ca-certificates curl gnupg git sudo procps \
      xfce4 xfce4-terminal dbus-x11 tigervnc-standalone-server \
      novnc websockify chromium fonts-noto-color-emoji fonts-liberation \
    && curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Usuario normal, sin privilegios sobre el host.
RUN useradd -m -s /bin/bash claw
USER claw
WORKDIR /home/claw

# OpenClaw (paquete npm "openclaw"), instalado en el home del usuario.
ENV NPM_CONFIG_PREFIX=/home/claw/.npm-global
ENV PATH=/home/claw/.npm-global/bin:$PATH
RUN npm install -g openclaw@latest

COPY --chown=claw:claw scripts/ /home/claw/scripts/
RUN chmod +x /home/claw/scripts/*.sh

EXPOSE 6080
ENTRYPOINT ["/home/claw/scripts/entrypoint.sh"]
