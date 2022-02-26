
import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

abstract class AbsCacheService{

  Future<void> init();

  Future<void> store(String key, String value);

  String? retrieve(String key);

  Future<void> remove(String key);

  bool keyExists(String key);

  T? retrieveObject<T extends Serializable>(String key, T instance) {
    var text = retrieve(key);
    if(text == null || text == 'null') return null;
    //
    return JsonSerializer().deserializeObject(text, instance);
  }
  
  Future<void> storeObject<T extends Serializable>(String key, T value){
    return store(key, JsonSerializer().serializeObject(value));
  }

  List<T>? retrieveList<T extends Serializable>(String key, T creator()) {
    var text = retrieve(key);
    if(text == null || text == 'null') return null;
    //
    return JsonSerializer().deserializeList(text, creator);
  }

  Future<void> storeList<T extends Serializable>(String key, List<T> value){
    return store(key, JsonSerializer().serializeList(value));
  }

}