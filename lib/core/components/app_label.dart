import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

class AppLabel extends AppBaseLabel {
  AppLabel({super.key, required this.title, required super.onPressed})
    : super(
        appLabelStyle: AppBaseLabelStyle(height: 32),
        appLabelInformation: AppBaseLabelInformation(title: title),
        appLabelActiveStyle: AppBaseLabelStyle(
          height: 32,
          backgroundColor: AppColors.secondary,
        ),
      );

  final String title;
}

class AppLabelButton extends AppBaseLabel {
  AppLabelButton({super.key, required this.title, required super.onPressed})
    : super(
        appLabelStyle: AppBaseLabelStyle(
          height: 32,
          borderColor: Colors.black,
          shadows: [
            BoxShadow(
              color: AppColors.darkCharcoal,
              spreadRadius: 1,
              offset: Offset(2, 2),
            ),
          ],
        ),
        appLabelInformation: AppBaseLabelInformation(title: title),
        appLabelActiveStyle: AppBaseLabelStyle(
          height: 32,
          backgroundColor: AppColors.secondary,
          borderColor: Colors.black,
          shadows: [
            BoxShadow(
              color: AppColors.darkCharcoal,
              spreadRadius: 1,
              offset: Offset(2, 2),
            ),
          ],
        ),
      );

  final String title;
}

class AppLabelIcon extends AppBaseLabel {
  AppLabelIcon({
    super.key,
    required this.title,
    required this.icon,
    required super.onPressed,
  }) : super(
         appLabelStyle: AppBaseLabelStyle(height: 32),
         appLabelIcon: AppBaseLabelIcon(icon: icon),
         appLabelInformation: AppBaseLabelInformation(title: title),
         appLabelActiveStyle: AppBaseLabelStyle(
           height: 32,
           backgroundColor: AppColors.secondary,
         ),
       );

  final String title;
  final String icon;
}

class AppBaseLabelIcon {
  const AppBaseLabelIcon({required this.icon, this.size = 24});

  final String icon;
  final double size;

  Widget get build {
    return SizedBox(height: size, width: size, child: Image.asset(icon));
  }
}

class AppBaseLabelInformation {
  const AppBaseLabelInformation({
    required this.title,
    this.color = Colors.black,
  });

  final String title;
  final Color color;

  Widget get build {
    return AppTextParagraphSemiBold(text: title, color: color);
  }
}

class AppBaseLabelStyle {
  const AppBaseLabelStyle({
    required this.height,
    this.width,
    this.radius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    this.borderColor = AppColors.platinum,
    this.backgroundColor = Colors.white,
    this.shadows = const [],
  });

  final double height;
  final double? width;
  final double radius;
  final EdgeInsets padding;
  final Color borderColor;
  final Color backgroundColor;
  final List<BoxShadow> shadows;

  Decoration get decoration {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: borderColor, width: 1),
      boxShadow: shadows,
      color: backgroundColor,
    );
  }
}

class AppBaseLabel extends StatefulWidget {
  const AppBaseLabel({
    super.key,
    required this.appLabelInformation,
    required this.appLabelStyle,
    required this.appLabelActiveStyle,
    required this.onPressed,
    this.appLabelIcon,
  });

  final AppBaseLabelIcon? appLabelIcon;
  final AppBaseLabelInformation appLabelInformation;
  final AppBaseLabelStyle appLabelStyle;
  final AppBaseLabelStyle? appLabelActiveStyle;
  final Function(bool) onPressed;

  @override
  State<AppBaseLabel> createState() => AppBaseLabelState();
}

class AppBaseLabelState extends State<AppBaseLabel> {
  late bool isActive;

  @override
  void initState() {
    isActive = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isActive = !isActive;
          widget.onPressed(isActive);
        });
      },
      child: Container(
        width: widget.appLabelStyle.width,
        height: widget.appLabelStyle.height,
        decoration: isActive
            ? widget.appLabelActiveStyle?.decoration ??
                  widget.appLabelStyle.decoration
            : widget.appLabelStyle.decoration,
        padding: widget.appLabelStyle.padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.appLabelIcon != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [widget.appLabelIcon!.build, SizedBox(width: 12)],
              ),
            widget.appLabelInformation.build,
          ],
        ),
      ),
    );
  }
}
