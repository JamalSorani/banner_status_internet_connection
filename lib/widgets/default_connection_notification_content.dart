part of '../banner_status_internet_connection.dart';

class DefaultConnectionNotificationContent extends StatelessWidget {
  const DefaultConnectionNotificationContent({
    super.key,
    required this.isConnected,
    required this.params,
  });

  final bool isConnected;
  final InternetConnectionBannerParams params;

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isConnected
                ? (params.connectedText ?? 'Back Online')
                : (params.disconnectedText ?? 'Retrying'),
            style: (isConnected
                    ? params.connectedTextStyle
                    : params.disconnectedTextStyle) ??
                const TextStyle(color: Colors.white),
          ),
          if (params.hasIndicationIcon)
            SizedBox(width: params.textAndIconSeparationWith ?? 10),
          if (params.hasIndicationIcon)
            SizedBox(
              height: params.iconBoxSideLength ?? 10,
              width: params.iconBoxSideLength ?? 10,
              child: isConnected
                  ? params.connectedIcon ??
                      const Icon(
                        Icons.check,
                        size: 12,
                        color: Colors.white,
                      )
                  : params.disconnectedIcon ??
                      (isIOS
                          ? CupertinoTheme(
                              data: CupertinoTheme.of(context)
                                  .copyWith(brightness: Brightness.dark),
                              child: const CupertinoActivityIndicator(),
                            )
                          : const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                              strokeWidth: 2.0,
                            )),
            ),
        ],
      ),
    );
  }
}
