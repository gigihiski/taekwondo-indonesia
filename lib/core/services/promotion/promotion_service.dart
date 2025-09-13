import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/networks/index.dart';
import 'package:taekwondo/core/services/promotion/models/promotion.dart';
import 'package:taekwondo/core/services/promotion/promotion_endpoint.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

abstract class IPromotionService {
  Future<List<Promotion>> getPromotions();
}

class PromotionService implements IPromotionService {
  final HttpClient httpClient;
  final HeaderProvider headerProvider;
  final PromotionEndpoint endpoint;

  PromotionService(this.httpClient, this.headerProvider, this.endpoint);

  @override
  Future<List<Promotion>> getPromotions() async {
    final url = endpoint.getPromotions();
    final headers = await headerProvider.headers;
    final response = await httpClient.get(url, headers);
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    final body = PromotionResponse.fromJson(response.body);
    return body.data;
  }

  factory PromotionService.create() {
    return PromotionService(
      AppHttpClient.create(),
      AppHeaderProvider.create(),
      PromotionEndpoint.create(),
    );
  }
}
