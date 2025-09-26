import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/news/models/news.dart';
import 'package:taekwondo/core/services/news/news_repository.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'news_list_state.dart';

class NewsListCubit extends Cubit<NewsListState> {
  NewsListCubit({required this.newsRepository})
    : super(NewsListState.initial());

  final NewsRepository newsRepository;

  Future<void> init() async {
    try {
      emit(state.copyWith(status: NewsListStatus.loading));
      final news = await newsRepository.getNews();
      emit(state.copyWith(news: news, status: NewsListStatus.loaded));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: NewsListStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: NewsListStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
