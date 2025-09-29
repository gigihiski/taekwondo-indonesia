import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'success_payment_state.dart';

class SuccessPaymentCubit extends Cubit<SuccessPaymentState> {
  SuccessPaymentCubit() : super(SuccessPaymentState.initial());

  Future<void> init() async {
    try {
      emit(state.copyWith(status: SuccessPaymentStatus.loading));
      emit(state.copyWith(status: SuccessPaymentStatus.loaded));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: SuccessPaymentStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SuccessPaymentStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
