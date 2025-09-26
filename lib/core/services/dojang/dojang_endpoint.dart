import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

class DojangEndpoint {
  final String baseUrl;

  DojangEndpoint(this.baseUrl);

  Uri getDojang(String id) {
    return createUrl(host: baseUrl, path: "/api/v1/dojangs/$id");
  }

  Uri getDojangs() {
    return createUrl(host: baseUrl, path: "/api/v1/dojangs");
  }

  factory DojangEndpoint.create() {
    return DojangEndpoint(AppConfiguration.host);
  }
}
