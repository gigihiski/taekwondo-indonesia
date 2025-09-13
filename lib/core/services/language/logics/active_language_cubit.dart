import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/models/language.dart';
import 'package:taekwondo/core/services/language/repositories/language_repository.dart';

part 'active_language_state.dart';

class ActiveLanguageCubit extends Cubit<ActiveLanguageState> {
  ActiveLanguageCubit({required this.repository})
    : super(ActiveLanguageState.initial());

  final LanguageRepository repository;

  Future<void> initial() async {
    try {
      emit(state.copyWith(status: ActiveLanguageStatus.loading));
      final Language language = await repository.getActiveLanguage();
      await repository.saveLanguage(language);
      emit(
        state.copyWith(status: ActiveLanguageStatus.loaded, language: language),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ActiveLanguageStatus.error, error: e.toString()),
      );
    }
  }

  Future<void> get language async {
    try {
      emit(state.copyWith(status: ActiveLanguageStatus.loading));
      final language = await repository.getActiveLanguage();
      emit(
        state.copyWith(status: ActiveLanguageStatus.loaded, language: language),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ActiveLanguageStatus.error, error: e.toString()),
      );
    }
  }

  Future<void> setLanguage(Language language) async {
    try {
      emit(state.copyWith(status: ActiveLanguageStatus.loading));
      await repository.saveLanguage(language);
      emit(
        state.copyWith(status: ActiveLanguageStatus.loaded, language: language),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ActiveLanguageStatus.error, error: e.toString()),
      );
    }
  }
}
