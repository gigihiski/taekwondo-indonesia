part of 'examiner_registration_cubit.dart';

enum ExaminerRegistrationStatus {
  initial,
  loading,
  loaded,
  error,
  unAuthenticated,
}

class ExaminerRegistrationState {
  const ExaminerRegistrationState({
    required this.status,
    required this.errorMessage,
  });

  final ExaminerRegistrationStatus status;
  final String errorMessage;

  factory ExaminerRegistrationState.initial() {
    return ExaminerRegistrationState(
      status: ExaminerRegistrationStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  ExaminerRegistrationState copyWith({
    ExaminerRegistrationStatus? status,
    String? errorMessage,
  }) {
    return ExaminerRegistrationState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
