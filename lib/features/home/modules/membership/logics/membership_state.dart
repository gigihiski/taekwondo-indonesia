part of 'membership_cubit.dart';

enum MembershipStatus {
  initial,
  loading,
  loaded,
  unAuthenticated,
  error,
}

class MembershipState {
  const MembershipState({
    required this.status,
    required this.errorMessage,
    required this.reward,
  });

  final MembershipStatus status;
  final String errorMessage;
  final Reward? reward;

  factory MembershipState.initial() {
    return MembershipState(
      status: MembershipStatus.initial,
      errorMessage: "Unknown - Default",
      reward: null,
    );
  }

  MembershipState copyWith({
    MembershipStatus? status,
    String? errorMessage,
    Reward? reward,
  }) {
    return MembershipState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      reward: reward ?? this.reward,
    );
  }
}
