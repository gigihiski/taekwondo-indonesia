import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/language/logics/active_language_cubit.dart';
import 'package:taekwondo/core/services/language/repositories/language_repository.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taekwondo/core/services/authentication/authentication_repository.dart';
import 'package:taekwondo/core/services/authentication/logics/authentication_cubit.dart';
import 'package:taekwondo/core/themes/app_transition.dart';
import 'package:taekwondo/features/splash/views/splash_page.dart';
import 'package:taekwondo/features/onboarding/views/onboarding_page.dart';
import 'package:taekwondo/features/authentication/modules/login/views/login_page.dart';
import 'package:taekwondo/features/home/modules/home/views/home_page.dart';

class TaekwondoApp extends StatefulWidget {
  const TaekwondoApp({
    super.key,
    required this.authenticationRepository,
    required this.languageRepository,
  });

  final AuthenticationRepository authenticationRepository;
  final LanguageRepository languageRepository;

  @override
  State<TaekwondoApp> createState() => TaekwondoAppState();
}

class TaekwondoAppState extends State<TaekwondoApp> {
  bool isRequestPinWidgetSupported = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
          create: (context) => widget.authenticationRepository,
        ),
        RepositoryProvider<LanguageRepository>(
          create: (context) => widget.languageRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationCubit>(
            create: (context) =>
                AuthenticationCubit(widget.authenticationRepository)..initial(),
          ),
          BlocProvider<ActiveLanguageCubit>(
            create: (context) =>
                ActiveLanguageCubit(repository: widget.languageRepository)
                  ..initial(),
          ),
        ],
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  AppViewState createState() => AppViewState();
}

class AppViewState extends State<AppView> {
  final navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get navigator => navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kampoeng Steak',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: L10n.localizationsDelegates(),
      supportedLocales: L10n.supportedLocales(),
      locale: Locale(
        context.watch<ActiveLanguageCubit>().state.language?.code.name ?? 'id',
      ),
      navigatorKey: navigatorKey,
      builder: (context, child) {
        return MultiBlocListener(
          listeners: [
            BlocListener<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) async {
                switch (state.status) {
                  case AuthenticationStatus.initial:
                  case AuthenticationStatus.authenticated:
                    showMainPage();
                    break;
                  case AuthenticationStatus.maintenance:
                    showMaintenanceDialog();
                    break;
                  case AuthenticationStatus.unAuthenticated:
                    showLoginPage();
                    break;
                }
              },
            ),
          ],
          child: child ?? Container(),
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }

  void showMaintenanceDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(content: Text('Maintenance In Progress'));
      },
    );
  }

  void showMainPage() {
    navigator.pushAndRemoveUntil(HomePage.route(), (route) => false);
  }

  void showLoginPage() {
    navigator.pushAndRemoveUntil(LoginPage.route(), (route) => false);
  }

  void showOnboardingPage() {
    navigator.pushAndRemoveUntil(
      AppTransition.pushTransition(
        const OnboardingPage(),
        OnboardingPage.routeSettings,
        type: PageTransitionType.fade,
      ),
      (route) => false,
    );
  }
}
