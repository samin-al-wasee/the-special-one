import 'package:ts1_core/src/enums/match/pitch_zone.dart';
import 'package:ts1_core/src/enums/player/position.dart';
import 'package:ts1_core/src/models/team/lineup/formation/shape/formation_shape.dart';
import 'package:ts1_core/src/models/team/lineup/formation/slot/formation_slot.dart';

/// Factory for canonical formation shapes.
class FormationFactory {
  const FormationFactory._();

  static const Set<String> supportedCodes = {
    '4-3-3',
    '4-2-3-1',
    '3-5-2',
    '4-4-2',
    '4-5-1',
    '4-1-4-1',
    '4-1-2-1-2',
    '4-3-1-2',
    '4-2-2-2',
    '4-2-4',
    '4-3-2-1',
    '3-4-3',
    '3-4-2-1',
    '3-4-1-2',
    '5-3-2',
    '5-4-1',
    '5-2-3',
  };

  static FormationShape byCode(String code) {
    final compact = _compactCode(code);

    switch (compact) {
      case '433':
        return _shape(
          id: 433,
          code: '4-3-3',
          slotDefinitions: _slots433(),
          structuralTags: const {
            'natural_width': 0.78,
            'central_compactness': 0.62,
            'rest_defense_shape': 0.58,
            'press_front_line': 0.70,
          },
        );
      case '4231':
        return _shape(
          id: 4231,
          code: '4-2-3-1',
          slotDefinitions: _slots4231(),
          structuralTags: const {
            'natural_width': 0.72,
            'central_compactness': 0.68,
            'rest_defense_shape': 0.74,
            'press_front_line': 0.66,
          },
        );
      case '352':
        return _shape(
          id: 352,
          code: '3-5-2',
          slotDefinitions: _slots352(),
          structuralTags: const {
            'natural_width': 0.80,
            'central_compactness': 0.76,
            'rest_defense_shape': 0.81,
            'press_front_line': 0.64,
          },
        );
      case '442':
        return _shape(
          id: 442,
          code: '4-4-2',
          slotDefinitions: _slots442Wide(),
          structuralTags: const {
            'natural_width': 0.74,
            'central_compactness': 0.64,
            'rest_defense_shape': 0.69,
            'press_front_line': 0.62,
          },
        );
      case '451':
        return _shape(
          id: 451,
          code: '4-5-1',
          slotDefinitions: _slots451(),
          structuralTags: const {
            'natural_width': 0.70,
            'central_compactness': 0.75,
            'rest_defense_shape': 0.78,
            'press_front_line': 0.56,
          },
        );
      case '4141':
        return _shape(
          id: 4141,
          code: '4-1-4-1',
          slotDefinitions: _slots4141(),
          structuralTags: const {
            'natural_width': 0.72,
            'central_compactness': 0.79,
            'rest_defense_shape': 0.80,
            'press_front_line': 0.58,
          },
        );
      case '41212':
      case '442diamond':
      case 'diamond':
        return _shape(
          id: 41212,
          code: '4-1-2-1-2',
          slotDefinitions: _slots41212Diamond(),
          structuralTags: const {
            'natural_width': 0.48,
            'central_compactness': 0.86,
            'rest_defense_shape': 0.73,
            'press_front_line': 0.68,
          },
        );
      case '4312':
        return _shape(
          id: 4312,
          code: '4-3-1-2',
          slotDefinitions: _slots4312Narrow(),
          structuralTags: const {
            'natural_width': 0.50,
            'central_compactness': 0.82,
            'rest_defense_shape': 0.71,
            'press_front_line': 0.67,
          },
        );
      case '4222':
        return _shape(
          id: 4222,
          code: '4-2-2-2',
          slotDefinitions: _slots4222Box(),
          structuralTags: const {
            'natural_width': 0.52,
            'central_compactness': 0.84,
            'rest_defense_shape': 0.72,
            'press_front_line': 0.69,
          },
        );
      case '424':
        return _shape(
          id: 424,
          code: '4-2-4',
          slotDefinitions: _slots424Wide(),
          structuralTags: const {
            'natural_width': 0.86,
            'central_compactness': 0.54,
            'rest_defense_shape': 0.49,
            'press_front_line': 0.75,
          },
        );
      case '4321':
        return _shape(
          id: 4321,
          code: '4-3-2-1',
          slotDefinitions: _slots4321ChristmasTree(),
          structuralTags: const {
            'natural_width': 0.54,
            'central_compactness': 0.81,
            'rest_defense_shape': 0.76,
            'press_front_line': 0.63,
          },
        );
      case '343':
        return _shape(
          id: 343,
          code: '3-4-3',
          slotDefinitions: _slots343Wide(),
          structuralTags: const {
            'natural_width': 0.88,
            'central_compactness': 0.63,
            'rest_defense_shape': 0.61,
            'press_front_line': 0.74,
          },
        );
      case '3421':
        return _shape(
          id: 3421,
          code: '3-4-2-1',
          slotDefinitions: _slots3421(),
          structuralTags: const {
            'natural_width': 0.78,
            'central_compactness': 0.73,
            'rest_defense_shape': 0.70,
            'press_front_line': 0.66,
          },
        );
      case '3412':
        return _shape(
          id: 3412,
          code: '3-4-1-2',
          slotDefinitions: _slots3412(),
          structuralTags: const {
            'natural_width': 0.74,
            'central_compactness': 0.78,
            'rest_defense_shape': 0.69,
            'press_front_line': 0.68,
          },
        );
      case '532':
        return _shape(
          id: 532,
          code: '5-3-2',
          slotDefinitions: _slots532(),
          structuralTags: const {
            'natural_width': 0.73,
            'central_compactness': 0.79,
            'rest_defense_shape': 0.86,
            'press_front_line': 0.55,
          },
        );
      case '541':
        return _shape(
          id: 541,
          code: '5-4-1',
          slotDefinitions: _slots541(),
          structuralTags: const {
            'natural_width': 0.69,
            'central_compactness': 0.83,
            'rest_defense_shape': 0.89,
            'press_front_line': 0.50,
          },
        );
      case '523':
        return _shape(
          id: 523,
          code: '5-2-3',
          slotDefinitions: _slots523(),
          structuralTags: const {
            'natural_width': 0.85,
            'central_compactness': 0.62,
            'rest_defense_shape': 0.80,
            'press_front_line': 0.67,
          },
        );
      default:
        // Keep runtime robust by defaulting to a broadly balanced shape.
        return byCode('4-3-3');
    }
  }

