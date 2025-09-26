import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/event/models/event.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'event_detail_state.dart';

class EventDetailCubit extends Cubit<EventDetailState> {
  EventDetailCubit() : super(EventDetailState.initial());

  Future<void> init(Event event) async {
    try {
      emit(state.copyWith(status: EventDetailStatus.loading));
      emit(state.copyWith(event: event, status: EventDetailStatus.loaded));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: EventDetailStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: EventDetailStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
