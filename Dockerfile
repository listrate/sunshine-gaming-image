FROM ghcr.io/lizardbyte/sunshine:v2026.516.143833-ubuntu-24.04@sha256:7069a0edad37ed76e562302bae783648ac778a94da906dea5dd3d81140f9e85b

USER root

RUN apt-get update \
    && apt-get install --no-install-recommends --yes \
        intel-media-va-driver \
        libegl1 \
        libva-drm2 \
        libva-x11-2 \
        libxcomposite1 \
        libxdamage1 \
        libxinerama1 \
        libxrandr2 \
        libxcb-damage0 \
        x11-utils \
        x11-xserver-utils \
    && rm -rf /var/lib/apt/lists/*

LABEL org.opencontainers.image.source="https://github.com/listrate/sunshine-gaming-image" \
      org.opencontainers.image.title="Sunshine gaming host" \
      org.opencontainers.image.version="v2026.516.143833-ubuntu-24.04.4"

USER lizard
