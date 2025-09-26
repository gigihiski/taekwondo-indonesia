part of 'news_detail_cubit.dart';

enum NewsDetailStatus { initial, loading, loaded, error, unAuthenticated }

class NewsDetailState {
  const NewsDetailState({
    required this.news,
    required this.status,
    required this.errorMessage,
  });

  final News? news;
  final NewsDetailStatus status;
  final String errorMessage;

  factory NewsDetailState.initial() {
    return NewsDetailState(
      news: null,
      status: NewsDetailStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  NewsDetailState copyWith({
    News? news,
    NewsDetailStatus? status,
    String? errorMessage,
  }) {
    return NewsDetailState(
      news: news ?? this.news,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
