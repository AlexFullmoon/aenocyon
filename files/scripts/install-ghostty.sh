#!/bin/bash

# Ghostty as appimage :(
while [[ -z "${GHOSTTY:-}" || "${GHOSTTY:-}" == "null" ]]; do
    GHOSTTY="$(curl -L https://api.github.com/repos/pkgforge-dev/ghostty-appimage/releases/latest | jq -r '.assets[] | select(.name| test("Ghostty-[0-9].*-x86_64.AppImage$")).browser_download_url')" || (true && sleep 5)
done
curl --retry 3 -Lo /tmp/ghostty.appimage "$GHOSTTY"
cd /tmp/
chmod +x /tmp/ghostty.appimage
/tmp/ghostty.appimage --appimage-extract
mkdir -p /usr/share/icons/hicolor/256x256/apps/
cp /tmp/AppDir/"$(readlink /tmp/squashfs-root/*.png)" /usr/share/icons/hicolor/256x256/apps/
cp /tmp/AppDir/"$(readlink /tmp/squashfs-root/*.desktop)" /usr/share/applications/
install -m 0755 /tmp/ghostty.appimage /usr/bin/ghostty