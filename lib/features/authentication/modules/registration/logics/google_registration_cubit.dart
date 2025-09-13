import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taekwondo/core/services/authentication/authentication_repository.dart';
import 'package:taekwondo/core/services/authentication/models/google_account_registration.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'google_registration_state.dart';

class GoogleRegistrationCubit extends Cubit<GoogleRegistrationState> {
  GoogleRegistrationCubit(this.authenticationRepository)
    : super(GoogleRegistrationState.initial());

  final AuthenticationRepository authenticationRepository;

  Future<void> checkToken() async {
    emit(state.copyWith(status: GoogleRegistrationStatus.loading));
    try {
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth == null) {
        emit(
          state.copyWith(
            status: GoogleRegistrationStatus.error,
            errorMessage: "Terjadi kesalahan, silahkan coba lagi.",
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: GoogleRegistrationStatus.successGoogleToken,
            googleUser: googleUser,
          ),
        );
      }
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: GoogleRegistrationStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: GoogleRegistrationStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> signUp(
    String phoneNumber,
    GoogleSignInAccount googleUser,
  ) async {
    emit(state.copyWith(status: GoogleRegistrationStatus.loading));
    try {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final request = GoogleAccountRegistrationRequest(
        firstName: googleUser.displayName!.split(" ")[0],
        lastName: googleUser.displayName!.split(" ")[1],
        email: googleUser.email,
        phoneNumber: phoneNumber,
        token: googleAuth.accessToken!,
        referralCode: null,
      );
      final accessToken = await authenticationRepository.registerGoogleAccount(
        request,
      );

      emit(
        state.copyWith(
          status: GoogleRegistrationStatus.success,
          accessToken: accessToken.token,
        ),
      );
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: GoogleRegistrationStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: GoogleRegistrationStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
