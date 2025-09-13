import 'dart:convert';

import 'package:geolocator/geolocator.dart';

class Coordinate {
  final String latitude;
  final String longitude;

  Coordinate(this.latitude, this.longitude);

  String toJson() => json.encode(toMap());

  factory Coordinate.fromJson(String str) =>
      Coordinate.fromMap(json.decode(str));

  factory Coordinate.fromMap(Map<String, dynamic> json) =>
      Coordinate(json["latitude"], json["longitude"]);

  Map<String, dynamic> toMap() => {
    "latitude": latitude,
    "longitude": longitude,
  };

  factory Coordinate.fromPosition(Position position) =>
      Coordinate(position.latitude.toString(), position.longitude.toString());
}
