import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/features/registration/modules/dojang-registration/logics/dojang_registration_cubit.dart';
import 'package:taekwondo/features/registration/modules/dojang-registration/views/dojang_registration_view.dart';

class DojangRegistrationPage extends StatefulWidget {
  const DojangRegistrationPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => DojangRegistrationPage());
  }

  static RouteSettings routeSettings = const RouteSettings(
    name: "dojang-registration",
  );

  @override
  State<DojangRegistrationPage> createState() => DojangRegistrationPageState();
}

class DojangRegistrationPageState extends State<DojangRegistrationPage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider dojangBlocProvider() {
    return BlocProvider<DojangRegistrationCubit>(
      create: (context) => DojangRegistrationCubit()..init(),
    );
  }

  BlocListener dojangBlocDetailener() {
    return BlocListener<DojangRegistrationCubit, DojangRegistrationState>(
      listener: (context, state) {
        switch (state.status) {
          case DojangRegistrationStatus.initial:
          case DojangRegistrationStatus.loading:
          case DojangRegistrationStatus.error:
          case DojangRegistrationStatus.loaded:
          case DojangRegistrationStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, DojangRegistrationState) dojangBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case DojangRegistrationStatus.initial:
        case DojangRegistrationStatus.loading:
        case DojangRegistrationStatus.error:
          return Container();
        case DojangRegistrationStatus.loaded:
          return DojangRegistrationView();
        case DojangRegistrationStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarHeader(
      title: "Pendaftaran Dojang",
      color: Colors.white,
    );

    return MultiBlocProvider(
      providers: [dojangBlocProvider()],
      child: MultiBlocListener(
        listeners: [dojangBlocDetailener()],
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar,
          body: BlocBuilder<DojangRegistrationCubit, DojangRegistrationState>(
            builder: dojangBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
