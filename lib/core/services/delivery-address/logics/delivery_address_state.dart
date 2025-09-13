part of 'delivery_address_cubit.dart';

enum DeliveryAddressStatus {
  initial,
  loading,
  loaded,
  saving,
  saved,
  unAuthenticated,
  error,
}

class DeliveryAddressState {
  const DeliveryAddressState({
    required this.status,
    required this.errorMessage,
    required this.addresses,
    required this.address,
  });

  final DeliveryAddressStatus status;
  final String errorMessage;
  final List<DeliveryAddress> addresses;
  final DeliveryAddress? address;

  factory DeliveryAddressState.initial() {
    final init = List.filled(
      8,
      DeliveryAddress(
        label: '',
        address: '',
        notes: '',
        longitude: 0,
        latitude: 0,
        isDefault: false,
      ),
    );

    return DeliveryAddressState(
      status: DeliveryAddressStatus.initial,
      errorMessage: "Unknown - Default",
      addresses: init.toList(),
      address: null,
    );
  }

  DeliveryAddressState copyWith({
    DeliveryAddressStatus? status,
    String? errorMessage,
    List<DeliveryAddress>? addresses,
    DeliveryAddress? address,
  }) {
    addresses?.sort((a, b) => (b.isDefault ? 1 : 0) - (a.isDefault ? 1 : 0));

    return DeliveryAddressState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      addresses: addresses ?? this.addresses,
      address: address ?? this.address,
    );
  }
}
