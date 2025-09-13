class NameParts {
  final String firstName;
  final String lastName;

  NameParts(
    this.firstName,
    this.lastName,
  );
}

extension NameSplitExt on String {
  NameParts splitFullName() {
    if (isEmpty) return NameParts('', '');

    final parts = trim().split(RegExp(r'\s+'));

    if (parts.isEmpty) return NameParts('', '');
    if (parts.length == 1) return NameParts(parts[0], '');

    return NameParts(
      parts.first,
      parts.last,
    );
  }
}
