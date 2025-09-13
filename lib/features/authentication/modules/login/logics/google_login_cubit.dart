import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taekwondo/core/services/authentication/authentication_repository.dart';
import 'package:taekwondo/core/services/authentication/models/google_authentication.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'google_login_state.dart';

class GoogleLoginCubit extends Cubit<GoogleLoginState> {
  GoogleLoginCubit(this.authenticationRepository)
    : super(GoogleLoginState.initial());

  final AuthenticationRepository authenticationRepository;

  Future<void> login() async {
    emit(state.copyWith(status: GoogleLoginStatus.loading));
    try {
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth == null) {
        emit(
          state.copyWith(
            status: GoogleLoginStatus.error,
            errorMessage: "Terjadi kesalahan, silahkan coba lagi.",
          ),
        );
      } else {
        final request = GoogleAuthenticationRequest(
          token: googleAuth.accessToken!,
          referralCode: null,
        );
        final accessToken = await authenticationRepository.authenticateGoogle(
          request,
        );

        emit(
          state.copyWith(
            status: GoogleLoginStatus.success,
            accessToken: accessToken.token,
          ),
        );
      }
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: GoogleLoginStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: GoogleLoginStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
