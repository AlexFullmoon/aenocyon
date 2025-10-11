#!/usr/bin/env sh

set -euo pipefail

URL=$(curl -s https://api.github.com/repos/bitwarden/clients/releases | jq -r 'first(.[] | .assets[]? | select(.browser_download_url | endswith(".rpm")) | .browser_download_url)')

if [ -n "$URL" ]; then
    echo "Downloading Bitwarden from $URL"
    curl -sL -o /tmp/bitwarden-latest.rpm "$URL"
else
    echo "--- Could not find Bitwarden RPM URL"
    exit 1
fi

dnf install -y /tmp/bitwarden-latest.rpm

rm -f /tmp/bitwarden-latest.rpm

# Additional Bitwarden stuff to do
ln -sf /usr/lib/opt/Bitwarden/bitwarden /etc/alternatives/bitwarden
# chcon system_u:object_r:usr_t:s0 /usr/share/polkit-1/actions/com.bitwarden.Bitwarden.policy