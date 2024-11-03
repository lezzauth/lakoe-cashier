
# Lakoe POS

A Flutter project with multiple flavors for development and production.

## Setting Flavors

This project is set up with two flavors: `dev` and `prod`. The flavor settings can be configured in `launch.json`.

### Example `launch.json` Configuration:

```json
{
  "configurations": [
    {
      "name": "Lakoe Dev",
      "request": "launch",
      "type": "dart",
      "program": "lib/main_dev.dart",
      "args": [
        "--flavor",
        "dev"
      ]
    },
    {
      "name": "Lakoe Prod",
      "request": "launch",
      "type": "dart",
      "program": "lib/main.dart",
      "args": [
        "--flavor",
        "prod"
      ]
    }
  ]
}
```

## Debugging

To debug each flavor in Visual Studio Code:

1. **Debug Dev Flavor**:
   - Select the `Lakoe Dev` configuration from the debug configurations.
   - Click on **Start Debugging** (or press `F5`) to launch the app in the `dev` flavor.

2. **Debug Prod Flavor**:
   - Select the `Lakoe Prod` configuration from the debug configurations.
   - Click on **Start Debugging** (or press `F5`) to launch the app in the `prod` flavor.

This will allow you to test and debug each flavor independently.

## Building APK

To build APKs for each flavor, use the following commands:

1. **Build Dev APK (for debugging)**:
   ```bash
   flutter build apk --flavor dev -t lib/main_dev.dart
   ```

2. **Build Prod APK (for debugging)**:
   ```bash
   flutter build apk --flavor prod -t lib/main.dart
   ```

These commands generate APKs that are suitable for testing and debugging.

## Building Release APK

To build release APKs for deployment or production, use these commands:

1. **Build Dev Release APK**:
   ```bash
   flutter build apk --flavor dev -t lib/main_dev.dart --release
   ```

2. **Build Prod Release APK**:
   ```bash
   flutter build apk --flavor prod -t lib/main.dart --release
   ```

These commands will generate release APKs for each flavor located in the `build/app/outputs/flutter-apk/` directory.

For example:
- `app-dev-release.apk` for the `dev` flavor
- `app-prod-release.apk` for the `prod` flavor

## Recommended Build for Google Play Store

To optimize APK size for Play Store distribution, use the following command with `--split-per-abi`. This will create separate APKs for each CPU architecture (e.g., arm64, armeabi-v7a), reducing the overall APK size:

```bash
flutter build apk --flavor prod -t lib/main.dart --release --split-per-abi
```

This command will generate APKs for different architectures in `build/app/outputs/flutter-apk/`, such as:
- `app-prod-arm64-v8a-release.apk`
- `app-prod-armeabi-v7a-release.apk`
- `app-prod-x86_64-release.apk`

Only upload these APKs to the Play Store, as they are optimized for specific device architectures.

**Note**: For additional optimization, you may want to enable ProGuard in your `build.gradle` file to minimize and obfuscate the code. Ensure that you test thoroughly, as ProGuard can impact performance if misconfigured.

## Additional Resources

For more information on Flutter development, view the [online documentation](https://docs.flutter.dev/), which offers tutorials, samples, and a full API reference.
