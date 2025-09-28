import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/gallery/gallery_repository.dart';
import 'package:taekwondo/core/services/gallery/models/gallery.dart';
import 'package:taekwondo/core/utils/exceptions/app_exception.dart';

part 'gallery_list_state.dart';

class GalleryListCubit extends Cubit<GalleryListState> {
  GalleryListCubit({required this.galleryRepository})
    : super(GalleryListState.initial());

  final GalleryRepository galleryRepository;

  Future<void> init(String id) async {
    try {
      emit(state.copyWith(status: GalleryListStatus.loading));
      final galleries = await galleryRepository.getGalleriesByCategoryId(id);
      emit(
        state.copyWith(galleries: galleries, status: GalleryListStatus.loaded),
      );
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: GalleryListStatus.error,
          errorMessage: e.message.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: GalleryListStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
