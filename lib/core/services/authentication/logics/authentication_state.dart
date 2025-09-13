part of 'authentication_cubit.dart';

enum AuthenticationStatus {
  initial,
  authenticated,
  unAuthenticated,
  maintenance,
}

class AuthenticationState {
  const AuthenticationState({
    required this.status,
    required this.token,
    required this.errorMessage,
  });

  final AuthenticationStatus status;
  final AccessToken? token;
  final String errorMessage;

  factory AuthenticationState.initial() {
    return AuthenticationState(
      status: AuthenticationStatus.initial,
      token: null,
      errorMessage: '',
    );
  }

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    AccessToken? token,
    String? errorMessage,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      token: token ?? this.token,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
