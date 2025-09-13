import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

abstract class IAuthenticationEndpoint {
  Uri registration();
  Uri emailAuthentication();
  Uri googleAuthentication();
  Uri appleAuthentication();
  Uri phoneValidation();
  Uri otpRequest();
  Uri forgotPasswordConfirmation();
}

class AuthenticationEndpoint implements IAuthenticationEndpoint {
  final String baseUrl;

  AuthenticationEndpoint(this.baseUrl);

  @override
  Uri registration() {
    return createUrl(host: baseUrl, path: '/api/v1/signup');
  }

  @override
  Uri emailAuthentication() {
    return createUrl(host: baseUrl, path: '/api/v1/signin');
  }

  @override
  Uri googleAuthentication() {
    return createUrl(host: baseUrl, path: '/v1/auth/register');
  }

  @override
  Uri appleAuthentication() {
    return createUrl(host: baseUrl, path: '/v1/auth/login');
  }

  @override
  Uri phoneValidation() {
    return createUrl(
      host: baseUrl,
      path: "/v1/auth/forgot-password/request-otp",
    );
  }

  @override
  Uri otpRequest() {
    return createUrl(
      host: baseUrl,
      path: "/v1/auth/forgot-password/request-otp",
    );
  }

  @override
  Uri forgotPasswordConfirmation() {
    return createUrl(host: baseUrl, path: "/v1/auth/forgot-password");
  }

  factory AuthenticationEndpoint.create() =>
      AuthenticationEndpoint(AppConfiguration.host);
}
