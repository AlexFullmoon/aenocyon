# Shapeshifter - custom Bluefin-DX image &nbsp; [![bluebuild build badge](https://github.com/alexfullmoon/shapeshifter/actions/workflows/build.yml/badge.svg)](https://github.com/alexfullmoon/shapeshifter/actions/workflows/build.yml)

Using `bluefin-dx:stable`, customized for personal use.

## TODO/Changes

- [x] Gnome tweaks (RPM)
  - No longer available in Flathub - outdated.
    Refine is missing some features (advanced keyboard layout stuff, mainly)
    Apparently it's re-added in Bluefin? Put this is on hold?
- [x] Solaar (RPM)
  - Also its udev rules
- [x] Bitwarden (RPM)
  - Biometric auth still not working.
- [x] Alacritty (RPM)
- [x] Sublime Text (RPM)
- [x] Sublime Merge (RPM)
- [x] Dolphin (RPM)
- [x] LibreOffice (flatpak)
- [x] GearLever (flatpak)
- [x] Betterbird instead of Thunderbird (flatpak)
- [x] Obsidian (flatpak)
- [x] Steam (flatpak is fine, I guess?)
- [x] Discord (flatpak)
- [x] Gnome Extensions
  - Clipboard indicator, Solaar extension, Syncthing, Thinkpad stuff, Just Perfection
- [x] Remove some extra bloat
  - Input Leap
  - InputRemapper (it conflicts with Solaar anyway)
  - Refine
- [ ] Add libfuse for continuing support of AppImage (whenever they drop it from Bluefin)
- [ ] Check if anything else needs optfix
- [ ] Seafile, Zotero? Annoying to keep them as binaries.
- [ ] Implement chezmoi module: clean up and publish dotfiles repo
- [ ] Copy some /etc configs?

## Current issues

Part of Bitwarden postinstall script is running `chcon system_u:object_r:usr_t:s0 /usr/share/polkit-1/actions/com.bitwarden.Bitwarden.policy`. It can't be run during build (fails with "Operation not permitted") and can't be run in system (fails with "Read-only file system")

---

See the [BlueBuild docs](https://blue-build.org/how-to/setup/) for quick setup instructions for setting up your own repository based on this template.

After setup, it is recommended you update this README to describe your custom image.

## Installation

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/alexfullmoon/shapeshifter:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/alexfullmoon/shapeshifter:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/alexfullmoon/shapeshifter
```
