import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taekwondo/core/services/event/event_repository.dart';
import 'package:taekwondo/core/services/event/models/event.dart';
import 'package:taekwondo/features/events/modules/event-detail/logics/event_detail_cubit.dart';
import 'package:taekwondo/features/events/modules/event-detail/views/event_detail_view.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({super.key, required this.id});

  final String id;

  static Route route(String id) {
    return MaterialPageRoute(builder: (_) => EventDetailPage(id: id));
  }

  static RouteSettings routeSettings = const RouteSettings(
    name: "event-detail",
  );

  @override
  State<EventDetailPage> createState() => EventDetailPageState();
}

class EventDetailPageState extends State<EventDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider eventBlocProvider() {
    return BlocProvider<EventDetailCubit>(
      create: (context) =>
          EventDetailCubit(EventRepository.create())..init(widget.id),
    );
  }

  BlocListener eventBlocDetailener() {
    return BlocListener<EventDetailCubit, EventDetailState>(
      listener: (context, state) {
        switch (state.status) {
          case EventDetailStatus.initial:
          case EventDetailStatus.loading:
          case EventDetailStatus.error:
          case EventDetailStatus.loaded:
          case EventDetailStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, EventDetailState) eventBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case EventDetailStatus.initial:
        case EventDetailStatus.loading:
        case EventDetailStatus.error:
          return Container();
        case EventDetailStatus.loaded:
          return EventDetailView(event: state.event!);
        case EventDetailStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar(Event event) {
      return AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        actionsPadding: EdgeInsets.only(right: 12),
        actions: [
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.favorite_border_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
          SizedBox(width: 6),
          InkWell(
            onTap: () {
              SharePlus.instance.share(
                ShareParams(subject: event.title, text: event.description),
              );
            },
            child: Icon(Icons.share_outlined, color: Colors.white, size: 22),
          ),
        ],
      );
    }

    return MultiBlocProvider(
      providers: [eventBlocProvider()],
      child: MultiBlocListener(
        listeners: [eventBlocDetailener()],
        child: BlocBuilder<EventDetailCubit, EventDetailState>(
          builder: (context, state) {
            print(state.status);
            switch (state.status) {
              case EventDetailStatus.initial:
              case EventDetailStatus.loading:
              case EventDetailStatus.error:
              case EventDetailStatus.unAuthenticated:
                return Container();
              case EventDetailStatus.loaded:
                print(state.status);
                return Scaffold(
                  extendBodyBehindAppBar: true,
                  backgroundColor: Colors.white,
                  appBar: appBar(state.event!),
                  body: BlocBuilder<EventDetailCubit, EventDetailState>(
                    builder: eventBlocBuilder(),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
