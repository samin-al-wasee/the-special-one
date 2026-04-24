T enumFromLabel<T extends Enum>(
  List<T> values,
  String Function(T value) labelOf,
  String value,
  String enumName,
) {
  final normalized = value.trim();
  return values.firstWhere(
    (item) => labelOf(item) == normalized,
    orElse: () => throw ArgumentError('Unknown $enumName: $value'),
  );
}
