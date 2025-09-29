import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/features/registration/modules/athlete-registration/logics/athlete_registration_cubit.dart';
import 'package:taekwondo/features/registration/modules/athlete-registration/views/athlete_registration_view.dart';

class AthleteRegistrationPage extends StatefulWidget {
  const AthleteRegistrationPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => AthleteRegistrationPage());
  }

  static RouteSettings routeSettings = const RouteSettings(
    name: "athlete-registration",
  );

  @override
  State<AthleteRegistrationPage> createState() =>
      AthleteRegistrationPageState();
}

class AthleteRegistrationPageState extends State<AthleteRegistrationPage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider athleteBlocProvider() {
    return BlocProvider<AthleteRegistrationCubit>(
      create: (context) => AthleteRegistrationCubit()..init(),
    );
  }

  BlocListener athleteBlocDetailener() {
    return BlocListener<AthleteRegistrationCubit, AthleteRegistrationState>(
      listener: (context, state) {
        switch (state.status) {
          case AthleteRegistrationStatus.initial:
          case AthleteRegistrationStatus.loading:
          case AthleteRegistrationStatus.error:
          case AthleteRegistrationStatus.loaded:
          case AthleteRegistrationStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, AthleteRegistrationState) athleteBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case AthleteRegistrationStatus.initial:
        case AthleteRegistrationStatus.loading:
        case AthleteRegistrationStatus.error:
          return Container();
        case AthleteRegistrationStatus.loaded:
          return AthleteRegistrationView();
        case AthleteRegistrationStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarHeader(
      title: "Pendaftaran Atlit",
      color: Colors.white,
    );

    return MultiBlocProvider(
      providers: [athleteBlocProvider()],
      child: MultiBlocListener(
        listeners: [athleteBlocDetailener()],
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar,
          body: BlocBuilder<AthleteRegistrationCubit, AthleteRegistrationState>(
            builder: athleteBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
