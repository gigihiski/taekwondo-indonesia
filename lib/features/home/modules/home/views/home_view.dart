import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_margin.dart';
import 'package:taekwondo/core/components/app_search.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/models/user.dart';
import 'package:taekwondo/core/services/banner/models/banner.dart';
import 'package:taekwondo/core/services/event/models/event.dart';
import 'package:taekwondo/core/services/gallery/models/gallery.dart';
import 'package:taekwondo/core/services/news/models/news.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/features/home/modules/home/models/category.dart';
import 'package:taekwondo/features/home/views/components/category_section.dart';
import 'package:taekwondo/features/home/views/components/event_section.dart';
import 'package:taekwondo/features/home/views/components/banner_slider.dart';
import 'package:taekwondo/features/home/views/components/gellery_section.dart';
import 'package:taekwondo/features/home/views/components/news_section.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
    required this.user,
    required this.events,
    required this.news,
    required this.galleries,
    required this.banners,
  });

  final User user;
  final List<Event> events;
  final List<News> news;
  final List<EventBanner> banners;
  final List<Gallery> galleries;

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
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
    final nameInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextCaption(
          text: L10n.localizations(context).welcome_back,
          color: Colors.white,
        ),
        SizedBox(height: 5),
        AppTextCaptionSemiBold(text: widget.user.name, color: Colors.white),
      ],
    );

    final avatar = CircleAvatar(
      child: SizedBox(
        width: 58,
        height: 58,
        child: Image.asset(AppAssets.logo),
      ),
    );

    Widget userInformation = Row(
      children: [avatar, SizedBox(width: 12), nameInformation],
    );

    Widget header = Container(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          userInformation,
          SizedBox(height: 14),
          AppSearch(hint: L10n.localizations(context).search_event),
          SizedBox(height: 8),
        ],
      ),
    );

    final category = CategorySection(
      categories: [
        Category(name: "Registrasi", icon: AppAssets.apple),
        Category(name: "Multimedia", icon: AppAssets.apple),
        Category(name: "Edukasi", icon: AppAssets.apple),
        Category(name: "Dojang", icon: AppAssets.apple),
      ],
      onPressed: () {},
    );

    final mainContent = Container(
      color: Colors.white,
      child: Column(
        children: [
          header,
          SizedBox(height: 20),
          AppMargin(child: category),
          SizedBox(height: 28),
          AppMargin(child: BannerSlider(banners: widget.banners)),
          SizedBox(height: 28),
          AppMargin(
            child: EventSection(events: widget.events, onPressed: () {}),
          ),
          SizedBox(height: 28),
          AppMargin(
            child: NewsSection(news: widget.news, onPressed: () {}),
          ),
          SizedBox(height: 28),
          AppMargin(
            child: GallerySection(
              galleries: widget.galleries,
              onPressed: () {},
            ),
          ),
          SizedBox(height: 120),
        ],
      ),
    );

    return Stack(
      children: [
        SingleChildScrollView(child: mainContent),
        Positioned(bottom: 110, child: Container()),
      ],
    );
  }
}
