import 'package:taekwondo/core/services/location/location_service.dart';
import 'package:taekwondo/core/services/location/models/coordinate.dart';
import 'package:taekwondo/core/services/location/models/location.dart';
import 'package:taekwondo/core/services/location/permissions/location_permission.dart';
import 'package:taekwondo/core/services/location/storages/location_storage.dart';

abstract class ILocationRepository {
  Future<void> requestPermission();
  Future<Location> getUpdatedLocation();
  Future<Location> getLocation();
}

class LocationRepository implements ILocationRepository {
  final LocationService locationService;
  final LocationStorage locationStorage;
  final LocationPermission locationPermission;

  LocationRepository({
    required this.locationService,
    required this.locationStorage,
    required this.locationPermission,
  });

  @override
  Future<void> requestPermission() async {
    await locationPermission.request();
  }

  @override
  Future<Location> getUpdatedLocation() async {
    final position = await locationService.getCurrentPosition();
    final coordinate = Coordinate.fromPosition(position);

    final location = await Location.fromCoordinate(coordinate);
    await locationStorage.saveLocation(location);
    return location;
  }

  @override
  Future<Location> getLocation() async {
    return await locationStorage.location ?? await getUpdatedLocation();
  }

  factory LocationRepository.create() {
    return LocationRepository(
      locationService: LocationService.create(),
      locationStorage: LocationStorage.create(),
      locationPermission: LocationPermission.create(),
    );
  }
}
