import 'package:taekwondo/core/services/payment-method/models/payment_method.dart';
import 'package:taekwondo/core/services/payment-method/payment_method_service.dart';

abstract class IPaymentMethodRepository {
  Future<List<PaymentMethod>> getPaymentMethods(String data);
}

class PaymentMethodRepository implements IPaymentMethodRepository {
  PaymentMethodRepository({required this.service});

  final PaymentMethodService service;

  factory PaymentMethodRepository.create() {
    return PaymentMethodRepository(service: PaymentMethodService.create());
  }

  @override
  Future<List<PaymentMethod>> getPaymentMethods(String data) async {
    return service.getPaymentMethods(data);
  }
}
