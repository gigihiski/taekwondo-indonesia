import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/networks/index.dart';
import 'package:taekwondo/core/services/news/models/news.dart';
import 'package:taekwondo/core/services/news/news_endpoint.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

abstract class INewsService {
  Future<List<News>> getNews();
}

class NewsService implements INewsService {
  final HttpClient httpClient;
  final HeaderProvider headerProvider;
  final NewsEndpoint endpoint;

  NewsService(this.httpClient, this.headerProvider, this.endpoint);

  @override
  Future<List<News>> getNews() async {
    final url = endpoint.getNews();
    final headers = await headerProvider.headers;
    final response = await httpClient.get(url, headers);
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    final body = NewsResponse.fromJson(response.body);
    return body.data;
  }

  factory NewsService.create() {
    return NewsService(
      AppHttpClient.create(),
      AppHeaderProvider.create(),
      NewsEndpoint.create(),
    );
  }
}
