import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/authentication/models/access_token.dart';
import 'package:taekwondo/core/services/authentication/authentication_repository.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepository repository;

  AuthenticationCubit(this.repository) : super(AuthenticationState.initial());

  Future<void> initial() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      final token = await repository.token;
      emit(
        state.copyWith(
          status: AuthenticationStatus.authenticated,
          token: token,
        ),
      );
    } on TokenExpired {
      emit(
        state.copyWith(
          status: AuthenticationStatus.unAuthenticated,
          errorMessage: "Unauthenticated",
        ),
      );
    } on Maintenance {
      emit(
        state.copyWith(
          status: AuthenticationStatus.maintenance,
          errorMessage: "Maintenance",
        ),
      );
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: AuthenticationStatus.unAuthenticated,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthenticationStatus.unAuthenticated,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> logout() async {
    try {
      await repository.unauthenticate();
      emit(state.copyWith(status: AuthenticationStatus.unAuthenticated));
    } on TokenExpired {
      emit(
        state.copyWith(
          status: AuthenticationStatus.unAuthenticated,
          errorMessage: "Unauthenticated",
        ),
      );
    } on Maintenance {
      emit(
        state.copyWith(
          status: AuthenticationStatus.maintenance,
          errorMessage: "Maintenance",
        ),
      );
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: AuthenticationStatus.unAuthenticated,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: AuthenticationStatus.unAuthenticated,
        ),
      );
    }
  }
}
