import 'dart:developer';
import 'package:flutter/foundation.dart';

appNetworkLogger({
  required String endpoint,
  required String payload,
  required String response,
}) {
  if (kDebugMode) {
    log("============================================================================================================");
    String text = "$endpoint\nPAYLOAD => $payload\nRESPONSE => $response";
    log("\x1B[32m$text\x1B[0m ");
    log("============================================================================================================");
  }
}
