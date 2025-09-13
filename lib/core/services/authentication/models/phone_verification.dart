import 'dart:convert';

class PhoneValidationRequest {
  String phoneNo;

  PhoneValidationRequest(this.phoneNo);

  String toJson() => json.encode(toMap());

  factory PhoneValidationRequest.fromJson(String str) =>
      PhoneValidationRequest.fromMap(json.decode(str));

  factory PhoneValidationRequest.fromMap(Map<String, dynamic> json) =>
      PhoneValidationRequest(json["phoneNumber"]);

  Map<String, dynamic> toMap() => {"phoneNumber": phoneNo};
}

class PhoneValidationResponse {
  String status;

  PhoneValidationResponse(this.status);

  String toJson() => json.encode(toMap());

  factory PhoneValidationResponse.fromJson(String str) =>
      PhoneValidationResponse.fromMap(json.decode(str));

  factory PhoneValidationResponse.fromMap(Map<String, dynamic> json) =>
      PhoneValidationResponse(json["Status"]);

  Map<String, dynamic> toMap() => {"Status": status};
}
