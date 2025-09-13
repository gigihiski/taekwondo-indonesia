import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taekwondo/core/components/app_message.dart';
import 'package:taekwondo/core/components/app_progress_hud.dart';
import 'package:taekwondo/core/services/authentication/authentication_repository.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/core/themes/app_transition.dart';
import 'package:taekwondo/features/authentication/modules/registration/logics/google_registration_cubit.dart';
import 'package:taekwondo/features/authentication/modules/registration/views/google_registration_view.dart';
import 'package:taekwondo/features/home/modules/home/views/home_page.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class GoogleRegistrationPage extends StatefulWidget {
  const GoogleRegistrationPage({super.key, required this.googleUser});

  final GoogleSignInAccount googleUser;

  static Route route(GoogleSignInAccount googleUser) {
    return MaterialPageRoute(
      builder: (_) => GoogleRegistrationPage(googleUser: googleUser),
    );
  }

  static RouteSettings routeSettings = const RouteSettings(
    name: "google-registration",
  );

  @override
  State<GoogleRegistrationPage> createState() => GoogleRegistrationPageState();
}

class GoogleRegistrationPageState extends State<GoogleRegistrationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          switch (state.status) {
            case GoogleRegistrationStatus.initial:
            case GoogleRegistrationStatus.error:
              AppMessage(
                title: L10n.localizations(context).registration_failed,
                description: state.errorMessage,
                buttonBack: L10n.localizations(context).back,
                onBackButtonPressed: () {},
              ).openAnimatedDialog(context);
              AppProgressHUD.of(context)?.dismiss();
              break;
            case GoogleRegistrationStatus.loading:
              AppProgressHUD.of(context)?.show();
            case GoogleRegistrationStatus.loaded:
            case GoogleRegistrationStatus.successGoogleToken:
            case GoogleRegistrationStatus.unAuthenticated:
              AppProgressHUD.of(context)?.dismiss();
              break;
            case GoogleRegistrationStatus.success:
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

    Widget Function(BuildContext, GoogleRegistrationState)
    googleRegistrationBlocBuilder() {
      return (context, state) {
        switch (state.status) {
          case GoogleRegistrationStatus.initial:
          case GoogleRegistrationStatus.error:
          case GoogleRegistrationStatus.success:
          case GoogleRegistrationStatus.loading:
          case GoogleRegistrationStatus.successGoogleToken:
          case GoogleRegistrationStatus.unAuthenticated:
          case GoogleRegistrationStatus.loaded:
            return GoogleRegistrationView(googleUser: widget.googleUser);
        }
      };
    }

    return AppProgressHUD(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: MultiBlocProvider(
          providers: [googleRegistrationBlocProvider()],
          child: MultiBlocListener(
            listeners: [googleRegistrationBlocListener()],
            child:
                BlocBuilder<GoogleRegistrationCubit, GoogleRegistrationState>(
                  builder: googleRegistrationBlocBuilder(),
                ),
          ),
        ),
      ),
    );
  }
}
