

import '../cache_lib.dart';

class FakeCacheService extends AbsCacheService{

  Map<String, String?> data = new Map();

  @override
  Future init() async{
    // do nothing
  }

  @override
  bool keyExists(String key) {
    return data.containsKey(key);
  }

  @override
  Future remove(String key) async{
    data.remove(key);
  }

  @override
  String? retrieve(String key) {
    return data[key];
  }

  @override
  Future store(String key, String value) async{
    data[key] = value;
  }

}