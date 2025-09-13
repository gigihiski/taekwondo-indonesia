import 'package:flutter/material.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/features/home/views/components/navigation_item.dart';

class DashboardBottomNavigationBar extends StatelessWidget {
  const DashboardBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    List<Widget> menus = [
      NavigationItem(
        callback: () {
          onTap(0);
        },
        active: currentIndex == 0,
        svgSource: AppAssets.email,
      ),
      NavigationItem(
        callback: () {
          onTap(1);
        },
        active: currentIndex == 1,
        svgSource: AppAssets.email,
      ),
      NavigationItem(
        callback: () {
          onTap(2);
        },
        active: currentIndex == 2,
        svgSource: AppAssets.email,
      ),
      NavigationItem(
        callback: () {
          onTap(3);
        },
        active: currentIndex == 3,
        svgSource: AppAssets.email,
      ),
      NavigationItem(
        callback: () {
          onTap(4);
        },
        active: currentIndex == 4,
        svgSource: AppAssets.email,
      ),
    ];

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: menus,
        ),
      ),
    );
  }
}
