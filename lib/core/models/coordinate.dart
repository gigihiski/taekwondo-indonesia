import 'dart:convert';

class Coordinate {
  Coordinate({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  String toJson() => json.encode(toMap());

  factory Coordinate.fromJson(String str) =>
      Coordinate.fromMap(json.decode(str));

  factory Coordinate.fromMap(Map<String, dynamic> json) => Coordinate(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toMap() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