  static FormationShape _shape({
    required int id,
    required String code,
    required List<FormationSlot> slotDefinitions,
    required Map<String, double> structuralTags,
  }) {
    return FormationShape(
      id: id,
      code: code,
      slotDefinitions: slotDefinitions,
      structuralTags: structuralTags,
    );
  }

  static String _compactCode(String code) {
    return code.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
  }

  static FormationSlot _slot(
    int id,
    String slotId,
    PitchZone zone,
    String line,
    List<Position> preferredPositions, {
    List<String> adjacency = const <String>[],
    List<String> support = const <String>[],
    List<String> lanes = const <String>[],
    List<String> defensive = const <String>[],
  }) {
    return FormationSlot(
      id: id,
      slotId: slotId,
      baseZone: zone,
      line: line,
      lateralBand: FormationSlot.lateralBandForZone(zone),
      verticalBand: FormationSlot.verticalBandForZone(zone),
      preferredPositions: preferredPositions,
      adjacencySlots: adjacency,
      supportLinks: support,
      attackingLaneAccess: lanes,
      defensiveResponsibility: defensive,
    );
  }

  static List<FormationSlot> _slots433() {
    return [
      _slot(
        1,
        'GK',
        PitchZone.cb,
        'goalkeeper',
        [Position.goalKeeper],
        adjacency: ['RCB', 'LCB'],
        support: ['RCB', 'LCB', 'DM'],
        lanes: ['central_build'],
        defensive: ['box'],
      ),
      _slot(
        2,
        'RB',
        PitchZone.rb,
        'defense',
        [Position.rightBack],
        adjacency: ['RCB', 'RCM', 'RW'],
        support: ['RCM', 'RW'],
        lanes: ['right_flank', 'right_halfspace'],
        defensive: ['right_flank'],
      ),
      _slot(
        3,
        'RCB',
        PitchZone.rcb,
        'defense',
        [Position.centerBack],
        adjacency: ['GK', 'RB', 'LCB', 'DM'],
        support: ['RB', 'DM'],
        lanes: ['central_build'],
        defensive: ['box', 'right_halfspace'],
      ),
      _slot(
        4,
        'LCB',
        PitchZone.lcb,
        'defense',
        [Position.centerBack],
        adjacency: ['GK', 'LB', 'RCB', 'DM'],
        support: ['LB', 'DM'],
        lanes: ['central_build'],
        defensive: ['box', 'left_halfspace'],
      ),
      _slot(
        5,
        'LB',
        PitchZone.lb,
        'defense',
        [Position.leftBack],
        adjacency: ['LCB', 'LCM', 'LW'],
        support: ['LCM', 'LW'],
        lanes: ['left_flank', 'left_halfspace'],
        defensive: ['left_flank'],
      ),
      _slot(
        6,
        'DM',
        PitchZone.cm,
        'midfield',
        [Position.defensiveMidfielder, Position.centralMidfielder],
        adjacency: ['RCB', 'LCB', 'RCM', 'LCM', 'ST'],
        support: ['RCM', 'LCM', 'ST'],
        lanes: ['central_build', 'halfspaces'],
        defensive: ['zone14', 'counter_rest'],
      ),
      _slot(
        7,
        'RCM',
        PitchZone.rcm,
        'midfield',
        [Position.centralMidfielder, Position.defensiveMidfielder],
        adjacency: ['RB', 'DM', 'ST', 'RW'],
        support: ['RB', 'RW', 'ST'],
        lanes: ['right_halfspace'],
        defensive: ['right_halfspace'],
      ),
      _slot(
        8,
        'LCM',
        PitchZone.lcm,
        'midfield',
        [Position.centralMidfielder, Position.defensiveMidfielder],
        adjacency: ['LB', 'DM', 'ST', 'LW'],
        support: ['LB', 'LW', 'ST'],
        lanes: ['left_halfspace'],
        defensive: ['left_halfspace'],
      ),
      _slot(
        9,
        'RW',
        PitchZone.rw,
        'attack',
        [Position.rightWinger, Position.attackingMidfielder],
        adjacency: ['RB', 'RCM', 'ST'],
        support: ['RB', 'RCM', 'ST'],
        lanes: ['right_flank', 'right_halfspace'],
        defensive: ['right_press_lane'],
      ),
      _slot(
        10,
        'LW',
        PitchZone.lw,
        'attack',
        [Position.leftWinger, Position.attackingMidfielder],
        adjacency: ['LB', 'LCM', 'ST'],
        support: ['LB', 'LCM', 'ST'],
        lanes: ['left_flank', 'left_halfspace'],
        defensive: ['left_press_lane'],
      ),
      _slot(
        11,
        'ST',
        PitchZone.cf,
        'attack',
        [Position.striker],
        adjacency: ['RW', 'LW', 'RCM', 'LCM', 'DM'],
        support: ['RW', 'LW', 'RCM', 'LCM'],
        lanes: ['box', 'central_channel'],
        defensive: ['first_press'],
      ),
    ];
  }

