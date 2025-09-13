import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text_style.dart';

/* Naming convention
1. AppTextSize
2. AppTextFont (default: plusJakartaSans)
3. AppTextWeight (default: regular)
*/

// Big Title

class AppTextBigTitle extends AppText {
  final Color color;

  AppTextBigTitle({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleBigTitle(color: color));
}

class AppTextBigTitleSourGummy extends AppText {
  final Color color;

  AppTextBigTitleSourGummy({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleBigTitleSourGummy(color: color));
}

class AppTextBigTitleSemiBold extends AppText {
  final Color color;

  AppTextBigTitleSemiBold({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleBigTitleSemiBold(color: color));
}

class AppTextBigTitleSourGummySemiBold extends AppText {
  final Color color;

  AppTextBigTitleSourGummySemiBold({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleBigTitleSourGummySemiBold(color: color));
}

// Title

class AppTextTitle extends AppText {
  final Color color;

  AppTextTitle({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleTitle(color: color));
}

class AppTextTitleSourGummy extends AppText {
  final Color color;

  AppTextTitleSourGummy({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleTitleSourGummy(color: color));
}

class AppTextTitleSemiBold extends AppText {
  final Color color;

  AppTextTitleSemiBold({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleTitleSemiBold(color: color));
}

class AppTextTitleSourGummySemiBold extends AppText {
  final Color color;

  AppTextTitleSourGummySemiBold({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleTitleSourGummySemiBold(color: color));
}

// H1

class AppTextH1 extends AppText {
  final Color color;

  AppTextH1({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleH1(color: color));
}

class AppTextH1SourGummy extends AppText {
  final Color color;

  AppTextH1SourGummy({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleH1SourGummy(color: color));
}

class AppTextH1SemiBold extends AppText {
  final Color color;

  AppTextH1SemiBold({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleH1SemiBold(color: color));
}

class AppTextH1SourGummySemiBold extends AppText {
  final Color color;

  AppTextH1SourGummySemiBold({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleH1SourGummySemiBold(color: color));
}

// H2

class AppTextH2 extends AppText {
  final Color color;

  AppTextH2({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleH2(color: color));
}

class AppTextH2SourGummy extends AppText {
  final Color color;

  AppTextH2SourGummy({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleH2SourGummy(color: color));
}

class AppTextH2SemiBold extends AppText {
  final Color color;

  AppTextH2SemiBold({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleH2SemiBold(color: color));
}

class AppTextH2SourGummySemiBold extends AppText {
  final Color color;

  AppTextH2SourGummySemiBold({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleH2SourGummySemiBold(color: color));
}

// H3

class AppTextH3 extends AppText {
  final Color color;

  AppTextH3({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleH3(color: color));
}

class AppTextH3SourGummy extends AppText {
  final Color color;

  AppTextH3SourGummy({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleH3SourGummy(color: color));
}

class AppTextH3SemiBold extends AppText {
  final Color color;

  AppTextH3SemiBold({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleH3SemiBold(color: color));
}

class AppTextH3SourGummySemiBold extends AppText {
  final Color color;

  AppTextH3SourGummySemiBold({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleH3SourGummySemiBold(color: color));
}

// H4

class AppTextH4 extends AppText {
  final Color color;

  AppTextH4({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleH4(color: color));
}

class AppTextH4SourGummy extends AppText {
  final Color color;

  AppTextH4SourGummy({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleH4SourGummy(color: color));
}

class AppTextH4SemiBold extends AppText {
  final Color color;

  AppTextH4SemiBold({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleH4SemiBold(color: color));
}

class AppTextH4SourGummySemiBold extends AppText {
  final Color color;

  AppTextH4SourGummySemiBold({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleH4SourGummySemiBold(color: color));
}

// Paragraph

class AppTextParagraph extends AppText {
  final Color color;

  AppTextParagraph({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleParagraph(color: color));
}

class AppTextSourGummyParagraph extends AppText {
  final Color color;

  AppTextSourGummyParagraph({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleSourGummyParagraph(color: color));
}

class AppTextParagraphSemiBold extends AppText {
  final Color color;

  AppTextParagraphSemiBold({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleParagraphSemiBold(color: color));
}

class AppTextParagraphSourGummySemiBold extends AppText {
  final Color color;

  AppTextParagraphSourGummySemiBold({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(
         appTextStyle: AppTextStyleParagraphSourGummySemiBold(color: color),
       );
}

// Caption

class AppTextCaption extends AppText {
  final Color color;

  AppTextCaption({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleCaption(color: color));
}

class AppTextSourGummyCaption extends AppText {
  final Color color;

  AppTextSourGummyCaption({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleSourGummyCaption(color: color));
}

class AppTextCaptionSemiBold extends AppText {
  final Color color;

  AppTextCaptionSemiBold({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleCaptionSemiBold(color: color));
}

class AppTextCaptionSourGummySemiBold extends AppText {
  final Color color;

  AppTextCaptionSourGummySemiBold({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleCaptionSourGummySemiBold(color: color));
}

// Micro

class AppTextMicro extends AppText {
  final Color color;

  AppTextMicro({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleMicro(color: color));
}

class AppTextMicroLineTrough extends AppText {
  final Color color;

  AppTextMicroLineTrough({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleMicroLineThrough(color: color));
}

class AppTextMicroSourGummy extends AppText {
  final Color color;

  AppTextMicroSourGummy({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleMicroSourGummy(color: color));
}

class AppTextMicroSemiBold extends AppText {
  final Color color;

  AppTextMicroSemiBold({
    super.key,
    super.text = "",
    this.color = Colors.black,
    super.textAlign = TextAlign.left,
  }) : super(appTextStyle: AppTextStyleMicroSemiBold(color: color));
}

class AppTextMicroSourGummySemiBold extends AppText {
  final Color color;

  AppTextMicroSourGummySemiBold({
    super.key,
    super.text = "",
    this.color = Colors.black,
  }) : super(
         textAlign: TextAlign.left,
         appTextStyle: AppTextStyleMicroSourGummySemiBold(color: color),
       );
}

// Base Class

class AppText extends StatelessWidget {
  final String? text;
  final TextAlign textAlign;
  final AppTextStyle appTextStyle;

  const AppText({
    super.key,
    this.text,
    required this.textAlign,
    required this.appTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      style: appTextStyle.textStyle,
    );
  }
}
