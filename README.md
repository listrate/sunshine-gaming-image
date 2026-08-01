# Sunshine Gaming Image

Small derived image for Sunshine on Intel Linux hosts.

The image starts from the official LizardByte Sunshine Ubuntu 24.04 image and
adds the X11 capture extensions and Intel VA-API runtime libraries needed for
hardware capture and encoding. It does not contain games, ROMs, BIOS files,
credentials, or cluster configuration. It includes `xterm` as a minimal GUI
application for validating the complete streaming path, RetroArch, and the
amd64 PCSX2 release build.

The published image is built for `linux/amd64`.

## Sunshine launchers

The image provides direct executable launchers so Sunshine entries do not need
`sh -c` or other implicit shell syntax. Pass one absolute ROM path, or omit it
to open the emulator UI:

```text
/usr/local/bin/pcsx2-ps2 /library/roms/ps2/<game.iso>
/usr/local/bin/retroarch-menu
```

RetroArch is included, but the upstream PSP core is not currently included:
Ubuntu 24.04 does not package `libretro-ppsspp`, Libretro's prebuilt PSP core
has no immutable checksum-bearing URL, and the verified PPSSPP source release
is not self-contained enough to build its core on this base without adding an
additional unverified dependency. It must remain a follow-up rather than use
an unverifiable artifact.

Mount the library with these paths available to the `lizard` user:

```text
/library/roms/psp
/library/roms/ps2
/library/system/retroarch
/library/system
/library/saves/psp
/library/saves
/library/states/psp
/library/states
/library/config
```

The launcher keeps emulator configuration under `/library/config`, system data
under `/library/system`, and save data under the matching `/library/saves` and
`/library/states` subdirectories.
