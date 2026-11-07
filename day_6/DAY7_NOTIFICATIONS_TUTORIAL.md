# Local Notifications Setup Guide

## Overview
This guide shows how to implement instant and scheduled local notifications in Flutter using `flutter_local_notifications`.

## Installation (Already Done ✓)

### pubspec.yaml
```yaml
dependencies:
  flutter_local_notifications: ^17.2.0
  timezone: ^0.9.2
```

Run: `flutter pub get`

---

## iOS Configuration

### Step 1: Update Info.plist
Edit `ios/Runner/Info.plist` and add these keys (if not present):

```xml
<key>NSLocalNetworkUsageDescription</key>
<string>App uses local notifications</string>

  <string>_http._tcp</string>
</array>
```

### Step 2: Request User Permission
The app automatically requests notification permissions on first run (handled in `NotificationService.initialize()`).

**User will see:** "Would you like to receive notifications from [App Name]?"

### What Users Can See
✓ Banner notifications
✓ Sounds  
✓ Badges (red number on app icon)

### Troubleshooting iOS
- If notifications don't appear: Check Settings > Notifications > [App Name] > Allow Notifications
- Notifications won't show while app is in foreground (by design on iOS)
- Test on physical device for best results

---

## Android Configuration

### Step 1: Update AndroidManifest.xml
Edit `android/app/src/main/AndroidManifest.xml`:

```xml
<!-- Add these permissions -->
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />

<!-- Update your application tag -->
<application
    android:label="@string/app_name"
    android:icon="@mipmap/ic_launcher"
    android:requestLegacyExternalStorage="true"
    android:usesCleartextTraffic="true">
```

### Step 2: Create Notification Channels
Add to `android/app/src/main/AndroidManifest.xml` inside `<application>`:

```xml
<receiver
    android:name="com.dexterous.flutterlocalnotifications.ActionBroadcastReceiver"
    android:exported="false" />
```

**Note:** The `NotificationService` automatically creates channels "instant_channel" and "scheduled_channel".

### Step 3: Set compileSdkVersion
Edit `android/app/build.gradle.kts`:

```kotlin
android {
    compileSdk = 34  // or higher
    defaultConfig {
        targetSdk = 34  // or higher
    }
}
```

### What Users Will See
✓ Notifications in status bar
✓ Sound and vibration
✓ Heads-up notifications (Android 5.0+)
✓ Notifications persist until dismissed

---

## Implementation

### 1. Initialize in main.dart

```dart
import 'package:day_6/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initialize();  // ← Add this
  runApp(const MyApp());
}
```

### 2. Show Instant Notification

```dart
NotificationService().showInstantNotification(
  title: 'Hello!',
  body: 'This appears immediately',
  payload: 'optional_data',
);
```

### 3. Schedule Notification

```dart
NotificationService().scheduleNotification(
  title: 'Reminder',
  body: 'This appears in 5 seconds',
  scheduledTime: DateTime.now().add(Duration(seconds: 5)),
  payload: 'optional_data',
);
```

### 4. Handle Taps
When user taps a notification, the payload is passed to the `onDidReceiveNotificationResponse` callback in `NotificationService.initialize()`.

---

## Platform Differences

| Feature | Android | iOS |
|---------|---------|-----|
| Instant Notification | ✓ Shows while app running | ✗ Requires permission |
| Scheduled Notification | ✓ Works perfectly | ✓ Works perfectly |
| Sound | ✓ Default | ✓ Default |
| Badge | ✓ Red number icon | ✓ Red number icon |
| Vibration | ✓ Default | - |
| Persistent | ✓ Stays until dismissed | ✓ Stays until dismissed |
| Heads-up (floating) | ✓ Android 5.0+ | - |

---

## Testing

### Android
1. Run: `flutter run`
2. Go to NotificationTutorialPage
3. Click "Send Instant Notification"
4. Notification appears immediately in status bar

### iOS
1. Run: `flutter run -v`
2. Grant notification permission when prompted
3. Go to NotificationTutorialPage  
4. Click "Send Instant Notification"
5. Notification appears at top of screen

---

## Common Issues

### Notifications not appearing on iOS
- **Solution:** Check Settings > Notifications > [App Name]
- **Solution:** Notifications may not show while app is in foreground (system behavior)

### Scheduled notifications not working
- **Solution:** Ensure `timezone` package is initialized (done in `NotificationService`)
- **Solution:** Don't close the app for the scheduled time to pass (on most devices)

### Permission prompt not showing
- **Solution:** Uninstall and reinstall the app
- **Solution:** On iOS, go to Settings > General > Reset > Reset Location & Privacy

---

## Next Steps

1. ✓ Create a NotificationProvider with State Management
2. ✓ Save notification preferences
3. ✓ Add notification categories (actions)
4. ✓ Integrate with your API for push notifications (Firebase Cloud Messaging)
<key>NSBonjourServiceTypes</key>
<array>