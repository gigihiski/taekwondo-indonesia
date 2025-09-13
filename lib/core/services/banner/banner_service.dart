import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/networks/index.dart';
import 'package:taekwondo/core/services/banner/banner_endpoint.dart';
import 'package:taekwondo/core/services/banner/models/banner.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

abstract class IBannerService {
  Future<List<EventBanner>> getBanners();
}

class BannerService implements IBannerService {
  final HttpClient httpClient;
  final HeaderProvider headerProvider;
  final BannerEndpoint endpoint;

  BannerService(this.httpClient, this.headerProvider, this.endpoint);

  @override
  Future<List<EventBanner>> getBanners() async {
    final url = endpoint.getBanners();
    final headers = await headerProvider.headers;
    final response = await httpClient.get(url, headers);
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    final body = BannerResponse.fromJson(response.body);
    return body.data;
  }

  factory BannerService.create() {
    return BannerService(
      AppHttpClient.create(),
      AppHeaderProvider.create(),
      BannerEndpoint.create(),
    );
  }
}
