import 'dart:convert';

import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/services/authentication/models/access_token.dart';

class PhoneAuthenticationRequest {
  final String phoneNumber;
  final String password;
  String? deviceId;
  String? type;
  String? token;

  PhoneAuthenticationRequest({
    required this.phoneNumber,
    required this.password,
    this.deviceId,
    this.type,
    this.token,
  });

  String toJson() => json.encode(toMap());

  factory PhoneAuthenticationRequest.fromJson(String str) =>
      PhoneAuthenticationRequest.fromMap(json.decode(str));

  factory PhoneAuthenticationRequest.fromMap(Map<String, dynamic> map) =>
      PhoneAuthenticationRequest(
        phoneNumber: map["phone_number"],
        password: map["password"],
        deviceId: map["device_id"],
        type: map["type"],
        token: map["token"],
      );
  Map<String, dynamic> toMap() => {
    "phone_number": "62$phoneNumber",
    "password": password,
    "device_id": deviceId,
    "type": type,
    "token": token,
  };
}

class PhoneAuthenticationResponse {
  Meta meta;
  PhoneAuthentication data;

  PhoneAuthenticationResponse({required this.meta, required this.data});

  factory PhoneAuthenticationResponse.fromJson(String str) =>
      PhoneAuthenticationResponse.fromMap(json.decode(str));

  factory PhoneAuthenticationResponse.fromMap(Map<String, dynamic> json) {
    return PhoneAuthenticationResponse(
      meta: Meta.fromMap(json["meta"]),
      data: PhoneAuthentication.fromMap(json["data"]),
    );
  }
}

class PhoneAuthentication {
  final String memberCode;
  final String firstName;
  final String lastName;
  final bool isNewPassword;
  final AccessToken token;

  PhoneAuthentication({
    required this.memberCode,
    required this.firstName,
    required this.lastName,
    required this.isNewPassword,
    required this.token,
  });

  factory PhoneAuthentication.fromJson(String str) =>
      PhoneAuthentication.fromMap(json.decode(str));

  factory PhoneAuthentication.fromMap(Map<String, dynamic> json) {
    return PhoneAuthentication(
      memberCode: json["member_code"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      isNewPassword: json["is_new_password"],
      token: AccessToken.fromMap(json),
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
    "member_code": memberCode,
    "first_name": firstName,
    "last_name": lastName,
    "is_new_password": isNewPassword,
    "token": token,
  };
}
