import 'dart:convert';

import 'package:taekwondo/core/services/authentication/models/access_token.dart';

class PhoneRegistrationRequest {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String password;
  String? email;
  String? deviceId;
  String? type;
  String? token;

  PhoneRegistrationRequest({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.password,
    this.email,
    this.deviceId,
    this.type,
    this.token,
  });

  String toJson() => json.encode(toMap());

  factory PhoneRegistrationRequest.fromJson(String str) =>
      PhoneRegistrationRequest.fromMap(json.decode(str));

  factory PhoneRegistrationRequest.fromMap(Map<String, dynamic> map) =>
      PhoneRegistrationRequest(
        firstName: map["first_name"],
        lastName: map["last_name"],
        phoneNumber: map["phone_number"],
        password: map["password"],
        email: map["email"],
        deviceId: map["device_id"] ?? "",
        type: map["type"],
        token: map["token"],
      );

  Map<String, dynamic> toMap() => {
    "first_name": firstName,
    "last_name": lastName,
    "phone_number": "62$phoneNumber",
    "password": password,
    "email": email,
    "device_id": deviceId ?? "",
    "type": type,
    "token": token,
  };
}

class PhoneRegistrationResponse {
  PhoneRegistration data;

  PhoneRegistrationResponse({required this.data});

  factory PhoneRegistrationResponse.fromJson(String str) =>
      PhoneRegistrationResponse.fromMap(json.decode(str));

  factory PhoneRegistrationResponse.fromMap(Map<String, dynamic> json) {
    return PhoneRegistrationResponse(
      data: PhoneRegistration.fromMap(json["data"]),
    );
  }
}

class PhoneRegistration {
  final String memberCode;
  final String firstName;
  final String lastName;
  final bool isNewPassword;
  final AccessToken token;

  PhoneRegistration({
    required this.memberCode,
    required this.firstName,
    required this.lastName,
    required this.isNewPassword,
    required this.token,
  });

  factory PhoneRegistration.fromJson(String str) =>
      PhoneRegistration.fromMap(json.decode(str));

  factory PhoneRegistration.fromMap(Map<String, dynamic> json) {
    return PhoneRegistration(
      memberCode: json["memberCode"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      isNewPassword: json["isNewPassword"],
      token: AccessToken.fromMap(json),
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
    "memberCode": memberCode,
    "firstName": firstName,
    "lastName": lastName,
    "isNewPassword": isNewPassword,
    "token": token,
  };
}
