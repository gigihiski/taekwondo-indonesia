import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/core/services/dojang/dojang_repository.dart';
import 'package:taekwondo/features/dojang/modules/dojang-list/logics/dojang_list_cubit.dart';
import 'package:taekwondo/features/dojang/modules/dojang-list/views/dojang_list_view.dart';

class DojangListPage extends StatefulWidget {
  const DojangListPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => DojangListPage());
  }

  static RouteSettings routeSettings = const RouteSettings(name: "dojang-list");

  @override
  State<DojangListPage> createState() => DojangListPageState();
}

class DojangListPageState extends State<DojangListPage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider dojangBlocProvider() {
    return BlocProvider<DojangListCubit>(
      create: (context) =>
          DojangListCubit(dojangRepository: DojangRepository.create())..init(),
    );
  }

  BlocListener dojangBlocListener() {
    return BlocListener<DojangListCubit, DojangListState>(
      listener: (context, state) {
        switch (state.status) {
          case DojangListStatus.initial:
          case DojangListStatus.loading:
          case DojangListStatus.error:
          case DojangListStatus.loaded:
          case DojangListStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, DojangListState) dojangBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case DojangListStatus.initial:
        case DojangListStatus.loading:
        case DojangListStatus.error:
          return Container();
        case DojangListStatus.loaded:
          return DojangListView(dojangs: state.dojangs);
        case DojangListStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarHeader(title: "Dojang", color: Colors.white);

    return MultiBlocProvider(
      providers: [dojangBlocProvider()],
      child: MultiBlocListener(
        listeners: [dojangBlocListener()],
        child: Scaffold(
          appBar: appBar,
          body: BlocBuilder<DojangListCubit, DojangListState>(
            builder: dojangBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
