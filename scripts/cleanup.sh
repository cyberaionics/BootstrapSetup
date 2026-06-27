#!/usr/bin/env bash

echo "🧹 Cleaning package cache..."

sudo paccache -r

echo "🧹 Removing Orphan packages..."

sudo pacman -Rns $(pacman Qtdq) --noconfirm 2>/dev/null || true

echo "🧹 Vacuuming journal..."

sudo journalctl --vacuum-time=14d

echo "✅ Cleanup Complete!!!"
