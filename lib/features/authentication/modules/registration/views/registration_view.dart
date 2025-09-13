import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/form_validation.dart';
import 'package:taekwondo/core/components/app_button.dart';
import 'package:taekwondo/core/components/app_checkbox.dart';
import 'package:taekwondo/core/components/app_margin.dart';
import 'package:taekwondo/core/components/app_message.dart';
import 'package:taekwondo/core/components/app_navigator.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/components/app_text_field.dart';
import 'package:taekwondo/core/services/authentication/models/phone_registration.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/core/utils/extensions/name.dart';
import 'package:taekwondo/features/authentication/modules/registration/logics/google_registration_cubit.dart';
import 'package:taekwondo/features/authentication/modules/registration/logics/registration_cubit.dart';
import 'package:taekwondo/features/authentication/views/authentication_divider.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  RegistrationViewState createState() => RegistrationViewState();
}

class RegistrationViewState extends State<RegistrationView> {
  final form = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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

    final socialButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppSocialButton(
          icon: AppAssets.google,
          onPressed: () {
            context.read<GoogleRegistrationCubit>().checkToken();
          },
          backgroundColor: Colors.white,
        ),
        SizedBox(width: 12),
        AppSocialButton(
          icon: AppAssets.apple,
          onPressed: () {},
          backgroundColor: Colors.white,
        ),
      ],
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
          onTap: () => AppNavigator(context: context).pop(),
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
          AppTextParagraph(
            text: L10n.localizations(context).name_registration_instruction,
            color: Colors.white,
          ),
          SizedBox(height: 11),
          AppTextField(
            controller: nameController,
            validator: (value) {
              final validator = Validator(validators: [RequiredValidator()]);

              return validator.validate(
                label: L10n.localizations(context).name,
                value: value,
              );
            },
          ),
          SizedBox(height: 12),
          AppTextParagraph(
            text: L10n.localizations(context).password_login_instruction,
            color: Colors.white,
          ),
          SizedBox(height: 11),
          AppTextField(
            controller: passwordController,
            isSecure: true,
            validator: (value) {
              final validator = Validator(validators: [RequiredValidator()]);

              return validator.validate(
                label: L10n.localizations(context).password,
                value: value,
              );
            },
          ),
          SizedBox(height: 12),
          AppButtonLargeSecondary(
            title: L10n.localizations(context).proceed,
            onPressed: () async {
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
                  final name = nameController.text.splitFullName();

                  final PhoneRegistrationRequest request =
                      PhoneRegistrationRequest(
                        firstName: name.firstName,
                        lastName: name.lastName,
                        phoneNumber: phoneController.text,
                        password: passwordController.text,
                      );
                  context.read<RegistrationCubit>().signUp(request);
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
          SizedBox(height: 28),
          AuthenticationDivider(
            text: L10n.localizations(context).other_registration_option,
            color: AppColors.royalBlue,
          ),
          SizedBox(height: 28),
          socialButton,
          SizedBox(height: 40),
          footer,
        ],
      ),
    );

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(AppAssets.background),
            fit: BoxFit.cover,
          ),
        ),
        child: AppMargin(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              header,
              SizedBox(height: 50),
              Image.asset(AppAssets.logo, width: 175, height: 175),
              SizedBox(height: 30),
              authenticationSection,
            ],
          ),
        ),
      ),
    );
  }
}
