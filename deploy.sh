#!/bin/bash

# Silent Caller - Deployment Script
# This script can be used with cloud CI/CD services like GitHub Actions, Codemagic, or Firebase App Distribution

echo "🚀 Starting Silent Caller Deployment..."

# Install Flutter (if not already installed)
if ! command -v flutter &> /dev/null; then
    echo "📦 Installing Flutter..."
    git clone https://github.com/flutter/flutter.git -b stable
    export PATH="$PATH:`pwd`/flutter/bin"
fi

# Verify Flutter installation
flutter doctor

# Get dependencies
echo "📚 Installing dependencies..."
flutter pub get

# Build for Android
echo "🔨 Building Android APK..."
flutter build apk --release

# Build for iOS (if on macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "🍎 Building iOS App..."
    flutter build ios --release
fi

echo "✅ Build completed successfully!"
echo "📱 APK location: build/app/outputs/flutter-apk/app-release.apk"

# Optional: Upload to Firebase App Distribution
# firebase appdistribution:distribute "build/app/outputs/flutter-apk/app-release.apk" \
#   --app YOUR_FIREBASE_APP_ID \
#   --groups "testers" \
#   --release-notes "Silent Caller v1.0.0 - Safety-focused silent communication app"
