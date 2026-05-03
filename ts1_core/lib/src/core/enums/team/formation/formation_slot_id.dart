enum FormationSlotId {
  gk('GK'),
  rb('RB'),
  rcb('RCB'),
  cb('CB'),
  lcb('LCB'),
  lb('LB'),
  rdm('RDM'),
  dm('DM'),
  ldm('LDM'),
  rm('RM'),
  rcm('RCM'),
  cm('CM'),
  lcm('LCM'),
  lm('LM'),
  ram('RAM'),
  am('AM'),
  lam('LAM'),
  rw('RW'),
  lw('LW'),
  rst('RST'),
  st('ST'),
  lst('LST'),
  cam('CAM');

  const FormationSlotId(this.code);

  final String code;

  static FormationSlotId fromCode(String code) {
    return FormationSlotId.values.firstWhere(
      (value) => value.code == code,
      orElse: () => throw ArgumentError('Unknown formation slot id: $code'),
    );
  }
}
