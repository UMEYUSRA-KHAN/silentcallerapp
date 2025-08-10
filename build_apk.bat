@echo off
echo ========================================
echo    Silent Caller - APK Builder
echo ========================================
echo.

echo Checking Flutter installation...
flutter --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Flutter is not installed or not in PATH
    echo.
    echo Please install Flutter first:
    echo 1. Download from: https://flutter.dev/docs/get-started/install/windows
    echo 2. Extract to C:\flutter
    echo 3. Add C:\flutter\bin to your PATH
    echo 4. Restart this script
    echo.
    pause
    exit /b 1
)

echo Flutter found! Starting build process...
echo.

echo Step 1: Getting dependencies...
flutter pub get
if %errorlevel% neq 0 (
    echo ERROR: Failed to get dependencies
    pause
    exit /b 1
)

echo.
echo Step 2: Building APK...
flutter build apk --release
if %errorlevel% neq 0 (
    echo ERROR: Failed to build APK
    pause
    exit /b 1
)

echo.
echo ========================================
echo    BUILD COMPLETED SUCCESSFULLY!
echo ========================================
echo.
echo Your APK is located at:
echo build\app\outputs\flutter-apk\app-release.apk
echo.
echo To install on your device:
echo 1. Transfer the APK to your Android device
echo 2. Enable "Install from unknown sources" in settings
echo 3. Tap the APK file to install
echo.
echo Note: Make sure you have configured Firebase
echo and Google Maps API keys before building.
echo.
pause
