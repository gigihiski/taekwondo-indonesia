import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileState.initial());

  Future<void> init() async {
    try {
      emit(state.copyWith(status: EditProfileStatus.loading));
      emit(state.copyWith(status: EditProfileStatus.loaded));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: EditProfileStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: EditProfileStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
