import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/models/user.dart';
import 'package:taekwondo/core/services/banner/banner_repository.dart';
import 'package:taekwondo/core/services/banner/models/banner.dart';
import 'package:taekwondo/core/services/event/event_repository.dart';
import 'package:taekwondo/core/services/event/models/event.dart';
import 'package:taekwondo/core/services/gallery/gallery_repository.dart';
import 'package:taekwondo/core/services/gallery/models/gallery.dart';
import 'package:taekwondo/core/services/news/models/news.dart';
import 'package:taekwondo/core/services/news/news_repository.dart';
import 'package:taekwondo/core/services/storages/profile_storage.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.profileStorage,
    required this.eventRepository,
    required this.newsRepository,
    required this.galleryRepository,
    required this.bannerRepository,
  }) : super(HomeState.initial());

  final ProfileStorage profileStorage;
  final EventRepository eventRepository;
  final NewsRepository newsRepository;
  final GalleryRepository galleryRepository;
  final BannerRepository bannerRepository;

  Future<void> init() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));

      final User user = await profileStorage.profile;
      final events = await eventRepository.getEvents();
      final news = await newsRepository.getNews();
      final galleries = await galleryRepository.getGalleries();
      final banners = await bannerRepository.getBanners();

      emit(
        state.copyWith(
          user: user,
          events: events,
          news: news,
          galleries: galleries,
          banners: banners,
          status: HomeStatus.loaded,
        ),
      );
    } on AppException catch (e) {
      print(e);
      emit(
        state.copyWith(
          status: HomeStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      print(e);
      emit(
        state.copyWith(status: HomeStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
