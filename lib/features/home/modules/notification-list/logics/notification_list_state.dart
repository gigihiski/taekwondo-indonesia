part of 'notification_list_cubit.dart';

enum NotificationListStatus { initial, loading, loaded, error, unAuthenticated }

class NotificationListState {
  const NotificationListState({
    required this.notifications,
    required this.status,
    required this.errorMessage,
  });

  final List<AppNotification>? notifications;
  final NotificationListStatus status;
  final String errorMessage;

  factory NotificationListState.initial() {
    return NotificationListState(
      notifications: null,
      status: NotificationListStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  NotificationListState copyWith({
    List<AppNotification>? notifications,
    NotificationListStatus? status,
    String? errorMessage,
  }) {
    return NotificationListState(
      notifications: notifications ?? this.notifications,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
