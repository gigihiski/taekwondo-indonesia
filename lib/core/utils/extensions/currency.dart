import 'dart:math';

import 'package:intl/intl.dart';

extension StringGlobalExt on String {
  String parseCountryCodeToCurrency() {
    switch (toUpperCase()) {
      case "USD":
        return "\$";
      default:
        return "Rp";
    }
  }
}

extension DoubleGlobalExt on double {
  double roundDecimalNumber(int decimals) {
    final corr = 0.5 * pow(0.1, decimals);
    return this + corr;
  }
}

extension NumGlobalExt on num {
  String get formattedPrice {
    final formatted = NumberFormat("#,##0", "en_US");
    return formatted.format(this);
  }
}
