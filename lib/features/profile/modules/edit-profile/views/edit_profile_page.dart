import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taekwondo/core/components/app_bar.dart';
import 'package:taekwondo/features/profile/modules/edit-profile/logics/edit_profile_cubit.dart';
import 'package:taekwondo/features/profile/modules/edit-profile/views/edit_profile_view.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => EditProfilePage());
  }

  static RouteSettings routeSettings = const RouteSettings(
    name: "edit-profile",
  );

  @override
  State<EditProfilePage> createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  BlocProvider editProfileBlocProvider() {
    return BlocProvider<EditProfileCubit>(
      create: (context) => EditProfileCubit()..init(),
    );
  }

  BlocListener editProfileBlocDetailener() {
    return BlocListener<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        switch (state.status) {
          case EditProfileStatus.initial:
          case EditProfileStatus.loading:
          case EditProfileStatus.error:
          case EditProfileStatus.loaded:
          case EditProfileStatus.unAuthenticated:
        }
      },
    );
  }

  Widget Function(BuildContext, EditProfileState) editProfileBlocBuilder() {
    return (context, state) {
      switch (state.status) {
        case EditProfileStatus.initial:
        case EditProfileStatus.loading:
        case EditProfileStatus.error:
          return Container();
        case EditProfileStatus.loaded:
          return EditProfileView();
        case EditProfileStatus.unAuthenticated:
          throw UnimplementedError();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBarHeader(title: "Edit Profile", color: Colors.white);

    return MultiBlocProvider(
      providers: [editProfileBlocProvider()],
      child: MultiBlocListener(
        listeners: [editProfileBlocDetailener()],
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar,
          body: BlocBuilder<EditProfileCubit, EditProfileState>(
            builder: editProfileBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