  static List<FormationSlot> _slots4231() {
    return [
      ..._backFourBase(),
      _slot(
        6,
        'RDM',
        PitchZone.rcm,
        'midfield',
        [Position.defensiveMidfielder, Position.centralMidfielder],
        adjacency: ['RCB', 'RB', 'LDM', 'AM'],
        support: ['RB', 'AM', 'RW'],
        lanes: ['right_halfspace'],
        defensive: ['counter_rest', 'zone14'],
      ),
      _slot(
        7,
        'LDM',
        PitchZone.lcm,
        'midfield',
        [Position.defensiveMidfielder, Position.centralMidfielder],
        adjacency: ['LCB', 'LB', 'RDM', 'AM'],
        support: ['LB', 'AM', 'LW'],
        lanes: ['left_halfspace'],
        defensive: ['counter_rest', 'zone14'],
      ),
      _slot(
        8,
        'AM',
        PitchZone.cf,
        'attack_mid',
        [Position.attackingMidfielder, Position.centralMidfielder],
        adjacency: ['RDM', 'LDM', 'RW', 'LW', 'ST'],
        support: ['RW', 'LW', 'ST'],
        lanes: ['halfspaces', 'central_channel'],
        defensive: ['press_shadow'],
      ),
      _slot(
        9,
        'RW',
        PitchZone.rw,
        'attack',
        [Position.rightWinger, Position.attackingMidfielder],
        adjacency: ['RB', 'RDM', 'AM', 'ST'],
        support: ['RB', 'RDM', 'AM', 'ST'],
        lanes: ['right_flank', 'right_halfspace'],
        defensive: ['right_press_lane'],
      ),
      _slot(
        10,
        'LW',
        PitchZone.lw,
        'attack',
        [Position.leftWinger, Position.attackingMidfielder],
        adjacency: ['LB', 'LDM', 'AM', 'ST'],
        support: ['LB', 'LDM', 'AM', 'ST'],
        lanes: ['left_flank', 'left_halfspace'],
        defensive: ['left_press_lane'],
      ),
      _slot(
        11,
        'ST',
        PitchZone.cf,
        'attack',
        [Position.striker],
        adjacency: ['RW', 'LW', 'AM'],
        support: ['RW', 'LW', 'AM'],
        lanes: ['box', 'central_channel'],
        defensive: ['first_press'],
      ),
    ];
  }

