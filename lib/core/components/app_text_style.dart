import 'package:flutter/material.dart';
import 'package:taekwondo/core/themes/app_fonts.dart';

enum EnAppTextStyleSize {
  bigTitle,
  title,
  h1,
  h2,
  h3,
  h4,
  paragraph,
  caption,
  micro,
}

class AppTextStyleSize {
  final EnAppTextStyleSize size;

  const AppTextStyleSize({required this.size});

  double get fontSize {
    return switch (size) {
      EnAppTextStyleSize.bigTitle => 53.0,
      EnAppTextStyleSize.title => 43.0,
      EnAppTextStyleSize.h1 => 34.0,
      EnAppTextStyleSize.h2 => 27.0,
      EnAppTextStyleSize.h3 => 22.0,
      EnAppTextStyleSize.h4 => 18.0,
      EnAppTextStyleSize.paragraph => 14.0,
      EnAppTextStyleSize.caption => 12.0,
      EnAppTextStyleSize.micro => 10.0,
    };
  }
}

enum EnAppTextStyleFont { plusJakartaSans, sourGummy }

class AppTextStyleFont {
  final EnAppTextStyleFont font;

  const AppTextStyleFont({required this.font});

  String get fontFamily {
    return (font == EnAppTextStyleFont.plusJakartaSans)
        ? AppFonts.plusJakartaSans
        : AppFonts.sourGummy;
  }
}

enum EnAppTextStyleWeight { regular, semiBold }

class AppTextStyleWeight {
  final EnAppTextStyleWeight weight;

  const AppTextStyleWeight({required this.weight});

  FontWeight get fontWeight {
    return (weight == EnAppTextStyleWeight.regular)
        ? FontWeight.normal
        : FontWeight.w600;
  }
}

/* Naming convention
1. AppTextStyleSize
2. AppTextStyleFont (default: plusJakartaSans)
3. AppTextStyleWeight (default: regular)
*/

// Big Title

class AppTextStyleBigTitle extends AppTextStyle {
  const AppTextStyleBigTitle({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(
      size: EnAppTextStyleSize.bigTitle,
    ),
    super.color = Colors.black,
  });
}

class AppTextStyleBigTitleSourGummy extends AppTextStyle {
  const AppTextStyleBigTitleSourGummy({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.sourGummy,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(
      size: EnAppTextStyleSize.bigTitle,
    ),
    super.color = Colors.black,
  });
}

class AppTextStyleBigTitleSemiBold extends AppTextStyle {
  const AppTextStyleBigTitleSemiBold({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.semiBold,
    ),
    super.appTextSize = const AppTextStyleSize(
      size: EnAppTextStyleSize.bigTitle,
    ),
    super.color = Colors.black,
  });
}

class AppTextStyleBigTitleSourGummySemiBold extends AppTextStyle {
  const AppTextStyleBigTitleSourGummySemiBold({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.sourGummy,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.semiBold,
    ),
    super.appTextSize = const AppTextStyleSize(
      size: EnAppTextStyleSize.bigTitle,
    ),
    super.color = Colors.black,
  });
}

// Title

class AppTextStyleTitle extends AppTextStyle {
  const AppTextStyleTitle({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.title),
    super.color = Colors.black,
  });
}

class AppTextStyleTitleSourGummy extends AppTextStyle {
  const AppTextStyleTitleSourGummy({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.sourGummy,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.title),
    super.color = Colors.black,
  });
}

class AppTextStyleTitleSemiBold extends AppTextStyle {
  const AppTextStyleTitleSemiBold({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.semiBold,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.title),
    super.color = Colors.black,
  });
}

class AppTextStyleTitleSourGummySemiBold extends AppTextStyle {
  const AppTextStyleTitleSourGummySemiBold({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.sourGummy,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.semiBold,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.title),
    super.color = Colors.black,
  });
}

// H1

class AppTextStyleH1 extends AppTextStyle {
  const AppTextStyleH1({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.h1),
    super.color = Colors.black,
  });
}

class AppTextStyleH1SourGummy extends AppTextStyle {
  const AppTextStyleH1SourGummy({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.sourGummy,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.h1),
    super.color = Colors.black,
  });
}

class AppTextStyleH1SemiBold extends AppTextStyle {
  const AppTextStyleH1SemiBold({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.semiBold,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.h1),
    super.color = Colors.black,
  });
}

class AppTextStyleH1SourGummySemiBold extends AppTextStyle {
  const AppTextStyleH1SourGummySemiBold({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.sourGummy,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.semiBold,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.h1),
    super.color = Colors.black,
  });
}

// H2

class AppTextStyleH2 extends AppTextStyle {
  const AppTextStyleH2({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.h2),
    super.color = Colors.black,
  });
}

class AppTextStyleH2SourGummy extends AppTextStyle {
  const AppTextStyleH2SourGummy({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.sourGummy,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.h2),
    super.color = Colors.black,
  });
}

class AppTextStyleH2SemiBold extends AppTextStyle {
  const AppTextStyleH2SemiBold({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.semiBold,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.h2),
    super.color = Colors.black,
  });
}

class AppTextStyleH2SourGummySemiBold extends AppTextStyle {
  const AppTextStyleH2SourGummySemiBold({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.sourGummy,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.semiBold,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.h2),
    super.color = Colors.black,
  });
}

// H3

class AppTextStyleH3 extends AppTextStyle {
  const AppTextStyleH3({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.h3),
    super.color = Colors.black,
  });
}

