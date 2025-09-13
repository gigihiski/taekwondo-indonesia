import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/form_validation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taekwondo/core/components/app_button.dart';
import 'package:taekwondo/core/components/app_checkbox.dart';
import 'package:taekwondo/core/components/app_message.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/components/app_text_field.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/core/themes/app_padding.dart';
import 'package:taekwondo/features/authentication/modules/registration/logics/google_registration_cubit.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class GoogleRegistrationView extends StatefulWidget {
  const GoogleRegistrationView({super.key, required this.googleUser});

  final GoogleSignInAccount googleUser;

  @override
  GoogleRegistrationViewState createState() => GoogleRegistrationViewState();
}

class GoogleRegistrationViewState extends State<GoogleRegistrationView> {
  final form = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  late bool isChecked;

  @override
  void initState() {
    isChecked = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final header = AppTextH3SourGummySemiBold(
      text: L10n.localizations(context).registration,
      color: Colors.white,
    );

    final phoneCodePrefix = Container(
      margin: EdgeInsets.only(left: 20, right: 1),
      width: 26,
      child: Align(
        alignment: Alignment.center,
        child: AppTextParagraph(text: "+62", color: AppColors.graniteGray),
      ),
    );

    final footer = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTextParagraph(
          text: L10n.localizations(context).already_have_an_account,
          color: Colors.white,
        ),
        SizedBox(width: 6),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          child: AppTextParagraphSemiBold(
            text: L10n.localizations(context).login_here,
            color: AppColors.secondary,
          ),
        ),
      ],
    );

    final authenticationSection = Form(
      key: form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextParagraph(
            text: L10n.localizations(context).whatsapp_login_instruction,
            color: Colors.white,
          ),
          SizedBox(height: 11),
          AppTextField(
            prefix: phoneCodePrefix,
            controller: phoneController,
            validator: (value) {
              final validator = Validator(
                validators: [RequiredValidator(), PhoneNumberValidator()],
              );

              return validator.validate(
                label: L10n.localizations(context).phone_number,
                value: value,
              );
            },
          ),
          SizedBox(height: 12),
          AppButtonLargeSecondary(
            title: L10n.localizations(context).proceed,
            onPressed: () {
              if (form.currentState!.validate()) {
                if (!isChecked) {
                  AppMessage(
                    title: L10n.localizations(context).registration_failed,
                    description: L10n.localizations(
                      context,
                    ).acceptance_terms_conditions_agreement,
                    onBackButtonPressed: () {},
                  ).openAnimatedDialog(context);
                } else {
                  final phoneNumber = phoneController.text;
                  context.read<GoogleRegistrationCubit>().signUp(
                    phoneNumber,
                    widget.googleUser,
                  );
                }
              }
            },
          ),
          SizedBox(height: 12),
          AppAgreementCheckbox(
            onTicked: (value) {
              setState(() {
                isChecked = value;
              });
            },
            child: AppTextParagraph(
              text: L10n.localizations(context).registration_agreement_checkbox,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 40),
          footer,
        ],
      ),
    );

    return SingleChildScrollView(
      child: Padding(
        padding: AppPadding.mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            header,
            SizedBox(height: 118),
            Image.asset(AppAssets.logo, width: 176, height: 132),
            SizedBox(height: 118),
            authenticationSection,
          ],
        ),
      ),
    );
  }
}
