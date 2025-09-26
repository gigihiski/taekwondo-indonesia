import 'package:flutter/widgets.dart';
import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/networks/index.dart';
import 'package:taekwondo/core/services/dojang/dojang_endpoint.dart';
import 'package:taekwondo/core/services/dojang/models/dojang.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

abstract class IDojangService {
  Future<Dojang> getDojang(String id);
  Future<List<Dojang>> getDojangs();
}

class DojangService implements IDojangService {
  final HttpClient httpClient;
  final HeaderProvider headerProvider;
  final DojangEndpoint endpoint;

  DojangService(this.httpClient, this.headerProvider, this.endpoint);

  @override
  Future<Dojang> getDojang(String id) async {
    final url = endpoint.getDojang(id);
    final headers = await headerProvider.headers;
    final response = await httpClient.get(url, headers);
    debugPrint(response.body);
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    final body = DojangResponse.fromJson(response.body);
    return body.data;
  }

  @override
  Future<List<Dojang>> getDojangs() async {
    final url = endpoint.getDojangs();
    final headers = await headerProvider.headers;
    final response = await httpClient.get(url, headers);
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    final body = DojangsResponse.fromJson(response.body);
    return body.data;
  }

  factory DojangService.create() {
    return DojangService(
      AppHttpClient.create(),
      AppHeaderProvider.create(),
      DojangEndpoint.create(),
    );
  }
}
