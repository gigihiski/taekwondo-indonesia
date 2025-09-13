import 'dart:convert';

class AppleIDAuthenticationRequest {
  String token;
  String email;

  AppleIDAuthenticationRequest(
    this.token,
    this.email,
  );

  String toJson() => json.encode(toMap());

  factory AppleIDAuthenticationRequest.fromJson(String str) =>
      AppleIDAuthenticationRequest.fromMap(json.decode(str));

  factory AppleIDAuthenticationRequest.fromMap(Map<String, dynamic> json) =>
      AppleIDAuthenticationRequest(
        json["token"],
        json["email"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "email": email,
      };
}
