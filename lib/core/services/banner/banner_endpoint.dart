import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

class BannerEndpoint {
  final String baseUrl;

  BannerEndpoint(this.baseUrl);

  Uri getBanners() {
    return createUrl(host: baseUrl, path: "/api/v1/banners");
  }

  factory BannerEndpoint.create() {
    return BannerEndpoint(AppConfiguration.host);
  }
}
