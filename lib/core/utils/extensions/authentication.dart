extension StringGlobalExt on String {
  bool isUnaunthenticatedResponse() {
    if (toLowerCase().contains("expired") || toLowerCase().contains("token")) {
      return true;
    }
    return false;
  }
}
