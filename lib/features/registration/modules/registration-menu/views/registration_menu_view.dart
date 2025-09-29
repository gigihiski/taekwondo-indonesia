import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_navigator.dart';
import 'package:taekwondo/core/components/app_text.dart';
import 'package:taekwondo/features/registration/modules/athlete-registration/views/athlete_registration_page.dart';
import 'package:taekwondo/features/registration/modules/dojang-registration/views/dojang_registration_page.dart';
import 'package:taekwondo/features/registration/modules/examiner-registration/views/examiner_registration_page.dart';
import 'package:taekwondo/features/registration/modules/refree-registration/views/refree_registration_page.dart';
import 'package:taekwondo/features/registration/modules/trainer-registration/views/trainer_registration_page.dart';

class RegistrationMenuView extends StatefulWidget {
  const RegistrationMenuView({super.key});

  @override
  RegistrationMenuViewState createState() => RegistrationMenuViewState();
}

class RegistrationMenuViewState extends State<RegistrationMenuView> {
  @override
  Widget build(BuildContext context) {
    Widget menu(Icon icon, String title, Function() onPressed) {
      return InkWell(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          child: ListTile(
            leading: icon,
            title: AppTextParagraphSemiBold(text: title),
            trailing: Icon(Icons.arrow_forward_ios_rounded, size: 17),
          ),
        ),
      );
    }

    return Column(
      children: [
        menu(Icon(Icons.menu), "Pendaftaran Dojang", () {
          AppNavigator(
            context: context,
            page: DojangRegistrationPage(),
            route: DojangRegistrationPage.routeSettings,
          ).push();
        }),
        menu(Icon(Icons.menu), "Pendaftaran Atlit", () {
          AppNavigator(
            context: context,
            page: AthleteRegistrationPage(),
            route: AthleteRegistrationPage.routeSettings,
          ).push();
        }),
        menu(Icon(Icons.menu), "Pendaftaran Pelatih", () {
          AppNavigator(
            context: context,
            page: TrainerRegistrationPage(),
            route: TrainerRegistrationPage.routeSettings,
          ).push();
        }),
        menu(Icon(Icons.menu), "Pendaftaran Pengurus", () {
          AppNavigator(
            context: context,
            page: DojangRegistrationPage(),
            route: DojangRegistrationPage.routeSettings,
          ).push();
        }),
        menu(Icon(Icons.menu), "Pendaftaran Penguji", () {
          AppNavigator(
            context: context,
            page: ExaminerRegistrationPage(),
            route: ExaminerRegistrationPage.routeSettings,
          ).push();
        }),
        menu(Icon(Icons.menu), "Pendaftaran Wasit", () {
          AppNavigator(
            context: context,
            page: RefreeRegistrationPage(),
            route: RefreeRegistrationPage.routeSettings,
          ).push();
        }),
      ],
    );
  }
}
