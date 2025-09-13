import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

class PromotionEndpoint {
  final String baseUrl;
  final int port;

  PromotionEndpoint(this.baseUrl, this.port);

  Uri getPromotions() {
    return createUrl(
      host: baseUrl,
      port: port,
      path: "/v1/promotions",
      queryParameters: {"type": "promo"},
    );
  }

  factory PromotionEndpoint.create() {
    return PromotionEndpoint(AppConfiguration.host, AppConfiguration.port);
  }
}
