part of 'index.dart';

abstract class HeaderProvider {
  Future<Map<String, String>> get headers;
  Future<Map<String, String>> get emptyHeaders;
}

class AppHeaderProvider implements HeaderProvider {
  final TokenStorage tokenStorage;
  final LanguageStorage languageStorage;
  final UserAgentProvider userAgentProvider;

  AppHeaderProvider(
    this.tokenStorage,
    this.languageStorage, {
    this.userAgentProvider = const UserAgentProvider(),
  });

  @override
  Future<Map<String, String>> get headers async {
    final accessToken = await tokenStorage.accessToken;
    final headers = {
      'x-api-key': "",
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': 'id-ID'
    };
    return headers;
  }

  @override
  Future<Map<String, String>> get emptyHeaders async => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': 'id-ID',
      };

  factory AppHeaderProvider.create() {
    return AppHeaderProvider(
      TokenStorage.create(),
      LanguageStorage.create(),
    );
  }
}

class UserAgentProvider {
  const UserAgentProvider();

  Future<String> get userAgent async {
    final packageInfo = await PackageInfo.fromPlatform();
    final appName = packageInfo.appName;
    final version = packageInfo.version;

    final deviceInfo = DeviceInfoPlugin();
    final String deviceInformation;
    final String operatingSystemVersion;
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceInformation = androidInfo.model;
      operatingSystemVersion = androidInfo.version.release;
    } else if (Platform.isIOS) {
      final iOSInfo = await deviceInfo.iosInfo;
      deviceInformation = iOSInfo.utsname.machine;
      operatingSystemVersion = iOSInfo.systemVersion;
    } else {
      deviceInformation = 'Unknown';
      operatingSystemVersion = 'Unknown OS Version';
    }
    final operatingSystem = Platform.operatingSystem;

    return "$appName/$version $deviceInformation $operatingSystem/$operatingSystemVersion";
  }
}
