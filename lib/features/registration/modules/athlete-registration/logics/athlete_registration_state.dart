part of 'athlete_registration_cubit.dart';

enum AthleteRegistrationStatus {
  initial,
  loading,
  loaded,
  error,
  unAuthenticated,
}

class AthleteRegistrationState {
  const AthleteRegistrationState({
    required this.status,
    required this.errorMessage,
  });

  final AthleteRegistrationStatus status;
  final String errorMessage;

  factory AthleteRegistrationState.initial() {
    return AthleteRegistrationState(
      status: AthleteRegistrationStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  AthleteRegistrationState copyWith({
    AthleteRegistrationStatus? status,
    String? errorMessage,
  }) {
    return AthleteRegistrationState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
