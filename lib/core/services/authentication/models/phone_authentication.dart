import 'dart:convert';

import 'package:taekwondo/core/models/meta.dart';

class EmailAuthenticationRequest {
  final String email;
  final String password;

  EmailAuthenticationRequest({required this.email, required this.password});

  String toJson() => json.encode(toMap());

  factory EmailAuthenticationRequest.fromJson(String str) =>
      EmailAuthenticationRequest.fromMap(json.decode(str));

  factory EmailAuthenticationRequest.fromMap(Map<String, dynamic> map) =>
      EmailAuthenticationRequest(
        email: map["email"],
        password: map["password"],
      );
  Map<String, dynamic> toMap() => {"email": email, "password": password};
}

class EmailAuthenticationResponse {
  Meta meta;
  EmailAuthentication data;

  EmailAuthenticationResponse({required this.meta, required this.data});

  factory EmailAuthenticationResponse.fromJson(String str) =>
      EmailAuthenticationResponse.fromMap(json.decode(str));

  factory EmailAuthenticationResponse.fromMap(Map<String, dynamic> json) {
    return EmailAuthenticationResponse(
      meta: Meta.fromMap(json["meta"]),
      data: EmailAuthentication.fromMap(json["data"]),
    );
  }
}

class EmailAuthentication {
  final String accessToken;
  final String tokenType;

  EmailAuthentication({required this.accessToken, required this.tokenType});

  factory EmailAuthentication.fromJson(String str) =>
      EmailAuthentication.fromMap(json.decode(str));

  factory EmailAuthentication.fromMap(Map<String, dynamic> json) {
    return EmailAuthentication(
      accessToken: json["access_token"],
      tokenType: json["token_type"],
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
    "access_token": accessToken,
    "token_type": tokenType,
  };
}
