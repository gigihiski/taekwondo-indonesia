import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/networks/index.dart';
import 'package:taekwondo/core/services/event-bazaar/event_bazaar_endpoint.dart';
import 'package:taekwondo/core/services/event-bazaar/models/event_bazaar.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

abstract class IEventBazaarService {
  Future<List<EventBazaar>> getEventBazaars();
}

class EventBazaarService implements IEventBazaarService {
  final HttpClient httpClient;
  final HeaderProvider headerProvider;
  final EventBazaarEndpoint endpoint;

  EventBazaarService(this.httpClient, this.headerProvider, this.endpoint);

  @override
  Future<List<EventBazaar>> getEventBazaars({int page = 1}) async {
    final url = endpoint.getEventBazaars(page: page);
    final headers = await headerProvider.headers;
    final response = await httpClient.get(url, headers);
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    final body = EventBazaarResponse.fromJson(response.body);
    return body.data;
  }

  factory EventBazaarService.create() {
    return EventBazaarService(
      AppHttpClient.create(),
      AppHeaderProvider.create(),
      EventBazaarEndpoint.create(),
    );
  }
}
