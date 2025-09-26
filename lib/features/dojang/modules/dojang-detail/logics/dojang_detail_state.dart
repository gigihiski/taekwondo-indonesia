part of 'dojang_detail_cubit.dart';

enum DojangDetailStatus { initial, loading, loaded, error, unAuthenticated }

class DojangDetailState {
  const DojangDetailState({
    required this.dojang,
    required this.status,
    required this.errorMessage,
  });

  final Dojang? dojang;
  final DojangDetailStatus status;
  final String errorMessage;

  factory DojangDetailState.initial() {
    return DojangDetailState(
      dojang: null,
      status: DojangDetailStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  DojangDetailState copyWith({
    Dojang? dojang,
    DojangDetailStatus? status,
    String? errorMessage,
  }) {
    return DojangDetailState(
      dojang: dojang ?? this.dojang,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
