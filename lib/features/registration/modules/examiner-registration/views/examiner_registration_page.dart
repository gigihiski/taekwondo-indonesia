import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/features/registration/modules/examiner-registration/logics/examiner_registration_cubit.dart';
import 'package:taekwondo/features/registration/modules/examiner-registration/views/examiner_registration_view.dart';

class ExaminerRegistrationPage extends StatefulWidget {
  const ExaminerRegistrationPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => ExaminerRegistrationPage());
  }

  static RouteSettings routeSettings = const RouteSettings(
    name: "examiner-registration",
  );

  @override
  State<ExaminerRegistrationPage> createState() =>
      ExaminerRegistrationPageState();
}

class ExaminerRegistrationPageState extends State<ExaminerRegistrationPage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider examinerBlocProvider() {
    return BlocProvider<ExaminerRegistrationCubit>(
      create: (context) => ExaminerRegistrationCubit()..init(),
    );
  }

  BlocListener examinerBlocDetailener() {
    return BlocListener<ExaminerRegistrationCubit, ExaminerRegistrationState>(
      listener: (context, state) {
        switch (state.status) {
          case ExaminerRegistrationStatus.initial:
          case ExaminerRegistrationStatus.loading:
          case ExaminerRegistrationStatus.error:
          case ExaminerRegistrationStatus.loaded:
          case ExaminerRegistrationStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, ExaminerRegistrationState)
  examinerBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case ExaminerRegistrationStatus.initial:
        case ExaminerRegistrationStatus.loading:
        case ExaminerRegistrationStatus.error:
          return Container();
        case ExaminerRegistrationStatus.loaded:
          return ExaminerRegistrationView();
        case ExaminerRegistrationStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarHeader(
      title: "Pendaftaran Penguji",
      color: Colors.white,
    );

    return MultiBlocProvider(
      providers: [examinerBlocProvider()],
      child: MultiBlocListener(
        listeners: [examinerBlocDetailener()],
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar,
          body:
              BlocBuilder<ExaminerRegistrationCubit, ExaminerRegistrationState>(
                builder: examinerBlocBuilder(),
              ),
        ),
      ),
    );
  }
}
