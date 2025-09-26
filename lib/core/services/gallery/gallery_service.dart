import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/networks/index.dart';
import 'package:taekwondo/core/services/gallery/gallery_endpoint.dart';
import 'package:taekwondo/core/services/gallery/models/gallery.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

abstract class IGalleryService {
  Future<List<Gallery>> getGalleries();
}

class GalleryService implements IGalleryService {
  final HttpClient httpClient;
  final HeaderProvider headerProvider;
  final GalleryEndpoint endpoint;

  GalleryService(this.httpClient, this.headerProvider, this.endpoint);

  @override
  Future<List<Gallery>> getGalleries() async {
    final url = endpoint.getGalleries();
    final headers = await headerProvider.headers;
    final response = await httpClient.get(url, headers);
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    // final body = GalleriesResponse.fromJson(response.body);
    return [
      Gallery(
        id: "",
        title: "",
        description: "",
        path: "https://picsum.photos/600/300",
        date: DateTime.now(),
      ),
      Gallery(
        id: "",
        title: "",
        description: "",
        path: "https://picsum.photos/600/300",
        date: DateTime.now(),
      ),
      Gallery(
        id: "",
        title: "",
        description: "",
        path: "https://picsum.photos/600/300",
        date: DateTime.now(),
      ),
    ];
  }

  factory GalleryService.create() {
    return GalleryService(
      AppHttpClient.create(),
      AppHeaderProvider.create(),
      GalleryEndpoint.create(),
    );
  }
}
