import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/core/services/authentication/authentication_repository.dart';
import 'package:taekwondo/core/themes/app_transition.dart';
import 'package:taekwondo/features/authentication/modules/otp/logics/otp_cubit.dart';
import 'package:taekwondo/features/authentication/modules/otp/views/otp_view.dart';
import 'package:taekwondo/features/home/modules/home/views/home_page.dart';
import 'package:taekwondo/l10n/common/material_localizations.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => OTPPage());
  }

  static RouteSettings routeSettings = const RouteSettings(name: "otp");

  @override
  State<OTPPage> createState() => OTPPageState();
}

class OTPPageState extends State<OTPPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider otpBlocProvider() {
      return BlocProvider<OTPCubit>(
        create: (context) =>
            OTPCubit(RepositoryProvider.of<AuthenticationRepository>(context)),
      );
    }

    BlocListener otpBlocListener() {
      return BlocListener<OTPCubit, OTPState>(
        listener: (context, state) {
          if (state.status == OTPStatus.success) {
            Navigator.of(context).pushAndRemoveUntil(
              AppTransition.pushTransition(HomePage(), HomePage.routeSettings),
              (route) => false,
            );
          }
          if (state.status == OTPStatus.error) {}
        },
      );
    }

    Widget Function(BuildContext, OTPState) otpBlocBuilder() {
      return (context, state) {
        switch (state.status) {
          case OTPStatus.initial:
          case OTPStatus.error:
            return OTPView();
          case OTPStatus.loading:
            return Container();
          case OTPStatus.loaded:
            return OTPView();
          case OTPStatus.success:
            throw UnimplementedError();
        }
      };
    }

    return MultiBlocProvider(
      providers: [otpBlocProvider()],
      child: MultiBlocListener(
        listeners: [otpBlocListener()],
        child: Scaffold(
          appBar: AppBarHeader(
            title: L10n.localizations(context).account_verification,
            textColor: Colors.white,
          ),
          body: BlocBuilder<OTPCubit, OTPState>(builder: otpBlocBuilder()),
        ),
      ),
    );
  }
}
