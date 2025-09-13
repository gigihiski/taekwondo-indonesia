part of 'google_login_cubit.dart';

enum GoogleLoginStatus {
  initial,
  loading,
  loaded,
  success,
  error,
  unAuthenticated,
}

class GoogleLoginState {
  const GoogleLoginState({
    required this.status,
    required this.errorMessage,
    required this.accessToken,
  });

  final GoogleLoginStatus status;
  final String errorMessage;
  final String? accessToken;

  factory GoogleLoginState.initial() {
    return const GoogleLoginState(
      status: GoogleLoginStatus.initial,
      errorMessage: "Unknown - Default",
      accessToken: null,
    );
  }

  GoogleLoginState copyWith({
    GoogleLoginStatus? status,
    String? errorMessage,
    String? accessToken,
  }) {
    return GoogleLoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}
