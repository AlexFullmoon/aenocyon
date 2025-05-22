# Shapeshifter - custom Bluefin-DX image &nbsp; [![bluebuild build badge](https://github.com/alexfullmoon/shapeshifter/actions/workflows/build.yml/badge.svg)](https://github.com/alexfullmoon/shapeshifter/actions/workflows/build.yml)

Using `bluefin-dx:stable`, customized for personal use and Thinkpad X1Y5 laptop.  

Use `ghcr.io/alexfullmoon/shapeshifter:stable` for rebase.

## Current changes from Bluefin-DX

- [x] Solaar (RPM)
  - Also adds udev rules
- [x] Bitwarden (RPM)
  - Biometric auth still not working.
  - Browser connection to Firefox still not working.
- [x] Alacritty (RPM)
- [x] Sublime Text (RPM)
- [x] Sublime Merge (RPM)
- [x] SourceGit (RPM)
- [x] Dolphin (RPM)
  - Pulls a *lot* of KDE dependencies... Testing for now.
  - Flatpak has too many limitations.
- [x] Firefox (RPM)
  - Testing for connection with Bitwarden. 
- [x] LibreOffice (flatpak)
- [x] WPS Office (flatpak)
- [x] GearLever (flatpak)
- [x] Betterbird instead of Thunderbird (flatpak)
- [x] Obsidian (flatpak)
- [x] Steam (flatpak)
- [x] Discord (flatpak)
- [x] Zed (flatpak)
- [x] Gnome Extensions
  - Clipboard indicator, Solaar extension, Syncthing, Thinkpad stuff, Just Perfection
- [x] Remove some extra bloat
  - Input Leap
  - InputRemapper (it conflicts with Solaar anyway)
  - VSCode (don't like it)
  
## TODO

- [ ] Add libfuse for continuing support of AppImage (whenever they drop it from Bluefin)
- [ ] Check if anything else needs optfix
- [ ] Seafile, Zotero, WindTerm, Ghostty - annoying to keep them as binaries.
- [ ] Implement chezmoi module: clean up and publish dotfiles repo
- [ ] Copy some /etc configs?
- [x] Make build tag actually say `stable` instead of `latest`
- [x] Move away from rpm-ostree
 
## Current issues

Part of Bitwarden postinstall script is running `chcon system_u:object_r:usr_t:s0 /usr/share/polkit-1/actions/com.bitwarden.Bitwarden.policy`. It can't be run during build (fails with "Operation not permitted") and can't be run in system (fails with "Read-only file system")

Bitwarden has weird issue with biometric auth - probably due to missing aforementioned command.

Zed editor doesn't install via RPM (unclear; can't add repo?) and conflicts with one of zfs commands, of all things.
