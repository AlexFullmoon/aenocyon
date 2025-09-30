# Shapeshifter - custom Bluefin-DX image
[![Bluebuild build status](https://github.com/alexfullmoon/shapeshifter/actions/workflows/build.yml/badge.svg)](https://github.com/alexfullmoon/shapeshifter/actions/workflows/build.yml)&nbsp; ![Last commit](https://img.shields.io/github/last-commit/AlexFullmoon/shapeshifter?style=plastic&label=updated)

Using `bluefin-dx:stable`, customized for personal use and Thinkpad X1Y5 laptop.

## Installation

From suitable image (preferably bluefin-dx):

```
rpm-ostree rebase ostree-unverified-registry:ghcr.io/alexfullmoon/shapeshifter:stable

systemctl reboot

rpm-ostree rebase ostree-image-signed:docker://ghcr.io/alexfullmoon/shapeshifter:stable

systemctl reboot
```

## Current changes from Bluefin-DX

- RPMs
  - Solaar
    - Also adds udev rules
  - Bitwarden
  - Sublime Text
  - SourceGit
  - Firefox
  - Crossover
  - Ghostty
  - Seafile
  - v2rayN
- Flatpaks
  - LibreOffice
  - GearLever
  - Betterbird (instead of Thunderbird)
  - Obsidian
  - Steam
  - Discord
  - Zotero
- Gnome extensions
  - Clipboard indicator, Solaar extension, Syncthing, Thinkpad stuff, Just Perfection...
- Some Gnome config
- Chezmoi dotfiles sync
- System config
  - Enabled SMB1 for VM printer
  - Disabled avahi-daemon listening on ethernet
- Removed
  - Input Leap
  - InputRemapper (it conflicts with Solaar)
  - Gnome Tweaks
  - DejaDup

## TODO

- [ ] Add libfuse for continuing support of AppImage (whenever they drop it from Bluefin)
  - Or drop Appimages
- [x] Seafile, WindTerm, Ghostty
- [x] Implement chezmoi module: clean up and publish dotfiles repo
- [x] Enable avahi-daemon but listen only on wifi (trying to limit printer spam) 
 
## Current issues

Notes after installation from ISO:

- Need to set all flatpaks, adding flatpak module resets all of standard ones.
- Extensions appear in the list as system, but they're disabled at start
- Grub config patches do not apply.
- Overall, rebasing from bluefin-dx works better.

Ghostty RPM install conflicts with its own terminfo file from ncurses. Awaiting fixes.

Crossover apparently _really_ doesn't like being installed on readonly filesystem, any operation with existing bottles results in hang up. Importing archived bottles work, though. For working with bottles install a copy into distrobox
