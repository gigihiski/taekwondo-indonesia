part of 'event_detail_cubit.dart';

enum EventDetailStatus { initial, loading, loaded, error, unAuthenticated }

class EventDetailState {
  const EventDetailState({
    required this.event,
    required this.status,
    required this.errorMessage,
  });

  final Event? event;
  final EventDetailStatus status;
  final String errorMessage;

  factory EventDetailState.initial() {
    return EventDetailState(
      event: null,
      status: EventDetailStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  EventDetailState copyWith({
    Event? event,
    EventDetailStatus? status,
    String? errorMessage,
  }) {
    return EventDetailState(
      event: event ?? this.event,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
