import 'package:taekwondo/core/services/dojang/dojang_service.dart';
import 'package:taekwondo/core/services/dojang/models/dojang.dart';

abstract class IDojangRepository {
  Future<Dojang> getDojang(String id);
  Future<List<Dojang>> getDojangs();
}

class DojangRepository implements IDojangRepository {
  DojangRepository(this.dojangService);

  final DojangService dojangService;

  @override
  Future<Dojang> getDojang(String id) async {
    return await dojangService.getDojang(id);
  }

  @override
  Future<List<Dojang>> getDojangs() async {
    return await dojangService.getDojangs();
  }

  factory DojangRepository.create() {
    return DojangRepository(DojangService.create());
  }
}