  static List<FormationSlot> _slots352() {
    return [
      ..._backThreeBase(),
      _slot(
        5,
        'RWB',
        PitchZone.rm,
        'wingback',
        [Position.rightBack, Position.rightWinger],
        adjacency: ['RCB', 'RCM', 'RST'],
        support: ['RCM', 'RST'],
        lanes: ['right_flank'],
        defensive: ['right_flank', 'right_press_lane'],
      ),
      _slot(
        6,
        'LWB',
        PitchZone.lm,
        'wingback',
        [Position.leftBack, Position.leftWinger],
        adjacency: ['LCB', 'LCM', 'LST'],
        support: ['LCM', 'LST'],
        lanes: ['left_flank'],
        defensive: ['left_flank', 'left_press_lane'],
      ),
      _slot(
        7,
        'DM',
        PitchZone.cm,
        'midfield',
        [Position.defensiveMidfielder, Position.centralMidfielder],
        adjacency: ['CB', 'RCM', 'LCM'],
        support: ['RCM', 'LCM'],
        lanes: ['central_build'],
        defensive: ['counter_rest', 'zone14'],
      ),
      _slot(
        8,
        'RCM',
        PitchZone.rcm,
        'midfield',
        [Position.centralMidfielder, Position.defensiveMidfielder],
        adjacency: ['RWB', 'DM', 'RST'],
        support: ['RWB', 'RST'],
        lanes: ['right_halfspace'],
        defensive: ['right_halfspace'],
      ),
      _slot(
        9,
        'LCM',
        PitchZone.lcm,
        'midfield',
        [Position.centralMidfielder, Position.defensiveMidfielder],
        adjacency: ['LWB', 'DM', 'LST'],
        support: ['LWB', 'LST'],
        lanes: ['left_halfspace'],
        defensive: ['left_halfspace'],
      ),
      _slot(
        10,
        'RST',
        PitchZone.rhs,
        'attack',
        [Position.striker],
        adjacency: ['RWB', 'RCM', 'LST'],
        support: ['RWB', 'RCM', 'LST'],
        lanes: ['box', 'right_halfspace'],
        defensive: ['first_press'],
      ),
      _slot(
        11,
        'LST',
        PitchZone.lhs,
        'attack',
        [Position.striker],
        adjacency: ['LWB', 'LCM', 'RST'],
        support: ['LWB', 'LCM', 'RST'],
        lanes: ['box', 'left_halfspace'],
        defensive: ['first_press'],
      ),
    ];
  }

