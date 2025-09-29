import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/features/registration/modules/management-registration/logics/management_registration_cubit.dart';
import 'package:taekwondo/features/registration/modules/management-registration/views/management_registration_view.dart';

class ManagementRegistrationPage extends StatefulWidget {
  const ManagementRegistrationPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => ManagementRegistrationPage());
  }

  static RouteSettings routeSettings = const RouteSettings(
    name: "management-registration",
  );

  @override
  State<ManagementRegistrationPage> createState() =>
      ManagementRegistrationPageState();
}

class ManagementRegistrationPageState
    extends State<ManagementRegistrationPage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider managementBlocProvider() {
    return BlocProvider<ManagementRegistrationCubit>(
      create: (context) => ManagementRegistrationCubit()..init(),
    );
  }

  BlocListener managementBlocDetailener() {
    return BlocListener<
      ManagementRegistrationCubit,
      ManagementRegistrationState
    >(
      listener: (context, state) {
        switch (state.status) {
          case ManagementRegistrationStatus.initial:
          case ManagementRegistrationStatus.loading:
          case ManagementRegistrationStatus.error:
          case ManagementRegistrationStatus.loaded:
          case ManagementRegistrationStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, ManagementRegistrationState)
  managementBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case ManagementRegistrationStatus.initial:
        case ManagementRegistrationStatus.loading:
        case ManagementRegistrationStatus.error:
          return Container();
        case ManagementRegistrationStatus.loaded:
          return ManagementRegistrationView();
        case ManagementRegistrationStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarHeader(
      title: "Pendaftaran Pengurus",
      color: Colors.white,
    );

    return MultiBlocProvider(
      providers: [managementBlocProvider()],
      child: MultiBlocListener(
        listeners: [managementBlocDetailener()],
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar,
          body:
              BlocBuilder<
                ManagementRegistrationCubit,
                ManagementRegistrationState
              >(builder: managementBlocBuilder()),
        ),
      ),
    );
  }
}
