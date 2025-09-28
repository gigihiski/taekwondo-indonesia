import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_margin.dart';
import 'package:taekwondo/core/services/gallery/models/gallery.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:taekwondo/core/themes/app_assets.dart';

class GalleryListView extends StatefulWidget {
  const GalleryListView({super.key, required this.galleries});

  final List<Gallery> galleries;

  @override
  GalleryListViewState createState() => GalleryListViewState();
}

class GalleryListViewState extends State<GalleryListView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppMargin(
      child: GridView.custom(
        shrinkWrap: true,
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: [
            QuiltedGridTile(2, 2),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: widget.galleries.length,
          (context, index) => CachedNetworkImage(
            height: 223,
            width: 223,
            imageUrl: widget.galleries[index].imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return Image.asset(AppAssets.placeholder, fit: BoxFit.cover);
            },
            errorWidget: (context, url, error) {
              return Image.asset(AppAssets.placeholder, fit: BoxFit.cover);
            },
          ),
        ),
      ),
    );
  }
}
