import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/authentication/authentication_repository.dart';
import 'package:taekwondo/core/services/authentication/models/phone_registration.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this.authenticationRepository)
    : super(RegistrationState.initial());

  final AuthenticationRepository authenticationRepository;

  Future<void> signUp(EmailRegistrationRequest request) async {
    emit(state.copyWith(status: RegistrationStatus.loading));
    try {
      await authenticationRepository.register(request);
      emit(state.copyWith(status: RegistrationStatus.success));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: RegistrationStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RegistrationStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
