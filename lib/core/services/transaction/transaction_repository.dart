import 'package:taekwondo/core/services/transaction/transaction_service.dart';
import 'package:taekwondo/core/services/transaction/models/transaction.dart';

abstract class ITransactionRepository {
  Future<Transaction> getTransactionById(String id);
  Future<List<Transaction>> getTransactions();
}

class TransactionRepository implements ITransactionRepository {
  TransactionRepository(this.transactionService);

  final TransactionService transactionService;

  @override
  Future<Transaction> getTransactionById(String id) async {
    return await transactionService.getTransactionById(id);
  }

  @override
  Future<List<Transaction>> getTransactions() async {
    return await transactionService.getTransactions();
  }

  factory TransactionRepository.create() {
    return TransactionRepository(TransactionService.create());
  }
}
