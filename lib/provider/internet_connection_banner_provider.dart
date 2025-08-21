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

  /// Creates an instance of [InternetConnectionBannerProvider].
  ///
  /// Initializes the internet connection status listener.
  InternetConnectionBannerProvider() {
    _initialize();
  }

  /// Returns whether the device has internet access.
  bool get hasInternetAccess => _hasInternetAccess;

  /// Initializes the listener to check internet connection status.
  ///
  /// Performs an immediate check and subscribes to the stream.
  Future<void> _initialize() async {
    // 🔹 Do an immediate check at startup
    await InternetConnection().hasInternetAccess;

    // 🔹 Then listen for changes
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
