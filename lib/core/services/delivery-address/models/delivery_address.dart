import 'dart:convert';

import 'package:taekwondo/core/models/meta.dart';

class DeliveryAddress {
  final int? id;
  final String label;
  final String address;
  final String notes;
  final double longitude;
  final double latitude;
  final bool isDefault;

  const DeliveryAddress({
    this.id,
    required this.label,
    required this.address,
    required this.notes,
    required this.longitude,
    required this.latitude,
    required this.isDefault,
  });

  String toJson() => json.encode(toMap());

  factory DeliveryAddress.fromJson(String str) =>
      DeliveryAddress.fromMap(json.decode(str));

  factory DeliveryAddress.fromMap(Map<String, dynamic> json) {
    return DeliveryAddress(
      id: json["id"],
      label: json["label"],
      address: json["address"],
      notes: json["notes"],
      longitude: json["longitude"],
      latitude: json["latitude"],
      isDefault: json["is_default"],
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "label": label,
    "address": address,
    "notes": notes,
    "longitude": longitude,
    "latitude": latitude,
    "is_default": isDefault,
  };
}

class DeliveryAddressResponse {
  Meta meta;
  DeliveryAddress data;

  DeliveryAddressResponse({required this.meta, required this.data});

  factory DeliveryAddressResponse.fromJson(String str) =>
      DeliveryAddressResponse.fromMap(json.decode(str));

  factory DeliveryAddressResponse.fromMap(Map<String, dynamic> json) {
    return DeliveryAddressResponse(
      meta: Meta.fromMap(json["meta"]),
      data: DeliveryAddress.fromMap(json["data"]),
    );
  }
}

class DeliveryAddressesResponse {
  Meta meta;
  List<DeliveryAddress> data;

  DeliveryAddressesResponse({required this.meta, required this.data});

  factory DeliveryAddressesResponse.fromJson(String str) =>
      DeliveryAddressesResponse.fromMap(json.decode(str));

  factory DeliveryAddressesResponse.fromMap(Map<String, dynamic> json) {
    return DeliveryAddressesResponse(
      meta: Meta.fromMap(json["meta"]),
      data: json["data"] != null
          ? List<DeliveryAddress>.from(
              json["data"].map((x) => DeliveryAddress.fromMap(x)),
            )
          : [],
    );
  }
}
