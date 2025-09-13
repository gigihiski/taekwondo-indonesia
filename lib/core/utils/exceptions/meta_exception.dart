import 'package:taekwondo/core/models/error_form.dart';
import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';
import 'package:taekwondo/core/utils/extensions/authentication.dart';

class MetaExceptionHanlder {
  final int errorCode;
  final String responseBody;

  MetaExceptionHanlder(this.errorCode, this.responseBody);

  handleByErrorCode() {
    String message = Meta.fromJson(responseBody).message;

    switch (errorCode) {
      case 400:
      case 401:
        if (message.isUnaunthenticatedResponse()) throw TokenExpired();
    }
    throw AppException(message);
  }

  handleByErrorCodeCatchMessage() {
    String message = Meta.fromJson(responseBody).message;

    switch (errorCode) {
      case 400:
        if (message.contains("Expired")) throw TokenExpired();
      case 401:
        if (message.isUnaunthenticatedResponse()) throw TokenExpired();
    }
    throw AppException(message);
  }

  handleErrorForm() =>
      throw AppException(ErrorForm.fromJson(responseBody).data);
}
