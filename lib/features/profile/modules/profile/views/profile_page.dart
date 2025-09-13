import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/services/authentication/authentication_repository.dart';
import 'package:taekwondo/core/services/storages/profile_storage.dart';
import 'package:taekwondo/core/themes/app_colors.dart';
import 'package:taekwondo/core/themes/app_transition.dart';
import 'package:taekwondo/features/authentication/modules/login/views/login_page.dart';
import 'package:taekwondo/features/profile/modules/profile/logics/profile_cubit.dart';
import 'package:taekwondo/features/profile/modules/profile/views/profile_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => ProfilePage());
  }

  static RouteSettings routeSettings = const RouteSettings(name: "profile");

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider profileBlocProvider() {
      return BlocProvider<ProfileCubit>(
        create: (context) => ProfileCubit(
          AuthenticationRepository.create(),
          ProfileStorage.create(),
        )..init(),
      );
    }

    BlocListener profileBlocListener() {
      return BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          switch (state.status) {
            case ProfileStatus.initial:
            case ProfileStatus.error:
            case ProfileStatus.unAuthenticated:
            case ProfileStatus.loading:
            case ProfileStatus.loaded:
              break;
            case ProfileStatus.loggedOut:
              Navigator.of(context).pushAndRemoveUntil(
                AppTransition.pushTransition(
                  LoginPage(),
                  LoginPage.routeSettings,
                ),
                (route) => false,
              );
              break;
          }
        },
      );
    }

    Widget Function(BuildContext, ProfileState) profileBlocBuilder() {
      return (context, state) {
        switch (state.status) {
          case ProfileStatus.initial:
          case ProfileStatus.error:
          case ProfileStatus.unAuthenticated:
            throw UnimplementedError();
          case ProfileStatus.loading:
            return Container();
          case ProfileStatus.loggedOut:
          case ProfileStatus.loaded:
            return ProfileView(user: state.user);
        }
      };
    }

    return MultiBlocProvider(
      providers: [profileBlocProvider()],
      child: MultiBlocListener(
        listeners: [profileBlocListener()],
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: BlocBuilder<ProfileCubit, ProfileState>(
            builder: profileBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
