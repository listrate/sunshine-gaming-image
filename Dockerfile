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
        libretro-core-info \
        mesa-utils \
        retroarch \
        retroarch-assets \
        xterm \
        x11-utils \
        x11-xserver-utils \
    && rm -rf /var/lib/apt/lists/*

# PCSX2 v2.6.3 is the latest stable upstream release. The GitHub Releases API
# publishes this asset digest; ADD verifies the downloaded bytes during build.
RUN /usr/bin/mkdir -p /opt/pcsx2
ADD --checksum=sha256:8ce7de8613c17b00b01028a512dd1b81998b6626ebbe93a067e0eb20aeedd5bf \
    https://github.com/PCSX2/pcsx2/releases/download/v2.6.3/pcsx2-v2.6.3-linux-appimage-x64-Qt.AppImage \
    /opt/pcsx2/pcsx2.AppImage

COPY scripts/ /usr/local/bin/

RUN /usr/bin/chmod 0755 /opt/pcsx2/pcsx2.AppImage \
        /usr/local/bin/pcsx2-ps2 \
        /usr/local/bin/retroarch-menu \
    && /usr/bin/mkdir -p \
        /library/config/retroarch \
        /library/config/pcsx2 \
        /library/roms/ps2 \
        /library/system/pcsx2/bios \
        /library/saves/ps2 \
        /library/states/ps2 \
    && /usr/bin/ln -s /library/saves/ps2 /library/config/pcsx2/memcards \
    && /usr/bin/ln -s /library/states/ps2 /library/config/pcsx2/sstates \
    && /usr/bin/ln -s /library/system/pcsx2/bios /library/config/pcsx2/bios \
    && /usr/bin/chown -R lizard:lizard /library

LABEL org.opencontainers.image.source="https://github.com/listrate/sunshine-gaming-image" \
      org.opencontainers.image.title="Sunshine gaming host" \
      org.opencontainers.image.version="v2026.516.143833-ubuntu-24.04.6"

USER lizard
