import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/transaction/models/transaction.dart';
import 'package:taekwondo/core/services/transaction/transaction_repository.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'transaction_list_state.dart';

class TransactionListCubit extends Cubit<TransactionListState> {
  TransactionListCubit({required this.transactionRepository})
    : super(TransactionListState.initial());

  final TransactionRepository transactionRepository;

  Future<void> init() async {
    try {
      emit(state.copyWith(status: TransactionListStatus.loading));
      // final transactions = await transactionRepository.getTransactions();
      emit(
        state.copyWith(transactions: [], status: TransactionListStatus.loaded),
      );
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: TransactionListStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TransactionListStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
