import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

enum EnAppButtonSize { small, medium, large }

class AppButtonSize {
  final EnAppButtonSize size;
  final double width;

  const AppButtonSize({required this.size, this.width = double.infinity});

  double get height {
    return switch (size) {
      EnAppButtonSize.small => 22.0,
      EnAppButtonSize.medium => 33.0,
      EnAppButtonSize.large => 41.0,
    };
  }
}

enum EnAppButtonColor { primary, secondary, tertiary, disabled, white }

class AppButtonColor {
  final EnAppButtonColor color;

  const AppButtonColor({required this.color});

  Color get backgroundColor {
    return switch (color) {
      EnAppButtonColor.primary => AppColors.primary,
      EnAppButtonColor.secondary => AppColors.secondary,
      EnAppButtonColor.tertiary => AppColors.tertiary,
      EnAppButtonColor.disabled => Colors.grey.shade400,
      EnAppButtonColor.white => Colors.white,
    };
  }
}

/* Naming convention
1. AppButtonSize
2. AppButtonColor (default: primary)
*/

// Large

class AppButtonLarge extends AppButton {
  const AppButtonLarge({
    super.key,
    required super.onPressed,
    super.title = "",
    super.appButtonColor = const AppButtonColor(
      color: EnAppButtonColor.primary,
    ),
    super.appButtonSize = const AppButtonSize(size: EnAppButtonSize.large),
    super.textColor = Colors.black,
  });
}

class AppButtonLargeSecondary extends AppButton {
  const AppButtonLargeSecondary({
    super.key,
    required super.onPressed,
    super.title = "",
    super.appButtonColor = const AppButtonColor(
      color: EnAppButtonColor.secondary,
    ),
    super.appButtonSize = const AppButtonSize(size: EnAppButtonSize.large),
    super.textColor = Colors.black,
  });
}

class AppButtonLargeTertiary extends AppButton {
  const AppButtonLargeTertiary({
    super.key,
    required super.onPressed,
    super.title = "",
    super.appButtonColor = const AppButtonColor(
      color: EnAppButtonColor.tertiary,
    ),
    super.appButtonSize = const AppButtonSize(size: EnAppButtonSize.large),
    super.textColor = Colors.black,
  });
}

class AppButtonLargeDisabled extends AppButton {
  const AppButtonLargeDisabled({
    super.key,
    required super.onPressed,
    super.title = "",
    super.appButtonColor = const AppButtonColor(
      color: EnAppButtonColor.disabled,
    ),
    super.appButtonSize = const AppButtonSize(size: EnAppButtonSize.large),
    super.textColor = Colors.black,
  });
}

// Medium

class AppButtonMedium extends AppButton {
  const AppButtonMedium({
    super.key,
    required super.onPressed,
    super.title = "",
    super.appButtonColor = const AppButtonColor(
      color: EnAppButtonColor.primary,
    ),
    super.appButtonSize = const AppButtonSize(size: EnAppButtonSize.medium),
    super.textColor = Colors.black,
  });
}

class AppButtonMediumSecondary extends AppButton {
  const AppButtonMediumSecondary({
    super.key,
    required super.onPressed,
    super.title = "",
    super.appButtonColor = const AppButtonColor(
      color: EnAppButtonColor.secondary,
    ),
    super.appButtonSize = const AppButtonSize(size: EnAppButtonSize.medium),
    super.textColor = Colors.black,
  });
}

class AppButtonMediumTertiary extends AppButton {
  const AppButtonMediumTertiary({
    super.key,
    required super.onPressed,
    super.title = "",
    super.appButtonColor = const AppButtonColor(
      color: EnAppButtonColor.tertiary,
    ),
    super.appButtonSize = const AppButtonSize(size: EnAppButtonSize.medium),
    super.textColor = Colors.black,
  });
}

// Small

class AppButtonSmall extends AppButton {
  const AppButtonSmall({
    super.key,
    required super.onPressed,
    super.title = "",
    super.appButtonColor = const AppButtonColor(
      color: EnAppButtonColor.primary,
    ),
    super.appButtonSize = const AppButtonSize(size: EnAppButtonSize.small),
    super.textColor = Colors.black,
  });
}

class AppButtonSmallSecondary extends AppButton {
  const AppButtonSmallSecondary({
    super.key,
    required super.onPressed,
    super.title = "Test",
    super.appButtonColor = const AppButtonColor(
      color: EnAppButtonColor.secondary,
    ),
    super.appButtonSize = const AppButtonSize(size: EnAppButtonSize.small),
    super.textColor = Colors.black,
  });
}

class AppButtonSmallTertiary extends AppButton {
  const AppButtonSmallTertiary({
    super.key,
    required super.onPressed,
    super.title = "",
    super.appButtonColor = const AppButtonColor(
      color: EnAppButtonColor.tertiary,
    ),
    super.appButtonSize = const AppButtonSize(size: EnAppButtonSize.small),
    super.textColor = Colors.black,
  });
}

// Base Class

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.appButtonSize,
    required this.appButtonColor,
    this.textColor = Colors.black,
  });

  final String title;
  final Function() onPressed;
  final AppButtonSize appButtonSize;
  final AppButtonColor appButtonColor;
  final Color textColor;

  AppText get appText {
    switch (appButtonSize.size) {
      case EnAppButtonSize.small:
        return AppTextCaptionSemiBold(text: title, color: textColor);
      default:
        return AppTextParagraphSemiBold(text: title, color: textColor);
    }
  }

  double get radius {
    switch (appButtonSize.size) {
      case EnAppButtonSize.small:
        return 6;
      case EnAppButtonSize.medium:
        return 10;
      default:
        return 12;
    }
  }

  EdgeInsets get padding {
    switch (appButtonSize.size) {
      case EnAppButtonSize.small:
        return EdgeInsets.zero;
      case EnAppButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: 10, vertical: 4);
      default:
        return EdgeInsets.symmetric(horizontal: 20, vertical: 8);
    }
  }

  Offset get shadownOffset {
    switch (appButtonSize.size) {
      case EnAppButtonSize.small:
        return Offset(0.5, 0.5);
      case EnAppButtonSize.medium:
        return Offset(1, 1);
      default:
        return Offset(2, 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      padding: padding,
      elevation: 0,
      backgroundColor: appButtonColor.backgroundColor,
      foregroundColor: appButtonColor.backgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(radius),
      ),
    );

    return Container(
      width: appButtonSize.width,
      height: appButtonSize.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkCharcoal,
            spreadRadius: 1,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: appText,
      ),
    );
  }
}

class AppSocialButton extends StatelessWidget {
  const AppSocialButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.backgroundColor,
    this.height = 50,
    this.width = 50,
    this.iconHeight = 20,
    this.iconWidth = 20,
  });

  final String icon;
  final Function() onPressed;
  final Color backgroundColor;
  final double height;
  final double width;
  final double iconHeight;
  final double iconWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor,
          foregroundColor: AppColors.primary,
        ),
        child: Image(
          image: AssetImage(icon),
          width: iconWidth,
          height: iconHeight,
        ),
      ),
    );
  }
}
