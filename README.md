# _Aenocyon_ - custom Bluefin image

[![Bluebuild build status](https://github.com/alexfullmoon/aenocyon/actions/workflows/build.yml/badge.svg)](https://github.com/alexfullmoon/aenocyon/actions/workflows/build.yml)&nbsp; ![Last commit](https://img.shields.io/github/last-commit/AlexFullmoon/aenocyon?style=plastic&label=updated)

Using `bluefin-dx:stable`, customized for personal use and Thinkpad laptop.

## Installation

From suitable image (ideally bluefin-dx:stable):

```
rpm-ostree rebase ostree-unverified-registry:ghcr.io/alexfullmoon/aenocyon:stable

systemctl reboot

rpm-ostree rebase ostree-image-signed:docker://ghcr.io/alexfullmoon/aenocyon:stable

systemctl reboot
```

## Current changes from Bluefin DX

Installed apps

| RPMs      | Flatpaks    |
| --------- | ----------- |
| Solaar    | LibreOffice |
| Bitwarden | Betterbird  |
| SourceGit | Obsidian    |
| Firefox   | Discord     |
| Crossover | NewsFlash   |
| Ghostty   | Pinta       |
| Zed       | Telegram    |
| Steam     | WinBox      |
| Seafile   | Decoder     |
| v2rayN    |             |
| Happ      |             |

Also:
- Several Gnome extensions
- Some Gnome config
- ~~Personal dotfiles sync via chezmoi~~
- System config
  - Enabled SMB1 for VM printer
  - Masked avahi-daemon
  - Disabled random MAC address by default
  - Added Russian root CA certificates (requires running `sudo update-ca-trust` after first install)
  - Added keyboard layout [M-Layout](https://github.com/alexfullmoon/m-layout)
- Removed apps
  - InputRemapper
  - Gnome Tweaks
  - Tailscale
  - VSCode

## TODO

- [ ] Add libfuse for continuing support of AppImage (whenever they drop it from Bluefin)
  - Or drop Appimages. I barely use them.
- [ ] Check if all prerequisites for Crossover are _really_ necessary for Office and PDF.
- [ ] Decide what to do with chezmoi module.

## Current issues

Crossover doesn't really work on readonly filesystem, any operation with existing bottles results in hang up. Running existing bottles works, though. For working with bottles install a copy into distrobox.

Chezmoi gets some variables (un)defined if applied during build. Currently disabled in recipe, apply manually.

## Making your own image

See the [BlueBuild docs](https://blue-build.org/how-to/setup/) for quick setup instructions for setting up your own repository based on this template.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/alexfullmoon/aenocyon
```
