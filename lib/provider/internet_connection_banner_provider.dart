import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// A singleton provider that monitors the internet connection status.
///
/// This class extends [ChangeNotifier] to notify listeners when the internet
/// connection status changes. It ensures only one instance exists across the app.
class InternetConnectionBannerProvider extends ChangeNotifier {
  // 🔹 Singleton instance
  static final InternetConnectionBannerProvider _instance =
      InternetConnectionBannerProvider._internal();

  factory InternetConnectionBannerProvider() => _instance;

  InternetConnectionBannerProvider._internal() {
    _initialize();
  }

  bool _noInternetAccess = false;
  bool get noInternetAccess => _noInternetAccess;

  StreamSubscription<InternetStatus>? _listener;

  /// Initializes the listener to check internet connection status.
  /// Performs an immediate check and subscribes to the stream.
  Future<void> _initialize() async {
    await InternetConnection().hasInternetAccess;

    _listener ??= InternetConnection().onStatusChange.listen((status) {
      print(status);
      _noInternetAccess = (status == InternetStatus.disconnected);
      notifyListeners();
    });
  }

  /// Cancels the internet connection listener when the provider is disposed.
  @override
  void dispose() {
    _listener?.cancel();
    _listener = null;
    super.dispose();
  }
}
