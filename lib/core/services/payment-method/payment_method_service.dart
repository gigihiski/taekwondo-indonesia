import 'package:taekwondo/core/models/error.dart';
import 'package:taekwondo/core/networks/index.dart';
import 'package:taekwondo/core/services/payment-method/models/payment_method.dart';
import 'package:taekwondo/core/services/payment-method/payment_method_endpoint.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

abstract class IPaymentMethodService {
  Future<List<PaymentMethod>> getPaymentMethods(String branchCode);
}

class PaymentMethodService implements IPaymentMethodService {
  final HttpClient httpClient;
  final HeaderProvider headerProvider;
  final PaymentMethodEndpoint endpoint;

  PaymentMethodService(this.httpClient, this.headerProvider, this.endpoint);

  @override
  Future<List<PaymentMethod>> getPaymentMethods(String branchCode) async {
    final url = endpoint.getPaymentMethods(branchCode);
    final headers = await headerProvider.headers;
    final response = await httpClient.get(url, headers);
    if (response.statusCode != 200) {
      final error = ErrorResponse.fromJson(response.body);
      throw AppException(error.errors.first);
    }

    final resp = {
      "meta": {"code": 200, "message": "success"},
      "data": [
        {
          "type": "CASH",
          "methods": [
            {"id": 87, "code": "Cash 1", "name": "Cash"},
          ],
        },
        {
          "type": "CARD",
          "methods": [
            {"id": 1, "code": "External", "name": "External"},
          ],
        },
        {
          "type": "VOUCHER",
          "methods": [
            {"id": 48, "code": "Voucher", "name": "Voucher"},
          ],
        },
        {
          "type": "OTHER VOUCHER",
          "methods": [
            {"id": -1, "code": "ESBVOUCHER", "name": "Ayomakan/ESB Voucher"},
          ],
        },
        {
          "type": "OTHER COST",
          "methods": [
            {"id": 84, "code": "8", "name": "online"},
          ],
        },
        {
          "type": "BANK",
          "methods": [
            {"id": 85, "code": "Gojek", "name": "Gojek"},
            {"id": 86, "code": "Shopee", "name": "Shopee"},
          ],
        },
      ],
    };

    final body = PaymentMethodsResponse.fromJson(resp);
    return body.data;
  }

  factory PaymentMethodService.create() {
    return PaymentMethodService(
      AppHttpClient.create(),
      AppHeaderProvider.create(),
      PaymentMethodEndpoint.create(),
    );
  }
}
