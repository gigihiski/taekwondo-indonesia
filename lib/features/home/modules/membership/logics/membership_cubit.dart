import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';
import 'package:taekwondo/features/home/modules/membership/models/reward.dart';

part 'membership_state.dart';

class MembershipCubit extends Cubit<MembershipState> {
  MembershipCubit() : super(MembershipState.initial());

  Future<void> initial() async {
    emit(state.copyWith(status: MembershipStatus.loading));
    try {
      emit(
        state.copyWith(
          reward: Reward(
            id: 0,
            transactionName: "",
            transactionType: "",
            transactionTypeId: "",
            transactionDate: "",
            transactionDateValue: DateTime.now(),
            point: 0,
          ),
          status: MembershipStatus.loaded,
        ),
      );
    } on TokenExpired {
      // await repository.setTokenExpired();
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: MembershipStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MembershipStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
