part of '../banner_status_internet_connection.dart';

/// Parameters used to customize the appearance and behavior of the internet connection banner.
///
/// This class allows you to define the message to be displayed, the style of the message text,
/// and the background color of the banner.
class InternetConnectionBannerParams {
  /// The message to display when there is no internet connection.
  ///
  /// Typically a short description like "No Internet Connection".
  final String message;

  /// The style to apply to the [message].
  ///
  /// Allows customization of text properties such as font size, weight, color, etc.
  final TextStyle messageStyle;

  /// The background color of the banner.
  ///
  /// Typically, you would use a color that contrasts well with the text for visibility.
  final Color backgroundColor;

  /// Creates an instance of [InternetConnectionBannerParams].
  ///
  /// All parameters are required to ensure proper display of the banner.
  ///
  /// - [message] is the text that will appear when the banner is shown.
  /// - [messageStyle] defines how the message text will look.
  /// - [backgroundColor] sets the background color of the banner.
  InternetConnectionBannerParams({
    required this.message,
    required this.messageStyle,
    required this.backgroundColor,
  });
}
