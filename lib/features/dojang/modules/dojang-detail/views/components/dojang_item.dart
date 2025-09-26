import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/services/dojang/models/dojang.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

class DojangItem extends StatelessWidget {
  const DojangItem({super.key, required this.dojang});

  final Dojang dojang;

  @override
  Widget build(BuildContext context) {
    final image = SizedBox(
      height: 100,
      width: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: CachedNetworkImage(
          imageUrl: "",
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

    final location = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
        SizedBox(width: 4),
        AppTextCaptionSemiBold(text: dojang.country),
      ],
    );

    final information = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextCaptionSemiBold(text: "Dojang", color: Colors.red),
          SizedBox(height: 6),
          AppTextH4SemiBold(text: dojang.name),
          SizedBox(height: 10),
          location,
        ],
      ),
    );

    final content = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [image, SizedBox(width: 12), information],
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.platinum, width: 1),
      ),
      child: content,
    );
  }
}
