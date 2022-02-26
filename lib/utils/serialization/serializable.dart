part of serialization;
//import 'dart:convert';

abstract class Serializable {
  String serialize() {
    try {
      return json.encode(this.toMap());
    } catch (error) {
      throw SerializationException(obj: this, error: error);
    }
  }

  void deserialize(String text) {
    try {
      this.fromMap(json.decode(text));
    } catch (error) {
      throw DeserializationException(obj: this, text: text, error: error);
    }
  }

  //abstract
  Map<String, dynamic> toMap();

  //abstract
  ///fills the instance fields from the map, and returns itself
  void fromMap(Map<String, dynamic> map);
}

class SerializationException implements Exception {
  Serializable obj;
  Object error;

  SerializationException({required this.obj, required this.error});

  @override
  String toString() {
    return '(Serialization Error) object: $obj\n error: $error';
  }
}

class DeserializationException implements Exception {
  Serializable obj;
  String text;
  Object error;

  DeserializationException(
      {required this.obj, required this.text, required this.error});

  @override
  String toString() {
    return '(Deserialization Error) object: $obj \n text: $text \n error: $error';
  }
}
