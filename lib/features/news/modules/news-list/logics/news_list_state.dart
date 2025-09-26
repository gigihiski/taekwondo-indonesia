part of 'news_list_cubit.dart';

enum NewsListStatus { initial, loading, loaded, error, unAuthenticated }

class NewsListState {
  const NewsListState({
    required this.news,
    required this.status,
    required this.errorMessage,
  });

  final List<News> news;
  final NewsListStatus status;
  final String errorMessage;

  factory NewsListState.initial() {
    return NewsListState(
      news: [],
      status: NewsListStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  NewsListState copyWith({
    List<News>? news,
    NewsListStatus? status,
    String? errorMessage,
  }) {
    return NewsListState(
      news: news ?? this.news,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
