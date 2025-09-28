import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

class GalleryEndpoint {
  final String baseUrl;

  GalleryEndpoint(this.baseUrl);

  Uri getGalleryCategories() {
    return createUrl(host: baseUrl, path: "/api/v1/gallery-categories");
  }

  Uri getGalleryByCategoryId(String categoryId) {
    return createUrl(
      host: baseUrl,
      path: "/api/v1/galleries",
      queryParameters: {"category_id": categoryId},
    );
  }

  Uri getGalleries() {
    return createUrl(host: baseUrl, path: "/api/v1/galleries");
  }

  factory GalleryEndpoint.create() {
    return GalleryEndpoint(AppConfiguration.host);
  }
}
