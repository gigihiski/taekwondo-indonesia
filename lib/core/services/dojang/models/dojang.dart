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
  final DateTime createdAt;

  final String? address;
  final String? district;
  final String? city;
  final String? province;
  final double? latitude;
  final double? longitude;

  final String? description;

  final String? website;
  final String? email;
  final String? phoneNumber;

  final String? logoUrl;

  Dojang({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    this.address,
    this.province,
    this.city,
    this.district,
    this.latitude,
    this.longitude,
    this.description,
    this.website,
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
    createdAt: DateTime.parse(map['created_at']),
    address: map['address'],
    province: map['province'],
    city: map['city'],
    district: map['district'],
    latitude: map['domicile_latitude'],
    longitude: map['domicile_longitude'],
    description: map['description'],
    website: map['website'],
    email: map['email'],
    phoneNumber: map['phone_number'],
    logoUrl: map['dojang_logo_url'],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "status": status,
    "created_at": createdAt,
    "address": address,
    "province": province,
    "city": city,
    "district": district,
    "latitude": latitude,
    "longitude": longitude,
    "description": description,
    "website": website,
    "email": email,
    "phone_number": phoneNumber,
    "dojang_logo_url": logoUrl,
  };
}
