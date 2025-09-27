import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taekwondo/core/services/dojang/dojang_repository.dart';
import 'package:taekwondo/core/services/dojang/models/dojang.dart';
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

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar(Dojang dojang) {
      return AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actionsPadding: EdgeInsets.only(right: 12),
        actions: [
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.favorite_border_rounded,
              color: Colors.black,
              size: 24,
            ),
          ),
          SizedBox(width: 6),
          InkWell(
            onTap: () {
              SharePlus.instance.share(
                ShareParams(subject: dojang.name, text: dojang.description),
              );
            },
            child: Icon(Icons.share_outlined, color: Colors.black, size: 22),
          ),
        ],
      );
    }

    return MultiBlocProvider(
      providers: [dojangBlocProvider()],
      child: MultiBlocListener(
        listeners: [dojangBlocDetailener()],
        child: BlocBuilder<DojangDetailCubit, DojangDetailState>(
          builder: (context, state) {
            switch (state.status) {
              case DojangDetailStatus.initial:
              case DojangDetailStatus.loading:
              case DojangDetailStatus.error:
              case DojangDetailStatus.unAuthenticated:
                return Container();
              case DojangDetailStatus.loaded:
                return Scaffold(
                  appBar: appBar(state.dojang!),
                  backgroundColor: Colors.white,
                  body: DojangDetailView(dojang: state.dojang!),
                );
            }
          },
        ),
      ),
    );
  }
}
