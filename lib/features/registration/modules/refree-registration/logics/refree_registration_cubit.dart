import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'refree_registration_state.dart';

class RefreeRegistrationCubit extends Cubit<RefreeRegistrationState> {
  RefreeRegistrationCubit() : super(RefreeRegistrationState.initial());

  Future<void> init() async {
    try {
      emit(state.copyWith(status: RefreeRegistrationStatus.loading));
      emit(state.copyWith(status: RefreeRegistrationStatus.loaded));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: RefreeRegistrationStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RefreeRegistrationStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
