part of 'profile_cubit.dart';

enum ProfileStatus {
  initial,
  loading,
  loaded,
  loggedOut,
  unAuthenticated,
  error,
}

class ProfileState {
  const ProfileState({
    required this.user,
    required this.status,
    required this.errorMessage,
  });

  final User? user;
  final ProfileStatus status;
  final String errorMessage;

  factory ProfileState.initial() {
    return ProfileState(
      user: null,
      status: ProfileStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  ProfileState copyWith({
    User? user,
    ProfileStatus? status,
    String? errorMessage,
  }) {
    return ProfileState(
      user: user ?? this.user,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
