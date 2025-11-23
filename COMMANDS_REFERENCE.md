# Flutter Web Login App - Commands Reference

## Essential Commands

### Setup & Run

```bash
# Get dependencies
flutter pub get

# Run in Chrome browser
flutter run -d chrome

# Run in other browsers
flutter run -d firefox
flutter run -d safari
flutter run -d edge
```

### Development

```bash
# Code analysis
flutter analyze

# Check dependencies
flutter pub outdated

# Format code
dart format lib/

# Get pub packages
flutter pub get
flutter pub upgrade

# Hot reload (while running)
# Press 'r' in terminal
```

### Build

```bash
# Debug build
flutter build web

# Release build (optimized)
flutter build web --release

# Release with specific renderer
flutter build web --release --web-renderer canvaskit
flutter build web --release --web-renderer html

# Check build output
ls build/web/
```

### Testing

```bash
# Run tests
flutter test

# Run tests with coverage
flutter test --coverage

# Analyze test files
flutter analyze --no-fatal-warnings
```

### Clean & Maintenance

```bash
# Clean build artifacts
flutter clean

# Remove pub cache
flutter pub cache clean

# Check doctor
flutter doctor

# Check device
flutter devices
```

## Common Development Workflows

### Quick Test on Multiple Screens

```bash
# Terminal 1: Start dev server
flutter run -d web

# Browser: Press F12 → Toggle Device Toolbar (Ctrl+Shift+M)
# Select devices: iPhone 12 (390px), iPad (768px), Desktop (1920px)
```

### Production Deployment

```bash
# 1. Build production version
flutter build web --release

# 2. Deploy to Firebase
firebase init hosting
firebase deploy

# Or deploy to Netlify
netlify deploy --prod --dir=build/web

# Or serve locally for testing
cd build/web
python3 -m http.server 8000
# Visit: http://localhost:8000
```

### Code Updates

```bash
# Edit code in lib/main.dart
vim lib/main.dart

# While running (flutter run -d web):
# Press 'r' to hot reload changes
# Press 'R' for full restart
```

### Customize Theme

```bash
# Edit MyApp build method (line 14)
# Change Colors.blue to any color:
# Colors.red, Colors.green, Colors.purple, etc.

flutter run -d web
# Press 'r' to see changes
```

### Adjust Responsive Breakpoints

```bash
# Edit _LoginScreenState build method (lines 68-69)
# Modify screen size thresholds:
final isSmallScreen = screenSize.width < 600;    # Mobile threshold
final isLargeScreen = screenSize.width >= 900;   # Desktop threshold

flutter run -d web
# Press 'r' to hot reload
```

## Project Structure Commands

```bash
# List project files
ls -la

# View lib directory
ls -la lib/

# View web directory
ls -la web/

# View build output
ls -la build/web/
```

## Troubleshooting Commands

```bash
# Check Flutter installation
flutter doctor

# List available devices
flutter devices

# Check SDK version
flutter --version

# Check Dart version
dart --version

# Check package versions
flutter pub deps

# Clear all caches
flutter clean && flutter pub cache clean

# Full reset
rm -rf .dart_tool build/ pubspec.lock
flutter pub get
```

## Performance Analysis

```bash
# Build with performance analysis
flutter build web --profile

# Check bundle size
du -sh build/web/

# List assets
ls -lh build/web/assets/
```

## Web-Specific Commands

```bash
# Run with specific port
flutter run -d web --web-port 8080

# Run with hostname
flutter run -d web --web-hostname 0.0.0.0

# Enable VM service
flutter run -d web --start-paused
```

## Deployment Commands

### Firebase Hosting

```bash
flutter build web --release
firebase init hosting
firebase deploy --only hosting
```

### Netlify

```bash
flutter build web --release
netlify deploy --prod --dir=build/web
```

### GitHub Pages

```bash
flutter build web --release
cd build/web
git add .
git commit -m "Deploy web app"
git push origin gh-pages
```

### Local Testing

```bash
# Python 3
cd build/web
python3 -m http.server 8000

# Node.js
npx http-server build/web -p 8000

# Visit: http://localhost:8000
```

## Useful Shortcuts

| Action | Command |
|--------|---------|
| Hot reload | r (while running) |
| Full restart | R (while running) |
| Quit | q (while running) |
| Open DevTools | F12 (in browser) |
| Device toolbar | Ctrl+Shift+M |
| Show device frames | Cmd+Shift+D (on Mac) |
| Analytics | flutter analytics --verbose |

## Environment Variables

```bash
# Enable verbose output
flutter run -d web -v

# Disable analytics
flutter config --no-analytics

# Show analytics
flutter analytics show

# Set Flutter SDK path
export PATH="$PATH:$HOME/flutter/bin"
```

## File Locations

```bash
# Project root
/Users/harshadarade/Projects/login_app

# Source code
/Users/harshadarade/Projects/login_app/lib/main.dart

# Web files
/Users/harshadarade/Projects/login_app/web/

# Build output
/Users/harshadarade/Projects/login_app/build/web/

# Dependencies
/Users/harshadarade/Projects/login_app/.dart_tool/
```

---

**Quick Reference**: Copy & paste the commands above directly into your terminal!
