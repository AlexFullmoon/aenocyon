# Shapeshifter - custom Bluefin-DX image &nbsp; [![bluebuild build badge](https://github.com/alexfullmoon/shapeshifter/actions/workflows/build.yml/badge.svg)](https://github.com/alexfullmoon/shapeshifter/actions/workflows/build.yml)

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
- Services
  - Masked avahi-daemon
    - This is due to long-standing Gnome bug, filling printers list with all autodetected network printers from LAN. Manually adding via CUPS UI works just fine.
- Removed
  - Input Leap
  - InputRemapper (it conflicts with Solaar)
  - Gnome Tweaks (Bluefin reincluded it)
  - DejaDup

## TODO

- [ ] Add libfuse for continuing support of AppImage (whenever they drop it from Bluefin)
- [ ] Seafile, WindTerm, Ghostty
- [ ] Implement chezmoi module: clean up and publish dotfiles repo
 
## Current issues

Notes after installation from ISO:

- Need to set all flatpaks, adding flatpak module resets all of standard ones.
- Extensions appear in the list as system, but they're disabled at start
- Gsettings overrides apparently do not work.
- Grub config did not apply. Removed.
- Overall, rebasing from bluefin-dx works better.
- Consider moving to UBlue build template.

Ghostty RPM install conflicts with its own terminfo file from ncurses. Awaiting fixes.

Crossover apparently _really_ doesn't like being installed on readonly filesystem, any operation with existing bottles results in hang up. Importing archived bottles work, though. For creating new bottles install a copy into distrobox
