import 'package:taekwondo/core/models/user.dart';
import 'package:taekwondo/core/services/authentication/logics/authentication_cubit.dart';
import 'package:taekwondo/core/services/authentication/models/access_token.dart';
import 'package:taekwondo/core/services/authentication/models/apple_authentication.dart';
import 'package:taekwondo/core/services/authentication/models/phone_authentication.dart';
import 'package:taekwondo/core/services/authentication/authentication_service.dart';
import 'package:taekwondo/core/services/authentication/models/google_account_registration.dart';
import 'package:taekwondo/core/services/authentication/models/google_authentication.dart';
import 'package:taekwondo/core/services/authentication/models/phone_registration.dart';
import 'package:taekwondo/core/services/storages/clear_storage.dart';
import 'package:taekwondo/core/services/storages/profile_storage.dart';
import 'package:taekwondo/core/services/storages/token_storage.dart';
import 'package:taekwondo/core/services/user/user_service.dart';
import 'package:taekwondo/core/utils/device_information.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

abstract class IAuthenticationRepository {
  Future<String> register(EmailRegistrationRequest request);
  Future<String> authenticateEmail(EmailAuthenticationRequest request);

  Future<AccessToken> registerGoogleAccount(
    GoogleAccountRegistrationRequest request,
  );
  Future<AccessToken> authenticateGoogle(GoogleAuthenticationRequest request);

  Future<AccessToken> authenticateAppleID(AppleIDAuthenticationRequest request);
  Future<User> getMe();
  Future<void> unauthenticate();
  Future<void> changeStatus(AuthenticationStatus status);
  Future<AuthenticationStatus> get status;
  Future<AccessToken> get token;
}

class AuthenticationRepository implements IAuthenticationRepository {
  final AuthenticationService authenticationService;
  final UserService userService;
  final TokenStorage tokenStorage;
  final ProfileStorage profileStorage;
  final ClearStorage clearStorage;

  AuthenticationRepository(
    this.authenticationService,
    this.userService,
    this.tokenStorage,
    this.profileStorage,
    this.clearStorage,
  );

  @override
  Future<String> register(EmailRegistrationRequest request) async {
    await authenticationService.register(request);
    final loginRequest = EmailAuthenticationRequest(
      email: request.email,
      password: request.password,
    );
    final loginResponse = await authenticationService.authenticateEmail(
      loginRequest,
    );
    await tokenStorage.saveToken(loginResponse.accessToken);
    final user = await userService.getMe();
    await profileStorage.saveProfile(user);
    return loginResponse.accessToken;
  }

  @override
  Future<String> authenticateEmail(EmailAuthenticationRequest request) async {
    final response = await authenticationService.authenticateEmail(request);
    await tokenStorage.saveToken(response.accessToken);
    final user = await userService.getMe();
    await profileStorage.saveProfile(user);
    return response.accessToken;
  }

  @override
  Future<AccessToken> authenticateAppleID(
    AppleIDAuthenticationRequest request,
  ) async {
    final response = await authenticationService.authenticateAppleID(request);
    await tokenStorage.saveToken(response.token);
    return response;
  }

  @override
  Future<AccessToken> registerGoogleAccount(
    GoogleAccountRegistrationRequest request,
  ) async {
    request.deviceId = await getDeviceId();
    final googleAccountResponse = await authenticationService
        .registerGoogleAccount(request);
    final token = googleAccountResponse.token;

    await tokenStorage.saveToken(token);
    final user = await userService.getMe();
    await profileStorage.saveProfile(user);
    return AccessToken(token);
  }

  @override
  Future<AccessToken> authenticateGoogle(
    GoogleAuthenticationRequest request,
  ) async {
    final existingGoogleAccountRequest = ExistingGoogleAccountRequest(
      token: request.token,
    );
    final existingGoogleAccount = await userService.getExistingGoogleAccount(
      existingGoogleAccountRequest,
    );

    if (existingGoogleAccount.exist) {
      await tokenStorage.saveToken(existingGoogleAccount.token);
      final user = await userService.getMe();
      await profileStorage.saveProfile(user);
      return AccessToken(existingGoogleAccount.token);
    }
    throw CustomException(message: "User not found");
  }

  @override
  Future<User> getMe() async {
    return await profileStorage.profile;
  }

  @override
  Future<void> unauthenticate() async {
    await clearStorage.clear(tokenStorage.tokenKey);
    await clearStorage.clear(profileStorage.profileKey);
  }

  @override
  Future<void> changeStatus(AuthenticationStatus status) {
    throw UnimplementedError();
  }

  @override
  Future<AuthenticationStatus> get status => throw UnimplementedError();

  @override
  Future<AccessToken> get token async {
    return AccessToken(await tokenStorage.accessToken);
  }

  factory AuthenticationRepository.create() {
    return AuthenticationRepository(
      AuthenticationService.create(),
      UserService.create(),
      TokenStorage.create(),
      ProfileStorage.create(),
      ClearStorage.create(),
    );
  }
}
