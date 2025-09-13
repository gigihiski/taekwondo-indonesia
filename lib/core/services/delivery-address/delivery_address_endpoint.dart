import 'package:taekwondo/core/app_configuration.dart';
import 'package:taekwondo/core/utils/networks/url_builder.dart';

class DeliveryAddressEndpoint {
  final String baseUrl;

  DeliveryAddressEndpoint(this.baseUrl);

  Uri saveDeliveryAddress() {
    return createUrl(host: baseUrl, path: "/v1/user-addresses");
  }

  Uri updateDeliveryAddress(String id) {
    return createUrl(host: baseUrl, path: "/v1/user-addresses/$id");
  }

  Uri getDeliveryAddresses() {
    return createUrl(host: baseUrl, path: "/v1/user-addresses");
  }

  Uri getDeliveryAddress(String id) {
    return createUrl(host: baseUrl, path: "/v1/user-addresses/$id");
  }

  Uri setDefault(int id) {
    return createUrl(host: baseUrl, path: "/v1/user-addresses/$id/default");
  }

  Uri remove(int id) {
    return createUrl(host: baseUrl, path: "/v1/user-addresses/$id");
  }

  factory DeliveryAddressEndpoint.create() {
    return DeliveryAddressEndpoint(AppConfiguration.host);
  }
}
