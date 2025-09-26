import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/dojang/dojang_repository.dart';
import 'package:taekwondo/core/services/dojang/models/dojang.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'dojang_detail_state.dart';

class DojangDetailCubit extends Cubit<DojangDetailState> {
  DojangDetailCubit({required this.dojangRepository})
    : super(DojangDetailState.initial());

  final DojangRepository dojangRepository;

  Future<void> init(String id) async {
    try {
      emit(state.copyWith(status: DojangDetailStatus.loading));
      final dojang = await dojangRepository.getDojang(id);
      emit(state.copyWith(dojang: dojang, status: DojangDetailStatus.loaded));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: DojangDetailStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DojangDetailStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
