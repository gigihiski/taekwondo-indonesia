import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/core/services/banner/banner_repository.dart';
import 'package:taekwondo/core/services/event/event_repository.dart';
import 'package:taekwondo/core/services/gallery/gallery_repository.dart';
import 'package:taekwondo/core/services/news/news_repository.dart';
import 'package:taekwondo/core/services/storages/profile_storage.dart';
import 'package:taekwondo/features/home/modules/home/logics/home_cubit.dart';
import 'package:taekwondo/features/home/modules/home/views/home_view.dart';
import 'package:taekwondo/features/home/views/components/home_navigation.dart';
import 'package:taekwondo/features/profile/modules/profile/views/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => HomePage());
  }

  static RouteSettings routeSettings = const RouteSettings(name: "home");

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late int currentIndex;
  late String? tableName;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    tableName = null;
  }

  BlocProvider homeBlocProvider() {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(
        profileStorage: ProfileStorage.create(),
        eventRepository: EventRepository.create(),
        newsRepository: NewsRepository.create(),
        galleryRepository: GalleryRepository.create(),
        bannerRepository: BannerRepository.create(),
      )..init(),
    );
  }

  BlocListener homeBlocListener() {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        switch (state.status) {
          case HomeStatus.initial:
          case HomeStatus.loading:
          case HomeStatus.error:
          case HomeStatus.loaded:
          case HomeStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, HomeState) homeBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case HomeStatus.initial:
        case HomeStatus.loading:
        case HomeStatus.error:
          return Container();
        case HomeStatus.loaded:
          return HomeView(
            user: state.user!,
            events: state.events,
            news: state.news,
            galleries: state.galleries,
            banners: state.banners,
          );
        case HomeStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  Widget showPage(int index) {
    switch (index) {
      case 1:
        return Container();
      case 2:
        return Container();
      case 3:
        return ProfilePage();
      default:
        return BlocBuilder<HomeCubit, HomeState>(builder: homeBlocBuilder());
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarHeader(height: 0);

    return MultiBlocProvider(
      providers: [homeBlocProvider()],
      child: MultiBlocListener(
        listeners: [homeBlocListener()],
        child: Scaffold(
          appBar: appBar,
          body: showPage(currentIndex),
          extendBody: true,
          backgroundColor: Colors.white,
          bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return DashboardBottomNavigationBar(
                currentIndex: currentIndex,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
