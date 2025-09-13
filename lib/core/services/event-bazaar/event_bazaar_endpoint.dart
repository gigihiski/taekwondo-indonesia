import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

class EventBazaarEndpoint {
  final String baseUrl;

  EventBazaarEndpoint(this.baseUrl);

  Uri getEventBazaars({int page = 1}) {
    final x = createUrl(
      host: baseUrl,
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
    return EventBazaarEndpoint(AppConfiguration.host);
  }
}
