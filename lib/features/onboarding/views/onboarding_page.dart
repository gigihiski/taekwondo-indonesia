import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => OnboardingPage());
  }

  static RouteSettings routeSettings = const RouteSettings(name: "onboarding");

  @override
  State<OnboardingPage> createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
