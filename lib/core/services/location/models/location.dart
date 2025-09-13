import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:taekwondo/core/services/location/models/coordinate.dart';

class Location {
  String? zone;
  String? address;
  String? city;
  String? state;
  String? country;
  Coordinate? coordinate;

  Location({
    this.zone,
    this.address,
    this.city,
    this.state,
    this.country,
    this.coordinate,
  });

  @override
  String toString() {
    return "$city, $state";
  }

  String get formattedState {
    return (state != null)
        ? state!.replaceAll(RegExp(r'Wilayah Persekutuan'), 'W.P.')
        : "";
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  Future<Location> from(String latitude, String longitude) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      double.parse(latitude),
      double.parse(longitude),
    );

    String address = placemarks[1].street?.toString() ?? "";
    String city = placemarks[1].locality?.toString() ?? "";
    String state = placemarks[1].administrativeArea?.toString() ?? "";
    String country = placemarks[1].country?.toString() ?? "";

    return Location(
      zone: zone,
      address: address,
      city: city,
      state: state,
      country: country,
      coordinate: Coordinate(latitude, longitude),
    );
  }

  static Future<Location> fromCoordinate(Coordinate coordinate) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      double.parse(coordinate.latitude),
      double.parse(coordinate.longitude),
    );

    String address = placemarks[0].street?.toString() ?? "";
    String city = placemarks[0].locality?.toString() ?? "";
    String state = placemarks[0].administrativeArea?.toString() ?? "";
    String country = placemarks[0].country?.toString() ?? "";

    return Location(
      address: address,
      city: city,
      state: state,
      country: country,
      coordinate: coordinate,
    );
  }

  factory Location.create() => Location();

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      zone: map['zone'],
      address: map['address'],
      city: map['city'],
      state: map['state'],
      country: map['country'],
      coordinate: Coordinate(map['latitude'], map['longitude']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'zone': zone,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'latitude': coordinate?.latitude,
      'longitude': coordinate?.longitude,
    };
  }
}
