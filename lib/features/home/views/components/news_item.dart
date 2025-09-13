import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/services/news/models/news.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    final image = SizedBox(
      height: 100,
      width: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: CachedNetworkImage(
          imageUrl: news.images.first,
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

    final information = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextCaptionSemiBold(text: "Seminar", color: Colors.red),
          SizedBox(height: 6),
          AppTextH4SemiBold(text: news.title),
        ],
      ),
    );

    final headline = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [information, SizedBox(width: 12), image],
    );

    final content = Container(
      width: MediaQuery.of(context).size.width - 24,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.platinum, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headline,
          SizedBox(height: 12),
          AppTextCaption(text: "Jum'at, 18 Maret 2025", color: Colors.grey),
          SizedBox(height: 12),
          AppTextParagraph(text: news.shortDescription, color: Colors.black),
        ],
      ),
    );

    return content;
  }
}
