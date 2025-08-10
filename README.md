# Silent Caller - Safety Communication App

A Flutter-based Android application that enables silent, vibration-based coded messages using tap patterns on the phone screen. Designed for safety and quick communication in situations where speaking or visible messages are not possible.

## 🚨 Safety Features

- **Silent Tap Patterns**: Send messages using custom tap sequences
- **Emergency Location Sharing**: Instantly share location with emergency contacts
- **Stealth Mode**: Hide app icon and disguise as calculator
- **Offline SMS Support**: Send basic messages via SMS when internet is unavailable
- **End-to-End Encryption**: All messages and location data are encrypted
- **Background Detection**: Tap detection works even when app is not open

## 🎯 Use Cases

- **Mosques & Religious Places**: Silent communication during prayers
- **Classrooms & Exams**: Discreet messaging without disruption
- **Domestic Safety**: Emergency alerts in dangerous situations
- **Public Transport**: Silent location sharing
- **Medical Emergencies**: Quick emergency contact activation

## 📱 Key Features

### Core Functionality
- **Tap Pattern Detection**: Detect and interpret tap patterns on screen
- **Pre-defined Patterns**: Built-in patterns for common messages
- **Custom Patterns**: Create personalized tap sequences
- **Vibration Feedback**: Haptic feedback for pattern confirmation
- **Pattern Recognition**: Smart pattern matching with timeout handling

### Safety & Security
- **Location Tracking**: Real-time GPS location sharing
- **Emergency Contacts**: Quick access to trusted contacts
- **Stealth Mode**: App disguises as calculator
- **Encrypted Storage**: All sensitive data is encrypted
- **Background Services**: Continuous monitoring in background

### User Experience
- **Dark Mode Support**: Eye-friendly dark theme
- **No-Text UI**: Icon-based interface for low literacy
- **Offline Functionality**: Works without internet connection
- **Cross-Platform**: Android and iOS support
- **Accessibility**: Voice-over and screen reader support

## 🛠️ Technical Stack

- **Framework**: Flutter 3.10+
- **Language**: Dart 3.0+
- **Backend**: Firebase (Auth, Firestore, Cloud Messaging)
- **State Management**: Provider
- **Database**: Cloud Firestore + Local SQLite
- **Authentication**: Firebase Auth
- **Push Notifications**: Firebase Cloud Messaging
- **Location Services**: Geolocator + Google Maps
- **Encryption**: AES-256 encryption
- **Background Services**: WorkManager + Foreground Services

## 📋 Prerequisites

- Flutter SDK 3.10.0 or higher
- Dart SDK 3.0.0 or higher
- Android Studio / VS Code
- Android SDK (API level 21+)
- Firebase project
- Google Maps API key
- Physical Android device for testing

## 🚀 Installation & Setup

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/silent-caller.git
cd silent-caller
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Firebase Setup

#### Create Firebase Project
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project
3. Enable Authentication, Firestore, and Cloud Messaging
4. Download `google-services.json` and place it in `android/app/`

#### Configure Firebase Services
```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize Firebase in project
firebase init
```

### 4. Google Maps Setup
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Enable Maps SDK for Android
3. Create API key
4. Replace `YOUR_GOOGLE_MAPS_API_KEY` in `android/app/src/main/AndroidManifest.xml`

### 5. Configure Permissions
The app requires several permissions. Update `android/app/src/main/AndroidManifest.xml`:

```xml
<!-- Location Permissions -->
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />

<!-- SMS Permissions -->
<uses-permission android:name="android.permission.SEND_SMS" />
<uses-permission android:name="android.permission.READ_SMS" />

<!-- Contact Permissions -->
<uses-permission android:name="android.permission.READ_CONTACTS" />

<!-- Notification Permissions -->
<uses-permission android:name="android.permission.VIBRATE" />
<uses-permission android:name="android.permission.WAKE_LOCK" />
```

### 6. Build Configuration

