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
  bool isSecure = true;
  final form = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
      color: Colors.black,
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
          AppTextField(
            hint: L10n.localizations(context).name,
            prefix: Icon(Icons.person_outline_sharp, size: 24),
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
          AppTextField(
            hint: L10n.localizations(context).phone_number,
            prefix: Icon(Icons.phone_outlined, size: 24),
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
          AppTextField(
            hint: L10n.localizations(context).email,
            prefix: Icon(Icons.email_outlined, size: 24),
            controller: emailController,
            validator: (value) {
              final validator = Validator(
                validators: [RequiredValidator(), EmailValidator()],
              );

              return validator.validate(
                label: L10n.localizations(context).email,
                value: value,
              );
            },
          ),
          SizedBox(height: 12),
          AppTextField(
            hint: L10n.localizations(context).password,
            suffix: isSecure
                ? Icon(Icons.remove_red_eye_outlined, size: 24)
                : Icon(Icons.remove_red_eye, size: 24),
            isSecure: isSecure,
            prefix: Icon(Icons.lock_outlined, size: 24),
            controller: passwordController,
            suffixOnPressed: () {
              setState(() => isSecure = !isSecure);
            },
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
                  final EmailRegistrationRequest request =
                      EmailRegistrationRequest(
                        email: nameController.text,
                        name: emailController.text,
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
              color: Colors.black,
            ),
          ),
          SizedBox(height: 28),
          AuthenticationDivider(
            text: L10n.localizations(context).other_registration_option,
            color: Colors.black,
          ),
          SizedBox(height: 20),
          socialButton,
          SizedBox(height: 20),
          footer,
          SizedBox(height: 20),
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
