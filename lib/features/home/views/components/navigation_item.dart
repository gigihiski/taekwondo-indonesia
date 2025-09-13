import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    super.key,
    required this.callback,
    required this.active,
    required this.svgSource,
  });

  final VoidCallback callback;
  final bool active;
  final String svgSource;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: 48,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(24),
          color: active ? AppColors.secondary : Colors.transparent,
        ),
        child: SvgPicture.asset(
          svgSource,
          height: 24,
          width: 24,
          colorFilter: ColorFilter.mode(
            active ? AppColors.primary : Colors.grey,
            BlendMode.srcIn,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
