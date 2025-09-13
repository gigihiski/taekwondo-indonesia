import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_message.dart';
import 'package:taekwondo/core/components/app_navigator.dart';
import 'package:taekwondo/core/components/app_progress_hud.dart';
import 'package:taekwondo/core/services/authentication/authentication_repository.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/core/themes/app_transition.dart';
import 'package:taekwondo/features/authentication/modules/registration/logics/google_registration_cubit.dart';
import 'package:taekwondo/features/authentication/modules/registration/logics/registration_cubit.dart';
import 'package:taekwondo/features/authentication/modules/registration/views/google_registration_page.dart';
import 'package:taekwondo/features/authentication/modules/registration/views/registration_view.dart';
import 'package:taekwondo/features/home/modules/home/views/home_page.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => RegistrationPage());
  }

  static RouteSettings routeSettings = const RouteSettings(
    name: "registration",
  );

  @override
  State<RegistrationPage> createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider registrationBlocProvider() {
      return BlocProvider<RegistrationCubit>(
        create: (context) => RegistrationCubit(
          RepositoryProvider.of<AuthenticationRepository>(context),
        ),
      );
    }

    BlocProvider googleRegistrationBlocProvider() {
      return BlocProvider<GoogleRegistrationCubit>(
        create: (context) => GoogleRegistrationCubit(
          RepositoryProvider.of<AuthenticationRepository>(context),
        ),
      );
    }

    BlocListener googleRegistrationBlocListener() {
      return BlocListener<GoogleRegistrationCubit, GoogleRegistrationState>(
        listener: (context, state) {
          AppProgressHUD.of(context)?.show();
          switch (state.status) {
            case GoogleRegistrationStatus.initial:
            case GoogleRegistrationStatus.loading:
            case GoogleRegistrationStatus.unAuthenticated:
              AppProgressHUD.of(context)?.dismiss();
              break;
            case GoogleRegistrationStatus.error:
              AppMessage(
                title: L10n.localizations(context).registration_failed,
                description: state.errorMessage,
                buttonBack: L10n.localizations(context).back,
                onBackButtonPressed: () {},
              ).openAnimatedDialog(context);
              AppProgressHUD.of(context)?.dismiss();
              break;
            case GoogleRegistrationStatus.loaded:
            case GoogleRegistrationStatus.success:
              Navigator.of(context).pushAndRemoveUntil(
                AppTransition.pushTransition(
                  HomePage(),
                  HomePage.routeSettings,
                ),
                (route) => false,
              );
              AppProgressHUD.of(context)?.dismiss();
              break;
            case GoogleRegistrationStatus.successGoogleToken:
              AppNavigator(
                context: context,
                page: GoogleRegistrationPage(googleUser: state.googleUser!),
                route: GoogleRegistrationPage.routeSettings,
              ).push();
              AppProgressHUD.of(context)?.dismiss();
              break;
          }
        },
      );
    }

    BlocListener registrationBlocListener() {
      return BlocListener<RegistrationCubit, RegistrationState>(
        listener: (context, state) {
          switch (state.status) {
            case RegistrationStatus.initial:
            case RegistrationStatus.error:
              AppMessage(
                title: L10n.localizations(context).registration_failed,
                description: state.errorMessage,
                buttonBack: L10n.localizations(context).back,
                onBackButtonPressed: () {},
              ).openAnimatedDialog(context);
              AppProgressHUD.of(context)?.dismiss();
              break;
            case RegistrationStatus.loading:
              AppProgressHUD.of(context)?.show();
            case RegistrationStatus.loaded:
              AppProgressHUD.of(context)?.dismiss();
              break;
            case RegistrationStatus.success:
              AppMessage(
                title: L10n.localizations(context).registration_success,
                description: L10n.localizations(
                  context,
                ).registration_success_message,
                buttonBack: L10n.localizations(context).go_to_home_page,
                onBackButtonPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    AppTransition.pushTransition(
                      HomePage(),
                      HomePage.routeSettings,
                    ),
                    (route) => false,
                  );
                },
              ).openAnimatedDialog(context);

              AppProgressHUD.of(context)?.dismiss();
              break;
          }
        },
      );
    }

    Widget Function(BuildContext, RegistrationState) registrationBlocBuilder() {
      return (context, state) {
        switch (state.status) {
          case RegistrationStatus.initial:
          case RegistrationStatus.error:
          case RegistrationStatus.success:
          case RegistrationStatus.loading:
          case RegistrationStatus.loaded:
            return RegistrationView();
        }
      };
    }

    return AppProgressHUD(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: MultiBlocProvider(
          providers: [
            registrationBlocProvider(),
            googleRegistrationBlocProvider(),
          ],
          child: MultiBlocListener(
            listeners: [
              registrationBlocListener(),
              googleRegistrationBlocListener(),
            ],
            child: BlocBuilder<RegistrationCubit, RegistrationState>(
              builder: registrationBlocBuilder(),
            ),
          ),
        ),
      ),
    );
  }
}
