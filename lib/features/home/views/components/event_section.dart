import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_header.dart';
import 'package:taekwondo/core/services/event-bazaar/models/event_bazaar.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class EventSection extends StatelessWidget {
  const EventSection({
    super.key,
    required this.events,
    required this.onPressed,
  });

  final List<EventBazaar> events;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final header = AppHeaderTitleIconLink(
      text: L10n.localizations(context).event,
      appHeaderIcon: AppHeaderIcon(icon: AppAssets.email),
      appHeaderLink: AppHeaderLink(
        text: L10n.localizations(context).view_all,
        onPressed: onPressed,
      ),
    );

    final content = GridView.builder(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.15,
      ),
      itemCount: events.length,
      itemBuilder: (context, index) {
        return Container();
      },
    );

    return Column(children: [header, SizedBox(height: 19), content]);
  }
}
