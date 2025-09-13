import 'package:taekwondo/core/services/event/event_service.dart';
import 'package:taekwondo/core/services/event/models/event.dart';

abstract class IEventRepository {
  Future<List<Event>> getEvents();
}

class EventRepository implements IEventRepository {
  EventRepository(this.eventService);

  final EventService eventService;

  @override
  Future<List<Event>> getEvents() async {
    return await eventService.getEvents();
  }

  factory EventRepository.create() {
    return EventRepository(EventService.create());
  }
}
