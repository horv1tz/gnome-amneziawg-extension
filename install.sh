#!/usr/bin/env bash

set -e

UUID="gnome-amneziawg-extension@horvitz.ru"
INSTALL_PATH="$HOME/.local/share/gnome-shell/extensions/$UUID"

echo "Compiling GSettings schemas..."
glib-compile-schemas schemas/

echo "Removing old installation if it exists..."
rm -rf "$INSTALL_PATH"

echo "Creating installation directory: $INSTALL_PATH"
mkdir -p "$INSTALL_PATH"

echo "Copying files..."
cp -r extension.js install.sh LICENSE metadata.json prefs.js README.md shell.nix icons schemas "$INSTALL_PATH"

echo "Reloading extension..."
gnome-extensions disable "$UUID" || true
gnome-extensions enable "$UUID"

echo "Installation complete."
echo "Please restart GNOME Shell (Alt+F2, then 'r') if changes are not applied."
