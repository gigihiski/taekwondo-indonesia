import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/dojang/dojang_repository.dart';
import 'package:taekwondo/features/dojang/modules/dojang-detail/logics/dojang_detail_cubit.dart';
import 'package:taekwondo/features/dojang/modules/dojang-detail/views/dojang_detail_view.dart';

class DojangDetailPage extends StatefulWidget {
  const DojangDetailPage({super.key, required this.id});

  final String id;

  static Route route(String id) {
    return MaterialPageRoute(builder: (_) => DojangDetailPage(id: id));
  }

  static RouteSettings routeSettings = const RouteSettings(
    name: "dojang-detail",
  );

  @override
  State<DojangDetailPage> createState() => DojangDetailPageState();
}

class DojangDetailPageState extends State<DojangDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider dojangBlocProvider() {
    return BlocProvider<DojangDetailCubit>(
      create: (context) =>
          DojangDetailCubit(dojangRepository: DojangRepository.create())
            ..init(widget.id),
    );
  }

  BlocListener dojangBlocDetailener() {
    return BlocListener<DojangDetailCubit, DojangDetailState>(
      listener: (context, state) {
        switch (state.status) {
          case DojangDetailStatus.initial:
          case DojangDetailStatus.loading:
          case DojangDetailStatus.error:
          case DojangDetailStatus.loaded:
          case DojangDetailStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, DojangDetailState) dojangBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case DojangDetailStatus.initial:
        case DojangDetailStatus.loading:
        case DojangDetailStatus.error:
          return Container();
        case DojangDetailStatus.loaded:
          return DojangDetailView(dojang: state.dojang!);
        case DojangDetailStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [dojangBlocProvider()],
      child: MultiBlocListener(
        listeners: [dojangBlocDetailener()],
        child: Scaffold(
          body: BlocBuilder<DojangDetailCubit, DojangDetailState>(
            builder: dojangBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
