import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_text_style.dart';
import 'package:taekwondo/core/themes/app_colors.dart';

final int max = 6;

final containerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(12),
);

class OTPTextField extends StatefulWidget {
  const OTPTextField({super.key, required this.onChanged});

  final Function(String) onChanged;

  @override
  State<OTPTextField> createState() => OTPTextFieldState();
}

class OTPTextFieldState extends State<OTPTextField> {
  late List<String> otp;
  List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  List<FocusNode> focusNodes = List.generate(max, (_) => FocusNode());

  @override
  void initState() {
    otp = [];
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(max, (index) => buildOtpField(index)),
    );
  }

  Widget buildOtpField(int index) {
    final textFieldDecoration = InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.zero,
      border: InputBorder.none,
      counterText: '',
      counterStyle: TextStyle(fontSize: 0),
      hintText: '_',
      hintStyle: AppTextStyleParagraph(color: AppColors.graniteGray).textStyle,
    );

    final container = Container(
      height: 48,
      width: 48,
      decoration: containerDecoration,
      child: Center(
        child: TextFormField(
          controller: controllers[index],
          focusNode: focusNodes[index],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          maxLength: 1,
          decoration: textFieldDecoration,
          cursorColor: Colors.black,
          style: AppTextStyleParagraph().textStyle,
          onChanged: (value) {
            try {
              if (value.isNotEmpty && index < (max - 1)) {
                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).requestFocus(focusNodes[index - 1]);
              }
              otp[index] = value;
            } on RangeError catch (_) {
              otp.insert(index, value);
            } finally {
              final joinedOTP = otp.join("");
              if (joinedOTP.length == max) widget.onChanged(joinedOTP);
            }
          },
        ),
      ),
    );

    return container;
  }
}
