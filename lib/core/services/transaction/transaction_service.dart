import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/networks/index.dart';
import 'package:taekwondo/core/services/transaction/models/transaction.dart';
import 'package:taekwondo/core/services/transaction/transaction_endpoint.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

abstract class ITransactionService {
  Future<Transaction> getTransactionById(String id);
  Future<List<Transaction>> getTransactions();
}

class TransactionService implements ITransactionService {
  final HttpClient httpClient;
  final HeaderProvider headerProvider;
  final TransactionEndpoint endpoint;

  TransactionService(this.httpClient, this.headerProvider, this.endpoint);

  @override
  Future<List<Transaction>> getTransactions() async {
    final url = endpoint.getTransactions();
    final headers = await headerProvider.headers;
    final response = await httpClient.get(url, headers);
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    final body = TransactionsResponse.fromJson(response.body);
    return body.data;
  }

  @override
  Future<Transaction> getTransactionById(String id) async {
    final url = endpoint.getTransactionById(id);
    final headers = await headerProvider.headers;
    final response = await httpClient.get(url, headers);
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    final body = TransactionResponse.fromJson(response.body);
    return body.data;
  }

  factory TransactionService.create() {
    return TransactionService(
      AppHttpClient.create(),
      AppHeaderProvider.create(),
      TransactionEndpoint.create(),
    );
  }
}
