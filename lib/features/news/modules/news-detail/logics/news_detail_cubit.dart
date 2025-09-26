import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/news/news_repository.dart';
import 'package:taekwondo/core/services/news/models/news.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'news_detail_state.dart';

class NewsDetailCubit extends Cubit<NewsDetailState> {
  NewsDetailCubit({required this.newsRepository})
    : super(NewsDetailState.initial());

  final NewsRepository newsRepository;

  Future<void> init(String id) async {
    try {
      emit(state.copyWith(status: NewsDetailStatus.loading));
      final news = await newsRepository.getNewsById(id);
      emit(state.copyWith(news: news, status: NewsDetailStatus.loaded));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: NewsDetailStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      print(e);
      emit(
        state.copyWith(
          status: NewsDetailStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
