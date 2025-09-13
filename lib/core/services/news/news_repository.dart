import 'package:taekwondo/core/services/news/models/news.dart';
import 'package:taekwondo/core/services/news/news_service.dart';

abstract class INewsRepository {
  Future<List<News>> getNews();
}

class NewsRepository implements INewsRepository {
  NewsRepository(this.eventService);

  final NewsService eventService;

  @override
  Future<List<News>> getNews() async {
    return await eventService.getNews();
  }

  factory NewsRepository.create() {
    return NewsRepository(NewsService.create());
  }
}
