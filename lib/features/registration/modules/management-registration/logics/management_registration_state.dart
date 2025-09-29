part of 'management_registration_cubit.dart';

enum ManagementRegistrationStatus {
  initial,
  loading,
  loaded,
  error,
  unAuthenticated,
}

class ManagementRegistrationState {
  const ManagementRegistrationState({
    required this.status,
    required this.errorMessage,
  });

  final ManagementRegistrationStatus status;
  final String errorMessage;

  factory ManagementRegistrationState.initial() {
    return ManagementRegistrationState(
      status: ManagementRegistrationStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  ManagementRegistrationState copyWith({
    ManagementRegistrationStatus? status,
    String? errorMessage,
  }) {
    return ManagementRegistrationState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
