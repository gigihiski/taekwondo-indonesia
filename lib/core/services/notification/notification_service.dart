import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/networks/index.dart';
import 'package:taekwondo/core/services/notification/models/notification.dart';
import 'package:taekwondo/core/services/notification/notification_endpoint.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

abstract class INotificationService {
  Future<AppNotification> getNotificationById(String id);
  Future<List<AppNotification>> getNotifications();
}

class NotificationService implements INotificationService {
  final HttpClient httpClient;
  final HeaderProvider headerProvider;
  final NotificationEndpoint endpoint;

  NotificationService(this.httpClient, this.headerProvider, this.endpoint);

  @override
  Future<List<AppNotification>> getNotifications() async {
    final url = endpoint.getNotifications();
    final headers = await headerProvider.headers;
    final response = await httpClient.get(url, headers);
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    final body = NotificationsResponse.fromJson(response.body);
    return body.data;
  }

  @override
  Future<AppNotification> getNotificationById(String id) async {
    final url = endpoint.getNotificationById(id);
    final headers = await headerProvider.headers;
    final response = await httpClient.get(url, headers);
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    final body = NotificationResponse.fromJson(response.body);
    return body.data;
  }

  factory NotificationService.create() {
    return NotificationService(
      AppHttpClient.create(),
      AppHeaderProvider.create(),
      NotificationEndpoint.create(),
    );
  }
}
