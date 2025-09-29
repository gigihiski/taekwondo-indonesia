import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentState.initial());

  Future<void> init() async {
    try {
      emit(state.copyWith(status: PaymentStatus.loading));
      emit(state.copyWith(status: PaymentStatus.loaded));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: PaymentStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: PaymentStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
