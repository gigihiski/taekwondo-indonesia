import 'dart:convert';

class OTPRequest {
  String phoneNo;

  OTPRequest(this.phoneNo);

  String toJson() => json.encode(toMap());

  factory OTPRequest.fromJson(String str) =>
      OTPRequest.fromMap(json.decode(str));

  factory OTPRequest.fromMap(Map<String, dynamic> json) =>
      OTPRequest(json["phone_number"]);

  Map<String, dynamic> toMap() => {"phone_number": phoneNo};
}
