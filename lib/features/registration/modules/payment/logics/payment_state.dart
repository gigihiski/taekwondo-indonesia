part of 'payment_cubit.dart';

enum PaymentStatus {
  initial,
  loading,
  loaded,
  error,
  unAuthenticated,
}

class PaymentState {
  const PaymentState({
    required this.status,
    required this.errorMessage,
  });

  final PaymentStatus status;
  final String errorMessage;

  factory PaymentState.initial() {
    return PaymentState(
      status: PaymentStatus.initial,
      errorMessage: "Unknown - Default",
    );
  }

  PaymentState copyWith({
    PaymentStatus? status,
    String? errorMessage,
  }) {
    return PaymentState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
