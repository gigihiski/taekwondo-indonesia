part of 'gallery_list_cubit.dart';

enum GalleryListStatus { initial, loading, loaded, error, unAuthenticated }

class GalleryListState {
  const GalleryListState({
    required this.galleries,
    required this.status,
    required this.errorMessage,
  });

  final List<Gallery>? galleries;
  final GalleryListStatus status;
  final String errorMessage;

  factory GalleryListState.initial() {
    return GalleryListState(
      galleries: null,
      status: GalleryListStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  GalleryListState copyWith({
    List<Gallery>? galleries,
    GalleryListStatus? status,
    String? errorMessage,
  }) {
    return GalleryListState(
      galleries: galleries ?? this.galleries,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
