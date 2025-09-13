import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

abstract class IAuthenticationEndpoint {
  Uri registration();
  Uri phoneAuthentication();
  Uri googleAuthentication();
  Uri appleAuthentication();
  Uri phoneValidation();
  Uri otpRequest();
  Uri forgotPasswordConfirmation();
}

class AuthenticationEndpoint implements IAuthenticationEndpoint {
  final String baseUrl;
  final int port;

  AuthenticationEndpoint(this.baseUrl, this.port);

  @override
  Uri registration() {
    return createUrl(host: baseUrl, port: port, path: '/v1/auth/register');
  }

  @override
  Uri phoneAuthentication() {
    return createUrl(host: baseUrl, port: port, path: '/v1/auth/login');
  }

  @override
  Uri googleAuthentication() {
    return createUrl(host: baseUrl, port: port, path: '/v1/auth/register');
  }

  @override
  Uri appleAuthentication() {
    return createUrl(host: baseUrl, port: port, path: '/v1/auth/login');
  }

  @override
  Uri phoneValidation() {
    return createUrl(
      host: baseUrl,
      port: port,
      path: "/v1/auth/forgot-password/request-otp",
    );
  }

  @override
  Uri otpRequest() {
    return createUrl(
      host: baseUrl,
      port: port,
      path: "/v1/auth/forgot-password/request-otp",
    );
  }

  @override
  Uri forgotPasswordConfirmation() {
    return createUrl(
      host: baseUrl,
      port: port,
      path: "/v1/auth/forgot-password",
    );
  }

  factory AuthenticationEndpoint.create() =>
      AuthenticationEndpoint(AppConfiguration.host, AppConfiguration.port);
}
