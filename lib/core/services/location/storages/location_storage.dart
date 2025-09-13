import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taekwondo/core/services/location/models/location.dart';

abstract class IUserLocationStorage {
  Future<Location?> get location;
  Future<void> saveLocation(Location location);

  Future<List<Location>> get locations;
  Future<void> savelocations(List<Location> locations);
}

class LocationStorage implements IUserLocationStorage {
  final String locationKey = "location";
  final String locationsKey = "locations";

  final FlutterSecureStorage secureStorage;

  LocationStorage(this.secureStorage);

  @override
  Future<Location?> get location async {
    final String? location = await secureStorage
        .read(key: locationKey)
        .catchError((error) {
          throw Exception("GET_LOCATIONS_FAILED");
        });
    if (location == null) return null;
    return Location.fromJson(json.decode(location));
  }

  @override
  Future<void> saveLocation(Location location) async {
    await secureStorage.write(key: locationKey, value: json.encode(location));
  }

  @override
  Future<List<Location>> get locations async {
    final locations = await secureStorage.read(key: locationsKey);
    if (locations == null) return [];
    return await json
        .decode(locations)
        .map<Location>((e) => Location.fromJson(e))
        .toList();
  }

  @override
  Future<void> savelocations(List<Location> locations) async {
    await secureStorage
        .write(
          key: locationsKey,
          value: json.encode(
            locations.map((location) => location.toJson()).toList(),
          ),
        )
        .catchError((error) {
          throw Exception("SAVE_LOCATION_FAILED");
        });
  }

  factory LocationStorage.create() =>
      LocationStorage(const FlutterSecureStorage());
}
