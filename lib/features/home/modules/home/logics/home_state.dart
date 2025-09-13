part of 'home_cubit.dart';

enum HomeStatus { initial, loading, loaded, error, unAuthenticated }

class HomeState {
  const HomeState({
    required this.user,
    required this.events,
    required this.status,
    required this.errorMessage,
  });

  final User? user;
  final List<EventBazaar> events;
  final HomeStatus status;
  final String errorMessage;

  factory HomeState.initial() {
    return HomeState(
      user: null,
      events: [],
      status: HomeStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  HomeState copyWith({
    User? user,
    List<EventBazaar>? events,
    HomeStatus? status,
    String? errorMessage,
  }) {
    return HomeState(
      user: user ?? this.user,
      events: events ?? this.events,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
