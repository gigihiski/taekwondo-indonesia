import 'package:flutter/material.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/features/registration/modules/registration-menu/views/registration_menu_view.dart';

class RegistrationMenuPage extends StatefulWidget {
  const RegistrationMenuPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => RegistrationMenuPage());
  }

  static RouteSettings routeSettings = const RouteSettings(
    name: "registration-menu",
  );

  @override
  State<RegistrationMenuPage> createState() => RegistrationMenuPageState();
}

class RegistrationMenuPageState extends State<RegistrationMenuPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarHeader(title: "Menu Pendaftaran", color: Colors.white);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: RegistrationMenuView(),
    );
  }
}
