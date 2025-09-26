part of 'event_list_cubit.dart';

enum EventListStatus { initial, loading, loaded, error, unAuthenticated }

class EventListState {
  const EventListState({
    required this.event,
    required this.status,
    required this.errorMessage,
  });

  final List<Event> event;
  final EventListStatus status;
  final String errorMessage;

  factory EventListState.initial() {
    return EventListState(
      event: [],
      status: EventListStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  EventListState copyWith({
    List<Event>? event,
    EventListStatus? status,
    String? errorMessage,
  }) {
    return EventListState(
      event: event ?? this.event,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
