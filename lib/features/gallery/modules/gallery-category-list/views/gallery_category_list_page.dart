import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/core/services/gallery/gallery_repository.dart';
import 'package:taekwondo/features/gallery/modules/gallery-category-list/logics/gallery_category_list_cubit.dart';
import 'package:taekwondo/features/gallery/modules/gallery-category-list/views/gallery_category_list_view.dart';

class GalleryCategoryListPage extends StatefulWidget {
  const GalleryCategoryListPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => GalleryCategoryListPage());
  }

  static RouteSettings routeSettings = const RouteSettings(name: "news-list");

  @override
  State<GalleryCategoryListPage> createState() =>
      GalleryCategoryListPageState();
}

class GalleryCategoryListPageState extends State<GalleryCategoryListPage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider galleryBlocProvider() {
    return BlocProvider<GalleryCategoryListCubit>(
      create: (context) => GalleryCategoryListCubit(
        galleryRepository: GalleryRepository.create(),
      )..init(),
    );
  }

  BlocListener galleryBlocListener() {
    return BlocListener<GalleryCategoryListCubit, GalleryCategoryListState>(
      listener: (context, state) {
        switch (state.status) {
          case GalleryCategoryListStatus.initial:
          case GalleryCategoryListStatus.loading:
          case GalleryCategoryListStatus.error:
          case GalleryCategoryListStatus.loaded:
          case GalleryCategoryListStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, GalleryCategoryListState) galleryBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case GalleryCategoryListStatus.initial:
        case GalleryCategoryListStatus.loading:
        case GalleryCategoryListStatus.error:
          return Container();
        case GalleryCategoryListStatus.loaded:
          return GalleryCategoryListView(categories: state.categories);
        case GalleryCategoryListStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarHeader(title: "Gallery", color: Colors.white);

    return MultiBlocProvider(
      providers: [galleryBlocProvider()],
      child: MultiBlocListener(
        listeners: [galleryBlocListener()],
        child: Scaffold(
          appBar: appBar,
          body: BlocBuilder<GalleryCategoryListCubit, GalleryCategoryListState>(
            builder: galleryBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
