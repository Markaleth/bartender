#!/bin/sh
# Takes a Flathub-ready screenshot of the running Bartender Flatpak on KDE Plasma:
# resizes the window to 1000x700 (Flathub's limit), focuses it, and captures it
# with Spectacle, keeping the native decorations and shadow.
#
#   linux/flatpak/screenshot.sh main      -> linux/flatpak/screenshots/main.png
#
# Run it on the host, or from a distrobox (it re-runs itself on the host).
set -eu

if [ -f /run/.containerenv ] && command -v distrobox-host-exec >/dev/null; then
  exec distrobox-host-exec sh "$(realpath "$0")" "$@"
fi

name=${1:?usage: screenshot.sh <name>}
out="$(cd "$(dirname "$0")" && pwd)/screenshots/$name.png"
app_id=io.github.markaleth.Bartender
qdbus=$(command -v qdbus6 || command -v qdbus-qt6 || command -v qdbus)

script=$(mktemp --suffix=.js)
trap 'rm -f "$script"' EXIT
cat >"$script" <<EOF
for (const w of workspace.windowList()) {
  if (w.resourceClass === "$app_id" || w.desktopFileName === "$app_id") {
    w.setMaximize(false, false);
    w.frameGeometry = { x: 100, y: 100, width: 1000, height: 700 };
    workspace.activeWindow = w;
  }
}
EOF

id=$($qdbus org.kde.KWin /Scripting org.kde.kwin.Scripting.loadScript "$script" bartender-screenshot)
$qdbus org.kde.KWin "/Scripting/Script$id" org.kde.kwin.Script.run >/dev/null
$qdbus org.kde.KWin /Scripting org.kde.kwin.Scripting.unloadScript bartender-screenshot >/dev/null

mkdir -p "$(dirname "$out")"
# The delay lets the resize settle; Spectacle keeps decorations and shadow by default.
spectacle --activewindow --background --nonotify --delay 1000 --output "$out"
echo "$out"
