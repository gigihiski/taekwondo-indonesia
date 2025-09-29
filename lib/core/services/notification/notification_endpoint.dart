import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

class NotificationEndpoint {
  final String baseUrl;

  NotificationEndpoint(this.baseUrl);

  Uri getNotifications() {
    return createUrl(host: baseUrl, path: "/api/v1/notifications");
  }

  Uri getNotificationById(String id) {
    return createUrl(host: baseUrl, path: "/api/v1/notifications/$id");
  }

  factory NotificationEndpoint.create() {
    return NotificationEndpoint(AppConfiguration.host);
  }
}
