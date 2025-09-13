import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

abstract class IClearStorage {
  Future<void> clear(String key);
  Future<void> clearAll();
}

class ClearStorage implements IClearStorage {
  final FlutterSecureStorage secureStorage;

  ClearStorage(this.secureStorage);

  @override
  Future<void> clear(String key) async {
    await secureStorage.delete(key: key).catchError((error) {
      throw CustomException();
    });
  }

  @override
  Future<void> clearAll() async {
    await secureStorage.deleteAll().catchError((error) {
      throw CustomException();
    });
  }

  factory ClearStorage.create() => ClearStorage(const FlutterSecureStorage());
}
