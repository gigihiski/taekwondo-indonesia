import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taekwondo/core/models/user.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

abstract class IProfileStorage {
  Future<User> get profile;
  Future<void> saveProfile(User profile);
}

class ProfileStorage implements IProfileStorage {
  final String profileKey = "profile";

  final FlutterSecureStorage secureStorage;

  ProfileStorage(this.secureStorage);

  @override
  Future<User> get profile async {
    final user = await secureStorage.read(key: profileKey);
    if (user == null) throw CustomException();
    return User.fromJson(user);
  }

  @override
  Future<void> saveProfile(User profile) async {
    return await secureStorage
        .write(key: profileKey, value: profile.toJson())
        .catchError((error) {
          throw CustomException();
        });
  }

  factory ProfileStorage.create() =>
      ProfileStorage(const FlutterSecureStorage());
}