#### Android
```bash
# Build debug APK
flutter build apk --debug

# Build release APK
flutter build apk --release

# Build app bundle
flutter build appbundle --release
```

#### iOS (if needed)
```bash
# Build for iOS
flutter build ios --release
```

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── user_model.dart
│   ├── tap_pattern_model.dart
│   └── message_model.dart
├── services/                 # Business logic services
│   ├── auth_service.dart
│   ├── tap_detection_service.dart
│   ├── location_service.dart
│   ├── notification_service.dart
│   └── encryption_service.dart
├── providers/                # State management
│   ├── app_provider.dart
│   ├── auth_provider.dart
│   └── tap_pattern_provider.dart
├── screens/                  # UI screens
│   ├── splash_screen.dart
│   ├── onboarding_screen.dart
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── signup_screen.dart
│   └── main/
│       ├── home_screen.dart
│       ├── patterns_screen.dart
│       ├── contacts_screen.dart
│       └── settings_screen.dart
├── widgets/                  # Reusable UI components
│   ├── tap_detector_widget.dart
│   ├── pattern_card_widget.dart
│   └── emergency_button_widget.dart
└── utils/                    # Utilities and constants
    ├── constants.dart
    └── theme.dart
```

## 🔧 Configuration

### Environment Variables
Create `.env` file in project root:
```env
FIREBASE_PROJECT_ID=your-project-id
GOOGLE_MAPS_API_KEY=your-maps-api-key
ENCRYPTION_KEY=your-encryption-key
```

### Firebase Configuration
Update `lib/firebase_options.dart` with your Firebase project settings.

### App Configuration
Modify `lib/utils/constants.dart` for app-specific settings:
- App name and version
- Default tap patterns
- Timeout values
- Encryption settings

## 🧪 Testing

### Unit Tests
```bash
flutter test
```

### Integration Tests
```bash
flutter test integration_test/
```

### Manual Testing Checklist
- [ ] Tap pattern detection
- [ ] Location sharing
- [ ] Emergency alerts
- [ ] Stealth mode
- [ ] Offline functionality
- [ ] Background services
- [ ] Push notifications

## 📦 Deployment

### Android Release
1. Update version in `pubspec.yaml`
2. Build release APK:
```bash
flutter build apk --release
```
3. Sign APK with your keystore
4. Upload to Google Play Store

### iOS Release (if applicable)
1. Update version in `pubspec.yaml`
2. Build for iOS:
```bash
flutter build ios --release
```
3. Archive and upload to App Store Connect

## 🔒 Security Considerations

- **Data Encryption**: All sensitive data is encrypted using AES-256
- **Secure Storage**: Credentials stored in Android Keystore
- **Network Security**: HTTPS-only communication
- **Permission Handling**: Minimal required permissions
- **Code Obfuscation**: Release builds are obfuscated

## 🤝 Contributing

1. Fork the repository
2. Create feature branch: `git checkout -b feature-name`
3. Commit changes: `git commit -am 'Add feature'`
4. Push to branch: `git push origin feature-name`
5. Submit pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

For support and questions:
- Create an issue on GitHub
- Email: support@silentcaller.com
- Documentation: [docs.silentcaller.com](https://docs.silentcaller.com)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- Open source community for libraries
- Beta testers for feedback and suggestions

## 📈 Roadmap

### Version 1.1
- [ ] iOS support
- [ ] Voice commands
- [ ] Advanced stealth modes
- [ ] Group messaging

### Version 1.2
- [ ] AI-powered pattern recognition
- [ ] Integration with smartwatches
- [ ] Emergency services integration
- [ ] Multi-language support

### Version 2.0
- [ ] Web dashboard
- [ ] Advanced analytics
- [ ] Custom themes
- [ ] API for third-party integrations

---

**⚠️ Important**: This app is designed for safety and emergency situations. Always test thoroughly before relying on it in critical situations. The developers are not responsible for any consequences of using this app.
#   s i l e n t c a l l e r a p p  
 