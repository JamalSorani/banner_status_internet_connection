import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

// StateNotifier to manage internet connectivity status.
class ConnectivityController extends StateNotifier<bool> {
  late final StreamSubscription<InternetStatus> listener;

  ConnectivityController() : super(true) {
    initialize();
  }

  void initialize() {
    listener = InternetConnection().onStatusChange.listen((status) {
      switch (status) {
        case InternetStatus.connected:
          state = true; // The internet is now connected
          break;
        case InternetStatus.disconnected:
          state = false; // The internet is now disconnected
          break;
      }
    });
  }

  Future<void> checkInternetConnection() async {
    state = await InternetConnection().hasInternetAccess;
  }

  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }
}

final connectivityProvider =
    StateNotifierProvider<ConnectivityController, bool>(
  (ref) => ConnectivityController(),
);
