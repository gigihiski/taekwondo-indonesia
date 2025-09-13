import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';
import 'package:taekwondo/core/services/delivery-address/models/delivery_address.dart';
import 'package:taekwondo/core/services/delivery-address/repositories/address_repository.dart';

part 'delivery_address_state.dart';

class DeliveryAddressCubit extends Cubit<DeliveryAddressState> {
  DeliveryAddressCubit(this.repository) : super(DeliveryAddressState.initial());
  final AddressRepository repository;

  Future<void> initial() async {
    emit(state.copyWith(status: DeliveryAddressStatus.loading));
    try {
      final addresses = await repository.getAddresses();
      emit(
        state.copyWith(
          addresses: addresses,
          status: DeliveryAddressStatus.loaded,
        ),
      );
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: DeliveryAddressStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DeliveryAddressStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> save(DeliveryAddress address) async {
    emit(state.copyWith(status: DeliveryAddressStatus.saving));
    try {
      await repository.save(address);
      final addresses = await repository.getAddresses();
      emit(
        state.copyWith(
          addresses: addresses,
          status: DeliveryAddressStatus.saved,
        ),
      );
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: DeliveryAddressStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DeliveryAddressStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> setDefault(DeliveryAddress address) async {
    emit(state.copyWith(status: DeliveryAddressStatus.loading));
    try {
      await repository.setDefault(address);
      final addresses = await repository.getAddresses();
      emit(
        state.copyWith(
          address: address,
          addresses: addresses,
          status: DeliveryAddressStatus.loaded,
        ),
      );
    } on TokenExpired {
      // await repository.setTokenExpired();
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: DeliveryAddressStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DeliveryAddressStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> getDefaultAddress() async {
    emit(state.copyWith(status: DeliveryAddressStatus.loading));
    try {
      final address = await repository.getDefaultAddress();
      emit(
        state.copyWith(address: address, status: DeliveryAddressStatus.loaded),
      );
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: DeliveryAddressStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DeliveryAddressStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> update(DeliveryAddress address) async {
    emit(state.copyWith(status: DeliveryAddressStatus.saving));
    try {
      await repository.update(address);
      final addresses = await repository.getAddresses();
      emit(
        state.copyWith(
          addresses: addresses,
          status: DeliveryAddressStatus.saved,
        ),
      );
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: DeliveryAddressStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DeliveryAddressStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> remove(DeliveryAddress address) async {
    emit(state.copyWith(status: DeliveryAddressStatus.loading));
    try {
      await repository.remove(address);
      final addresses = await repository.getAddresses();
      emit(
        state.copyWith(
          addresses: addresses,
          status: DeliveryAddressStatus.loaded,
        ),
      );
    } on TokenExpired {
      // await repository.setTokenExpired();
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: DeliveryAddressStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DeliveryAddressStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
