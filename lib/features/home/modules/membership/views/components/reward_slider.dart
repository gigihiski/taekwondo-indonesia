import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/features/home/modules/membership/models/reward.dart';

class RewardSlider extends StatelessWidget {
  const RewardSlider({super.key, required this.reward, this.height = 12});

  final Reward reward;
  final double height;

  @override
  Widget build(BuildContext context) {
    final progressBarWidth = MediaQuery.of(context).size.width - 80;
    final perProgress = progressBarWidth / 100;

    Widget progressBackground = Container(
      height: height,
      width: progressBarWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(44),
        color: AppColors.platinum,
      ),
    );

    Widget progress = Container(
      height: height,
      width: perProgress * reward.generatedPoint,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(44),
        color: reward.color,
      ),
    );

    Widget progressBar = Stack(children: [progressBackground, progress]);

    final points = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTextCaption(text: "${reward.min.toStringAsFixed(0)} pts"),
        AppTextCaption(text: "${reward.max.toStringAsFixed(0)} pts"),
      ],
    );

    return Container(
      height: 72,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [progressBar, SizedBox(height: 6), points],
      ),
    );
  }
}