  static List<FormationSlot> _slots442Wide() {
    return [
      ..._backFourBase(),
      _slot(
        6,
        'RM',
        PitchZone.rm,
        'midfield',
        [Position.rightWinger, Position.rightBack],
        lanes: ['right_flank'],
        defensive: ['right_flank'],
      ),
      _slot(7, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(8, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(
        9,
        'LM',
        PitchZone.lm,
        'midfield',
        [Position.leftWinger, Position.leftBack],
        lanes: ['left_flank'],
        defensive: ['left_flank'],
      ),
      _slot(10, 'RST', PitchZone.rhs, 'attack', [Position.striker]),
      _slot(11, 'LST', PitchZone.lhs, 'attack', [Position.striker]),
    ];
  }

  static List<FormationSlot> _slots451() {
    return [
      ..._backFourBase(),
      _slot(6, 'RM', PitchZone.rm, 'midfield', [Position.rightWinger]),
      _slot(7, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(8, 'DM', PitchZone.cm, 'midfield', [Position.defensiveMidfielder]),
      _slot(9, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(10, 'LM', PitchZone.lm, 'midfield', [Position.leftWinger]),
      _slot(11, 'ST', PitchZone.cf, 'attack', [Position.striker]),
    ];
  }

  static List<FormationSlot> _slots4141() {
    return [
      ..._backFourBase(),
      _slot(6, 'DM', PitchZone.cm, 'midfield', [Position.defensiveMidfielder]),
      _slot(7, 'RM', PitchZone.rm, 'midfield', [Position.rightWinger]),
      _slot(8, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(9, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(10, 'LM', PitchZone.lm, 'midfield', [Position.leftWinger]),
      _slot(11, 'ST', PitchZone.cf, 'attack', [Position.striker]),
    ];
  }

  static List<FormationSlot> _slots41212Diamond() {
    return [
      ..._backFourBase(),
      _slot(6, 'DM', PitchZone.cm, 'midfield', [Position.defensiveMidfielder]),
      _slot(7, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(8, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(9, 'AM', PitchZone.cf, 'attack_mid', [
        Position.attackingMidfielder,
      ]),
      _slot(10, 'RST', PitchZone.rhs, 'attack', [Position.striker]),
      _slot(11, 'LST', PitchZone.lhs, 'attack', [Position.striker]),
    ];
  }

  static List<FormationSlot> _slots4312Narrow() {
    return [
      ..._backFourBase(),
      _slot(6, 'DM', PitchZone.cm, 'midfield', [Position.defensiveMidfielder]),
      _slot(7, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(8, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(9, 'AM', PitchZone.cf, 'attack_mid', [
        Position.attackingMidfielder,
      ]),
      _slot(10, 'RST', PitchZone.rhs, 'attack', [Position.striker]),
      _slot(11, 'LST', PitchZone.lhs, 'attack', [Position.striker]),
    ];
  }

  static List<FormationSlot> _slots4222Box() {
    return [
      ..._backFourBase(),
      _slot(6, 'RDM', PitchZone.rcm, 'midfield', [
        Position.defensiveMidfielder,
        Position.centralMidfielder,
      ]),
      _slot(7, 'LDM', PitchZone.lcm, 'midfield', [
        Position.defensiveMidfielder,
        Position.centralMidfielder,
      ]),
      _slot(8, 'RAM', PitchZone.rhs, 'attack_mid', [
        Position.attackingMidfielder,
        Position.rightWinger,
      ]),
      _slot(9, 'LAM', PitchZone.lhs, 'attack_mid', [
        Position.attackingMidfielder,
        Position.leftWinger,
      ]),
      _slot(10, 'RST', PitchZone.rhs, 'attack', [Position.striker]),
      _slot(11, 'LST', PitchZone.lhs, 'attack', [Position.striker]),
    ];
  }

  static List<FormationSlot> _slots424Wide() {
    return [
      ..._backFourBase(),
      _slot(6, 'RDM', PitchZone.rcm, 'midfield', [
        Position.defensiveMidfielder,
      ]),
      _slot(7, 'LDM', PitchZone.lcm, 'midfield', [
        Position.defensiveMidfielder,
      ]),
      _slot(8, 'RW', PitchZone.rw, 'attack', [Position.rightWinger]),
      _slot(9, 'LW', PitchZone.lw, 'attack', [Position.leftWinger]),
      _slot(10, 'RST', PitchZone.rhs, 'attack', [Position.striker]),
      _slot(11, 'LST', PitchZone.lhs, 'attack', [Position.striker]),
    ];
  }

  static List<FormationSlot> _slots4321ChristmasTree() {
    return [
      ..._backFourBase(),
      _slot(6, 'DM', PitchZone.cm, 'midfield', [Position.defensiveMidfielder]),
      _slot(7, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(8, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(9, 'RAM', PitchZone.rhs, 'attack_mid', [
        Position.attackingMidfielder,
      ]),
      _slot(10, 'LAM', PitchZone.lhs, 'attack_mid', [
        Position.attackingMidfielder,
      ]),
      _slot(11, 'ST', PitchZone.cf, 'attack', [Position.striker]),
    ];
  }

  static List<FormationSlot> _slots343Wide() {
    return [
      ..._backThreeBase(),
      _slot(5, 'RWB', PitchZone.rm, 'wingback', [
        Position.rightBack,
        Position.rightWinger,
      ]),
      _slot(6, 'LWB', PitchZone.lm, 'wingback', [
        Position.leftBack,
        Position.leftWinger,
      ]),
      _slot(7, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(8, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(9, 'RW', PitchZone.rw, 'attack', [Position.rightWinger]),
      _slot(10, 'ST', PitchZone.cf, 'attack', [Position.striker]),
      _slot(11, 'LW', PitchZone.lw, 'attack', [Position.leftWinger]),
    ];
  }

  static List<FormationSlot> _slots3421() {
    return [
      ..._backThreeBase(),
      _slot(5, 'RWB', PitchZone.rm, 'wingback', [
        Position.rightBack,
        Position.rightWinger,
      ]),
      _slot(6, 'LWB', PitchZone.lm, 'wingback', [
        Position.leftBack,
        Position.leftWinger,
      ]),
      _slot(7, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(8, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(9, 'RAM', PitchZone.rhs, 'attack_mid', [
        Position.attackingMidfielder,
      ]),
      _slot(10, 'LAM', PitchZone.lhs, 'attack_mid', [
        Position.attackingMidfielder,
      ]),
      _slot(11, 'ST', PitchZone.cf, 'attack', [Position.striker]),
    ];
  }

  static List<FormationSlot> _slots3412() {
    return [
      ..._backThreeBase(),
      _slot(5, 'RWB', PitchZone.rm, 'wingback', [
        Position.rightBack,
        Position.rightWinger,
      ]),
      _slot(6, 'LWB', PitchZone.lm, 'wingback', [
        Position.leftBack,
        Position.leftWinger,
      ]),
      _slot(7, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(8, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(9, 'AM', PitchZone.cf, 'attack_mid', [
        Position.attackingMidfielder,
      ]),
      _slot(10, 'RST', PitchZone.rhs, 'attack', [Position.striker]),
      _slot(11, 'LST', PitchZone.lhs, 'attack', [Position.striker]),
    ];
  }

  static List<FormationSlot> _slots532() {
    return [
      _slot(1, 'GK', PitchZone.cb, 'goalkeeper', [Position.goalKeeper]),
      _slot(2, 'RB', PitchZone.rb, 'defense', [Position.rightBack]),
      _slot(3, 'RCB', PitchZone.rcb, 'defense', [Position.centerBack]),
      _slot(4, 'CB', PitchZone.cb, 'defense', [Position.centerBack]),
      _slot(5, 'LCB', PitchZone.lcb, 'defense', [Position.centerBack]),
      _slot(6, 'LB', PitchZone.lb, 'defense', [Position.leftBack]),
      _slot(7, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(8, 'DM', PitchZone.cm, 'midfield', [Position.defensiveMidfielder]),
      _slot(9, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(10, 'RST', PitchZone.rhs, 'attack', [Position.striker]),
      _slot(11, 'LST', PitchZone.lhs, 'attack', [Position.striker]),
    ];
  }

  static List<FormationSlot> _slots541() {
    return [
      _slot(1, 'GK', PitchZone.cb, 'goalkeeper', [Position.goalKeeper]),
      _slot(2, 'RB', PitchZone.rb, 'defense', [Position.rightBack]),
      _slot(3, 'RCB', PitchZone.rcb, 'defense', [Position.centerBack]),
      _slot(4, 'CB', PitchZone.cb, 'defense', [Position.centerBack]),
      _slot(5, 'LCB', PitchZone.lcb, 'defense', [Position.centerBack]),
      _slot(6, 'LB', PitchZone.lb, 'defense', [Position.leftBack]),
      _slot(7, 'RM', PitchZone.rm, 'midfield', [Position.rightWinger]),
      _slot(8, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(9, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(10, 'LM', PitchZone.lm, 'midfield', [Position.leftWinger]),
      _slot(11, 'ST', PitchZone.cf, 'attack', [Position.striker]),
    ];
  }

  static List<FormationSlot> _slots523() {
    return [
      _slot(1, 'GK', PitchZone.cb, 'goalkeeper', [Position.goalKeeper]),
      _slot(2, 'RB', PitchZone.rb, 'defense', [Position.rightBack]),
      _slot(3, 'RCB', PitchZone.rcb, 'defense', [Position.centerBack]),
      _slot(4, 'CB', PitchZone.cb, 'defense', [Position.centerBack]),
      _slot(5, 'LCB', PitchZone.lcb, 'defense', [Position.centerBack]),
      _slot(6, 'LB', PitchZone.lb, 'defense', [Position.leftBack]),
      _slot(7, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(8, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(9, 'RW', PitchZone.rw, 'attack', [Position.rightWinger]),
      _slot(10, 'ST', PitchZone.cf, 'attack', [Position.striker]),
      _slot(11, 'LW', PitchZone.lw, 'attack', [Position.leftWinger]),
    ];
  }

  static List<FormationSlot> _backFourBase() {
    return [
      _slot(1, 'GK', PitchZone.cb, 'goalkeeper', [Position.goalKeeper]),
      _slot(2, 'RB', PitchZone.rb, 'defense', [Position.rightBack]),
      _slot(3, 'RCB', PitchZone.rcb, 'defense', [Position.centerBack]),
      _slot(4, 'LCB', PitchZone.lcb, 'defense', [Position.centerBack]),
      _slot(5, 'LB', PitchZone.lb, 'defense', [Position.leftBack]),
    ];
  }

  static List<FormationSlot> _backThreeBase() {
    return [
      _slot(1, 'GK', PitchZone.cb, 'goalkeeper', [Position.goalKeeper]),
      _slot(2, 'RCB', PitchZone.rcb, 'defense', [Position.centerBack]),
      _slot(3, 'CB', PitchZone.cb, 'defense', [Position.centerBack]),
      _slot(4, 'LCB', PitchZone.lcb, 'defense', [Position.centerBack]),
    ];
  }
}
