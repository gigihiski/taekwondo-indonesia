part of 'index.dart';

abstract class HttpClient<T> {
  Future<T> delete(
    Uri url,
    Map<String, String>? headers,
    Object? body, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  });
  Future<T> get(
    Uri url,
    Map<String, String>? headers, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  });
  Future<T> post(
    Uri url,
    Map<String, String>? headers,
    Object? body, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  });
  Future<T> put(
    Uri url,
    Map<String, String>? headers,
    Object? body, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  });
  Future<T> patch(
    Uri url,
    Map<String, String>? headers,
    Object? body, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  });
  Future<T> multipartPost(
    Uri url,
    Map<String, String> headers,
    Map<String, File> files,
    Map<String, String>? fields, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  });
}

class AppHttpClient implements HttpClient {
  final http.Client _client;

  AppHttpClient(this._client);

  @override
  Future<http.Response> delete(
    Uri url,
    Map<String, String>? headers,
    Object? body, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  }) async {
    try {
      final response = await _client.delete(
        url,
        headers: headers,
        body: body,
      );
      return response;
    } on AppException {
      rethrow;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  @override
  Future<http.Response> get(
    Uri url,
    Map<String, String>? headers, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  }) async {
    try {
      final response = await _client.get(
        url,
        headers: headers,
      );
      appNetworkLogger(
        endpoint: "GET ENDPOINT => ${url.toString()}",
        payload: "",
        response: response.body.toString(),
      );
      return response;
    } on AppException {
      rethrow;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  @override
  Future<http.Response> post(
    Uri url,
    Map<String, String>? headers,
    Object? body, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  }) async {
    try {
      final response = await _client.post(
        url,
        headers: headers,
        body: body,
      );
      appNetworkLogger(
        endpoint: "POST ENDPOINT => ${url.toString()}",
        payload: body.toString(),
        response: response.body.toString(),
      );
      return response;
    } on AppException {
      rethrow;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  @override
  Future<http.Response> put(
    Uri url,
    Map<String, String>? headers,
    Object? body, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  }) async {
    try {
      final response = await _client.put(
        url,
        headers: headers,
        body: body,
      );
      appNetworkLogger(
        endpoint: "PUT ENDPOINT => ${url.toString()}",
        payload: body.toString(),
        response: response.body.toString(),
      );
      return response;
    } on AppException {
      rethrow;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  @override
  Future<http.Response> patch(
    Uri url,
    Map<String, String>? headers,
    Object? body, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  }) async {
    try {
      final response = await _client.patch(
        url,
        headers: headers,
        body: body,
      );
      appNetworkLogger(
        endpoint: "PATCH ENDPOINT => ${url.toString()}",
        payload: body.toString(),
        response: response.body.toString(),
      );
      return response;
    } on AppException {
      rethrow;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  @override
  Future<http.Response> multipartPost(
    Uri url,
    Map<String, String> headers,
    Map<String, File> files,
    Map<String, String>? fields, {
    StackTrace? stackTrace,
    List<int>? customAllowedStatusCode,
  }) async {
    http.MultipartRequest request = http.MultipartRequest('POST', url);
    request.headers.addAll(headers);
    if (fields != null) request.fields.addAll(fields);
    files.forEach((key, value) {
      request.files.add(http.MultipartFile.fromBytes(
        key,
        value.readAsBytesSync(),
        filename: value.path.split('/').last,
      ));
    });
    final streamedResponse = await request.send();
    appNetworkLogger(
      endpoint: "MULTIPART POST ENDPOINT => ${url.toString()}",
      payload: fields.toString(),
      response: "",
    );
    return await http.Response.fromStream(streamedResponse);
  }

  factory AppHttpClient.create() {
    return AppHttpClient(http.Client());
  }
}
