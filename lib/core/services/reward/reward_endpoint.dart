import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

class RewardEndpoint {
  final String baseUrl;

  RewardEndpoint(this.baseUrl);

  Uri getRewardHistories(int page, int limit) {
    return createUrl(
      host: baseUrl,
      path: "/v1/point-history",
      queryParameters: {"page": page.toString(), "perPage": limit.toString()},
    );
  }

  factory RewardEndpoint.create() {
    return RewardEndpoint(AppConfiguration.host);
  }
}
