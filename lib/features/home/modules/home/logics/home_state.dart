part of 'home_cubit.dart';

enum HomeStatus { initial, loading, loaded, error, unAuthenticated }

class HomeState {
  const HomeState({
    required this.user,
    required this.events,
    required this.news,
    required this.galleries,
    required this.banners,
    required this.status,
    required this.errorMessage,
  });

  final User? user;
  final List<Event> events;
  final List<News> news;
  final List<Gallery> galleries;
  final List<EventBanner> banners;
  final HomeStatus status;
  final String errorMessage;

  factory HomeState.initial() {
    return HomeState(
      user: null,
      events: [],
      news: [],
      galleries: [],
      banners: [],
      status: HomeStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  HomeState copyWith({
    User? user,
    List<Event>? events,
    List<News>? news,
    List<Gallery>? galleries,
    List<EventBanner>? banners,
    HomeStatus? status,
    String? errorMessage,
  }) {
    return HomeState(
      user: user ?? this.user,
      events: events ?? this.events,
      news: news ?? this.news,
      galleries: galleries ?? this.galleries,
      banners: banners ?? this.banners,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
