part of '../banner_status_internet_connection.dart';

/// A widget that displays an internet connection status banner.
///
/// The banner will appear when there is no internet connection, and it will hide when the connection is restored.
///
/// The [InternetConnectionBanner] accepts a [child] widget that will be displayed below the banner.
class InternetConnectionBanner extends StatefulWidget {
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
  final Widget child;

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
  State<InternetConnectionBanner> createState() =>
      _InternetConnectionBannerState();
}

class _InternetConnectionBannerState extends State<InternetConnectionBanner> {
  InternetConnectionBannerProvider? _provider;

  @override
  void initState() {
    super.initState();
    _provider ??= InternetConnectionBannerProvider();
  }

  @override
  void dispose() {
    _provider?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedBuilder(
            animation: _provider!,
            builder: (context, child) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    axisAlignment: -1.0,
                    child: child,
                  );
                },
                child: _provider!.noInternetAccess
                    ? _buildBannerContent()
                    : const SizedBox.shrink(key: ValueKey("BannerHidden")),
              );
            },
          ),
          Expanded(child: widget.child),
        ],
      ),
    );
  }

  Widget _buildBannerContent() {
    return ConnectionStatusView(
      isConnected: false,
      alignment: widget.alignment,
      height: widget.height,
      width: widget.width ?? double.infinity,
      connectedBackgroundColor: widget.connectedBackgroundColor,
      disconnectedBackgroundColor: widget.disconnectedBackgroundColor,
      connectedContent: widget.connectedContent,
      disconnectedContent: widget.disconnectedContent,
      connectedConnectionNotification: widget.connectedConnectionNotification,
      disconnectedConnectionNotification:
          widget.disconnectedConnectionNotification,
      connectedText: widget.connectedText,
      disconnectedText: widget.disconnectedText,
      overlayAnimationType: widget.overlayAnimationType,
      shouldAlwaysPullContentDownOnTopAlignment:
          widget.shouldAlwaysPullContentDownOnTopAlignment,
      animationCurve: widget.animationCurve,
      animationDuration: widget.animationDuration,
      hasIndicationIcon: widget.hasIndicationIcon,
      connectedTextStyle: widget.connectedTextStyle,
      disconnectedTextStyle: widget.disconnectedTextStyle,
      connectedIcon: widget.connectedIcon,
      disconnectedIcon: widget.disconnectedIcon,
      textAndIconSeparationWith: widget.textAndIconSeparationWith,
      iconBoxSideLength: widget.iconBoxSideLength,
      borderRadius: widget.borderRadius,
      disconnectedDuration: widget.disconnectedDuration,
      connectedDuration: widget.connectedDuration,
    );
  }
}
