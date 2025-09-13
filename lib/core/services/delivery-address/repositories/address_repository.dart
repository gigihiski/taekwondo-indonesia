import 'package:taekwondo/core/services/delivery-address/delivery_address_service.dart';
import 'package:taekwondo/core/services/delivery-address/models/delivery_address.dart';

abstract class IAddressRepository {
  Future<void> save(DeliveryAddress address);
  Future<void> update(DeliveryAddress address);
  Future<List<DeliveryAddress>> getAddresses();
  Future<DeliveryAddress> getAddress(int id);
  Future<void> setDefault(DeliveryAddress address);
  Future<void> remove(DeliveryAddress address);
  Future<DeliveryAddress?> getDefaultAddress();
}

class AddressRepository implements IAddressRepository {
  AddressRepository(this.deliveryAddressService);

  final DeliveryAddressService deliveryAddressService;

  factory AddressRepository.create() {
    return AddressRepository(DeliveryAddressService.create());
  }

  @override
  Future<void> save(DeliveryAddress address) async {
    return await deliveryAddressService.save(address);
  }

  @override
  Future<void> update(DeliveryAddress address) async {
    return await deliveryAddressService.update(address);
  }

  @override
  Future<List<DeliveryAddress>> getAddresses() async {
    return await deliveryAddressService.getDeliveryAddresses();
  }

  @override
  Future<DeliveryAddress> getAddress(int id) async {
    return await deliveryAddressService.getDeliveryAddress(id);
  }

  @override
  Future<void> setDefault(DeliveryAddress address) async {
    return await deliveryAddressService.setDefault(address);
  }

  @override
  Future<DeliveryAddress?> getDefaultAddress() async {
    final addresses = await deliveryAddressService.getDeliveryAddresses();
    final defaultAddress = addresses.isNotEmpty
        ? addresses.firstWhere((element) => element.isDefault)
        : null;
    return defaultAddress;
  }

  @override
  Future<void> remove(DeliveryAddress address) async {
    return await deliveryAddressService.remove(address);
  }
}
