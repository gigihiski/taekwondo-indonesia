import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_navigator.dart';
import 'package:taekwondo/core/components/app_search.dart';
import 'package:taekwondo/core/services/news/models/news.dart';
import 'package:taekwondo/features/home/views/components/news_item.dart';
import 'package:taekwondo/features/news/modules/news-detail/views/news_detail_page.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key, required this.news});

  final List<News> news;

  @override
  NewsListViewState createState() => NewsListViewState();
}

class NewsListViewState extends State<NewsListView> {
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
              itemCount: widget.news.length,
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  AppNavigator(
                    context: context,
                    page: NewsDetailPage(id: widget.news[index].id),
                    route: NewsDetailPage.routeSettings,
                  ).push();
                },
                child: NewsItem(news: widget.news[index]),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
