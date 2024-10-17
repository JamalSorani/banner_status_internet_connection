# banner_status_internet_connection

A Flutter package that displays a banner indicating the internet connection status. This banner is shown when there is no internet access and provides a visual cue to the user.

## Features

- Displays a banner when there is no internet connection.
- Easy to integrate with your existing Flutter applications.
- Customizable message and styles.

## Installation

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  banner_status_internet_connection: ^0.0.4  # Replace with the latest version
```

Run the following command to install the package:

```bash
flutter pub get
```

## Usage

### Importing the Package

To use the `InternetConnectionBanner` widget, import it into your Dart file:

```dart
import 'package:banner_status_internet_connection/widgets/internet_connection_banner.dart';
```

### Creating the Banner

You can create the banner using the `InternetConnectionBanner` widget. Here’s an example of how to implement it in your Flutter application:

```dart
import 'package:flutter/material.dart';
import 'package:banner_status_internet_connection/widgets/internet_connection_banner.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Internet Connection Banner Example')),
        body: InternetConnectionBanner(
          params: InternetConnectionBannerParams(
            message: 'WAITING_RED'.tr,
            backgroundColor: context.appTheme.colors.secondary,
            messageStyle: context.appTheme.style.h3.copyWith(
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
          child: Center(child: Text('Main Content Area')),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
```


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
