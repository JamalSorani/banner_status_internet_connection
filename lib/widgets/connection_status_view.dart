part of '../banner_status_internet_connection.dart';

class ConnectionStatusView extends StatelessWidget {
  const ConnectionStatusView({
    super.key,
    required this.isConnected,
    required this.alignment,
    required this.height,
    required this.width,
    required this.connectedBackgroundColor,
    required this.disconnectedBackgroundColor,
    required this.connectedContent,
    required this.disconnectedContent,
    required this.connectedConnectionNotification,
    required this.disconnectedConnectionNotification,
    required this.connectedText,
    required this.disconnectedText,
    required this.overlayAnimationType,
    required this.shouldAlwaysPullContentDownOnTopAlignment,
    required this.animationCurve,
    required this.animationDuration,
    required this.hasIndicationIcon,
    required this.connectedTextStyle,
    required this.disconnectedTextStyle,
    required this.connectedIcon,
    required this.disconnectedIcon,
    required this.textAndIconSeparationWith,
    required this.iconBoxSideLength,
    required this.borderRadius,
    required this.disconnectedDuration,
    required this.connectedDuration,
  });

  final bool isConnected;
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

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (_) {
        final topPaddingHeight =
            (MediaQueryData.fromView(View.of(context)).padding.top * 2);
        final heightHalf = (height ?? topPaddingHeight) / 2;
        final AlignmentHelper alignmentHelper = AlignmentHelper(alignment);
        final bool shouldPullContentDownOnTopAlignment =
            !(height != null && height! > (topPaddingHeight * 2)) ||
                shouldAlwaysPullContentDownOnTopAlignment;

        return Material(
          type: MaterialType.transparency,
          child: Align(
            alignment: alignment,
            child: Directionality(
              textDirection: Directionality.of(context),
              child: OverlayAnimation(
                isConnected: isConnected,
                overlayAnimationType: overlayAnimationType,
                alignment: alignment,
                animationDuration: animationDuration,
                animationCurve: animationCurve,
                connectedDuration: connectedDuration,
                disconnectedDuration: disconnectedDuration,
                child: (isConnected
                        ? connectedConnectionNotification
                        : disconnectedConnectionNotification) ??
                    Container(
                      height: height ?? topPaddingHeight,
                      width: width ?? double.infinity,
                      decoration: BoxDecoration(
                        color: isConnected
                            ? (connectedBackgroundColor ?? Colors.green)
                            : (disconnectedBackgroundColor ?? Colors.red),
                        borderRadius: borderRadius,
                      ),
                      child: Column(
                        children: [
                          if (alignmentHelper.isTopAlignment &&
                              shouldPullContentDownOnTopAlignment)
                            SizedBox(height: heightHalf),
                          SizedBox(
                            height: alignmentHelper.isTopAlignment &&
                                    shouldPullContentDownOnTopAlignment
                                ? heightHalf
                                : heightHalf * 2,
                            child: (isConnected
                                    ? connectedContent
                                    : disconnectedContent) ??
                                DefaultConnectionNotificationContent(
                                  isConnected: isConnected,
                                  connectedText: connectedText,
                                  disconnectedText: disconnectedText,
                                  hasIndicationIcon: hasIndicationIcon,
                                  connectedTextStyle: connectedTextStyle,
                                  disconnectedTextStyle: disconnectedTextStyle,
                                  connectedIcon: connectedIcon,
                                  disconnectedIcon: disconnectedIcon,
                                  textAndIconSeparationWith:
                                      textAndIconSeparationWith,
                                  iconBoxSideLength: iconBoxSideLength,
                                ),
                          ),
                        ],
                      ),
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
