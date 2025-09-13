import 'dart:convert';

import 'package:taekwondo/core/services/authentication/models/access_token.dart';

class EmailRegistrationRequest {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;

  EmailRegistrationRequest({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  String toJson() => json.encode(toMap());

  factory EmailRegistrationRequest.fromJson(String str) =>
      EmailRegistrationRequest.fromMap(json.decode(str));

  factory EmailRegistrationRequest.fromMap(Map<String, dynamic> map) =>
      EmailRegistrationRequest(
        name: map["name"],
        email: map["email"],
        phoneNumber: map["phone_number"],
        password: map["password"],
      );

  Map<String, dynamic> toMap() => {
    "name": name,
    "email": email,
    "phone_number": phoneNumber,
    "password": password,
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
