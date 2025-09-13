import 'package:permission_handler/permission_handler.dart';

class LocationPermission {
  const LocationPermission();

  Future<bool> request() async {
    final status = await Permission.location.status;
    if (status == PermissionStatus.granted) return true;

    final granted = await Permission.location.request();
    if (granted == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    } else if (granted == PermissionStatus.granted) {
      return true;
    } else {
      throw Exception("LOCATION_PERMISSION_DENIED");
    }
    return false;
  }

  factory LocationPermission.create() => LocationPermission();
}
