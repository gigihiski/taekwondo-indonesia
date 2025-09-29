import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/core/services/transaction/transaction_repository.dart';
import 'package:taekwondo/features/home/modules/transaction-list/logics/transaction_list_cubit.dart';
import 'package:taekwondo/features/home/modules/transaction-list/views/transaction_list_view.dart';

class TransactionListPage extends StatefulWidget {
  const TransactionListPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => TransactionListPage());
  }

  static RouteSettings routeSettings = const RouteSettings(
    name: "transaction-list",
  );

  @override
  State<TransactionListPage> createState() => TransactionListPageState();
}

class TransactionListPageState extends State<TransactionListPage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider newsBlocProvider() {
    return BlocProvider<TransactionListCubit>(
      create: (context) => TransactionListCubit(
        transactionRepository: TransactionRepository.create(),
      )..init(),
    );
  }

  BlocListener newsBlocDetailener() {
    return BlocListener<TransactionListCubit, TransactionListState>(
      listener: (context, state) {
        switch (state.status) {
          case TransactionListStatus.initial:
          case TransactionListStatus.loading:
          case TransactionListStatus.error:
          case TransactionListStatus.loaded:
          case TransactionListStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, TransactionListState) newsBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case TransactionListStatus.initial:
        case TransactionListStatus.loading:
        case TransactionListStatus.error:
          return Container();
        case TransactionListStatus.loaded:
          return TransactionListView(transactions: state.transactions!);
        case TransactionListStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarHeader(
      title: "Transaksi",
      color: Colors.white,
      isEnabledBackButton: false,
    );

    return MultiBlocProvider(
      providers: [newsBlocProvider()],
      child: MultiBlocListener(
        listeners: [newsBlocDetailener()],
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          appBar: appBar,
          body: BlocBuilder<TransactionListCubit, TransactionListState>(
            builder: newsBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
