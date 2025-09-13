import 'package:taekwondo/core/models/meta.dart';
import 'package:taekwondo/core/networks/index.dart';
import 'package:taekwondo/core/services/event/event_endpoint.dart';
import 'package:taekwondo/core/services/event/models/event.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

abstract class IEventService {
  Future<List<Event>> getEvents();
}

class EventService implements IEventService {
  final HttpClient httpClient;
  final HeaderProvider headerProvider;
  final EventEndpoint endpoint;

  EventService(this.httpClient, this.headerProvider, this.endpoint);

  @override
  Future<List<Event>> getEvents() async {
    final url = endpoint.getEvents();
    print(url);
    final headers = await headerProvider.headers;
    final response = await httpClient.get(url, headers);
    print(response.body);
    if (response.statusCode != 200) {
      final meta = Meta.fromJson(response.body);
      throw AppException(meta.message);
    }
    final body = EventResponse.fromJson(response.body);
    return body.data;
  }

  factory EventService.create() {
    return EventService(
      AppHttpClient.create(),
      AppHeaderProvider.create(),
      EventEndpoint.create(),
    );
  }
}
