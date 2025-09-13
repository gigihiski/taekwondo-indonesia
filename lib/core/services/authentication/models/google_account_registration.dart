import 'dart:convert';

import 'package:taekwondo/core/models/meta.dart';

class GoogleAccountRegistrationRequest {
  final String? firstName;
  final String? lastName;
  final String email;
  final String phoneNumber;
  final String token;
  String? deviceId;
  String? type;
  final String? referralCode;

  GoogleAccountRegistrationRequest({
    required this.email,
    required this.phoneNumber,
    required this.token,
    this.firstName,
    this.lastName,
    this.deviceId,
    this.type,
    this.referralCode,
  });

  String toJson() => json.encode(toMap());

  factory GoogleAccountRegistrationRequest.fromJson(String str) =>
      GoogleAccountRegistrationRequest.fromMap(json.decode(str));

  factory GoogleAccountRegistrationRequest.fromMap(Map<String, dynamic> map) =>
      GoogleAccountRegistrationRequest(
        firstName: map["first_name"],
        lastName: map["last_name"],
        email: map["email"],
        phoneNumber: map["phone_number"],
        token: map["token"],
        deviceId: map["device_id"],
        type: map["type"],
        referralCode: map["referral_code"],
      );

  Map<String, dynamic> toMap() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone_number": "62$phoneNumber",
    "token": token,
    "device_id": deviceId,
    "type": "google",
    "referral_code": referralCode,
  };
}

class GoogleAccountRegistrationResponse {
  Meta meta;
  GoogleAccountRegistration data;

  GoogleAccountRegistrationResponse({required this.meta, required this.data});

  factory GoogleAccountRegistrationResponse.fromJson(String str) =>
      GoogleAccountRegistrationResponse.fromMap(json.decode(str));

  factory GoogleAccountRegistrationResponse.fromMap(
    Map<String, dynamic> json,
  ) => GoogleAccountRegistrationResponse(
    meta: Meta.fromMap(json["meta"]),
    data: GoogleAccountRegistration.fromMap(json["data"]),
  );
}

class GoogleAccountRegistration {
  final String token;

  GoogleAccountRegistration({required this.token});

  String toJson() => json.encode(toMap());

  factory GoogleAccountRegistration.fromJson(String str) =>
      GoogleAccountRegistration.fromMap(json.decode(str));

  factory GoogleAccountRegistration.fromMap(Map<String, dynamic> json) =>
      GoogleAccountRegistration(token: json["token"]);

  Map<String, dynamic> toMap() => {"token": token};
}
