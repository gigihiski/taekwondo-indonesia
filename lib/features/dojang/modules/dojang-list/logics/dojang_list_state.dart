part of 'dojang_list_cubit.dart';

enum DojangListStatus { initial, loading, loaded, error, unAuthenticated }

class DojangListState {
  const DojangListState({
    required this.dojangs,
    required this.status,
    required this.errorMessage,
  });

  final List<Dojang> dojangs;
  final DojangListStatus status;
  final String errorMessage;

  factory DojangListState.initial() {
    return DojangListState(
      dojangs: [],
      status: DojangListStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  DojangListState copyWith({
    List<Dojang>? dojangs,
    DojangListStatus? status,
    String? errorMessage,
  }) {
    return DojangListState(
      dojangs: dojangs ?? this.dojangs,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
