part of 'google_registration_cubit.dart';

enum GoogleRegistrationStatus {
  initial,
  loading,
  loaded,
  successGoogleToken,
  success,
  error,
  unAuthenticated,
}

class GoogleRegistrationState {
  const GoogleRegistrationState({
    required this.status,
    required this.errorMessage,
    required this.googleUser,
    required this.accessToken,
  });

  final GoogleRegistrationStatus status;
  final String errorMessage;
  final GoogleSignInAccount? googleUser;
  final String? accessToken;

  factory GoogleRegistrationState.initial() {
    return const GoogleRegistrationState(
      status: GoogleRegistrationStatus.initial,
      errorMessage: "Unknown - Default",
      googleUser: null,
      accessToken: null,
    );
  }

  GoogleRegistrationState copyWith({
    GoogleRegistrationStatus? status,
    String? errorMessage,
    GoogleSignInAccount? googleUser,
    String? accessToken,
  }) {
    return GoogleRegistrationState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      googleUser: googleUser ?? this.googleUser,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}
