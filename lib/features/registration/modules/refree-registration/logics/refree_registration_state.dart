part of 'refree_registration_cubit.dart';

enum RefreeRegistrationStatus {
  initial,
  loading,
  loaded,
  error,
  unAuthenticated,
}

class RefreeRegistrationState {
  const RefreeRegistrationState({
    required this.status,
    required this.errorMessage,
  });

  final RefreeRegistrationStatus status;
  final String errorMessage;

  factory RefreeRegistrationState.initial() {
    return RefreeRegistrationState(
      status: RefreeRegistrationStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  RefreeRegistrationState copyWith({
    RefreeRegistrationStatus? status,
    String? errorMessage,
  }) {
    return RefreeRegistrationState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
