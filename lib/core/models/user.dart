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
    required this.esbMemberID,
    required this.memberCode,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.countryCode,
    required this.passwordHash,
    required this.referralCodeReferrer,
    required this.referralCode,
    required this.email,
    required this.imageURL,
    required this.address,
    required this.gender,
    required this.birthDate,
    required this.pointAmount,
    required this.flagCompleteBonus,
    required this.isPhoneNumberVerified,
    required this.tier,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int esbMemberID;
  final String memberCode;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String countryCode;
  final String passwordHash;
  final String? referralCodeReferrer;
  final String referralCode;
  final String? email;
  final String? imageURL;
  final String? address;
  final int? gender;
  final String? birthDate;
  final int pointAmount;
  final bool flagCompleteBonus;
  final bool isPhoneNumberVerified;
  final UserTier tier;
  final String createdAt;
  final String updatedAt;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  factory User.fromMap(Map<String, dynamic> json) {
    print("id: ${json["id"]}");
    print("esb_member_id: ${json["esb_member_id"]}");
    print("member_code: ${json["member_code"]}");
    print("first_name: ${json["first_name"]}");
    print("last_name: ${json["last_name"]}");
    print("phone_number: ${json["phone_number"]}");
    print("country_code: ${json["country_code"]}");
    print("password_hash: ${json["password_hash"]}");

    return User(
      id: json["id"],
      esbMemberID: json["esb_member_id"],
      memberCode: json["member_code"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      phoneNumber: json["phone_number"],
      countryCode: json["country_code"],
      passwordHash: json["password_hash"],
      referralCodeReferrer: json["referral_code_referrer"],
      referralCode: json["referral_code"],
      email: json["email"],
      imageURL: json["image_url"],
      address: json["address"],
      gender: json["gender"],
      birthDate: json["birth_date"],
      pointAmount: json["point_amount"],
      flagCompleteBonus: json["flag_complete_bonus"],
      isPhoneNumberVerified: json["is_phone_number_verified"],
      tier: UserTier.fromMap(json["tier"]),
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
    "id": id,
    "esb_member_id": esbMemberID,
    "member_code": memberCode,
    "first_name": firstName,
    "last_name": lastName,
    "phone_number": phoneNumber,
    "country_code": countryCode,
    "password_hash": passwordHash,
    "referral_code_referrer": referralCodeReferrer,
    "referral_code": referralCode,
    "email": email,
    "image_url": imageURL,
    "address": address,
    "gender": gender,
    "birth_date": birthDate,
    "point_amount": pointAmount,
    "flag_complete_bonus": flagCompleteBonus,
    "is_phone_number_verified": isPhoneNumberVerified,
    "tier": tier.toMap(),
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class UserTier {
  final int level;
  final String? iconURL;
  final String? tierName;
  final String? currentTierName;
  final int currentQualification;
  final String? nextTierName;
  final int nextQualification;
  final int currentSpendingAmount;
  final int remainingSpendingAmount;

  UserTier({
    required this.level,
    required this.iconURL,
    required this.tierName,
    required this.currentTierName,
    required this.currentQualification,
    required this.nextTierName,
    required this.nextQualification,
    required this.currentSpendingAmount,
    required this.remainingSpendingAmount,
  });

  factory UserTier.fromJson(String str) => UserTier.fromMap(json.decode(str));

  factory UserTier.fromMap(Map<String, dynamic> json) {
    print("level: ${json["level"]}");
    print("icon_url: ${json["icon_url"]}");
    print("tier_name: ${json["tier_name"]}");
    print("current_tier_name: ${json["current_tier_name"]}");
    print("current_qualification: ${json["current_qualification"]}");
    print("next_tier_name: ${json["next_tier_name"]}");
    print("next_qualification: ${json["next_qualification"]}");
    print("current_spending_amount: ${json["current_spending_amount"]}");
    print("remaining_spending_amount: ${json["remaining_spending_amount"]}");

    return UserTier(
      level: json["level"],
      iconURL: json["icon_url"],
      tierName: json["tier_name"],
      currentTierName: json["current_tier_name"],
      currentQualification: json["current_qualification"],
      nextTierName: json["next_tier_name"],
      nextQualification: json["next_qualification"],
      currentSpendingAmount: json["current_spending_amount"],
      remainingSpendingAmount: json["remaining_spending_amount"],
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
    "level": level,
    "icon_url": iconURL,
    "tier_name": tierName,
    "current_tier_name": currentTierName,
    "current_qualification": currentQualification,
    "next_tier_name": nextTierName,
    "next_qualification": nextQualification,
    "current_spending_amount": currentSpendingAmount,
    "remaining_spending_amount": remainingSpendingAmount,
  };
}
