import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/services/event/models/event.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    final image = SizedBox(
      height: 173,
      child: Center(
        child: CachedNetworkImage(
          imageUrl: event.images.first,
          fit: BoxFit.cover,
          placeholder: (context, url) {
            return Image.asset(
              AppAssets.placeholder,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          },
          errorWidget: (context, url, error) {
            return Image.asset(
              AppAssets.placeholder,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );

    final content = Container(
      width: MediaQuery.of(context).size.width - 24,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.platinum, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 173, child: image),
          SizedBox(height: 6),
          AppTextCaptionSemiBold(text: event.title, color: Colors.black),
          SizedBox(height: 6),
          Expanded(
            child: AppTextMicro(
              text: event.shortDescription,
              color: AppColors.spanishGray,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  height: 16,
                  width: 16,
                  child: Icon(
                    Icons.pin_drop_outlined,
                    color: Colors.black,
                    size: 15,
                  ),
                ),
                SizedBox(width: 5),
                AppTextMicro(text: event.location.venue, color: Colors.black),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  height: 16,
                  width: 16,
                  child: Icon(
                    Icons.access_time_rounded,
                    color: Colors.black,
                    size: 15,
                  ),
                ),
                SizedBox(width: 5),
                AppTextMicro(
                  text:
                      "${event.eventTimes.first.formattedDateOnly} - ${event.eventTimes.last.formattedDateOnly}",
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return content;
  }
}
