enum FormationLine {
  goalkeeper('goalkeeper'),
  defense('defense'),
  midfield('midfield'),
  wingback('wingback'),
  attack('attack'),
  attackMid('attack_mid');

  const FormationLine(this.code);

  final String code;

  static FormationLine fromCode(String code) {
    return FormationLine.values.firstWhere(
      (value) => value.code == code,
      orElse: () => throw ArgumentError('Unknown formation line: $code'),
    );
  }
}
