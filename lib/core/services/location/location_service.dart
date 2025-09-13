import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

abstract class ILocationService {
  Future<Position> getCurrentPosition();
  StreamSubscription<Position> get locationStream;
}

class LocationService implements ILocationService {
  final LocationSettings locationSettings;

  LocationService(this.locationSettings);

  @override
  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition().timeout(
      const Duration(seconds: 15),
      onTimeout: () => throw TimeoutException('LOCATION_TIMEOUT'),
    );
  }

  @override
  StreamSubscription<Position> get locationStream {
    return Geolocator.getPositionStream(
      locationSettings: locationSettings,
    ).listen((Position? position) {
      print(
        position == null
            ? 'Unknown'
            : '${position.latitude.toString()}, ${position.longitude.toString()}',
      );
    });
  }

  factory LocationService.create() {
    LocationSettings settings;
    if (defaultTargetPlatform == TargetPlatform.android) {
      settings = AndroidSettings(
        distanceFilter: 0,
        timeLimit: const Duration(seconds: 30),
        intervalDuration: const Duration(milliseconds: 500),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      settings = AppleSettings(
        activityType: ActivityType.automotiveNavigation,
        distanceFilter: 10,
        pauseLocationUpdatesAutomatically: true,
        showBackgroundLocationIndicator: false,
      );
    } else {
      settings = const LocationSettings(distanceFilter: 10);
    }
    return LocationService(settings);
  }
}
