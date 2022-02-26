

abstract class IConnectivityService{

  Stream<bool> onConnectivityChanged();

  Future<bool> isConnected();

}