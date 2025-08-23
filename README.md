# Elkood Connection Banner

A Flutter package that provides a dynamic internet connection status banner with customizable styles, animations, and text. Monitor your device's internet connectivity and display beautiful, animated banners when the connection is lost or restored.

## Features

- 🌐 **Real-time Connection Monitoring**: Reliable internet connectivity detection
- 🎨 **Highly Customizable**: Colors, text, icons, dimensions, and animations
- ✨ **Smooth Animations**: Multiple animation types (fade, slide, fadeAndSlide, none)
- 📱 **Platform-Aware**: Different loading indicators for iOS and Android
- 🔄 **Auto-hide Functionality**: Configurable auto-hide durations
- 📍 **Flexible Positioning**: Support for top, bottom, and custom alignments
- 🎯 **Easy Integration**: Simple widget wrapper for your app content

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  elkood_connection_banner:
    git:
      url: git@ssh.gitlab.elkood.com:mobile-apps/elkood-packages.git
      ref: # add latest version
      path: packages/elkood_connection_banner
```

Then run:

```bash
flutter pub get
```

## Quick Start

Wrap your app content with `InternetConnectionBanner`:

```dart
import 'package:elkood_connection_banner/elkood_connection_banner.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InternetConnectionBanner(
        child: Scaffold(
          appBar: AppBar(title: Text('My App')),
          body: Center(child: Text('Your app content here')),
        ),
      ),
    );
  }
}


### Customized Banner

```dart
InternetConnectionBanner(
  // Banner positioning
  alignment: Alignment.topCenter,
  
  // Banner dimensions
  height: 60,
  width: double.infinity,
  
  // Colors
  connectedBackgroundColor: Colors.green,
  disconnectedBackgroundColor: Colors.red,
  
  // Custom text
  connectedText: "Connection Restored!",
  disconnectedText: "No Internet Connection",
  
  // Animation
  overlayAnimationType: OverlayAnimationType.fadeAndSlide,
  animationDuration: Duration(milliseconds: 500),
  
  // Auto-hide durations
  connectedDuration: Duration(seconds: 3),
  disconnectedDuration: Duration(seconds: 5),
  
  child: YourAppContent(),
)
```

## API Reference

### InternetConnectionBanner Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `alignment` | `AlignmentGeometry` | `Alignment.topCenter` | Banner position |
| `height` | `double?` | `null` | Banner height (auto-calculated if null) |
| `width` | `double?` | `double.infinity` | Banner width |
| `connectedBackgroundColor` | `Color?` | `Colors.green` | Background color when connected |
| `disconnectedBackgroundColor` | `Color?` | `Colors.red` | Background color when disconnected |
| `connectedText` | `String?` | `"Back Online"` | Text shown when connected |
| `disconnectedText` | `String?` | `"Retrying"` | Text shown when disconnected |
| `overlayAnimationType` | `OverlayAnimationType` | `OverlayAnimationType.fade` | Animation type |
| `animationDuration` | `Duration?` | `300ms` | Animation duration |
| `animationCurve` | `Curve?` | `Curves.fastOutSlowIn` | Animation curve |
| `connectedDuration` | `Duration?` | `2s` | Auto-hide duration when connected |
| `disconnectedDuration` | `Duration?` | `null` | Auto-hide duration when disconnected |
| `hasIndicationIcon` | `bool` | `true` | Show loading/status icons |
| `connectedIcon` | `Icon?` | `Icons.check` | Icon for connected state |
| `disconnectedIcon` | `Icon?` | Platform-specific | Icon for disconnected state |
| `borderRadius` | `BorderRadiusGeometry?` | `null` | Banner corner radius |
| `shouldAlwaysPullContentDownOnTopAlignment` | `bool` | `false` | Force content push down |

### Custom Content

You can provide custom widgets for both connected and disconnected states:

```dart
InternetConnectionBanner(
  connectedContent: Container(
    padding: EdgeInsets.all(16),
    child: Row(
      children: [
        Icon(Icons.wifi, color: Colors.white),
        SizedBox(width: 8),
        Text('Internet Restored!', style: TextStyle(color: Colors.white)),
      ],
    ),
  ),
  disconnectedContent: Container(
    padding: EdgeInsets.all(16),
    child: Row(
      children: [
        Icon(Icons.wifi_off, color: Colors.white),
        SizedBox(width: 8),
        Text('No Internet Connection', style: TextStyle(color: Colors.white)),
      ],
    ),
  ),
  child: YourAppContent(),
)
```

### Animation Types

```dart
// Fade animation (default)
overlayAnimationType: OverlayAnimationType.fade

// Slide animation
overlayAnimationType: OverlayAnimationType.slide

// Combined fade and slide
overlayAnimationType: OverlayAnimationType.fadeAndSlide

// No animation
overlayAnimationType: OverlayAnimationType.none
```

### Alignment Options

```dart
// Top alignments
alignment: Alignment.topCenter
alignment: Alignment.topLeft
alignment: Alignment.topRight

// Bottom alignments
alignment: Alignment.bottomCenter
alignment: Alignment.bottomLeft
alignment: Alignment.bottomRight

// Custom alignment
alignment: Alignment(0.5, 0.1) // 50% from left, 10% from top
```

## Advanced Examples

### Custom Styling with Theme Integration

```dart
InternetConnectionBanner(
  connectedBackgroundColor: Theme.of(context).primaryColor,
  disconnectedBackgroundColor: Theme.of(context).errorColor,
  connectedTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  ),
  disconnectedTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
    color: Colors.white,
  ),
  borderRadius: BorderRadius.circular(8),
  child: YourAppContent(),
)
```

### Bottom-Aligned Banner with Custom Animation

```dart
InternetConnectionBanner(
  alignment: Alignment.bottomCenter,
  overlayAnimationType: OverlayAnimationType.slide,
  animationDuration: Duration(milliseconds: 800),
  animationCurve: Curves.elasticOut,
  height: 80,
  connectedDuration: Duration(seconds: 4),
  child: YourAppContent(),
)
```

### Minimal Banner with No Icons

```dart
InternetConnectionBanner(
  hasIndicationIcon: false,
  height: 40,
  connectedText: "Online",
  disconnectedText: "Offline",
  overlayAnimationType: OverlayAnimationType.fade,
  child: YourAppContent(),
)
```

## Dependencies

This package uses the following dependencies:

- `provider: ^6.1.2` - For state management
- `internet_connection_checker_plus: ^2.5.2` - For reliable connection monitoring

## Platform Support

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ macOS
- ✅ Windows
- ✅ Linux

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a list of changes and version history.
