import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/services/event/models/event.dart';
import 'package:taekwondo/core/themes/app_assets.dart';

class EventDetailView extends StatefulWidget {
  const EventDetailView({super.key, required this.event});

  final Event event;

  @override
  EventDetailViewState createState() => EventDetailViewState();
}

class EventDetailViewState extends State<EventDetailView> {
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
    final header = ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: CachedNetworkImage(
        height: 441,
        colorBlendMode: BlendMode.darken,
        color: Colors.black.withOpacity(0.3),
        imageUrl: "https://picsum.photos/600/300",
        fit: BoxFit.cover,
        placeholder: (context, url) {
          return Image.asset(AppAssets.placeholder, fit: BoxFit.cover);
        },
        errorWidget: (context, url, error) {
          return Image.asset(AppAssets.placeholder, fit: BoxFit.cover);
        },
      ),
    );

    final date = Row(
      children: [
        Icon(Icons.calendar_today_rounded, color: Colors.white, size: 16),
        SizedBox(width: 6),
        AppTextCaption(
          text: widget.event.eventTimes.first.formattedDate,
          color: Colors.white,
        ),
      ],
    );

    final place = Row(
      children: [
        Icon(Icons.location_on_outlined, color: Colors.white, size: 16),
        SizedBox(width: 6),
        AppTextCaption(text: widget.event.location.venue, color: Colors.white),
      ],
    );

    final subHeader = Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextH3SemiBold(text: widget.event.title, color: Colors.white),
          SizedBox(height: 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [date, SizedBox(width: 12), place],
          ),
        ],
      ),
    );

    final headerContainer = Stack(
      children: [
        header,
        Positioned(bottom: 0, left: 0, child: subHeader),
      ],
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          headerContainer,
          SizedBox(height: 14),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                AppTextParagraph(text: widget.event.longDescription),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
