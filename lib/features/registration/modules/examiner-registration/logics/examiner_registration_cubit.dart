import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'examiner_registration_state.dart';

class ExaminerRegistrationCubit extends Cubit<ExaminerRegistrationState> {
  ExaminerRegistrationCubit() : super(ExaminerRegistrationState.initial());

  Future<void> init() async {
    try {
      emit(state.copyWith(status: ExaminerRegistrationStatus.loading));
      emit(state.copyWith(status: ExaminerRegistrationStatus.loaded));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: ExaminerRegistrationStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ExaminerRegistrationStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
