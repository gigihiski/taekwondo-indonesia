import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_message.dart';
import 'package:taekwondo/core/components/app_progress_hud.dart';
import 'package:taekwondo/core/services/authentication/authentication_repository.dart';
import 'package:taekwondo/core/services/location/location_repository.dart';
import 'package:taekwondo/core/themes/app_transition.dart';
import 'package:taekwondo/features/authentication/modules/login/logics/google_login_cubit.dart';
import 'package:taekwondo/features/authentication/modules/login/logics/login_cubit.dart';
import 'package:taekwondo/features/authentication/modules/login/views/login_view.dart';
import 'package:taekwondo/features/home/modules/home/views/home_page.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => LoginPage());
  }

  static RouteSettings routeSettings = const RouteSettings(name: "login");

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider loginBlocProvider() {
      return BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(
          authenticationRepository:
              RepositoryProvider.of<AuthenticationRepository>(context),
          locationRepository: LocationRepository.create(),
        )..init(),
      );
    }

    BlocProvider googleLoginBlocProvider() {
      return BlocProvider<GoogleLoginCubit>(
        create: (context) => GoogleLoginCubit(
          RepositoryProvider.of<AuthenticationRepository>(context),
        ),
      );
    }

    BlocListener loginBlocListener() {
      return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          switch (state.status) {
            case LoginStatus.error:
              AppMessage(
                title: L10n.localizations(context).login_failed,
                description: state.errorMessage,
                buttonBack: L10n.localizations(context).back,
                onBackButtonPressed: () {},
              ).openAnimatedDialog(context);
              AppProgressHUD.of(context)?.dismiss();
              break;
            case LoginStatus.loading:
              AppProgressHUD.of(context)?.show();
              break;
            case LoginStatus.success:
              Navigator.of(context).pushAndRemoveUntil(
                AppTransition.pushTransition(
                  HomePage(),
                  HomePage.routeSettings,
                ),
                (route) => false,
              );
              AppProgressHUD.of(context)?.dismiss();
              break;
            default:
              AppProgressHUD.of(context)?.dismiss();
              break;
          }
        },
      );
    }

    BlocListener googleLoginBlocListener() {
      return BlocListener<GoogleLoginCubit, GoogleLoginState>(
        listener: (context, state) {
          switch (state.status) {
            case GoogleLoginStatus.error:
              AppMessage(
                title: L10n.localizations(context).login_failed,
                description: state.errorMessage,
                buttonBack: L10n.localizations(context).back,
                onBackButtonPressed: () {},
              ).openAnimatedDialog(context);
              AppProgressHUD.of(context)?.dismiss();
              break;
            case GoogleLoginStatus.loading:
              AppProgressHUD.of(context)?.show();
              break;
            case GoogleLoginStatus.success:
              Navigator.of(context).pushAndRemoveUntil(
                AppTransition.pushTransition(
                  HomePage(),
                  HomePage.routeSettings,
                ),
                (route) => false,
              );
              AppProgressHUD.of(context)?.dismiss();
              break;
            default:
              AppProgressHUD.of(context)?.dismiss();
              break;
          }
        },
      );
    }

    Widget Function(BuildContext, LoginState) loginBlocBuilder() {
      return (context, state) {
        switch (state.status) {
          case LoginStatus.initial:
          case LoginStatus.error:
          case LoginStatus.loading:
          case LoginStatus.success:
          case LoginStatus.loaded:
            return LoginView();
        }
      };
    }

    return AppProgressHUD(
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [loginBlocProvider(), googleLoginBlocProvider()],
          child: MultiBlocListener(
            listeners: [loginBlocListener(), googleLoginBlocListener()],
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: loginBlocBuilder(),
            ),
          ),
        ),
      ),
    );
  }
}
