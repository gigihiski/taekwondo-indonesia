import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/form_validation.dart';
import 'package:taekwondo/core/components/app_button.dart';
import 'package:taekwondo/core/components/app_margin.dart';
import 'package:taekwondo/core/components/app_navigator.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/core/components/app_text_field.dart';
import 'package:taekwondo/core/services/authentication/models/phone_authentication.dart';
import 'package:taekwondo/core/themes/app_assets.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/features/authentication/modules/login/logics/google_login_cubit.dart';
import 'package:taekwondo/features/authentication/modules/login/logics/login_cubit.dart';
import 'package:taekwondo/features/authentication/modules/registration/views/registration_page.dart';
import 'package:taekwondo/features/authentication/views/authentication_divider.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  bool isSecure = true;
  final form = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final header = AppTextH3SourGummySemiBold(
      text: L10n.localizations(context).login,
      color: Colors.white,
    );

    final socialButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppSocialButton(
          icon: AppAssets.google,
          onPressed: () {
            context.read<GoogleLoginCubit>().login();
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
          text: L10n.localizations(context).dont_have_account,
          color: Colors.white,
        ),
        SizedBox(width: 6),
        InkWell(
          onTap: () {
            AppNavigator(
              context: context,
              page: RegistrationPage(),
              route: RegistrationPage.routeSettings,
            ).push();
          },
          child: AppTextParagraphSemiBold(
            text: L10n.localizations(context).register_now,
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
            color: Colors.black,
          ),
          SizedBox(height: 11),
          AppTextField(
            prefix: Icon(Icons.email_outlined, size: 24),
            controller: usernameController,
            validator: (value) {
              final validator = Validator(
                validators: [RequiredValidator(), EmailValidator()],
              );
              return validator.validate(
                label: L10n.localizations(context).phone_number,
                value: value,
              );
            },
          ),
          SizedBox(height: 12),
          AppTextParagraph(
            text: L10n.localizations(context).password_login_instruction,
            color: Colors.black,
          ),
          SizedBox(height: 11),
          AppTextField(
            controller: passwordController,
            prefix: Icon(Icons.lock_outlined, size: 24),
            suffix: isSecure
                ? Icon(Icons.remove_red_eye_outlined, size: 24)
                : Icon(Icons.remove_red_eye, size: 24),
            isSecure: isSecure,
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
                final EmailAuthenticationRequest request =
                    EmailAuthenticationRequest(
                      email: usernameController.text,
                      password: passwordController.text,
                    );
                context.read<LoginCubit>().login(request);
              }
            },
          ),
          SizedBox(height: 28),
          AuthenticationDivider(
            text: L10n.localizations(context).other_login_option,
            color: Colors.black,
          ),
          SizedBox(height: 20),
          socialButton,
          SizedBox(height: 20),
          footer,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            header,
            SizedBox(height: 60),
            Image.asset(AppAssets.logo, width: 175, height: 175),
            SizedBox(height: 50),
            authenticationSection,
          ],
        ),
      ),
    );
  }
}
