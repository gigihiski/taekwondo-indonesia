part of 'active_language_cubit.dart';

enum ActiveLanguageStatus {
  initial,
  loading,
  loaded,
  error,
}

class ActiveLanguageState {
  const ActiveLanguageState({
    required this.status,
    required this.error,
    required this.language,
  });

  final ActiveLanguageStatus status;
  final String error;
  final Language? language;

  factory ActiveLanguageState.initial() {
    return const ActiveLanguageState(
      status: ActiveLanguageStatus.initial,
      error: "Default Error",
      language: null,
    );
  }

  ActiveLanguageState copyWith({
    ActiveLanguageStatus? status,
    String? error,
    Language? language,
  }) {
    return ActiveLanguageState(
      status: status ?? this.status,
      error: error ?? this.error,
      language: language ?? this.language,
    );
  }
}
