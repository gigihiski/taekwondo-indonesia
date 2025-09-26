import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/core/services/news/news_repository.dart';
import 'package:taekwondo/features/news/modules/news-list/logics/news_list_cubit.dart';
import 'package:taekwondo/features/news/modules/news-list/views/news_list_view.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => NewsListPage());
  }

  static RouteSettings routeSettings = const RouteSettings(name: "news-list");

  @override
  State<NewsListPage> createState() => NewsListPageState();
}

class NewsListPageState extends State<NewsListPage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider dojangBlocProvider() {
    return BlocProvider<NewsListCubit>(
      create: (context) =>
          NewsListCubit(newsRepository: NewsRepository.create())..init(),
    );
  }

  BlocListener dojangBlocListener() {
    return BlocListener<NewsListCubit, NewsListState>(
      listener: (context, state) {
        switch (state.status) {
          case NewsListStatus.initial:
          case NewsListStatus.loading:
          case NewsListStatus.error:
          case NewsListStatus.loaded:
          case NewsListStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, NewsListState) dojangBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case NewsListStatus.initial:
        case NewsListStatus.loading:
        case NewsListStatus.error:
          return Container();
        case NewsListStatus.loaded:
          return NewsListView(news: state.news);
        case NewsListStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarHeader(title: "News", color: Colors.white);

    return MultiBlocProvider(
      providers: [dojangBlocProvider()],
      child: MultiBlocListener(
        listeners: [dojangBlocListener()],
        child: Scaffold(
          appBar: appBar,
          body: BlocBuilder<NewsListCubit, NewsListState>(
            builder: dojangBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
