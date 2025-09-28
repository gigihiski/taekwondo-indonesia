import 'package:taekwondo/core/services/event/event_service.dart';
import 'package:taekwondo/core/services/event/models/event.dart';

abstract class IEventRepository {
  Future<Event> getEventById(String id);
  Future<List<Event>> getEvents();
}

class EventRepository implements IEventRepository {
  EventRepository(this.eventService);

  final EventService eventService;

  @override
  Future<Event> getEventById(String id) async {
    return await eventService.getEventById(id);
  }

  @override
  Future<List<Event>> getEvents() async {
    return await eventService.getEvents();
  }

  factory EventRepository.create() {
    return EventRepository(EventService.create());
  }
}
