Uri createUrl({
  required String host,
  String? path,
  int? port,
  Map<String, dynamic>? queryParameters,
}) {
  return Uri(
    scheme: "http",
    host: host,
    port: port ?? 80,
    path: path,
    queryParameters: queryParameters,
  );
}
