import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

class EventEndpoint {
  final String baseUrl;

  EventEndpoint(this.baseUrl);

  Uri getEventById(String id) {
    return createUrl(host: baseUrl, path: "/api/v1/events/$id");
  }

  Uri getEvents() {
    return createUrl(host: baseUrl, path: "/api/v1/events");
  }

  factory EventEndpoint.create() {
    return EventEndpoint(AppConfiguration.host);
  }
}
