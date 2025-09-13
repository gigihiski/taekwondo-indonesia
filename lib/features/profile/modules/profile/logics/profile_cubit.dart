import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/models/user.dart';
import 'package:taekwondo/core/services/authentication/authentication_repository.dart';
import 'package:taekwondo/core/services/storages/profile_storage.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.authenticationRepository, this.profileStorage)
    : super(ProfileState.initial());

  final AuthenticationRepository authenticationRepository;
  final ProfileStorage profileStorage;

  Future<void> init() async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      final User user = await profileStorage.profile;
      emit(state.copyWith(user: user, status: ProfileStatus.loaded));
    } on TokenExpired {
      // await repository.setTokenExpired();
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: ProfileStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ProfileStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      await authenticationRepository.unauthenticate();
      emit(state.copyWith(status: ProfileStatus.loggedOut));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: ProfileStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ProfileStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
