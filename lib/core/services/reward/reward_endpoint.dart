import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

class RewardEndpoint {
  final String baseUrl;
  final int port;

  RewardEndpoint(this.baseUrl, this.port);

  Uri getRewardHistories(int page, int limit) {
    return createUrl(
      host: baseUrl,
      port: port,
      path: "/v1/point-history",
      queryParameters: {"page": page.toString(), "perPage": limit.toString()},
    );
  }

  factory RewardEndpoint.create() {
    return RewardEndpoint(AppConfiguration.host, AppConfiguration.port);
  }
}
