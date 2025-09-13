import 'dart:convert';

import 'package:taekwondo/core/models/meta.dart';

class ExistingGoogleAccountRequest {
  final String token;
  final String? type;

  ExistingGoogleAccountRequest({required this.token, this.type});

  String toJson() => json.encode(toMap());

  factory ExistingGoogleAccountRequest.fromJson(String str) =>
      ExistingGoogleAccountRequest.fromMap(json.decode(str));

  factory ExistingGoogleAccountRequest.fromMap(Map<String, dynamic> map) =>
      ExistingGoogleAccountRequest(token: map["token"], type: map["type"]);

  Map<String, dynamic> toMap() => {"token": token, "type": "google"};
}

class ExistingGoogleAccountResponse {
  final Meta meta;
  final ExistingGoogleAccount data;

  ExistingGoogleAccountResponse({required this.meta, required this.data});

  factory ExistingGoogleAccountResponse.fromJson(String str) =>
      ExistingGoogleAccountResponse.fromMap(json.decode(str));

  factory ExistingGoogleAccountResponse.fromMap(Map<String, dynamic> json) =>
      ExistingGoogleAccountResponse(
        meta: Meta.fromMap(json['meta']),
        data: ExistingGoogleAccount.fromMap(json['data']),
      );
}

class ExistingGoogleAccount {
  final String memberCode;
  final String firstName;
  final String lastName;
  final bool isNewPassword;
  final String token;

  ExistingGoogleAccount({
    required this.memberCode,
    required this.firstName,
    required this.lastName,
    required this.isNewPassword,
    required this.token,
  });

  bool get exist {
    return (token.isNotEmpty) ? true : false;
  }

  String toJson() => json.encode(toMap());

  factory ExistingGoogleAccount.fromJson(String str) =>
      ExistingGoogleAccount.fromMap(json.decode(str));

  factory ExistingGoogleAccount.fromMap(Map<String, dynamic> json) {
    return ExistingGoogleAccount(
      memberCode: json["member_code"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      isNewPassword: json["is_new_password"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toMap() => {
    "member_code": memberCode,
    "first_name": firstName,
    "last_name": lastName,
    "is_new_password": isNewPassword,
    "token": token,
  };
}

class GoogleAuthenticationRequest {
  final String token;
  String? type;
  String? referralCode;

  GoogleAuthenticationRequest({
    required this.token,
    this.type,
    this.referralCode,
  });

  String toJson() => json.encode(toMap());

  factory GoogleAuthenticationRequest.fromJson(String str) =>
      GoogleAuthenticationRequest.fromMap(json.decode(str));

  factory GoogleAuthenticationRequest.fromMap(Map<String, dynamic> map) =>
      GoogleAuthenticationRequest(
        token: map["token"],
        type: map["type"],
        referralCode: map["referral_code"],
      );

  Map<String, dynamic> toMap() => {
    "token": token,
    "type": "google",
    "referral_code": referralCode,
  };
}
