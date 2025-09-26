import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

class GalleryEndpoint {
  final String baseUrl;

  GalleryEndpoint(this.baseUrl);

  Uri getGalleries() {
    return createUrl(host: baseUrl, path: "/api/v1/events");
  }

  factory GalleryEndpoint.create() {
    return GalleryEndpoint(AppConfiguration.host);
  }
}
