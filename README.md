# *Aenocyon* - custom Bluefin LTS image
[![Bluebuild build status](https://github.com/alexfullmoon/aenocyon/actions/workflows/build.yml/badge.svg)](https://github.com/alexfullmoon/aenocyon/actions/workflows/build.yml)&nbsp; ![Last commit](https://img.shields.io/github/last-commit/AlexFullmoon/aenocyon?style=plastic&label=updated)

Using `bluefin-dx:lts`, customized for personal use and Thinkpad X1Y5 laptop. Image is currently **suspended** and missing some features.

## Installation

From suitable image (ideally bluefin-dx:lts):

```
rpm-ostree rebase ostree-unverified-registry:ghcr.io/alexfullmoon/aenocyon:br-lts-lts-10

systemctl reboot

rpm-ostree rebase ostree-image-signed:docker://ghcr.io/alexfullmoon/aenocyon:br-lts-lts-10

systemctl reboot
```

## Current changes from Bluefin DX

- Installed as RPMs
  - Bitwarden
  - Sublime Text
  - SourceGit
  - Firefox
  - ~~Crossover~~
  - Ghostty
  - Seafile
  - v2rayN
- Installed as flatpaks
  - LibreOffice
  - Betterbird (instead of Thunderbird)
  - Obsidian
  - Steam
  - Discord
  - Zotero
  - Solaar (along with udev rules)
- Several Gnome extensions
- Some Gnome config
- ~~Personal dotfiles sync via chezmoi~~
- System config
  - Enabled SMB1 for VM printer
  - Disabled avahi-daemon listening on ethernet

## TODO

- [ ] Add libfuse for continuing support of AppImage (whenever they drop it from Bluefin)
  - Or drop Appimages
- [ ] Check if all prerequisites for Crossover are *really* necessary for Office and PDF
- RPM host installation of:
  - [x] Solaar — works fine as Flatpak
  - [x] Seafile — wound working COPR
  - [-] Crossover — requires i686 libraries, missing in Centos 10. Install in distrobox?
  - [x] Ghostty — found a workaround for dnf bug.
 
## Current issues

Crossover _really_ doesn't like being installed on readonly filesystem, any operation with existing bottles results in hang up. Importing archived bottles work, though. For working with bottles install a copy into distrobox.

Chezmoi gets some variables (un)defined if applied during build. Currently disabled in recipe, apply manually.

## Making your own image

See the [BlueBuild docs](https://blue-build.org/how-to/setup/) for quick setup instructions for setting up your own repository based on this template.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/alexfullmoon/aenocyon
```
