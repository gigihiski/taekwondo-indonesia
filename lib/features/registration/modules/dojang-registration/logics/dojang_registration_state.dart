part of 'dojang_registration_cubit.dart';

enum DojangRegistrationStatus {
  initial,
  loading,
  loaded,
  error,
  unAuthenticated,
}

class DojangRegistrationState {
  const DojangRegistrationState({
    required this.status,
    required this.errorMessage,
  });

  final DojangRegistrationStatus status;
  final String errorMessage;

  factory DojangRegistrationState.initial() {
    return DojangRegistrationState(
      status: DojangRegistrationStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  DojangRegistrationState copyWith({
    DojangRegistrationStatus? status,
    String? errorMessage,
  }) {
    return DojangRegistrationState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
