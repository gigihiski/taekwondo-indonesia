import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_navigator.dart';
import 'package:taekwondo/core/components/app_search.dart';
import 'package:taekwondo/core/services/event/models/event.dart';
import 'package:taekwondo/features/events/modules/event-detail/views/event_detail_page.dart';
import 'package:taekwondo/features/home/views/components/event_item.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class EventListView extends StatefulWidget {
  const EventListView({super.key, required this.event});

  final List<Event> event;

  @override
  EventListViewState createState() => EventListViewState();
}

class EventListViewState extends State<EventListView> {
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
    Widget header = AppSearch(
      hint: L10n.localizations(context).search_event,
      color: Colors.grey.shade100,
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 12),
          header,
          SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              primary: true,
              padding: EdgeInsets.zero,
              itemCount: widget.event.length,
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  AppNavigator(
                    context: context,
                    page: EventDetailPage(event: widget.event[index]),
                    route: EventDetailPage.routeSettings,
                  ).push();
                },
                child: EventItem(event: widget.event[index]),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
