# Sunshine Gaming Image

Small derived image for Sunshine on Intel Linux hosts.

The image starts from the official LizardByte Sunshine Ubuntu 24.04 image and
adds the X11 capture extensions and Intel VA-API runtime libraries needed for
hardware capture and encoding. It does not contain games, ROMs, BIOS files,
credentials, or cluster configuration. It includes `xterm` as a minimal GUI
application for validating the complete streaming path.

The published image is built for `linux/amd64`.
