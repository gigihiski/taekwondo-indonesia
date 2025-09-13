import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

class EventBazaarEndpoint {
  final String baseUrl;
  final int port;

  EventBazaarEndpoint(this.baseUrl, this.port);

  Uri getEventBazaars({int page = 1}) {
    final x = createUrl(
      host: baseUrl,
      port: port,
      path: "/v1/events",
      queryParameters: {
        "page": "1",
        "start_date": "08-22-2025",
        "end_date": "12-22-2026",
      },
    );
    return x;
  }

  factory EventBazaarEndpoint.create() {
    return EventBazaarEndpoint(AppConfiguration.host, AppConfiguration.port);
  }
}
