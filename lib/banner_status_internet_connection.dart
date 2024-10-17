import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/banner_status_internet_connection_provider.dart';

class BannerStatusInternetConnection extends StatelessWidget {
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final String waitingText;

  const BannerStatusInternetConnection({
    super.key,
    this.textStyle,
    this.backgroundColor,
    required this.waitingText,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectivityProvider>(
      builder: (context, connectivity, child) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SizeTransition(
              sizeFactor: animation,
              axisAlignment: -1.0,
              child: child,
            );
          },
          child: !connectivity.hasInternetAccess
              ? _buildContent(context)
              : const SizedBox.shrink(key: ValueKey("BannerHidden")),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      key: const ValueKey("BannerVisible"),
      color: backgroundColor ?? Colors.red,
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
            Text(
              waitingText,
              style: textStyle ??
                  Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
