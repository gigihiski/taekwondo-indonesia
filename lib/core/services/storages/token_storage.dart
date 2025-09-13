import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

abstract class ITokenStorage {
  Future<String> get accessToken;
  Future<void> saveToken(String token);
}

class TokenStorage implements ITokenStorage {
  final String tokenKey = "accessToken";

  final FlutterSecureStorage secureStorage;

  TokenStorage(this.secureStorage);

  @override
  Future<String> get accessToken async {
    final token = await secureStorage.read(key: tokenKey);
    if (token == null) throw AuthenticationFailed();
    return token;
  }

  @override
  Future<void> saveToken(String token) async {
    await secureStorage.write(key: tokenKey, value: token).catchError((error) {
      throw CustomException();
    });
  }

  factory TokenStorage.create() => TokenStorage(const FlutterSecureStorage());
}
