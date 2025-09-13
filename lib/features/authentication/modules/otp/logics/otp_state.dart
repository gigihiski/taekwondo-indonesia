part of 'otp_cubit.dart';

enum OTPStatus {
  initial,
  loading,
  loaded,
  success,
  error,
}

class OTPState {
  const OTPState({
    required this.status,
    required this.errorMessage,
    required this.accessToken,
  });

  final OTPStatus status;
  final String errorMessage;
  final String? accessToken;

  factory OTPState.initial() {
    return const OTPState(
      status: OTPStatus.initial,
      errorMessage: "Unknown - Default",
      accessToken: null,
    );
  }

  OTPState copyWith({
    OTPStatus? status,
    String? errorMessage,
    String? accessToken,
  }) {
    return OTPState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}
