import 'dart:convert';

class ErrorResponse {
  List<String> errors;

  ErrorResponse({required this.errors});

  factory ErrorResponse.fromJson(String str) =>
      ErrorResponse.fromMap(json.decode(str));

  factory ErrorResponse.fromMap(Map<String, dynamic> map) {
    return ErrorResponse(
        errors: List<String>.from(map["errors"].map((x) => x)));
  }
}
