import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// A provider that monitors the internet connection status.
///
/// This class extends [ChangeNotifier] to notify listeners when the internet
/// connection status changes.
class InternetConnectionBannerProvider extends ChangeNotifier {
  bool _hasInternetAccess = true;
  late final StreamSubscription<InternetStatus> _listener;

  /// Creates an instance of [BannerStatusInternetConnectionProvider].
  ///
  /// Initializes the internet connection status listener.
  InternetConnectionBannerProvider() {
    _initialize();
  }

  /// Returns whether the device has internet access.
  ///
  /// @returns: A boolean indicating the internet access status [bool].
  bool get hasInternetAccess => _hasInternetAccess;

  /// Initializes the listener to check internet connection status.
  ///
  /// This method subscribes to the internet connection status stream and updates
  /// the [_hasInternetAccess] property whenever the connection status changes.
  void _initialize() {
    _listener = InternetConnection().onStatusChange.listen((status) {
      _hasInternetAccess = (status == InternetStatus.connected);
      notifyListeners();
    });
  }

  /// Cancels the internet connection listener when the provider is disposed.
  @override
  void dispose() {
    _listener.cancel();
    super.dispose();
  }
}
