part of 'gallery_category_list_cubit.dart';

enum GalleryCategoryListStatus {
  initial,
  loading,
  loaded,
  error,
  unAuthenticated,
}

class GalleryCategoryListState {
  const GalleryCategoryListState({
    required this.categories,
    required this.status,
    required this.errorMessage,
  });

  final List<GalleryCategory> categories;
  final GalleryCategoryListStatus status;
  final String errorMessage;

  factory GalleryCategoryListState.initial() {
    return GalleryCategoryListState(
      categories: [],
      status: GalleryCategoryListStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  GalleryCategoryListState copyWith({
    List<GalleryCategory>? categories,
    GalleryCategoryListStatus? status,
    String? errorMessage,
  }) {
    return GalleryCategoryListState(
      categories: categories ?? this.categories,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
