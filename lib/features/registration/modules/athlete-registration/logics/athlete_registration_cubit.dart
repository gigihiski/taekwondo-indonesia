import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'athlete_registration_state.dart';

class AthleteRegistrationCubit extends Cubit<AthleteRegistrationState> {
  AthleteRegistrationCubit() : super(AthleteRegistrationState.initial());

  Future<void> init() async {
    try {
      emit(state.copyWith(status: AthleteRegistrationStatus.loading));
      emit(state.copyWith(status: AthleteRegistrationStatus.loaded));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: AthleteRegistrationStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AthleteRegistrationStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
