import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'management_registration_state.dart';

class ManagementRegistrationCubit extends Cubit<ManagementRegistrationState> {
  ManagementRegistrationCubit() : super(ManagementRegistrationState.initial());

  Future<void> init() async {
    try {
      emit(state.copyWith(status: ManagementRegistrationStatus.loading));
      emit(state.copyWith(status: ManagementRegistrationStatus.loaded));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: ManagementRegistrationStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ManagementRegistrationStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
