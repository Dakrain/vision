import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class NetworkCheckUtilities {
  bool gotNetwork = true;

  void listenToNetworkChange({
    required VoidCallback noNetworkCallback,
    required VoidCallback gotNetworkCallback,
  }) {
    StreamSubscription<ConnectivityResult> sub =
        Connectivity().onConnectivityChanged.listen((event) {
      switch (event) {
        case ConnectivityResult.none:
          noNetworkCallback();
          gotNetwork = false;
          break;

        case ConnectivityResult.vpn:
        case ConnectivityResult.other:
        case ConnectivityResult.bluetooth:
          break;

        case ConnectivityResult.wifi:
        case ConnectivityResult.ethernet:
        case ConnectivityResult.mobile:
          if (!gotNetwork) {
            gotNetworkCallback.call();
          }
          gotNetwork = true;
          break;
      }
    });
  }
}
