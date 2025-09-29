import 'package:flutter/cupertino.dart';
import 'package:taekwondo/core/components/app_margin.dart';
import 'package:taekwondo/core/services/notification/models/notification.dart';
import 'package:taekwondo/features/home/modules/notification-list/views/components/notification_item.dart';

class NotificationListView extends StatefulWidget {
  const NotificationListView({super.key, required this.notifications});

  final List<AppNotification> notifications;

  @override
  NotificationListViewState createState() => NotificationListViewState();
}

class NotificationListViewState extends State<NotificationListView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppMargin(
      child: ListView.separated(
        itemBuilder: (context, index) => NotificationItem(),
        separatorBuilder: (context, index) => SizedBox(height: 15),
        itemCount: 5,
      ),
    );
  }
}
