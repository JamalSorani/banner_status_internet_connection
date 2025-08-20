part of '../banner_status_internet_connection.dart';

/// Parameters used to customize the appearance and behavior of the internet connection banner.
///
/// This class allows you to define the message to be displayed, the style of the message text,
/// and the background color of the banner.
class InternetConnectionBannerParams {
  final String? connectedText;
  final String? disconnectedText;
  final bool hasIndicationIcon;
  final TextStyle? connectedTextStyle;
  final TextStyle? disconnectedTextStyle;
  final Icon? connectedIcon;
  final Icon? disconnectedIcon;
  final double? textAndIconSeparationWith;
  final double? iconBoxSideLength;

  InternetConnectionBannerParams({
    required this.connectedText,
    required this.disconnectedText,
    required this.hasIndicationIcon,
    required this.connectedTextStyle,
    required this.disconnectedTextStyle,
    required this.connectedIcon,
    required this.disconnectedIcon,
    required this.textAndIconSeparationWith,
    required this.iconBoxSideLength,
  });
}
