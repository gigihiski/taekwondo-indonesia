import 'package:taekwondo/core/services/event-bazaar/event_bazaar_service.dart';
import 'package:taekwondo/core/services/event-bazaar/models/event_bazaar.dart';

abstract class IEventBazaarRepository {
  Future<List<EventBazaar>> getEventBazaars();
}

class EventBazaarRepository implements IEventBazaarRepository {
  EventBazaarRepository(this.eventBazaarService);

  final EventBazaarService eventBazaarService;

  @override
  Future<List<EventBazaar>> getEventBazaars() async {
    return await eventBazaarService.getEventBazaars();
  }

  factory EventBazaarRepository.create() {
    return EventBazaarRepository(EventBazaarService.create());
  }
}
