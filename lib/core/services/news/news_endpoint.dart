import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

class NewsEndpoint {
  final String baseUrl;

  NewsEndpoint(this.baseUrl);

  Uri getNews() {
    return createUrl(host: baseUrl, path: "/api/v1/events");
  }

  factory NewsEndpoint.create() {
    return NewsEndpoint(AppConfiguration.host);
  }
}
