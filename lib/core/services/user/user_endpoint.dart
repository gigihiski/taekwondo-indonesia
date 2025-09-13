import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

class UserEndpoint {
  final String baseUrl;
  final int port;

  UserEndpoint(this.baseUrl, this.port);

  Uri getMe() {
    return createUrl(host: baseUrl, port: port, path: "/v1/profile/me");
  }

  Uri existingGoogleAccount() {
    return createUrl(host: baseUrl, port: port, path: "/v1/auth/login");
  }

  Uri updateProfile() {
    return createUrl(host: baseUrl, port: port, path: "/v1/user");
  }

  factory UserEndpoint.create() {
    return UserEndpoint(AppConfiguration.host, AppConfiguration.port);
  }
}
