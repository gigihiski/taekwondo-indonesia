import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/networks/index.dart';
import 'package:taekwondo/core/services/reward/reward_endpoint.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';
import 'package:taekwondo/features/home/modules/membership/models/reward.dart';

abstract class IRewardService {
  Future<List<Reward>> getRewardHistories({int page, int limit});
}

class RewardService implements IRewardService {
  final HttpClient httpClient;
  final HeaderProvider headerProvider;
  final RewardEndpoint endpoint;

  RewardService(this.httpClient, this.headerProvider, this.endpoint);

  @override
  Future<List<Reward>> getRewardHistories({
    int page = 1,
    int limit = 10,
  }) async {
    final url = endpoint.getRewardHistories(page, limit);
    final headers = await headerProvider.headers;
    final response = await httpClient.get(url, headers);
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    final body = RewardsResponse.fromJson(response.body);
    return body.data;
  }

  factory RewardService.create() {
    return RewardService(
      AppHttpClient.create(),
      AppHeaderProvider.create(),
      RewardEndpoint.create(),
    );
  }
}
