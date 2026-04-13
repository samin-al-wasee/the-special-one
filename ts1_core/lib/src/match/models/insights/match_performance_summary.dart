class MatchPerformanceSummary {
  const MatchPerformanceSummary({required this.rating});

  final double rating;

  int get stars => rating.round().clamp(0, 5);

  String get label {
    if (rating >= 4.5) {
      return 'Dominant';
    }
    if (rating >= 3.5) {
      return 'Strong';
    }
    if (rating >= 2.5) {
      return 'Even';
    }
    if (rating >= 1.5) {
      return 'Struggled';
    }
    return 'Rough';
  }
}
