#!/bin/bash
# This file is meant to be ran by Github Actions to generate nightly builds.
# For local builds, please just download the Godot editor yourself and use that.
GODOT_VERSION="4.4-stable"
GODOT_ARCH="linux.x86_64"
cd "$(dirname "$0")"
bash clean.sh
echo "Downloading editor..."
wget "https://github.com/godotengine/godot/releases/download/${GODOT_VERSION}/Godot_v${GODOT_VERSION}_${GODOT_ARCH}.zip"
echo "Downloading export templates..."
wget "https://github.com/godotengine/godot/releases/download/${GODOT_VERSION}/Godot_v${GODOT_VERSION}_export_templates.tpz"
echo "Unzipping..."
unzip *.zip
unzip *.tpz
echo "Installing templates..."
mkdir -p ~/.local/share/godot/export_templates/
mv templates ~/.local/share/godot/export_templates/${GODOT_VERSION/-/.}
echo "Exporting..."
for i in "Windows Desktop" "Linux" "Linux Arm" "macOS" "Web"
do
    ./Godot_v${GODOT_VERSION}_${GODOT_ARCH} --headless --path .. --export-release "$i"
done
