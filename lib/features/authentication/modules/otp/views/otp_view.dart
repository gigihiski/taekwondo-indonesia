import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_margin.dart';
import 'package:taekwondo/core/components/app_navigator.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/features/authentication/modules/otp/views/components/count_down_timer.dart';
import 'package:taekwondo/features/authentication/modules/otp/views/components/otp_text_field.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class OTPView extends StatefulWidget {
  const OTPView({super.key});

  @override
  OTPViewState createState() => OTPViewState();
}

class OTPViewState extends State<OTPView> {
  GlobalKey form = GlobalKey();
  late bool isEnded;

  @override
  void initState() {
    isEnded = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final header = AppTextParagraph(text: "");

    final resendActive = InkWell(
      onTap: () {
        AppNavigator(context: context).pop();
      },
      child: AppTextParagraphSemiBold(
        text: L10n.localizations(context).resend_code,
        color: AppColors.secondary,
      ),
    );

    final resendInactive = AppTextParagraphSemiBold(
      text: L10n.localizations(context).resend_code,
      color: (isEnded) ? AppColors.secondary : AppColors.graniteGray,
    );

    final footer = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTextParagraph(
          text: L10n.localizations(context).didnt_receive_code,
          color: Colors.white,
        ),
        SizedBox(width: 6),
        (isEnded) ? resendActive : resendInactive,
      ],
    );

    final codeEnds = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTextParagraph(
          text: L10n.localizations(context).code_ends_in,
          color: Colors.white,
        ),
        SizedBox(width: 6),
        CountDownTimer(
          seconds: 90,
          onTimerEnded: () {
            setState(() {
              isEnded = true;
            });
          },
        ),
      ],
    );

    final authenticationSection = Form(
      key: form,
      child: Column(
        children: [
          AppTextParagraph(
            text: L10n.localizations(context).otp_instruction,
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 28),
          OTPTextField(onChanged: (value) {}),
          SizedBox(height: 28),
          codeEnds,
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(AppAssets.background),
          fit: BoxFit.cover,
        ),
      ),
      child: AppMargin(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [header, authenticationSection, footer],
        ),
      ),
    );
  }
}
