import 'dart:convert';

abstract class IAccessToken {}

class AccessToken {
  final String token;

  AccessToken(this.token);

  factory AccessToken.fromJson(String str) =>
      AccessToken.fromMap(json.decode(str));

  factory AccessToken.fromMap(Map<String, dynamic> json) =>
      AccessToken(json["token"]);
}
