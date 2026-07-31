FROM ghcr.io/lizardbyte/sunshine:v2026.730.3043-ubuntu-24.04@sha256:9bacaa0ed361ca190cf3e9645b9dc514b229f5a9c1f35b2278901d04b564e56d

USER root

RUN apt-get update \
    && apt-get install --no-install-recommends --yes \
        intel-media-va-driver \
        libva-drm2 \
        libva-x11-2 \
        libxrandr2 \
    && rm -rf /var/lib/apt/lists/*

LABEL org.opencontainers.image.source="https://github.com/listrate/sunshine-gaming-image" \
      org.opencontainers.image.title="Sunshine gaming host" \
      org.opencontainers.image.version="v2026.730.3043-ubuntu-24.04.1"

USER lizard
