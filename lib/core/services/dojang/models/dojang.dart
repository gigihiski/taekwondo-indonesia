import 'dart:convert';
import 'package:taekwondo/core/models/meta.dart';

class DojangResponse {
  final Meta meta;
  final Dojang data;

  DojangResponse({required this.meta, required this.data});

  factory DojangResponse.fromJson(String str) =>
      DojangResponse.fromMap(json.decode(str));

  factory DojangResponse.fromMap(Map<String, dynamic> map) {
    return DojangResponse(
      meta: Meta.fromMap(map["meta"]),
      data: Dojang.fromMap(map["data"]),
    );
  }
}

class DojangsResponse {
  final Meta meta;
  final List<Dojang> data;

  DojangsResponse({required this.meta, required this.data});

  factory DojangsResponse.fromJson(String str) =>
      DojangsResponse.fromMap(json.decode(str));

  factory DojangsResponse.fromMap(Map<String, dynamic> map) {
    return DojangsResponse(
      meta: Meta.fromMap(map["meta"]),
      data: map['data'] != null
          ? List<Dojang>.from(map['data'].map((x) => Dojang.fromMap(x)))
          : [],
    );
  }
}

class Dojang {
  final String id;
  final String name;
  final String status;
  final String country;
  final DateTime createdAt;

  final String? province;
  final String? city;
  final String? district;
  final double? latitude;
  final double? longitude;

  final String? email;
  final String? phoneNumber;

  final String? logoUrl;

  Dojang({
    required this.id,
    required this.name,
    required this.status,
    required this.country,
    required this.createdAt,
    this.province,
    this.city,
    this.district,
    this.latitude,
    this.longitude,
    this.email,
    this.phoneNumber,
    this.logoUrl,
  });

  String toJson() => json.encode(toMap());

  factory Dojang.fromJson(String str) => Dojang.fromMap(json.decode(str));

  factory Dojang.fromMap(Map<String, dynamic> map) => Dojang(
    id: map['id'],
    name: map['name'],
    status: map['status'],
    country: map['country'],
    createdAt: DateTime.parse(map['created_at']),
    province: map['province'],
    city: map['city'],
    district: map['district'],
    latitude: map['latitude'],
    longitude: map['longitude'],
    email: map['email'],
    phoneNumber: map['phone_number'],
    logoUrl: map['logo_url'],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "status": status,
    "country": country,
    "created_at": createdAt,
    "province": province,
    "city": city,
    "district": district,
    "latitude": latitude,
    "longitude": longitude,
    "email": email,
    "phone_number": phoneNumber,
    "logo_url": logoUrl,
  };
}
