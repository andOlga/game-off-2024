#!/bin/bash
# This file is meant to be ran by Github Actions to generate nightly builds.
# For local builds, please just download the Godot editor yourself and use that.
GODOT_VERSION="4.4.1-stable"
GODOT_ARCH="linux.x86_64"
cd "$(dirname "$0")"
bash clean.sh
echo "Downloading editor..."
wget -q "https://github.com/godotengine/godot/releases/download/${GODOT_VERSION}/Godot_v${GODOT_VERSION}_${GODOT_ARCH}.zip"
echo "Downloading export templates..."
wget -q "https://github.com/godotengine/godot/releases/download/${GODOT_VERSION}/Godot_v${GODOT_VERSION}_export_templates.tpz"
echo "Unzipping..."
unzip -q *.zip
unzip -q *.tpz
echo "Installing templates..."
mkdir -p ~/.local/share/godot/export_templates/
mv templates ~/.local/share/godot/export_templates/${GODOT_VERSION/-/.}
echo "Exporting..."
for i in "Windows x86_64" "Windows Arm" "Linux x86_64" "Linux Arm" "macOS" "Web"
do
    ./Godot_v${GODOT_VERSION}_${GODOT_ARCH} --headless --quiet --path .. --export-release "$i"
done
