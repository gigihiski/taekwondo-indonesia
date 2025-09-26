import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_header.dart';
import 'package:taekwondo/core/services/gallery/models/gallery.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({
    super.key,
    required this.galleries,
    required this.onPressed,
  });

  final List<Gallery> galleries;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final header = AppHeaderTitleIconLink(
      text: L10n.localizations(context).new_gelleries,
      appHeaderIcon: AppHeaderIcon(icon: AppAssets.email),
      appHeaderLink: AppHeaderLink(
        text: L10n.localizations(context).view_all,
        onPressed: onPressed,
      ),
    );

    final content = SizedBox(
      height: 292,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: galleries.length,
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: 215,
            height: 292,
            child: CachedNetworkImage(
              imageUrl: galleries[index].path,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 10),
      ),
    );

    return Column(children: [header, SizedBox(height: 19), content]);
  }
}
