import 'package:banner_status_internet_connection/provider/internet_connection_banner_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A widget that displays a banner indicating the internet connection status.
///
/// This banner is shown when there is no internet access and provides a visual
/// cue to the user. It uses a [ChangeNotifierProvider] to listen for changes
/// in the internet connection status.
class InternetConnectionBanner extends StatelessWidget {
  /// The message displayed on the banner.
  ///
  /// @param message: The message of the banner [String].
  final String message;

  /// The style applied to the message text.
  ///
  /// @param messageStyle: The text style for the banner message [TextStyle].
  final TextStyle messageStyle;

  /// The color of the banner's background.
  ///
  /// @param backgroundColor: The background color of the banner [Color].
  final Color backgroundColor;

  /// Creates an [InternetConnectionBanner] widget.
  ///
  /// @param key: An optional key for the widget [Key].
  /// @param message: The message of the banner [String].
  /// @param messageStyle: The text style for the banner message [TextStyle].
  /// @param backgroundColor: The background color of the banner [Color].
  const InternetConnectionBanner({
    super.key,
    required this.message,
    required this.messageStyle,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
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

  /// Builds the content of the banner when there is no internet access.
  ///
  /// @returns: A [Widget] representing the banner content [Widget].
  Widget _buildBannerContent() {
    return Container(
      key: const ValueKey("BannerVisible"),
      color: backgroundColor,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2.0,
              ),
            ),
            const SizedBox(width: 20),
            Text(message, style: messageStyle),
          ],
        ),
      ),
    );
  }
}
