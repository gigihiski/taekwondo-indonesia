import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/authentication/authentication_repository.dart';
import 'package:taekwondo/core/services/authentication/models/phone_authentication.dart';
import 'package:taekwondo/core/services/location/location_repository.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.authenticationRepository,
    required this.locationRepository,
  }) : super(LoginState.initial());

  final AuthenticationRepository authenticationRepository;
  final LocationRepository locationRepository;

  Future<void> init() async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await locationRepository.requestPermission();
      await locationRepository.getUpdatedLocation();
      emit(state.copyWith(status: LoginStatus.loaded));
    } catch (e) {
      emit(
        state.copyWith(status: LoginStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> login(PhoneAuthenticationRequest request) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await authenticationRepository.authenticatePhone(request);
      emit(state.copyWith(status: LoginStatus.success));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: LoginStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
