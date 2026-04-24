const int defaultAttr = 50;

/// Safely get attribute value from a map
int getPlayerAttr(
  Map<String, int>? bucket,
  Object key, {
  int defaultValue = defaultAttr,
}) {
  if (bucket == null || bucket.isEmpty) return defaultValue;

  final keyStr = key.toString().trim();

  // Direct match
  if (bucket.containsKey(keyStr)) return bucket[keyStr]!;

  // Snake case conversion
  final snakeKey = keyStr
      .toLowerCase()
      .replaceAll('-', ' ')
      .split(RegExp(r'\s+'))
      .where((part) => part.isNotEmpty)
      .join('_');
  final titleKey = snakeKey
      .split('_')
      .where((part) => part.isNotEmpty)
      .map((e) => e[0].toUpperCase() + e.substring(1))
      .join(' ');

  if (bucket.containsKey(snakeKey)) return bucket[snakeKey]!;
  if (bucket.containsKey(titleKey)) return bucket[titleKey]!;

  // Backwards compatibility: short_passing <-> passing
  if (snakeKey == 'short_passing') {
    if (bucket.containsKey('passing')) return bucket['passing']!;
    if (bucket.containsKey('Passing')) return bucket['Passing']!;
  }
  if (snakeKey == 'passing') {
    if (bucket.containsKey('short_passing')) return bucket['short_passing']!;
    if (bucket.containsKey('Short Passing')) {
      return bucket['Short Passing']!;
    }
  }

  return defaultValue;
}
