# Qr Scanner View

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

QR Scanner View with desing

## Installation 💻

**❗ In order to start using Qr Scanner View you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Install via `flutter pub add`:

```sh
dart pub add qr_scanner_view
```

or

Manual Installer in ```pubspec.yaml```

```yaml
qr_scanner_view:
    path: packages/qr_scanner_view
```

---

## Configuration ⚙️

You need to configurate permissions if you want to use in differents platforms

### Android

In order to use this plugin, please update the Gradle, Kotlin and Kotlin Gradle Plugin:

In android/build.gradle change ```ext.kotlin_version = '1.3.50'``` to ```ext.kotlin_version = '1.5.10'```

In ```android/build.gradle``` change ```classpath 'com.android.tools.build:gradle:3.5.0'``` to ```classpath 'com.android.tools.build:gradle:4.2.0'```

In ```android/gradle/wrapper/gradle-wrapper.properties``` change
```distributionUrl=https\://services.gradle.org/distributions/gradle-5.6.2-all.zip``` to
```distributionUrl=https\://services.gradle.org/distributions/gradle-6.9-all.zip```

In ```android/app/build.gradle``` change ```defaultConfig{ ... minSdkVersion 16 } to defaultConfig{ ... minSdkVersion 20 }```

### iOS

In order to use this plugin, add the following to your Info.plist file:

```plist
<key>io.flutter.embedded_views_preview</key>
<true/>
<key>NSCameraUsageDescription</key>
<string>This app needs camera access to scan QR codes</string>
```

## Continuous Integration 🤖

In order to use this plugin, add the following imports in your new page or view

```dart
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner_view/qr_scanner_view.dart';
```

For implement or integrate qr scanner view you need to create a ```stateless``` widget wehere you can implement the qr scanner

```dart
class QrScannerPage extends StatelessWidget {
  const QrScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return QrScannerView(
      onResult: (result) {
        // implement logic with result value
      },
    );
  }
}
```

You'll need to add the barcode format support in your code, if you want to scan QR or Barcode

```dart
formatsAllowed: const [
    // barcode formats
],
```

In the end it would be this way

```dart
class QrScannerPage extends StatelessWidget {
  const QrScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return QrScannerView(
        formatsAllowed: const [
            // barcode formats
        ],
        onResult: (result) {
            // implement logic with result value
        },
    );
  }
}
```


## Running Tests 🧪

For first time users, install the [very_good_cli][very_good_cli_link]:

```sh
dart pub global activate very_good_cli
```

To run all unit tests:

```sh
very_good test --coverage
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
open coverage/index.html
```

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://pub.dev/packages/very_good_cli
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
