import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/components/app_text_style.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/core/themes/app_fonts.dart';

final containerDecoration = BoxDecoration(
  color: AppColors.background,
  borderRadius: BorderRadius.circular(12),
);

final contentPadding = EdgeInsets.only(
  top: 15,
  bottom: 15,
  left: 17,
  right: 17,
);

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.hint,
    this.prefix,
    this.suffix,
    this.controller,
    this.isSecure = false,
    this.isDisabled = false,
    this.validator,
    this.suffixOnPressed,
    this.onChanged,
    this.maxLength,
    this.contentHeight = 48,
  });

  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final TextEditingController? controller;
  final bool isSecure;
  final bool isDisabled;
  final String? Function(String?)? validator;
  final int? maxLength;
  final double contentHeight;
  final Function()? suffixOnPressed;
  final Function(String)? onChanged;

  @override
  State<AppTextField> createState() => AppTextFieldState();
}

class AppTextFieldState extends State<AppTextField> {
  late String? validationError;

  @override
  void initState() {
    validationError = null;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textFieldDecoration = InputDecoration(
      counterText: "",
      isDense: true,
      isCollapsed: true,
      hint: widget.hint != null
          ? AppTextParagraph(text: widget.hint, color: AppColors.graniteGray)
          : null,
      contentPadding: contentPadding,
      prefixIcon: widget.prefix,
      suffixIcon: widget.suffix != null
          ? InkWell(onTap: widget.suffixOnPressed, child: widget.suffix)
          : null,
      border: InputBorder.none,
      labelStyle: AppTextStyleParagraph().textStyle,
      floatingLabelStyle: AppTextStyleParagraph().textStyle,
      errorStyle: TextStyle(height: 0.01, color: Colors.transparent),
    );

    final container = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.contentHeight,
          decoration: containerDecoration,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.left,
            maxLength: widget.maxLength,
            readOnly: widget.isDisabled,
            controller: widget.controller,
            decoration: textFieldDecoration,
            style: AppTextStyleParagraph().textStyle,
            obscureText: widget.isSecure,
            cursorColor: Colors.black,
            validator: (value) {
              final error = widget.validator?.call(value);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  validationError = error;
                });
              });
              return error;
            },
            onChanged: widget.onChanged,
          ),
        ),
        SizedBox(height: 2),
        if (validationError != null)
          AppTextMicro(text: validationError, color: Colors.red),
      ],
    );

    return container;
  }
}

class AppTextArea extends StatefulWidget {
  const AppTextArea({super.key, this.controller, this.validator});

  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  AppTextAreaState createState() => AppTextAreaState();
}

class AppTextAreaState extends State<AppTextArea> {
  late String? validationError;

  @override
  void initState() {
    validationError = null;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textFieldDecoration = InputDecoration(
      isDense: true,
      contentPadding: contentPadding,
      border: InputBorder.none,
      floatingLabelStyle: AppTextStyleParagraph().textStyle,
      errorStyle: TextStyle(height: 0.01, color: Colors.transparent),
      counterStyle: AppTextStyleParagraph().textStyle,
    );

    final textStyle = TextStyle(
      fontFamily: AppFonts.plusJakartaSans,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Colors.black,
    );

    final container = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: containerDecoration,
          child: TextFormField(
            controller: widget.controller,
            decoration: textFieldDecoration,
            style: textStyle,
            maxLines: 4,
            maxLength: 500,
            validator: (value) {
              final error = widget.validator?.call(value);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  validationError = error;
                });
              });
              return error;
            },
          ),
        ),
        SizedBox(height: 2),
        if (validationError != null)
          AppTextMicro(text: validationError, color: Colors.red),
      ],
    );

    return container;
  }
}
