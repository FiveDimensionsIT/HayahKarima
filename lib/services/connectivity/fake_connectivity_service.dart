
import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'connectivity_lib.dart';

class FakeConnectivityService implements IConnectivityService{

  bool _connected = true;
  late BehaviorSubject<bool> _controller;



  FakeConnectivityService(){
    _controller = BehaviorSubject.seeded(_connected);
  }


  @override
  Future<bool> isConnected() async{
    return _connected;
  }

  @override
  Stream<bool> onConnectivityChanged() {
    return _controller.stream;
  }

  void setConnected(bool value){
    this._connected = value;
    _controller.sink.add(value);
  }

}