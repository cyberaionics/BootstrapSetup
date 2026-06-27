#!/usr/bin/env bash

set -e

echo "📦 Updating Pacman..."

sudo pacman -Syu

echo "📦 Updating AUR..."

yay -Sua

echo "📦 Updating Flatpak..."

flatpak update

echo "✅ System Updated!"
