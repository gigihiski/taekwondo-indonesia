import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

class AppBarHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHeader({
    super.key,
    this.title = '',
    this.color = AppColors.primary,
    this.height = 60,
    this.textColor = Colors.black,
    this.actions = const [],
  });

  final String title;
  final Color color;
  final double height;
  final Color textColor;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(color: textColor),
      backgroundColor: color,
      elevation: 0,
      titleSpacing: 0,
      centerTitle: true,
      title: AppTextH4SourGummySemiBold(
        text: title,
        textAlign: TextAlign.center,
        color: textColor,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
