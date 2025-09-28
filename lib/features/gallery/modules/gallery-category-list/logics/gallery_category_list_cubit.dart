import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/gallery/gallery_repository.dart';
import 'package:taekwondo/core/services/gallery/models/gallery.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'gallery_category_list_state.dart';

class GalleryCategoryListCubit extends Cubit<GalleryCategoryListState> {
  GalleryCategoryListCubit({required this.galleryRepository})
    : super(GalleryCategoryListState.initial());

  final GalleryRepository galleryRepository;

  Future<void> init() async {
    try {
      emit(state.copyWith(status: GalleryCategoryListStatus.loading));
      final categories = await galleryRepository.getGalleryCategories();
      emit(
        state.copyWith(
          categories: categories,
          status: GalleryCategoryListStatus.loaded,
        ),
      );
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: GalleryCategoryListStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: GalleryCategoryListStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
