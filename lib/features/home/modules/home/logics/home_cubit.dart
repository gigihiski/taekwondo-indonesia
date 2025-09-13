import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/models/user.dart';
import 'package:taekwondo/core/services/event-bazaar/event_bazaar_repository.dart';
import 'package:taekwondo/core/services/event-bazaar/models/event_bazaar.dart';
import 'package:taekwondo/core/services/storages/profile_storage.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.profileStorage, this.eventBazaarRepository)
    : super(HomeState.initial());

  final ProfileStorage profileStorage;
  final EventBazaarRepository eventBazaarRepository;

  Future<void> init() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));

      final User user = await profileStorage.profile;
      final events = await eventBazaarRepository.getEventBazaars();

      emit(
        state.copyWith(user: user, events: events, status: HomeStatus.loaded),
      );
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      print(e);
      emit(
        state.copyWith(status: HomeStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
