#!/bin/bash

# Clean build directory
flutter clean

# Get dependencies
flutter pub get

# Build iOS IPA
echo "Building iOS IPA..."
flutter build ipa --release

# Build Android App Bundle
echo "Building Android App Bundle..."
flutter build appbundle --release

echo "Build completed!"
