part of '../banner_status_internet_connection.dart';

/// A widget that displays an internet connection status banner.
///
/// The banner will appear when there is no internet connection, and it will hide when the connection is restored.
///
/// The [InternetConnectionBanner] accepts a [child] widget that will be displayed below the banner.
class InternetConnectionBanner extends StatelessWidget {
  final AlignmentGeometry alignment;
  final double? height;
  final double? width;
  final Color? connectedBackgroundColor;
  final Color? disconnectedBackgroundColor;
  final Widget? connectedContent;
  final Widget? disconnectedContent;
  final Widget? connectedConnectionNotification;
  final Widget? disconnectedConnectionNotification;
  final String? connectedText;
  final String? disconnectedText;
  final OverlayAnimationType overlayAnimationType;
  final bool shouldAlwaysPullContentDownOnTopAlignment;
  final Curve? animationCurve;
  final Duration? animationDuration;
  final bool hasIndicationIcon;
  final TextStyle? connectedTextStyle;
  final TextStyle? disconnectedTextStyle;
  final Icon? connectedIcon;
  final Icon? disconnectedIcon;
  final double? textAndIconSeparationWith;
  final double? iconBoxSideLength;
  final BorderRadiusGeometry? borderRadius;
  final Duration? disconnectedDuration;
  final Duration? connectedDuration;

  /// The widget that will be displayed beneath the banner.
  final Widget child;

  /// Creates an instance of [InternetConnectionBanner].
  ///
  /// The [params] argument is required to define the appearance and text of the banner.
  const InternetConnectionBanner({
    super.key,
    this.alignment = Alignment.topCenter,
    this.height,
    this.width,
    this.connectedBackgroundColor,
    this.disconnectedBackgroundColor,
    this.connectedContent,
    this.disconnectedContent,
    this.connectedConnectionNotification,
    this.disconnectedConnectionNotification,
    this.connectedText,
    this.disconnectedText,
    this.overlayAnimationType = OverlayAnimationType.fade,
    this.shouldAlwaysPullContentDownOnTopAlignment = false,
    this.animationCurve,
    this.animationDuration,
    this.hasIndicationIcon = true,
    this.connectedTextStyle,
    this.disconnectedTextStyle,
    this.connectedIcon,
    this.disconnectedIcon,
    this.textAndIconSeparationWith,
    this.iconBoxSideLength,
    this.borderRadius,
    this.disconnectedDuration,
    this.connectedDuration,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildBanner(),
        Expanded(child: child),
      ],
    );
  }

  /// Builds the internet connection banner and manages its visibility based on the provider's internet status.
  Widget _buildBanner() {
    return ChangeNotifierProvider<InternetConnectionBannerProvider>(
      create: (_) => InternetConnectionBannerProvider(),
      child: Consumer<InternetConnectionBannerProvider>(
        builder: (context, provider, child) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SizeTransition(
                sizeFactor: animation,
                axisAlignment: -1.0,
                child: child,
              );
            },
            child: provider.hasInternetAccess
                ? const SizedBox.shrink(key: ValueKey("BannerHidden"))
                : _buildBannerContent(),
          );
        },
      ),
    );
  }

  /// Builds the content of the banner when there is no internet connection.
  ///
  /// Displays a message and an animated loading indicator.
  Widget _buildBannerContent() {
    return ConnectionStatusView(
      isConnected: false,
      alignment: alignment,
      height: height,
      width: width,
      connectedBackgroundColor: connectedBackgroundColor,
      disconnectedBackgroundColor: disconnectedBackgroundColor,
      connectedContent: connectedContent,
      disconnectedContent: disconnectedContent,
      connectedConnectionNotification: connectedConnectionNotification,
      disconnectedConnectionNotification: disconnectedConnectionNotification,
      connectedText: connectedText,
      disconnectedText: disconnectedText,
      overlayAnimationType: overlayAnimationType,
      shouldAlwaysPullContentDownOnTopAlignment:
          shouldAlwaysPullContentDownOnTopAlignment,
      animationCurve: animationCurve,
      animationDuration: animationDuration,
      hasIndicationIcon: hasIndicationIcon,
      connectedTextStyle: connectedTextStyle,
      disconnectedTextStyle: disconnectedTextStyle,
      connectedIcon: connectedIcon,
      disconnectedIcon: disconnectedIcon,
      textAndIconSeparationWith: textAndIconSeparationWith,
      iconBoxSideLength: iconBoxSideLength,
      borderRadius: borderRadius,
      disconnectedDuration: disconnectedDuration,
      connectedDuration: connectedDuration,
    );
  }
}
