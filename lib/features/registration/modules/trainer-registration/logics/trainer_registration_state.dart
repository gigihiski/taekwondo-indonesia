part of 'trainer_registration_cubit.dart';

enum TrainerRegistrationStatus {
  initial,
  loading,
  loaded,
  error,
  unAuthenticated,
}

class TrainerRegistrationState {
  const TrainerRegistrationState({
    required this.status,
    required this.errorMessage,
  });

  final TrainerRegistrationStatus status;
  final String errorMessage;

  factory TrainerRegistrationState.initial() {
    return TrainerRegistrationState(
      status: TrainerRegistrationStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  TrainerRegistrationState copyWith({
    TrainerRegistrationStatus? status,
    String? errorMessage,
  }) {
    return TrainerRegistrationState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
