import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taekwondo/core/models/coordinate.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

abstract class IUserLocationStorage {
  Future<Coordinate> get position;
  Future<void> savePosition(Coordinate coordinate);
}

class UserLocationStorage implements IUserLocationStorage {
  final String positionKey = "position";

  final FlutterSecureStorage secureStorage;

  UserLocationStorage(this.secureStorage);

  @override
  Future<Coordinate> get position async {
    final String? coordinate = await secureStorage
        .read(key: positionKey)
        .catchError((error) {
          throw CustomException();
        });
    if (coordinate == null) throw CustomException();
    return Coordinate.fromJson(coordinate);
  }

  @override
  Future<void> savePosition(Coordinate coordinate) async {
    await secureStorage.write(key: positionKey, value: coordinate.toJson());
  }

  factory UserLocationStorage.create() =>
      UserLocationStorage(const FlutterSecureStorage());
}
