// generators/models/attribute_range.dart
class AttributeRange {
  final int minStrong;
  final int maxStrong;
  final int minNormal;
  final int maxNormal;
  final int minWeak;
  final int maxWeak;

  const AttributeRange({
    required this.minStrong,
    required this.maxStrong,
    required this.minNormal,
    required this.maxNormal,
    required this.minWeak,
    required this.maxWeak,
  });

  int getStrongValue() =>
      minStrong +
      (DateTime.now().millisecondsSinceEpoch % (maxStrong - minStrong + 1))
          .toInt();
  int getNormalValue() =>
      minNormal +
      (DateTime.now().millisecondsSinceEpoch % (maxNormal - minNormal + 1))
          .toInt();
  int getWeakValue() =>
      minWeak +
      (DateTime.now().millisecondsSinceEpoch % (maxWeak - minWeak + 1)).toInt();
}
