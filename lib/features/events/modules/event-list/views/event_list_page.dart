import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/core/services/event/event_repository.dart';
import 'package:taekwondo/features/events/modules/event-list/logics/event_list_cubit.dart';
import 'package:taekwondo/features/events/modules/event-list/views/event_list_view.dart';

class EventListPage extends StatefulWidget {
  const EventListPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => EventListPage());
  }

  static RouteSettings routeSettings = const RouteSettings(name: "event-list");

  @override
  State<EventListPage> createState() => EventListPageState();
}

class EventListPageState extends State<EventListPage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider dojangBlocProvider() {
    return BlocProvider<EventListCubit>(
      create: (context) =>
          EventListCubit(eventRepository: EventRepository.create())..init(),
    );
  }

  BlocListener dojangBlocListener() {
    return BlocListener<EventListCubit, EventListState>(
      listener: (context, state) {
        switch (state.status) {
          case EventListStatus.initial:
          case EventListStatus.loading:
          case EventListStatus.error:
          case EventListStatus.loaded:
          case EventListStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, EventListState) dojangBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case EventListStatus.initial:
        case EventListStatus.loading:
        case EventListStatus.error:
          return Container();
        case EventListStatus.loaded:
          return EventListView(event: state.event);
        case EventListStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarHeader(title: "Event", color: Colors.white);

    return MultiBlocProvider(
      providers: [dojangBlocProvider()],
      child: MultiBlocListener(
        listeners: [dojangBlocListener()],
        child: Scaffold(
          appBar: appBar,
          body: BlocBuilder<EventListCubit, EventListState>(
            builder: dojangBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
