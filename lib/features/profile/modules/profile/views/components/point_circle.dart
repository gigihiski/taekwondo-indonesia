import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class PointCircle extends StatelessWidget {
  const PointCircle({super.key, required this.point});

  final int point;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 52,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.crayola, width: 4),
        color: AppColors.secondary,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTextH4SourGummySemiBold(text: point.toStringAsFixed(0)),
            AppTextMicro(text: L10n.localizations(context).point),
          ],
        ),
      ),
    );
  }
}
