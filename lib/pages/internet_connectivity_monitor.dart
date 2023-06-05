import 'dart:async';

import 'package:connectivity/connectivity.dart';

class InternetConnectivityMonitor {
  static final InternetConnectivityMonitor _instance =
      InternetConnectivityMonitor._internal();
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _subscription;
  Function(bool hasConnection)? onConnectivityChanged;

  factory InternetConnectivityMonitor() {
    return _instance;
  }

  InternetConnectivityMonitor._internal() {
    _subscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (onConnectivityChanged != null) {
        bool hasConnection = result != ConnectivityResult.none;
        onConnectivityChanged!(hasConnection);
      }
    });
  }

  void dispose() {
    _subscription.cancel();
  }
}
