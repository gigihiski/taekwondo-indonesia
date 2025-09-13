import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/models/user.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

final double containerHeight = 75;

class ShareReferral extends StatelessWidget {
  const ShareReferral({
    super.key,
    required this.user,
    required this.onSharePresseed,
  });

  final User user;
  final Function() onSharePresseed;

  @override
  Widget build(BuildContext context) {
    final shareIcon = SizedBox(
      height: 24,
      width: 24,
      child: SvgPicture.asset(
        AppAssets.share,
        fit: BoxFit.contain,
        colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
      ),
    );

    final referralCode = Container(
      height: 51,
      width: 161,
      padding: EdgeInsets.all(14),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppTextH3SourGummySemiBold(text: user.email, color: Colors.black),
          shareIcon,
        ],
      ),
    );

    final icon = SizedBox(
      height: 32,
      width: 32,
      child: SvgPicture.asset(
        AppAssets.email,
        fit: BoxFit.contain,
        colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
      ),
    );

    final information = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(width: 19),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppTextParagraphSemiBold(
                text: 'Undang teman\ndan dapatkan',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 2),
            AppTextCaption(text: 'Voucher 50%', color: AppColors.primary),
          ],
        ),
      ],
    );

    return Container(
      height: containerHeight,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [information, referralCode],
      ),
    );
  }
}
