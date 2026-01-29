# Web Support for YouTube BLoC Pattern

This directory contains the web platform configuration for running the YouTube BLoC Pattern Flutter app as a website.

## Files

- **index.html**: The main HTML entry point for the web application
- **manifest.json**: PWA manifest file for progressive web app features
- **flutter_bootstrap.js**: Flutter web initialization script
- **favicon.png**: Browser favicon (32x32)
- **icons/**: PWA icons in various sizes (192x192, 512x512, and maskable variants)

## Building for Web

To build the application for web deployment:

```bash
flutter build web
```

The compiled web assets will be generated in the `build/web` directory.

## Running in Debug Mode

To run the app in web debug mode:

```bash
flutter run -d chrome
# or
flutter run -d web-server
```

## Deployment

After building, deploy the contents of `build/web` to your web server or hosting service (e.g., Firebase Hosting, GitHub Pages, Netlify, Vercel, etc.).

## PWA Features

The app is configured as a Progressive Web App (PWA) with:
- Installable on desktop and mobile
- Offline capability (via service worker)
- YouTube-themed red color scheme (#FF0000)
- YouTube-themed play button icons

## Notes

- The YouTube Data API v3 key must be configured in `lib/api.dart` for the app to function
- Web platform may have different behavior than mobile platforms for video playback
- Ensure CORS is properly configured if hosting the API separately
