import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_navigator.dart';
import 'package:taekwondo/core/services/gallery/models/gallery.dart';
import 'package:taekwondo/features/gallery/modules/gallery-category-list/views/components/gallery_category_item.dart';
import 'package:taekwondo/features/gallery/modules/gallery-list/views/gallery_list_page.dart';

class GalleryCategoryListView extends StatefulWidget {
  const GalleryCategoryListView({super.key, required this.categories});

  final List<GalleryCategory> categories;

  @override
  GalleryCategoryListViewState createState() => GalleryCategoryListViewState();
}

class GalleryCategoryListViewState extends State<GalleryCategoryListView> {
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.white,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        primary: true,
        padding: EdgeInsets.zero,
        itemCount: widget.categories.length,
        separatorBuilder: (context, index) => SizedBox(height: 20),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            AppNavigator(
              context: context,
              page: GalleryListPage(category: widget.categories[index]),
              route: GalleryListPage.routeSettings,
            ).push();
          },
          child: GalleryCategoryItem(category: widget.categories[index]),
        ),
      ),
    );
  }
}
