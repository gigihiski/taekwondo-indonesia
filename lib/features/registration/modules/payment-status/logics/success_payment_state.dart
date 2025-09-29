part of 'success_payment_cubit.dart';

enum SuccessPaymentStatus { initial, loading, loaded, error, unAuthenticated }

class SuccessPaymentState {
  const SuccessPaymentState({required this.status, required this.errorMessage});

  final SuccessPaymentStatus status;
  final String errorMessage;

  factory SuccessPaymentState.initial() {
    return SuccessPaymentState(
      status: SuccessPaymentStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  SuccessPaymentState copyWith({
    SuccessPaymentStatus? status,
    String? errorMessage,
  }) {
    return SuccessPaymentState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
