import 'package:taekwondo/core/services/banner/banner_service.dart';
import 'package:taekwondo/core/services/banner/models/banner.dart';

abstract class IBannerRepository {
  Future<List<EventBanner>> getBanners();
}

class BannerRepository implements IBannerRepository {
  BannerRepository(this.bannerService);

  final BannerService bannerService;

  @override
  Future<List<EventBanner>> getBanners() async {
    return await bannerService.getBanners();
  }

  factory BannerRepository.create() {
    return BannerRepository(BannerService.create());
  }
}
