import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_header.dart';
import 'package:taekwondo/core/services/news/models/news.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/features/home/views/components/news_item.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key, required this.news, required this.onPressed});

  final List<News> news;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final header = AppHeaderTitleIconLink(
      text: L10n.localizations(context).news,
      appHeaderIcon: AppHeaderIcon(icon: AppAssets.email),
      appHeaderLink: AppHeaderLink(
        text: L10n.localizations(context).view_all,
        onPressed: onPressed,
      ),
    );

    final content = SizedBox(
      height: 200,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: news.length,
        itemBuilder: (context, index) => NewsItem(news: news[index]),
        separatorBuilder: (context, index) => SizedBox(width: 10),
      ),
    );

    return Column(children: [header, SizedBox(height: 19), content]);
  }
}
