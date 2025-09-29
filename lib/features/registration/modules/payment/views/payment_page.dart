import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/features/registration/modules/payment/logics/payment_cubit.dart';
import 'package:taekwondo/features/registration/modules/payment/views/payment_view.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => PaymentPage());
  }

  static RouteSettings routeSettings = const RouteSettings(name: "payment");

  @override
  State<PaymentPage> createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider paymentBlocProvider() {
    return BlocProvider<PaymentCubit>(
      create: (context) => PaymentCubit()..init(),
    );
  }

  BlocListener paymentBlocDetailener() {
    return BlocListener<PaymentCubit, PaymentState>(
      listener: (context, state) {
        switch (state.status) {
          case PaymentStatus.initial:
          case PaymentStatus.loading:
          case PaymentStatus.error:
          case PaymentStatus.loaded:
          case PaymentStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, PaymentState) paymentBlocBuilder() {
    return (context, state) {
      print(state.status);
      switch (state.status) {
        case PaymentStatus.initial:
        case PaymentStatus.loading:
        case PaymentStatus.error:
          return Container();
        case PaymentStatus.loaded:
          return PaymentView();
        case PaymentStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarHeader(title: "Pembayaran", color: Colors.white);

    return MultiBlocProvider(
      providers: [paymentBlocProvider()],
      child: MultiBlocListener(
        listeners: [paymentBlocDetailener()],
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar,
          body: BlocBuilder<PaymentCubit, PaymentState>(
            builder: paymentBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
