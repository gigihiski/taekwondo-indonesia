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
    final activeBoxShadow = (active)
        ? [
            BoxShadow(
              color: AppColors.darkCharcoal,
              spreadRadius: 1,
              offset: Offset(2, 2),
            ),
          ]
        : null;

    return InkWell(
      onTap: callback,
      child: Container(
        width: 48,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: (active) ? AppColors.darkCharcoal : Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(24),
          color: active ? AppColors.secondary : Colors.transparent,
          boxShadow: activeBoxShadow,
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
