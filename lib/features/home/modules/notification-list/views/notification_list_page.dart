import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/core/services/notification/notification_repository.dart';
import 'package:taekwondo/features/home/modules/notification-list/logics/notification_list_cubit.dart';
import 'package:taekwondo/features/home/modules/notification-list/views/notification_list_view.dart';

class NotificationListPage extends StatefulWidget {
  const NotificationListPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => NotificationListPage());
  }

  static RouteSettings routeSettings = const RouteSettings(
    name: "notification-list",
  );

  @override
  State<NotificationListPage> createState() => NotificationListPageState();
}

class NotificationListPageState extends State<NotificationListPage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider newsBlocProvider() {
    return BlocProvider<NotificationListCubit>(
      create: (context) => NotificationListCubit(
        notificationRepository: NotificationRepository.create(),
      )..init(),
    );
  }

  BlocListener newsBlocDetailener() {
    return BlocListener<NotificationListCubit, NotificationListState>(
      listener: (context, state) {
        switch (state.status) {
          case NotificationListStatus.initial:
          case NotificationListStatus.loading:
          case NotificationListStatus.error:
          case NotificationListStatus.loaded:
          case NotificationListStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, NotificationListState) newsBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case NotificationListStatus.initial:
        case NotificationListStatus.loading:
        case NotificationListStatus.error:
          return Container();
        case NotificationListStatus.loaded:
          return NotificationListView(notifications: state.notifications!);
        case NotificationListStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarHeader(
      title: "Notification",
      color: Colors.white,
      isEnabledBackButton: false,
    );

    return MultiBlocProvider(
      providers: [newsBlocProvider()],
      child: MultiBlocListener(
        listeners: [newsBlocDetailener()],
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          appBar: appBar,
          body: BlocBuilder<NotificationListCubit, NotificationListState>(
            builder: newsBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
