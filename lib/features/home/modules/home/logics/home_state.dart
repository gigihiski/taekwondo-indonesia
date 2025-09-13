part of 'home_cubit.dart';

enum HomeStatus { initial, loading, loaded, error, unAuthenticated }

class HomeState {
  const HomeState({
    required this.user,
    required this.events,
    required this.news,
    required this.banners,
    required this.status,
    required this.errorMessage,
  });

  final User? user;
  final List<Event> events;
  final List<News> news;
  final List<EventBanner> banners;
  final HomeStatus status;
  final String errorMessage;

  factory HomeState.initial() {
    return HomeState(
      user: null,
      events: [],
      news: [],
      banners: [],
      status: HomeStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  HomeState copyWith({
    User? user,
    List<Event>? events,
    List<News>? news,
    List<EventBanner>? banners,
    HomeStatus? status,
    String? errorMessage,
  }) {
    return HomeState(
      user: user ?? this.user,
      events: events ?? this.events,
      news: news ?? this.news,
      banners: banners ?? this.banners,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
