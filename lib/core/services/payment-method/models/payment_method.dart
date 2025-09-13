import 'package:taekwondo/core/models/meta.dart';

enum PaymentMethodType {
  unknown,
  cash,
  card,
  voucher,
  otherVoucher,
  otherCost,
  bank,
}

class PaymentMethod {
  final String type;
  final List<PaymentPlatform> methods;

  PaymentMethod({required this.type, required this.methods});

  PaymentMethodType get paymentMethodType {
    switch (type) {
      case "CASH":
        return PaymentMethodType.cash;
      case "CARD":
        return PaymentMethodType.card;
      case "VOUDHER":
        return PaymentMethodType.voucher;
      case "OTHER VOUCHER":
        return PaymentMethodType.otherVoucher;
      case "OTHER COST":
        return PaymentMethodType.otherCost;
      case "BANK":
        return PaymentMethodType.bank;
      default:
        return PaymentMethodType.unknown;
    }
  }

  String get paymentMethodStr {
    switch (type) {
      case "CASH":
        return "Tunai";
      case "CARD":
        return "Kartu Kredit / Debit";
      case "VOUCHER":
        return "Voucher";
      case "OTHER VOUCHER":
        return "Voucher Lain";
      case "OTHER COST":
        return "Pembiayaan Lain";
      case "BANK":
        return "Bank Transfer";
      default:
        return "Tidak Diketahui";
    }
  }

  factory PaymentMethod.fromMap(Map<String, dynamic> map) {
    return PaymentMethod(
      type: map['type'],
      methods: map['methods'] != null
          ? List<PaymentPlatform>.from(
              map['methods']?.map((x) => PaymentPlatform.fromMap(x)),
            )
          : [],
    );
  }
}

class PaymentPlatform {
  final int id;
  final String code;
  final String name;
  final String? description;

  PaymentPlatform({
    required this.id,
    required this.code,
    required this.name,
    this.description,
  });

  factory PaymentPlatform.fromMap(Map<String, dynamic> map) {
    return PaymentPlatform(
      id: map['id'],
      code: map['code'],
      name: map['name'],
      description: map['description'] ?? "",
    );
  }
}

class PaymentMethodsResponse {
  final Meta meta;
  final List<PaymentMethod> data;

  PaymentMethodsResponse({required this.meta, required this.data});

  factory PaymentMethodsResponse.fromJson(Map<String, dynamic> json) {
    return PaymentMethodsResponse(
      meta: Meta.fromMap(json['meta']),
      data: List<PaymentMethod>.from(
        json["data"].map((x) => PaymentMethod.fromMap(x)),
      ),
    );
  }
}
