import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_margin.dart';
import 'package:taekwondo/core/models/user.dart';
import 'package:taekwondo/core/services/event-bazaar/models/event_bazaar.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/features/home/views/components/event_section.dart';
import 'package:taekwondo/features/home/views/components/promotion_slider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.user, required this.events});

  final User user;
  final List<EventBazaar> events;

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
    Widget headerContent = Column(
      children: [
        AppMargin(color: AppColors.primary, child: Container()),
        SizedBox(height: 23),
        PromotionSlider(),
        SizedBox(height: 20),
        AppMargin(color: Colors.transparent, child: Container()),
      ],
    );

    Widget headerBackground = Container(
      height: 287,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
        color: AppColors.primary,
      ),
    );

    Widget header = Stack(children: [headerBackground, headerContent]);

    final mainContent = Container(
      color: AppColors.background,
      child: Column(
        children: [
          header,
          SizedBox(height: 20),
          Container(),
          SizedBox(height: 28),
          Container(),
          SizedBox(height: 28),
          AppMargin(
            child: EventSection(events: widget.events, onPressed: () {}),
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
