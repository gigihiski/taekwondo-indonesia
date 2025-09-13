import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taekwondo/core/models/language.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

abstract class ILanguageStorage {
  Future<Language> get language;
  Future<void> saveLanguage(Language language);
}

class LanguageStorage implements ILanguageStorage {
  final String languageKey = "language";

  final FlutterSecureStorage secureStorage;

  LanguageStorage(this.secureStorage);

  @override
  Future<Language> get language async {
    final language = await secureStorage.read(key: languageKey);
    if (language == null) return Language.init()[0];
    return Language.fromJson(language);
  }

  @override
  Future<void> saveLanguage(Language language) async {
    return await secureStorage
        .write(key: languageKey, value: language.toJson())
        .catchError((error) {
          throw CustomException();
        });
  }

  factory LanguageStorage.create() =>
      LanguageStorage(const FlutterSecureStorage());
}
