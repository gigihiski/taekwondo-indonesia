import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/news/news_repository.dart';
import 'package:taekwondo/features/news/modules/news-detail/logics/news_detail_cubit.dart';
import 'package:taekwondo/features/news/modules/news-detail/views/news_detail_view.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key, required this.id});

  final String id;

  static Route route(String id) {
    return MaterialPageRoute(builder: (_) => NewsDetailPage(id: id));
  }

  static RouteSettings routeSettings = const RouteSettings(name: "news-detail");

  @override
  State<NewsDetailPage> createState() => NewsDetailPageState();
}

class NewsDetailPageState extends State<NewsDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider newsBlocProvider() {
    return BlocProvider<NewsDetailCubit>(
      create: (context) =>
          NewsDetailCubit(newsRepository: NewsRepository.create())
            ..init(widget.id),
    );
  }

  BlocListener newsBlocDetailener() {
    return BlocListener<NewsDetailCubit, NewsDetailState>(
      listener: (context, state) {
        switch (state.status) {
          case NewsDetailStatus.initial:
          case NewsDetailStatus.loading:
          case NewsDetailStatus.error:
          case NewsDetailStatus.loaded:
          case NewsDetailStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, NewsDetailState) newsBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case NewsDetailStatus.initial:
        case NewsDetailStatus.loading:
        case NewsDetailStatus.error:
          return Container();
        case NewsDetailStatus.loaded:
          return NewsDetailView(news: state.news!);
        case NewsDetailStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.transparent,
    );

    return MultiBlocProvider(
      providers: [newsBlocProvider()],
      child: MultiBlocListener(
        listeners: [newsBlocDetailener()],
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          appBar: appBar,
          body: BlocBuilder<NewsDetailCubit, NewsDetailState>(
            builder: newsBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
