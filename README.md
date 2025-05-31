# Shapeshifter - custom Bluefin-DX image &nbsp; [![bluebuild build badge](https://github.com/alexfullmoon/shapeshifter/actions/workflows/build.yml/badge.svg)](https://github.com/alexfullmoon/shapeshifter/actions/workflows/build.yml)

Using `bluefin-dx:stable`, customized for personal use and Thinkpad X1Y5 laptop.  

Use `ghcr.io/alexfullmoon/shapeshifter:stable` for rebase.

## Current changes from Bluefin-DX

- RPMs
  - Solaar
    - Also adds udev rules
  - Bitwarden
    - Biometric auth glitches but works.
    - Browser connection to Firefox works fine.
  - Alacritty
  - Sublime Text
  - SourceGit
  - Dolphin
    - Pulls a *lot* of KDE dependencies, but flatpak has too many limitations.
  - Firefox
  - Crossover
- Flatpaks
  - LibreOffice
  - GearLever
  - Betterbird instead of Thunderbird
  - Obsidian
  - Steam
  - Discord
  - Zotero
- Gnome extensions
  - Clipboard indicator, Solaar extension, Syncthing, Thinkpad stuff, Just Perfection
- Some Gnome config
- GRUB config and theme
- Services
  - Masked avahi-daemon
    - This is due to long-standing Gnome bug, filling printers list with all autodetected network printers from LAN.
- Removed
  - Input Leap
  - InputRemapper (it conflicts with Solaar)
  - VSCode (don't like it)
  - Gnome Tweaks (Bluefin reincluded it)
  - DejaDup

## TODO

- [ ] Add libfuse for continuing support of AppImage (whenever they drop it from Bluefin)
- [ ] Seafile, WindTerm, Ghostty
- [ ] Implement chezmoi module: clean up and publish dotfiles repo
 
## Current issues

Part of Bitwarden postinstall script is running `chcon system_u:object_r:usr_t:s0 /usr/share/polkit-1/actions/com.bitwarden.Bitwarden.policy`. It can't be run during build (fails with "Operation not permitted") and can't be run in system (fails with "Read-only file system")

Bitwarden has weird issue with biometric auth - probably due to missing aforementioned command.

Ghostty RPM install conflicts with its own terminfo file from ncurses. Awaiting fixes.

Crossover apparently doesn't really like being installed on readonly filesystem. Importing archived bottles work, though.
