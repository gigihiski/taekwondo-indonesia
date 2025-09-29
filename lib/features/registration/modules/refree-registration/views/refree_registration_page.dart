import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/features/registration/modules/refree-registration/logics/refree_registration_cubit.dart';
import 'package:taekwondo/features/registration/modules/refree-registration/views/refree_registration_view.dart';

class RefreeRegistrationPage extends StatefulWidget {
  const RefreeRegistrationPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => RefreeRegistrationPage());
  }

  static RouteSettings routeSettings = const RouteSettings(
    name: "refree-registration",
  );

  @override
  State<RefreeRegistrationPage> createState() => RefreeRegistrationPageState();
}

class RefreeRegistrationPageState extends State<RefreeRegistrationPage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider refreeBlocProvider() {
    return BlocProvider<RefreeRegistrationCubit>(
      create: (context) => RefreeRegistrationCubit()..init(),
    );
  }

  BlocListener refreeBlocDetailener() {
    return BlocListener<RefreeRegistrationCubit, RefreeRegistrationState>(
      listener: (context, state) {
        switch (state.status) {
          case RefreeRegistrationStatus.initial:
          case RefreeRegistrationStatus.loading:
          case RefreeRegistrationStatus.error:
          case RefreeRegistrationStatus.loaded:
          case RefreeRegistrationStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, RefreeRegistrationState) refreeBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case RefreeRegistrationStatus.initial:
        case RefreeRegistrationStatus.loading:
        case RefreeRegistrationStatus.error:
          return Container();
        case RefreeRegistrationStatus.loaded:
          return RefreeRegistrationView();
        case RefreeRegistrationStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarHeader(
      title: "Pendaftaran Wasit",
      color: Colors.white,
    );

    return MultiBlocProvider(
      providers: [refreeBlocProvider()],
      child: MultiBlocListener(
        listeners: [refreeBlocDetailener()],
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar,
          body: BlocBuilder<RefreeRegistrationCubit, RefreeRegistrationState>(
            builder: refreeBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
