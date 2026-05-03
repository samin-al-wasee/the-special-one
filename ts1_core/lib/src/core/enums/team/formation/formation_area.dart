enum FormationArea {
  box('box'),
  counterRest('counter_rest'),
  firstPress('first_press'),
  leftFlank('left_flank'),
  leftHalfSpace('left_halfspace'),
  leftPressLane('left_press_lane'),
  pressShadow('press_shadow'),
  rightFlank('right_flank'),
  rightHalfSpace('right_halfspace'),
  rightPressLane('right_press_lane'),
  zone14('zone14'),
  centralBuild('central_build'),
  centralChannel('central_channel'),
  halfspaces('halfspaces');

  const FormationArea(this.code);

  final String code;

  static FormationArea fromCode(String code) {
    return FormationArea.values.firstWhere(
      (value) => value.code == code,
      orElse: () => throw ArgumentError('Unknown formation area: $code'),
    );
  }
}
