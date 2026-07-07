class FilterOption<T> {
  final String label;
  final T value;
  final String? assetName;

  const FilterOption({
    required this.label,
    required this.value,
    this.assetName,
  });
}
