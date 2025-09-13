import 'package:taekwondo/core/models/error.dart';
import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/services/authentication/authentication_endpoint.dart';
import 'package:taekwondo/core/services/authentication/models/access_token.dart';
import 'package:taekwondo/core/services/authentication/models/apple_authentication.dart';
import 'package:taekwondo/core/services/authentication/models/confirm_password.dart';
import 'package:taekwondo/core/services/authentication/models/phone_authentication.dart';
import 'package:taekwondo/core/networks/index.dart';
import 'package:taekwondo/core/services/authentication/models/google_account_registration.dart';
import 'package:taekwondo/core/services/authentication/models/google_authentication.dart';
import 'package:taekwondo/core/services/authentication/models/otp.dart';
import 'package:taekwondo/core/services/authentication/models/phone_registration.dart';
import 'package:taekwondo/core/services/authentication/models/phone_verification.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';
import 'package:taekwondo/core/utils/exceptions/meta_exception.dart';

abstract class IAuthenticationService {
  Future<void> register(EmailRegistrationRequest request);
  Future<EmailAuthentication> authenticateEmail(
    EmailAuthenticationRequest request,
  );

  Future<GoogleAccountRegistration> registerGoogleAccount(
    GoogleAccountRegistrationRequest request,
  );
  Future<AccessToken> authenticateGoogle(GoogleAuthenticationRequest request);
  Future<AccessToken> authenticateAppleID(AppleIDAuthenticationRequest request);
  Future<bool> validatePhone(PhoneValidationRequest request);

  Future<bool> sendOTP(OTPRequest request);
  Future<bool> confirmForgotPassword(ConfirmPasswordRequest request);
}

class AuthenticationService implements IAuthenticationService {
  final HttpClient httpClient;
  final HeaderProvider headerProvider;
  final AuthenticationEndpoint endpoint;

  AuthenticationService(this.httpClient, this.headerProvider, this.endpoint);

  @override
  Future<void> register(EmailRegistrationRequest request) async {
    final url = endpoint.registration();
    final headers = await headerProvider.emptyHeaders;
    final response = await httpClient.post(url, headers, request.toJson());
    if (response.statusCode != 201) {
      final error = ErrorResponse.fromJson(response.body);
      throw AppException(error.errors.first);
    }
  }

  @override
  Future<EmailAuthentication> authenticateEmail(
    EmailAuthenticationRequest request,
  ) async {
    final url = endpoint.emailAuthentication();
    print(url);
    final headers = await headerProvider.emptyHeaders;
    final response = await httpClient.post(url, headers, request.toJson());
    print(response.body);
    if (response.statusCode != 200) {
      final error = ErrorResponse.fromJson(response.body);
      throw AppException(error.errors.first);
    }
    final body = EmailAuthenticationResponse.fromJson(response.body);
    return body.data;
  }

  @override
  Future<GoogleAccountRegistration> registerGoogleAccount(
    GoogleAccountRegistrationRequest request,
  ) async {
    final url = endpoint.googleAuthentication();
    final headers = await headerProvider.emptyHeaders;
    final response = await httpClient.post(url, headers, request.toJson());

    if (response.statusCode != 200) {
      throw MetaExceptionHanlder(
        response.statusCode,
        response.body,
      ).handleByErrorCode();
    }
    final body = GoogleAccountRegistrationResponse.fromJson(response.body);
    return body.data;
  }

  @override
  Future<AccessToken> authenticateGoogle(
    GoogleAuthenticationRequest request,
  ) async {
    final url = endpoint.googleAuthentication();
    final headers = await headerProvider.headers;
    return await httpClient.post(url, headers, request.toJson());
  }

  @override
  Future<AccessToken> authenticateAppleID(
    AppleIDAuthenticationRequest request,
  ) async {
    final url = endpoint.appleAuthentication();
    final headers = await headerProvider.headers;
    return await httpClient.post(url, headers, request.toJson());
  }

  @override
  Future<bool> validatePhone(PhoneValidationRequest request) async {
    final url = endpoint.phoneValidation();
    final header = await headerProvider.headers;
    final response = await httpClient.post(url, header, request.toJson());
    if (response.statusCode != 200) {
      throw MetaExceptionHanlder(
        response.statusCode,
        response.body,
      ).handleByErrorCode();
    }
    return true;
  }

  @override
  Future<bool> sendOTP(OTPRequest request) async {
    final url = endpoint.otpRequest();
    final header = await headerProvider.headers;
    final response = await httpClient.post(url, header, request.toJson());
    if (response.statusCode != 200) {
      throw MetaExceptionHanlder(
        response.statusCode,
        response.body,
      ).handleByErrorCode();
    }
    return true;
  }

  @override
  Future<bool> confirmForgotPassword(ConfirmPasswordRequest request) async {
    final url = endpoint.forgotPasswordConfirmation();
    final header = await headerProvider.headers;
    final response = await httpClient.post(url, header, request.toJson());
    if (response.statusCode != 200) {
      if (response.statusCode == 422) {
        String message = Meta.fromJson(response.body).message;
        throw TokenExpired(message: message);
      } else {
        throw MetaExceptionHanlder(
          response.statusCode,
          response.body,
        ).handleByErrorCode();
      }
    }
    return true;
  }

  factory AuthenticationService.create() {
    return AuthenticationService(
      AppHttpClient.create(),
      AppHeaderProvider.create(),
      AuthenticationEndpoint.create(),
    );
  }
}
