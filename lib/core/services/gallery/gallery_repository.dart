import 'package:taekwondo/core/services/gallery/gallery_service.dart';
import 'package:taekwondo/core/services/gallery/models/gallery.dart';

abstract class IGalleryRepository {
  Future<List<GalleryCategory>> getGalleryCategories();
  Future<List<Gallery>> getGalleriesByCategoryId(String categoryId);
  Future<List<Gallery>> getGalleries();
}

class GalleryRepository implements IGalleryRepository {
  GalleryRepository(this.galleryService);

  final GalleryService galleryService;

  @override
  Future<List<GalleryCategory>> getGalleryCategories() async {
    return await galleryService.getGalleryCategories();
  }

  @override
  Future<List<Gallery>> getGalleriesByCategoryId(String categoryId) async {
    return await galleryService.getGalleries();
  }

  @override
  Future<List<Gallery>> getGalleries() async {
    return await galleryService.getGalleries();
  }

  factory GalleryRepository.create() {
    return GalleryRepository(GalleryService.create());
  }
}
