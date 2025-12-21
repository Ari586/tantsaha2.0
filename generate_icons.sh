#!/bin/bash

# Exit on error
set -e

# Check for source icon
if [ ! -f assets/icon.png ]; then
  echo "Source icon 'assets/icon.png' not found!" >&2
  exit 1
fi

# Generate web icons
echo "Generating web icons..."
convert assets/icon.png -resize 512x512 web/icons/Icon-512.png
convert assets/icon.png -resize 192x192 web/icons/Icon-192.png
convert assets/icon.png -resize 48x48 web/favicon.png

# Generate macOS icons
echo "Generating macOS icons..."
mkdir -p macos/Runner/Assets.xcassets/AppIcon.appiconset
convert assets/icon.png -resize 16x16 macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_16.png
convert assets/icon.png -resize 32x32 macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_32.png
convert assets/icon.png -resize 64x64 macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_64.png
convert assets/icon.png -resize 128x128 macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_128.png
convert assets/icon.png -resize 256x256 macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_256.png
convert assets/icon.png -resize 512x512 macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_512.png
convert assets/icon.png -resize 1024x1024 macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_1024.png

echo "Icons generated! Now run:"
echo "flutter build web"
echo "flutter build macos"

# Automatically build Flutter web app
echo "\nBuilding Flutter web app..."
flutter build web
echo "Flutter web build complete."
