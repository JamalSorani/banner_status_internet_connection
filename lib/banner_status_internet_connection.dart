import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider/banner_status_internet_connection_provider.dart';

class BannerStatusInternetConnection extends ConsumerWidget {
  final String title;
  final Color iconColor;
  final TextStyle titleStyle;

  const BannerStatusInternetConnection({
    super.key,
    required this.title,
    required this.iconColor,
    required this.titleStyle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasInternetAccess = ref.watch(connectivityProvider);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SizeTransition(
          sizeFactor: animation,
          axisAlignment: -1.0,
          child: child,
        );
      },
      child: hasInternetAccess
          ? const SizedBox.shrink(key: ValueKey("BannerHidden"))
          : _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      key: const ValueKey("BannerVisible"),
      color: iconColor,
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
            Text(title, style: titleStyle),
          ],
        ),
      ),
    );
  }
}