class AppTextStyleH3SourGummy extends AppTextStyle {
  const AppTextStyleH3SourGummy({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.sourGummy,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.h3),
    super.color = Colors.black,
  });
}

class AppTextStyleH3SemiBold extends AppTextStyle {
  const AppTextStyleH3SemiBold({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.semiBold,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.h3),
    super.color = Colors.black,
  });
}

class AppTextStyleH3SourGummySemiBold extends AppTextStyle {
  const AppTextStyleH3SourGummySemiBold({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.sourGummy,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.semiBold,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.h3),
    super.color = Colors.black,
  });
}

// H4

class AppTextStyleH4 extends AppTextStyle {
  const AppTextStyleH4({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.h4),
    super.color = Colors.black,
  });
}

class AppTextStyleH4SourGummy extends AppTextStyle {
  const AppTextStyleH4SourGummy({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.sourGummy,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.h4),
    super.color = Colors.black,
  });
}

class AppTextStyleH4SemiBold extends AppTextStyle {
  const AppTextStyleH4SemiBold({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.semiBold,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.h4),
    super.color = Colors.black,
  });
}

class AppTextStyleH4SourGummySemiBold extends AppTextStyle {
  const AppTextStyleH4SourGummySemiBold({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.sourGummy,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.semiBold,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.h4),
    super.color = Colors.black,
  });
}

// Paragraph

class AppTextStyleParagraph extends AppTextStyle {
  const AppTextStyleParagraph({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(
      size: EnAppTextStyleSize.paragraph,
    ),
    super.color = Colors.black,
  });
}

class AppTextStyleSourGummyParagraph extends AppTextStyle {
  const AppTextStyleSourGummyParagraph({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.sourGummy,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(
      size: EnAppTextStyleSize.paragraph,
    ),
    super.color = Colors.black,
  });
}

class AppTextStyleParagraphSemiBold extends AppTextStyle {
  const AppTextStyleParagraphSemiBold({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.semiBold,
    ),
    super.appTextSize = const AppTextStyleSize(
      size: EnAppTextStyleSize.paragraph,
    ),
    super.color = Colors.black,
  });
}

class AppTextStyleParagraphSourGummySemiBold extends AppTextStyle {
  const AppTextStyleParagraphSourGummySemiBold({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.sourGummy,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.semiBold,
    ),
    super.appTextSize = const AppTextStyleSize(
      size: EnAppTextStyleSize.paragraph,
    ),
    super.color = Colors.black,
  });
}

// Caption

class AppTextStyleCaption extends AppTextStyle {
  const AppTextStyleCaption({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(
      size: EnAppTextStyleSize.caption,
    ),
    super.color = Colors.black,
  });
}

class AppTextStyleSourGummyCaption extends AppTextStyle {
  const AppTextStyleSourGummyCaption({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.sourGummy,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(
      size: EnAppTextStyleSize.caption,
    ),
    super.color = Colors.black,
  });
}

class AppTextStyleCaptionSemiBold extends AppTextStyle {
  const AppTextStyleCaptionSemiBold({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(
      size: EnAppTextStyleSize.caption,
    ),
    super.color = Colors.black,
  });
}

class AppTextStyleCaptionSourGummySemiBold extends AppTextStyle {
  const AppTextStyleCaptionSourGummySemiBold({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.sourGummy,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(
      size: EnAppTextStyleSize.caption,
    ),
    super.color = Colors.black,
  });
}

// Micro

class AppTextStyleMicro extends AppTextStyle {
  const AppTextStyleMicro({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.micro),
    super.color = Colors.black,
  });
}

class AppTextStyleMicroLineThrough extends AppTextStyle {
  const AppTextStyleMicroLineThrough({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.micro),
    super.color = Colors.black,
    super.decoration = TextDecoration.lineThrough,
  });
}

class AppTextStyleMicroSourGummy extends AppTextStyle {
  const AppTextStyleMicroSourGummy({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.sourGummy,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.regular,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.micro),
    super.color = Colors.black,
  });
}

class AppTextStyleMicroSemiBold extends AppTextStyle {
  const AppTextStyleMicroSemiBold({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.plusJakartaSans,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.semiBold,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.micro),
    super.color = Colors.black,
  });
}

class AppTextStyleMicroSourGummySemiBold extends AppTextStyle {
  const AppTextStyleMicroSourGummySemiBold({
    super.appTextFont = const AppTextStyleFont(
      font: EnAppTextStyleFont.sourGummy,
    ),
    super.appTextWeight = const AppTextStyleWeight(
      weight: EnAppTextStyleWeight.semiBold,
    ),
    super.appTextSize = const AppTextStyleSize(size: EnAppTextStyleSize.micro),
    super.color = Colors.black,
  });
}

// Base Class

class AppTextStyle {
  final AppTextStyleSize appTextSize;
  final AppTextStyleFont appTextFont;
  final AppTextStyleWeight appTextWeight;
  final TextDecoration? decoration;
  final Color color;

  const AppTextStyle({
    required this.appTextFont,
    required this.appTextSize,
    required this.appTextWeight,
    this.decoration,
    required this.color,
  });

  TextStyle get textStyle {
    return TextStyle(
      height: 1.2,
      fontFamily: appTextFont.fontFamily,
      fontWeight: appTextWeight.fontWeight,
      fontSize: appTextSize.fontSize,
      decoration: decoration,
      color: color,
    );
  }
}
