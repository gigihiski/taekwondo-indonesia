import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/notification/models/notification.dart';
import 'package:taekwondo/core/services/notification/notification_repository.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'notification_list_state.dart';

class NotificationListCubit extends Cubit<NotificationListState> {
  NotificationListCubit({required this.notificationRepository})
    : super(NotificationListState.initial());

  final NotificationRepository notificationRepository;

  Future<void> init() async {
    try {
      emit(state.copyWith(status: NotificationListStatus.loading));
      // final notifications = await notificationRepository.getNotifications();
      emit(
        state.copyWith(
          notifications: [],
          status: NotificationListStatus.loaded,
        ),
      );
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: NotificationListStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: NotificationListStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
