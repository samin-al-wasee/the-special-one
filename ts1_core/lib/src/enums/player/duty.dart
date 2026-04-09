enum Duty {
  defend('Defend'),
  support('Support'),
  attack('Attack'),
  balanced('Balanced');

  const Duty(this.label);

  final String label;

  static Duty fromLabel(String value) {
    final normalized = value.trim();
    return Duty.values.firstWhere(
      (duty) => duty.label == normalized,
      orElse: () => throw ArgumentError('Unknown duty: $value'),
    );
  }

  @override
  String toString() => label;
}
