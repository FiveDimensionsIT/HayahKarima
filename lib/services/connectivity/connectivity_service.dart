import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hayah_karema/services/logger/log.dart';
import 'i_connectivity_service.dart';


class ConnectivityService implements IConnectivityService{

  ConnectivityService();

  final _connectivity = Connectivity();


  @override
  Stream<bool> onConnectivityChanged() async* {

    yield* _connectivity.onConnectivityChanged.map(_status);
  }

  @override
  Future<bool> isConnected() {
    return _connectivity.checkConnectivity().then(_status);
  }

  bool _status(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      Log.error("no internet connection found");
      return false;
    }
    Log.debug('internet connection', result);
    return true;
  }
}
