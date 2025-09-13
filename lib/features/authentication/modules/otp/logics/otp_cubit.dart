import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/authentication/authentication_repository.dart';
import 'package:taekwondo/core/services/authentication/models/phone_authentication.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'otp_state.dart';

class OTPCubit extends Cubit<OTPState> {
  OTPCubit(this.authenticationRepository) : super(OTPState.initial());

  final AuthenticationRepository authenticationRepository;

  Future<void> login(EmailAuthenticationRequest request) async {
    emit(state.copyWith(status: OTPStatus.loading));
    try {
      await authenticationRepository.authenticateEmail(request);
      emit(state.copyWith(status: OTPStatus.success));
    } on TokenExpired {
      // await repository.setTokenExpired();
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: OTPStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: OTPStatus.error, errorMessage: e.toString()));
    }
  }
}
