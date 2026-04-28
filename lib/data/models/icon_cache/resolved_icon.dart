class ResolvedIcon {
  final String packageName;
  final String? iconUrl;
  final bool isSvg;
  final DateTime resolvedAt;

  ResolvedIcon({
    required this.packageName,
    this.iconUrl,
    required this.isSvg,
    required this.resolvedAt,
  });
}
