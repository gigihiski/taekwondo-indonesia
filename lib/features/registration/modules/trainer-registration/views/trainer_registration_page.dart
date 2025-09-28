import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/features/registration/modules/trainer-registration/logics/trainer_registration_cubit.dart';
import 'package:taekwondo/features/registration/modules/trainer-registration/views/trainer_registration_view.dart';

class TrainerRegistrationPage extends StatefulWidget {
  const TrainerRegistrationPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => TrainerRegistrationPage());
  }

  static RouteSettings routeSettings = const RouteSettings(
    name: "trainer-registration",
  );

  @override
  State<TrainerRegistrationPage> createState() =>
      TrainerRegistrationPageState();
}

class TrainerRegistrationPageState extends State<TrainerRegistrationPage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider trainerBlocProvider() {
    return BlocProvider<TrainerRegistrationCubit>(
      create: (context) => TrainerRegistrationCubit()..init(),
    );
  }

  BlocListener trainerBlocDetailener() {
    return BlocListener<TrainerRegistrationCubit, TrainerRegistrationState>(
      listener: (context, state) {
        switch (state.status) {
          case TrainerRegistrationStatus.initial:
          case TrainerRegistrationStatus.loading:
          case TrainerRegistrationStatus.error:
          case TrainerRegistrationStatus.loaded:
          case TrainerRegistrationStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, TrainerRegistrationState) trainerBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case TrainerRegistrationStatus.initial:
        case TrainerRegistrationStatus.loading:
        case TrainerRegistrationStatus.error:
          return Container();
        case TrainerRegistrationStatus.loaded:
          return TrainerRegistrationView();
        case TrainerRegistrationStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.transparent,
      actionsPadding: EdgeInsets.only(right: 12),
      actions: [
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.favorite_border_rounded,
            color: Colors.white,
            size: 24,
          ),
        ),
        SizedBox(width: 6),
        InkWell(
          onTap: () {},
          child: Icon(Icons.share_outlined, color: Colors.white, size: 22),
        ),
      ],
    );

    return MultiBlocProvider(
      providers: [trainerBlocProvider()],
      child: MultiBlocListener(
        listeners: [trainerBlocDetailener()],
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          appBar: appBar,
          body: BlocBuilder<TrainerRegistrationCubit, TrainerRegistrationState>(
            builder: trainerBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
