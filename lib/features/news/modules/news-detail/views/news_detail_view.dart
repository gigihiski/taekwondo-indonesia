import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/services/news/models/news.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/utils/extensions/date.dart';

class NewsDetailView extends StatefulWidget {
  const NewsDetailView({super.key, required this.news});

  final News news;

  @override
  NewsDetailViewState createState() => NewsDetailViewState();
}

class NewsDetailViewState extends State<NewsDetailView> {
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
    Widget header = ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: CachedNetworkImage(
        height: 320,
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
        Icon(Icons.calendar_today_rounded, color: Colors.grey, size: 22),
        SizedBox(width: 12),
        AppTextParagraph(
          text: widget.news.publishedAt.formattedDate,
          color: Colors.grey,
        ),
      ],
    );

    final action = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.favorite_border_rounded,
            color: Colors.grey,
            size: 24,
          ),
        ),
        SizedBox(width: 6),
        InkWell(
          onTap: () {
            SharePlus.instance.share(
              ShareParams(
                subject: widget.news.title,
                text: widget.news.summary,
              ),
            );
          },
          child: Icon(Icons.share_outlined, color: Colors.grey, size: 22),
        ),
      ],
    );

    final subHeader = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [date, action],
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          header,
          SizedBox(height: 14),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextH3SemiBold(text: widget.news.title),
                SizedBox(height: 9),
                subHeader,
                SizedBox(height: 12),
                Html(data: widget.news.content ?? ""),
                SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
