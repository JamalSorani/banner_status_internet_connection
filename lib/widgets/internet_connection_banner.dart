import 'package:banner_status_internet_connection/parameters/internet_connection_banner_params.dart';
import 'package:banner_status_internet_connection/provider/internet_connection_banner_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A widget that displays an internet connection status banner.
///
/// The banner will appear when there is no internet connection, and it will hide when the connection is restored.
///
/// The [InternetConnectionBanner] accepts a [child] widget that will be displayed below the banner.
class InternetConnectionBanner extends StatelessWidget {
  /// The widget that will be displayed beneath the banner.
  final Widget? child;

  /// Parameters for customizing the appearance and behavior of the banner.
  final InternetConnectionBannerParams params;

  /// Creates an instance of [InternetConnectionBanner].
  ///
  /// The [params] argument is required to define the appearance and text of the banner.
  const InternetConnectionBanner({
    super.key,
    this.child,
    required this.params,
  });

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildBanner(),
          Expanded(child: child!),
        ],
      );
    }

    return _buildBanner();
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
    return Container(
      key: const ValueKey("BannerVisible"),
      color: params.backgroundColor,
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
            Text(params.message, style: params.messageStyle),
          ],
        ),
      ),
    );
  }
}
