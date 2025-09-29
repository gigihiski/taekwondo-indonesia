import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/core/themes/app_transition.dart';
import 'package:taekwondo/features/home/modules/home/views/home_page.dart';
import 'package:taekwondo/features/registration/modules/payment-status/logics/success_payment_cubit.dart';
import 'package:taekwondo/features/registration/modules/payment-status/views/success_payment_view.dart';

class SuccessPaymentPage extends StatefulWidget {
  const SuccessPaymentPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => SuccessPaymentPage());
  }

  static RouteSettings routeSettings = const RouteSettings(
    name: "success-payment",
  );

  @override
  State<SuccessPaymentPage> createState() => SuccessPaymentPageState();
}

class SuccessPaymentPageState extends State<SuccessPaymentPage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider paymentBlocProvider() {
    return BlocProvider<SuccessPaymentCubit>(
      create: (context) => SuccessPaymentCubit()..init(),
    );
  }

  BlocListener paymentBlocDetailener() {
    return BlocListener<SuccessPaymentCubit, SuccessPaymentState>(
      listener: (context, state) {
        switch (state.status) {
          case SuccessPaymentStatus.initial:
          case SuccessPaymentStatus.loading:
          case SuccessPaymentStatus.error:
          case SuccessPaymentStatus.loaded:
          case SuccessPaymentStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, SuccessPaymentState) paymentBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case SuccessPaymentStatus.initial:
        case SuccessPaymentStatus.loading:
        case SuccessPaymentStatus.error:
          return Container();
        case SuccessPaymentStatus.loaded:
          return SuccessPaymentView();
        case SuccessPaymentStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarHeader(
      title: "Pembayaran Berhasil",
      color: Colors.white,
      actions: [
        SizedBox(
          child: IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                AppTransition.pushTransition(
                  HomePage(),
                  HomePage.routeSettings,
                ),
                (route) => false,
              );
            },
          ),
        ),
      ],
    );

    return MultiBlocProvider(
      providers: [paymentBlocProvider()],
      child: MultiBlocListener(
        listeners: [paymentBlocDetailener()],
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar,
          body: BlocBuilder<SuccessPaymentCubit, SuccessPaymentState>(
            builder: paymentBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
