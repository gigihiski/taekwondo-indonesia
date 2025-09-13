import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taekwondo/core/services/banner/models/banner.dart';
import 'package:taekwondo/core/themes/app_assets.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key, required this.banners});

  final List<EventBanner> banners;

  @override
  BannerSliderState createState() => BannerSliderState();
}

class BannerSliderState extends State<BannerSlider> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page?.round() ?? 0;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = SizedBox(
      height: 174,
      child: PageView.builder(
        controller: pageController,
        itemCount: widget.banners.length,
        itemBuilder: (context, index) {
          return PromotionCard(banner: widget.banners[index]);
        },
      ),
    );

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          content,
          SizedBox(height: 11),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.banners.length, (index) {
              return Container(
                width: 7,
                height: 7,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentPage == index
                      ? Colors.grey
                      : Colors.grey.withAlpha(100),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class PromotionCard extends StatelessWidget {
  const PromotionCard({super.key, required this.banner});

  final EventBanner banner;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 24,
        child: CachedNetworkImage(
          imageUrl: banner.path,
          fit: BoxFit.cover,
          placeholder: (context, url) => Image.asset(
            AppAssets.placeholder,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          errorWidget: (context, url, error) => Image.asset(
            AppAssets.placeholder,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
