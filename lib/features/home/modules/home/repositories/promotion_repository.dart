import 'package:taekwondo/core/services/promotion/promotion_service.dart';
import 'package:taekwondo/core/services/promotion/models/promotion.dart';

abstract class IPromotionRepository {
  Future<List<Promotion>> getPromotions();
}

class PromotionRepository implements IPromotionRepository {
  PromotionRepository(this.service);

  final PromotionService service;

  factory PromotionRepository.create() {
    return PromotionRepository(PromotionService.create());
  }

  @override
  Future<List<Promotion>> getPromotions() async {
    return await service.getPromotions();
  }
}
