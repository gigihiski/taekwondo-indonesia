import 'dart:convert';
import 'dart:io';

import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/models/user.dart';

class UpdateProfileResponse {
  final Meta meta;

  UpdateProfileResponse({required this.meta});

  factory UpdateProfileResponse.fromJson(String str) =>
      UpdateProfileResponse.fromMap(json.decode(str));

  factory UpdateProfileResponse.fromMap(Map<String, dynamic> json) =>
      UpdateProfileResponse(meta: Meta.fromMap(json["meta"]));
}

class UpdateProfile {
  File? profileImage;
  String? email;
  String? name;
  String? gender;
  String? birthDate;
  String? phoneNumber;

  UpdateProfile({
    this.profileImage,
    this.email,
    this.name,
    this.gender,
    this.birthDate,
    this.phoneNumber,
  });

  UserGender get sex {
    return gender == "MALE" ? UserGender.male : UserGender.female;
  }

  Map<String, String> toMap() => {
    if (name != null) "name": name!,
    if (gender != null) "gender": gender!,
    if (email != null) "email": email!,
    if (birthDate != null) "birth_date": birthDate!,
    if (phoneNumber != null) "phone_number": phoneNumber!,
    if (profileImage != null) "profile_picture": profileImage?.path ?? "",
  };
}
