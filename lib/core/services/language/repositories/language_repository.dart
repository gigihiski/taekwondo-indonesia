import 'package:taekwondo/core/models/language.dart';
import 'package:taekwondo/core/services/storages/language_storage.dart';

abstract class ILanguageRepository {
  Future<Language> getActiveLanguage();
  Future<void> saveLanguage(Language language);
}

class LanguageRepository implements ILanguageRepository {
  LanguageRepository({required this.storage});

  final LanguageStorage storage;

  factory LanguageRepository.create() {
    return LanguageRepository(storage: LanguageStorage.create());
  }

  @override
  Future<Language> getActiveLanguage() async {
    return storage.language;
  }

  @override
  Future<void> saveLanguage(Language language) async {
    await storage.saveLanguage(language);
  }
}
