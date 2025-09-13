import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

abstract class IPaymentMethodEndpoint {
  Uri getPaymentMethods(String branchCode);
}

class PaymentMethodEndpoint implements IPaymentMethodEndpoint {
  final String baseUrl;

  PaymentMethodEndpoint(this.baseUrl);

  @override
  Uri getPaymentMethods(String branchCode) {
    return createUrl(
      host: baseUrl,
      path: '/v1/payment-methods',
      queryParameters: {'branch_code': branchCode},
    );
  }

  factory PaymentMethodEndpoint.create() =>
      PaymentMethodEndpoint(AppConfiguration.host);
}
