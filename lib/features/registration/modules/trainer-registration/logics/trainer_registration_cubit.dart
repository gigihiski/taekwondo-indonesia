import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'trainer_registration_state.dart';

class TrainerRegistrationCubit extends Cubit<TrainerRegistrationState> {
  TrainerRegistrationCubit() : super(TrainerRegistrationState.initial());

  Future<void> init() async {
    try {
      emit(state.copyWith(status: TrainerRegistrationStatus.loading));
      emit(state.copyWith(status: TrainerRegistrationStatus.loaded));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: TrainerRegistrationStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TrainerRegistrationStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
