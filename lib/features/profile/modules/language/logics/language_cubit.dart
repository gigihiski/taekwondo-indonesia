import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/models/language.dart';
import 'package:taekwondo/core/services/storages/language_storage.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit(this.languageStorage) : super(LanguageState.initial());

  final LanguageStorage languageStorage;

  Future<void> initial() async {
    emit(state.copyWith(status: LanguageStatus.loading));
    try {
      final languages = Language.init();
      final activeLanguage = await languageStorage.language;
      emit(
        state.copyWith(
          languages: languages,
          activeLanguage: activeLanguage,
          status: LanguageStatus.loaded,
        ),
      );
    } on TokenExpired {
      // await repository.setTokenExpired();
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: LanguageStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: LanguageStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
