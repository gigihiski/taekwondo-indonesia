import 'dart:convert';
import 'package:taekwondo/core/models/meta.dart';

class ErrorForm {
  Meta meta;
  String data;

  ErrorForm({required this.meta, required this.data});

  static convertMapToString(Map<String, dynamic>? messageData) {
    String message = "";
    if (messageData == null) return message;
    messageData.forEach((key, value) {
      message += "$key: ${value[0]}\n";
    });
    return message;
  }

  factory ErrorForm.fromJson(String str) => ErrorForm.fromMap(json.decode(str));

  factory ErrorForm.fromMap(Map<String, dynamic> map) {
    return ErrorForm(
      meta: Meta.fromMap(map["meta"]),
      data: map["data"] == null
          ? map["meta"]["description"] ?? map["meta"]["message"]
          : ErrorForm.convertMapToString(map["data"]),
    );
  }
}
