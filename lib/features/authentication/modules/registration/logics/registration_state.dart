part of 'registration_cubit.dart';

enum RegistrationStatus {
  initial,
  loading,
  loaded,
  success,
  error,
}

class RegistrationState {
  const RegistrationState({
    required this.status,
    required this.errorMessage,
    required this.accessToken,
  });

  final RegistrationStatus status;
  final String errorMessage;
  final String? accessToken;

  factory RegistrationState.initial() {
    return const RegistrationState(
      status: RegistrationStatus.initial,
      errorMessage: "Unknown - Default",
      accessToken: null,
    );
  }

  RegistrationState copyWith({
    RegistrationStatus? status,
    String? errorMessage,
    String? accessToken,
  }) {
    return RegistrationState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}
