import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

class PromotionEndpoint {
  final String baseUrl;

  PromotionEndpoint(this.baseUrl);

  Uri getPromotions() {
    return createUrl(
      host: baseUrl,
      path: "/v1/promotions",
      queryParameters: {"type": "promo"},
    );
  }

  factory PromotionEndpoint.create() {
    return PromotionEndpoint(AppConfiguration.host);
  }
}
