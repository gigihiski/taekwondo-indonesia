import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

class TransactionEndpoint {
  final String baseUrl;

  TransactionEndpoint(this.baseUrl);

  Uri getTransactions() {
    return createUrl(host: baseUrl, path: "/api/v1/transactions");
  }

  Uri getTransactionById(String id) {
    return createUrl(host: baseUrl, path: "/api/v1/transactions/$id");
  }

  factory TransactionEndpoint.create() {
    return TransactionEndpoint(AppConfiguration.host);
  }
}
