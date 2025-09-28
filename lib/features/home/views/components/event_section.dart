import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_header.dart';
import 'package:taekwondo/core/components/app_navigator.dart';
import 'package:taekwondo/core/services/event/models/event.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/features/events/modules/event-detail/views/event_detail_page.dart';
import 'package:taekwondo/features/home/views/components/event_item.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class EventSection extends StatelessWidget {
  const EventSection({
    super.key,
    required this.events,
    required this.onPressed,
  });

  final List<Event> events;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final header = AppHeaderTitleIconLink(
      text: L10n.localizations(context).competition_event,
      appHeaderIcon: AppHeaderIcon(icon: AppAssets.email),
      appHeaderLink: AppHeaderLink(
        text: L10n.localizations(context).view_all,
        onPressed: onPressed,
      ),
    );

    final content = SizedBox(
      height: 275,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            AppNavigator(
              context: context,
              page: EventDetailPage(id: events[index].id),
              route: EventDetailPage.routeSettings,
            ).push();
          },
          child: EventItem(event: events[index]),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 10),
      ),
    );

    return Column(children: [header, SizedBox(height: 19), content]);
  }
}
