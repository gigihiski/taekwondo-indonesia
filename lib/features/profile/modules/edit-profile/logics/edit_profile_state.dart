part of 'edit_profile_cubit.dart';

enum EditProfileStatus { initial, loading, loaded, error, unAuthenticated }

class EditProfileState {
  const EditProfileState({required this.status, required this.errorMessage});

  final EditProfileStatus status;
  final String errorMessage;

  factory EditProfileState.initial() {
    return EditProfileState(
      status: EditProfileStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  EditProfileState copyWith({EditProfileStatus? status, String? errorMessage}) {
    return EditProfileState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
