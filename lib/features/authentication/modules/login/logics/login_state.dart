part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  loaded,
  success,
  error,
}

class LoginState {
  const LoginState({
    required this.status,
    required this.errorMessage,
    required this.accessToken,
  });

  final LoginStatus status;
  final String errorMessage;
  final String? accessToken;

  factory LoginState.initial() {
    return const LoginState(
      status: LoginStatus.initial,
      errorMessage: "Unknown - Default",
      accessToken: null,
    );
  }

  LoginState copyWith({
    LoginStatus? status,
    String? errorMessage,
    String? accessToken,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}
