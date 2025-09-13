import 'package:flutter/material.dart';
import 'package:taekwondo/features/splash/views/splash_view.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => SplashPage());
  }

  static RouteSettings routeSettings = const RouteSettings(name: "splash");

  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashView();
  }
}
