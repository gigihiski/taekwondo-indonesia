import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

class AppHeaderIcon {
  AppHeaderIcon({
    required this.icon,
    this.size = 24,
    this.color = Colors.white,
    this.backgroundColor = AppColors.primary,
  });

  final String icon;
  final double size;
  final Color color;
  final Color backgroundColor;

  Widget get build {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: backgroundColor,
      ),
      child: SizedBox(
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
      ),
    );
  }
}

class AppHeaderBadge {
  AppHeaderBadge({
    required this.text,
    this.textColor = Colors.white,
    this.backgroundColor = AppColors.deepCarminePink,
  });

  final String text;
  final Color textColor;
  final Color backgroundColor;

  Widget get build {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: backgroundColor,
      ),
      child: AppTextCaption(text: text, color: textColor),
    );
  }
}

class AppHeaderLink {
  AppHeaderLink({
    required this.text,
    this.color = AppColors.primary,
    required this.onPressed,
  });

  final String text;
  final Color color;
  final Function() onPressed;

  Widget get build {
    return InkWell(
      onTap: onPressed,
      child: AppTextParagraphSemiBold(text: text, color: color),
    );
  }
}

class AppHeaderTitleBadge extends AppHeader {
  AppHeaderTitleBadge({
    super.key,
    required this.text,
    required this.appHeaderBadge,
  }) : super(
         content: Row(
           children: [
             AppTextH4SourGummySemiBold(text: text),
             SizedBox(width: 12),
             appHeaderBadge.build,
           ],
         ),
       );

  final String text;
  final AppHeaderBadge appHeaderBadge;
}

class AppHeaderTitleIconLink extends AppHeader {
  AppHeaderTitleIconLink({
    super.key,
    required this.text,
    required this.appHeaderIcon,
    required this.appHeaderLink,
  }) : super(
         content: AppTextH4SourGummySemiBold(text: text),
         leading: appHeaderIcon.build,
         action: appHeaderLink.build,
       );

  final String text;
  final AppHeaderIcon appHeaderIcon;
  final AppHeaderLink appHeaderLink;
}

class AppHeaderTitleIcon extends AppHeader {
  AppHeaderTitleIcon({
    super.key,
    required this.text,
    required this.appHeaderIcon,
  }) : super(
         content: AppTextH4SourGummySemiBold(text: text),
         leading: appHeaderIcon.build,
       );

  final String text;
  final AppHeaderIcon appHeaderIcon;
}

class AppHeaderTitleLink extends AppHeader {
  AppHeaderTitleLink({
    super.key,
    required this.text,
    required this.appHeaderLink,
  }) : super(
         content: AppTextH4SourGummySemiBold(text: text),
         action: appHeaderLink.build,
       );

  final String text;
  final AppHeaderLink appHeaderLink;
}

class AppHeaderTitle extends AppHeader {
  AppHeaderTitle({super.key, required this.text, this.color = Colors.black})
    : super(
        content: AppTextH4SourGummySemiBold(text: text, color: color),
      );

  final String text;
  final Color color;
}

class AppHeaderTitleDescription extends AppHeader {
  AppHeaderTitleDescription({
    super.key,
    required this.text,
    required this.description,
  }) : super(
         content: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             AppTextH4SourGummySemiBold(text: text),
             AppTextCaption(text: description, color: AppColors.graniteGray),
           ],
         ),
       );

  final String text;
  final String description;
}

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    required this.content,
    this.leading,
    this.action,
  });

  final Widget content;
  final Widget? leading;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final information = Row(
      children: [
        leading ?? Container(),
        if (leading != null) SizedBox(width: 10),
        content,
      ],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [information, action ?? Container()],
    );
  }
}
