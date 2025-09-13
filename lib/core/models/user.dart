import 'dart:convert';

import 'package:taekwondo/core/models/meta.dart';

enum UserGender { male, female }

abstract class IUser {}

class UserRequest {
  String phoneNumber;
  String password;

  UserRequest({required this.phoneNumber, required this.password});

  String toJson() => json.encode(toMap());

  factory UserRequest.fromJson(String str) =>
      UserRequest.fromMap(json.decode(str));

  factory UserRequest.fromMap(Map<String, dynamic> json) => UserRequest(
    phoneNumber: json["phone_number"],
    password: json["password"],
  );

  Map<String, dynamic> toMap() => {
    "phone_number": phoneNumber,
    "password": password,
  };
}

class UserResponse {
  Meta meta;
  User data;

  UserResponse({required this.meta, required this.data});

  factory UserResponse.fromJson(String str) =>
      UserResponse.fromMap(json.decode(str));

  factory UserResponse.fromMap(Map<String, dynamic> json) {
    return UserResponse(
      meta: Meta.fromMap(json["meta"]),
      data: User.fromMap(json["data"]),
    );
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  final String id;
  final String name;
  final String email;
  final String phone;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
  };
}
