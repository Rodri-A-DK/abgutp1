# Escritorio Linux aislado (XFCE + noVNC + Chromium) con Hermes Agent instalado.
FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive LANG=es_ES.UTF-8 DISPLAY=:1

RUN apt-get update && apt-get install -y --no-install-recommends \
      ca-certificates curl gnupg git sudo procps xz-utils \
      xfce4 xfce4-terminal dbus-x11 tigervnc-standalone-server \
      novnc websockify chromium fonts-noto-color-emoji fonts-liberation \
    && curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash claw
USER claw
WORKDIR /home/claw
ENV PATH=/home/claw/.local/bin:$PATH

# Hermes Agent (NousResearch) via su instalador oficial; trae uv/Python y el puente WhatsApp (Baileys).
RUN curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh \
      | bash -s -- --non-interactive --skip-browser

COPY --chown=claw:claw scripts/ /home/claw/scripts/
RUN chmod +x /home/claw/scripts/*.sh

EXPOSE 6080
ENTRYPOINT ["/home/claw/scripts/entrypoint.sh"]
