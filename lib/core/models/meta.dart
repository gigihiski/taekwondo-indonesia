import 'dart:convert';

class Meta {
  final int code;
  final String message;

  Meta({
    required this.code,
    required this.message,
  });

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str)["meta"]);

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        code: json["code"],
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
      };
}
