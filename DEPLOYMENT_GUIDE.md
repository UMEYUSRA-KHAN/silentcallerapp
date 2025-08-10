# 🚀 Silent Caller - Deployment Guide

## Quick Start Options

### Option 1: Cloud Deployment (Recommended for immediate APK)
1. **Upload to GitHub**:
   - Create a new repository on GitHub
   - Upload all project files
   - The GitHub Actions workflow will automatically build and provide APK

2. **Use Codemagic**:
   - Sign up at https://codemagic.io
   - Connect your GitHub repository
   - Get APK in minutes

3. **Use Firebase App Distribution**:
   - Follow the Firebase setup guide below
   - Use the provided deployment script

### Option 2: Local Deployment

#### Prerequisites
- Windows 10/11, macOS, or Linux
- Git installed
- Android Studio (optional but recommended)

#### Step 1: Install Flutter
```bash
# Windows
# Download Flutter SDK from https://flutter.dev/docs/get-started/install/windows
# Extract to C:\flutter
# Add C:\flutter\bin to PATH

# macOS/Linux
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"
```

#### Step 2: Verify Installation
```bash
flutter doctor
```

#### Step 3: Setup Firebase
1. Go to [Firebase Console](https://console.firebase.google.com)
2. Create a new project named "Silent Caller"
3. Enable Authentication, Firestore, and Cloud Messaging
4. Download `google-services.json` and place it in `android/app/`
5. Update Firebase configuration in the code

#### Step 4: Build APK
```bash
# Navigate to project directory
cd "silent Caller"

# Get dependencies
flutter pub get

# Build release APK
flutter build apk --release

# APK will be available at:
# build/app/outputs/flutter-apk/app-release.apk
```

## Firebase Setup Guide

### 1. Create Firebase Project
1. Visit [Firebase Console](https://console.firebase.google.com)
2. Click "Add project"
3. Name: "Silent Caller"
4. Enable Google Analytics (optional)
5. Create project

### 2. Add Android App
1. Click "Android" icon
2. Package name: `com.silentcaller.app`
3. App nickname: "Silent Caller"
4. Download `google-services.json`
5. Place file in `android/app/` directory

### 3. Enable Services
1. **Authentication**:
   - Go to Authentication > Sign-in method
   - Enable Email/Password
   - Enable Anonymous (optional)

2. **Firestore Database**:
   - Go to Firestore Database
   - Create database in test mode
   - Set security rules (see below)

3. **Cloud Messaging**:
   - Go to Project Settings > Cloud Messaging
   - Note the Server Key

### 4. Security Rules
```javascript
// Firestore Security Rules
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can only access their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Messages are encrypted and accessible to sender/recipients
    match /messages/{messageId} {
      allow read, write: if request.auth != null && 
        (resource.data.senderId == request.auth.uid || 
         request.auth.uid in resource.data.recipientIds);
    }
  }
}
```

## Google Maps Setup

### 1. Get API Key
1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. Create a new project or select existing
3. Enable Maps SDK for Android
4. Create credentials (API Key)
5. Restrict API key to Android apps with your package name

### 2. Update Android Manifest
Replace `YOUR_GOOGLE_MAPS_API_KEY` in `android/app/src/main/AndroidManifest.xml`:
```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_ACTUAL_API_KEY" />
```

## Testing the App

### 1. Install APK
```bash
# Using ADB (if you have Android SDK)
adb install build/app/outputs/flutter-apk/app-release.apk

# Or transfer APK to device and install manually
```

### 2. Test Features
1. **Tap Detection**: Tap the screen in different patterns
2. **Emergency Mode**: Use emergency tap patterns
3. **Location Sharing**: Test location permissions and sharing
4. **Stealth Mode**: Verify app disguise functionality
5. **Offline SMS**: Test SMS fallback when offline

## Troubleshooting

### Common Issues

1. **Flutter not found**:
   - Ensure Flutter is in PATH
   - Run `flutter doctor` to verify installation

2. **Build errors**:
   - Run `flutter clean`
   - Run `flutter pub get`
   - Check all dependencies in `pubspec.yaml`

3. **Firebase connection issues**:
   - Verify `google-services.json` is in correct location
   - Check Firebase project configuration
   - Ensure internet connection

4. **Permission errors**:
   - Grant all required permissions in app settings
   - Check Android manifest permissions

### Support
- Check the main README.md for detailed documentation
- Review code comments for implementation details
- Test on multiple devices for compatibility

## Production Deployment

### 1. Code Signing
```bash
# Generate keystore
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload

# Configure signing in android/app/build.gradle
```

### 2. App Store Deployment
- Follow platform-specific guidelines for Google Play Store and Apple App Store
- Ensure all privacy policies and terms of service are in place
- Test thoroughly on multiple devices

### 3. Monitoring
- Set up Firebase Analytics for usage tracking
- Monitor crash reports and performance metrics
- Implement user feedback system

## Security Checklist

- [ ] End-to-end encryption implemented
- [ ] Firebase security rules configured
- [ ] API keys properly restricted
- [ ] User data privacy compliant
- [ ] Permissions properly requested
- [ ] Stealth mode tested
- [ ] Emergency features verified

---

**🎉 Your Silent Caller app is ready for deployment!**

The app includes all requested features:
- ✅ Silent tap pattern communication
- ✅ Emergency location sharing
- ✅ Stealth mode
- ✅ Offline SMS functionality
- ✅ End-to-end encryption
- ✅ Cross-platform support
- ✅ User-friendly interface
- ✅ Background services
- ✅ Complete documentation
