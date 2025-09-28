import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/core/services/gallery/gallery_repository.dart';
import 'package:taekwondo/core/services/gallery/models/gallery.dart';
import 'package:taekwondo/features/gallery/modules/gallery-list/logics/gallery_list_cubit.dart';
import 'package:taekwondo/features/gallery/modules/gallery-list/views/gallery_list_view.dart';

class GalleryListPage extends StatefulWidget {
  const GalleryListPage({super.key, required this.category});

  final GalleryCategory category;

  static Route route(GalleryCategory category) {
    return MaterialPageRoute(
      builder: (_) => GalleryListPage(category: category),
    );
  }

  static RouteSettings routeSettings = const RouteSettings(
    name: "gallery-list",
  );

  @override
  State<GalleryListPage> createState() => GalleryListPageState();
}

class GalleryListPageState extends State<GalleryListPage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider newsBlocProvider() {
    return BlocProvider<GalleryListCubit>(
      create: (context) =>
          GalleryListCubit(galleryRepository: GalleryRepository.create())
            ..init(widget.category.id),
    );
  }

  BlocListener newsBlocDetailener() {
    return BlocListener<GalleryListCubit, GalleryListState>(
      listener: (context, state) {
        switch (state.status) {
          case GalleryListStatus.initial:
          case GalleryListStatus.loading:
          case GalleryListStatus.error:
          case GalleryListStatus.loaded:
          case GalleryListStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, GalleryListState) newsBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case GalleryListStatus.initial:
        case GalleryListStatus.loading:
        case GalleryListStatus.error:
          return Container();
        case GalleryListStatus.loaded:
          return GalleryListView(galleries: state.galleries!);
        case GalleryListStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarHeader(
      title: widget.category.name,
      color: Colors.white,
    );

    return MultiBlocProvider(
      providers: [newsBlocProvider()],
      child: MultiBlocListener(
        listeners: [newsBlocDetailener()],
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          appBar: appBar,
          body: BlocBuilder<GalleryListCubit, GalleryListState>(
            builder: newsBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
