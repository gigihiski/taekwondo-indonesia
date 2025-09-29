import 'package:taekwondo/core/services/notification/notification_service.dart';
import 'package:taekwondo/core/services/notification/models/notification.dart';

abstract class INotificationRepository {
  Future<AppNotification> getNotificationById(String id);
  Future<List<AppNotification>> getNotifications();
}

class NotificationRepository implements INotificationRepository {
  NotificationRepository(this.notificationService);

  final NotificationService notificationService;

  @override
  Future<AppNotification> getNotificationById(String id) async {
    return await notificationService.getNotificationById(id);
  }

  @override
  Future<List<AppNotification>> getNotifications() async {
    return await notificationService.getNotifications();
  }

  factory NotificationRepository.create() {
    return NotificationRepository(NotificationService.create());
  }
}
