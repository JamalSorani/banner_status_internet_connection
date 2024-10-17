import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectivityProvider extends ChangeNotifier {
  bool _hasInternetAccess = true;
  bool get hasInternetAccess => _hasInternetAccess;

  late final StreamSubscription<InternetStatus> _listener;

  ConnectivityProvider() {
    _initialize();
  }

  void _initialize() {
    _listener = InternetConnection().onStatusChange.listen((status) {
      _hasInternetAccess = status == InternetStatus.connected;
      notifyListeners();
    });
  }

  Future<void> checkInternetConnection() async {
    _hasInternetAccess = await InternetConnection().hasInternetAccess;
    notifyListeners();
  }

  @override
  void dispose() {
    _listener.cancel();
    super.dispose();
  }
}
