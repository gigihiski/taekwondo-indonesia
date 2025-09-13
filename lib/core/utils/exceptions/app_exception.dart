class AppException implements Exception {
  final String message;

  AppException(this.message);
}

// Authentication Failure

class AuthenticationFailed extends AppException {
  AuthenticationFailed({String message = "AUTHENTICATION_FAILED"})
      : super(message);
}

// Token Failure

class TokenExpired extends AppException {
  TokenExpired({String message = "TOKEN_EXPIRED"}) : super(message);
}

class TokenNotFound extends AppException {
  TokenNotFound({String message = "TOKEN_NOT_FOUND"}) : super(message);
}

// Maintenance

class Maintenance extends AppException {
  Maintenance({String message = "MAINTENANCE"}) : super(message);
}

class CustomException extends AppException {
  CustomException({String message = "UNKNOWN_ERROR"}) : super(message);
}

extension DefaultException on int {
  AppException get defaultException {
    switch (this) {
      case 400:
        return TokenExpired();
      default:
        return CustomException(message: "UNKNOWN_ERROR");
    }
  }
}
