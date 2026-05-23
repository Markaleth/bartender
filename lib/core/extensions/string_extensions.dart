extension StringEx on String? {
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;
}
