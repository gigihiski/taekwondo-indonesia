import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'dojang_registration_state.dart';

class DojangRegistrationCubit extends Cubit<DojangRegistrationState> {
  DojangRegistrationCubit() : super(DojangRegistrationState.initial());

  Future<void> init() async {
    try {
      emit(state.copyWith(status: DojangRegistrationStatus.loading));
      emit(state.copyWith(status: DojangRegistrationStatus.loaded));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: DojangRegistrationStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DojangRegistrationStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
