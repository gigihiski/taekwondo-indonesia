import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/networks/index.dart';
import 'package:taekwondo/core/services/delivery-address/delivery_address_endpoint.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';
import 'package:taekwondo/core/services/delivery-address/models/delivery_address.dart';

abstract class IDeliveryAddressService {
  Future<void> save(DeliveryAddress address);
  Future<void> update(DeliveryAddress address);
  Future<List<DeliveryAddress>> getDeliveryAddresses();
  Future<DeliveryAddress> getDeliveryAddress(int id);
  Future<void> setDefault(DeliveryAddress address);
  Future<void> remove(DeliveryAddress address);
}

class DeliveryAddressService implements IDeliveryAddressService {
  final HttpClient httpClient;
  final HeaderProvider headerProvider;
  final DeliveryAddressEndpoint endpoint;

  DeliveryAddressService(this.httpClient, this.headerProvider, this.endpoint);

  @override
  Future<void> save(DeliveryAddress address) async {
    final url = endpoint.saveDeliveryAddress();
    final headers = await headerProvider.headers;
    final response = await httpClient.post(url, headers, address.toJson());
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    return;
  }

  @override
  Future<void> update(DeliveryAddress address) async {
    final url = endpoint.updateDeliveryAddress(address.id.toString());
    final headers = await headerProvider.headers;
    final response = await httpClient.put(url, headers, address.toJson());
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    return;
  }

  @override
  Future<List<DeliveryAddress>> getDeliveryAddresses() async {
    final url = endpoint.getDeliveryAddresses();
    final headers = await headerProvider.headers;
    final response = await httpClient.get(url, headers);
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    final body = DeliveryAddressesResponse.fromJson(response.body);
    return body.data;
  }

  @override
  Future<DeliveryAddress> getDeliveryAddress(int id) async {
    final url = endpoint.getDeliveryAddress(id.toString());
    final headers = await headerProvider.headers;
    final response = await httpClient.get(url, headers);
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    final body = DeliveryAddressResponse.fromJson(response.body);
    return body.data;
  }

  @override
  Future<void> setDefault(DeliveryAddress address) async {
    final url = endpoint.setDefault(address.id ?? 0);
    final headers = await headerProvider.headers;
    final response = await httpClient.put(url, headers, address.toJson());
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    return;
  }

  @override
  Future<void> remove(DeliveryAddress address) async {
    final url = endpoint.remove(address.id ?? 0);
    final headers = await headerProvider.headers;
    final response = await httpClient.delete(url, headers, address.toJson());
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    return;
  }

  factory DeliveryAddressService.create() {
    return DeliveryAddressService(
      AppHttpClient.create(),
      AppHeaderProvider.create(),
      DeliveryAddressEndpoint.create(),
    );
  }
}
