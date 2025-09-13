import 'dart:convert';

class ConfirmPasswordRequest {
  String phoneNo;
  String otp;
  String newPassword;
  String confirmPassword;

  ConfirmPasswordRequest(
    this.phoneNo,
    this.otp,
    this.newPassword,
    this.confirmPassword,
  );

  String toJson() => json.encode(toMap());

  factory ConfirmPasswordRequest.fromJson(String str) =>
      ConfirmPasswordRequest.fromMap(json.decode(str));

  factory ConfirmPasswordRequest.fromMap(Map<String, dynamic> json) =>
      ConfirmPasswordRequest(
        json["phone_number"],
        json["otp"],
        json["password"],
        json["confirmation_password"],
      );

  Map<String, dynamic> toMap() => {
        "phone_number": phoneNo,
        "otp": otp,
        "password": newPassword,
        "confirmation_password": newPassword,
      };
}
