import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/dojang/dojang_repository.dart';
import 'package:taekwondo/core/services/dojang/models/dojang.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'dojang_list_state.dart';

class DojangListCubit extends Cubit<DojangListState> {
  DojangListCubit({required this.dojangRepository})
    : super(DojangListState.initial());

  final DojangRepository dojangRepository;

  Future<void> init() async {
    try {
      emit(state.copyWith(status: DojangListStatus.loading));
      final dojangs = await dojangRepository.getDojangs();
      emit(state.copyWith(dojangs: dojangs, status: DojangListStatus.loaded));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: DojangListStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DojangListStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
