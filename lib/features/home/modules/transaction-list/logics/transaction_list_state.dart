part of 'transaction_list_cubit.dart';

enum TransactionListStatus { initial, loading, loaded, error, unAuthenticated }

class TransactionListState {
  const TransactionListState({
    required this.transactions,
    required this.status,
    required this.errorMessage,
  });

  final List<Transaction>? transactions;
  final TransactionListStatus status;
  final String errorMessage;

  factory TransactionListState.initial() {
    return TransactionListState(
      transactions: null,
      status: TransactionListStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  TransactionListState copyWith({
    List<Transaction>? transactions,
    TransactionListStatus? status,
    String? errorMessage,
  }) {
    return TransactionListState(
      transactions: transactions ?? this.transactions,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
