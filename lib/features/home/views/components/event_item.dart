import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/services/event/models/event.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/core/utils/extensions/date.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    final image = SizedBox(
      height: 178,
      child: CachedNetworkImage(
        imageUrl: event.coverImg,
        fit: BoxFit.cover,
        placeholder: (context, url) {
          return Image.asset(AppAssets.placeholder, fit: BoxFit.cover);
        },
        errorWidget: (context, url, error) {
          return Image.asset(AppAssets.placeholder, fit: BoxFit.cover);
        },
      ),
    );

    final date = Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.platinum, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppTextCaptionSemiBold(
            text: event.date.formattedDay,
            color: Colors.black,
          ),
          SizedBox(height: 4),
          AppTextMicroSemiBold(text: event.date.formattedMonth),
        ],
      ),
    );

    final imageContainer = Stack(
      children: [
        image,
        Positioned(top: 10, left: 10, child: date),
      ],
    );

    final content = Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppTextCaptionSemiBold(text: event.title, color: Colors.black),
          SizedBox(height: 6),
          Expanded(
            child: AppTextMicro(
              text: event.description,
              color: AppColors.spanishGray,
            ),
          ),
          Row(
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
              AppTextMicro(
                text: "${event.city}, ${event.province}",
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 275,
        width: 215,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.platinum, width: 1),
        ),
        child: Column(children: [imageContainer, SizedBox(height: 6), content]),
      ),
    );
  }
}
