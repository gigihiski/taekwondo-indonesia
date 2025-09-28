import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/event/event_repository.dart';
import 'package:taekwondo/core/services/event/models/event.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'event_detail_state.dart';

class EventDetailCubit extends Cubit<EventDetailState> {
  EventDetailCubit(this.eventRepository) : super(EventDetailState.initial());

  final EventRepository eventRepository;

  Future<void> init(String id) async {
    try {
      emit(state.copyWith(status: EventDetailStatus.loading));
      final event = await eventRepository.getEventById(id);
      print(event.toJson());
      emit(state.copyWith(event: event, status: EventDetailStatus.loaded));
    } on AppException catch (e) {
      print(e);
      emit(
        state.copyWith(
          status: EventDetailStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      print(e);
      emit(
        state.copyWith(
          status: EventDetailStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
