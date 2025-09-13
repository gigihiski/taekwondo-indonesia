part of 'language_cubit.dart';

enum LanguageStatus {
  initial,
  loading,
  loaded,
  unAuthenticated,
  error,
}

class LanguageState {
  const LanguageState({
    required this.status,
    required this.errorMessage,
    required this.languages,
    required this.activeLanguage,
  });

  final LanguageStatus status;
  final String errorMessage;
  final List<Language> languages;
  final Language activeLanguage;

  factory LanguageState.initial() {
    return const LanguageState(
      status: LanguageStatus.initial,
      errorMessage: "Unknown - Default",
      languages: [],
      activeLanguage: Language(
        icon: AppAssets.idFlag,
        name: 'Bahasa ( Indonesia )',
        code: LanguageCode.id,
      ),
    );
  }

  LanguageState copyWith({
    LanguageStatus? status,
    String? errorMessage,
    List<Language>? languages,
    Language? activeLanguage,
  }) {
    return LanguageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      languages: languages ?? this.languages,
      activeLanguage: activeLanguage ?? this.activeLanguage,
    );
  }
}
