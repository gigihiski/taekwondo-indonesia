import 'dart:convert';

import 'package:taekwondo/core/models/error.dart';
import 'package:taekwondo/core/models/user.dart';
import 'package:taekwondo/core/networks/index.dart';
import 'package:taekwondo/core/services/authentication/models/google_authentication.dart';
import 'package:taekwondo/core/services/user/models/update_profile.dart';
import 'package:taekwondo/core/services/user/user_endpoint.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

abstract class IUserService {
  Future<User> getMe();
  Future<ExistingGoogleAccount> getExistingGoogleAccount(
    ExistingGoogleAccountRequest request,
  );
  Future<void> updateProfile(UpdateProfile request);
}

class UserService implements IUserService {
  final HttpClient httpClient;
  final HeaderProvider headerProvider;
  final UserEndpoint endpoint;

  UserService(this.httpClient, this.headerProvider, this.endpoint);

  @override
  Future<User> getMe() async {
    final url = endpoint.getMe();
    final headers = await headerProvider.headers;
    final response = await httpClient.post(url, headers, json.encode({}));
    print(response.body);
    if (response.statusCode != 200) {
      throw AppException(response.body["message"]);
    }
    print(response.body);
    final body = UserResponse.fromJson(response.body);
    return body.data;
  }

  @override
  Future<ExistingGoogleAccount> getExistingGoogleAccount(
    ExistingGoogleAccountRequest request,
  ) async {
    final url = endpoint.existingGoogleAccount();
    final headers = await headerProvider.emptyHeaders;
    final response = await httpClient.post(url, headers, request.toJson());
    print("response3: ${response.body}");

    if (response.statusCode != 200) {
      final error = ErrorResponse.fromJson(response.body);
      throw AppException(error.errors.first);
    }

    print("response4: ${response.body}");
    final body = ExistingGoogleAccountResponse.fromJson(response.body);
    print("boooddyyy: $body");
    return body.data;
  }

  @override
  Future<void> updateProfile(UpdateProfile request) async {
    final url = endpoint.updateProfile();
    final headers = await headerProvider.headers;
    final response = await httpClient.multipartPost(url, headers, {
      if (request.profileImage != null)
        "profile_picture": request.profileImage!,
    }, request.toMap());
    if (response.statusCode != 200) {
      throw AppException(response.body["message"]);
    }
    return;
  }

  factory UserService.create() {
    return UserService(
      AppHttpClient.create(),
      AppHeaderProvider.create(),
      UserEndpoint.create(),
    );
  }
}
