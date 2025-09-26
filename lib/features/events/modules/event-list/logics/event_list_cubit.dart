import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/event/models/event.dart';
import 'package:taekwondo/core/services/event/event_repository.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'event_list_state.dart';

class EventListCubit extends Cubit<EventListState> {
  EventListCubit({required this.eventRepository})
    : super(EventListState.initial());

  final EventRepository eventRepository;

  Future<void> init() async {
    try {
      emit(state.copyWith(status: EventListStatus.loading));
      final event = await eventRepository.getEvents();
      emit(state.copyWith(event: event, status: EventListStatus.loaded));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: EventListStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: EventListStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
