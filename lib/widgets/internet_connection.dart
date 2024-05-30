import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

enum InternetConnectionStatus {
  connected,
  disconnected,
}

class InternetConnectionProvider with ChangeNotifier {
  InternetConnectionStatus _status = InternetConnectionStatus.disconnected;

  InternetConnectionStatus get status => _status;

  InternetConnectionProvider() {
    _checkInternetConnection();
    Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        _status = InternetConnectionStatus.disconnected;
      } else {
        _status = InternetConnectionStatus.connected;
      }
      notifyListeners();
    });
  }

  Future<void> _checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      _status = InternetConnectionStatus.disconnected;
    } else {
      _status = InternetConnectionStatus.connected;
    }
    notifyListeners();
  }
}
