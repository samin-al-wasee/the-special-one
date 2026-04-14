import 'package:ts1_core/src/core/enums/match/pitch_zone.dart';
import 'package:ts1_core/src/core/enums/player/position.dart';
import 'package:ts1_core/src/team/models/lineup/formation/shape/formation_shape.dart';
import 'package:ts1_core/src/team/models/lineup/formation/slot/formation_slot.dart';

/// Factory for canonical formation shapes.
///
/// \*
/// \* All formation slot lists in this factory strictly follow this enforced order:
///
///   1. GK
///   2. RB (if present)
///   3. CBs (from right to left)
///   4. LB (if present)
///   5. DM(s) (right to left, if present)
///   6. RM (if present)
///   7. CM(s) (right to left, if present)
///   8. LM (if present)
///   9. AM(s) (right to left, if present)
///  10. RW (if present)
///  11. LW (if present)
///  12. ST
///
/// This order is enforced for all formation slot list methods to ensure consistency
/// and predictable downstream consumption.
///
class FormationFactory {
  const FormationFactory._();

  static const Set<String> supportedCodes = {
    '3-1-4-2',
    '3-4-1-2',
    '3-4-2-1',
    '3-4-3',
    '3-5-2',
    '4-1-2-1-2',
    '4-1-4-1',
    '4-2-2-2',
    '4-2-3-1',
    '4-2-3-1-narrow',
    '4-2-4',
    '4-3-1-2',
    '4-3-2-1',
    '4-3-3',
    '4-3-3-attacking',
    '4-3-3-defensive',
    '4-4-1-1',
    '4-4-2',
    '4-4-2-defensive',
    '4-5-1',
    '5-2-1-2',
    '5-2-3',
    '5-3-2',
    '5-4-1',
  };

  static FormationShape byCode(String code) {
    final compact = _compactCode(code);

    switch (compact) {
      case '433':
      case '433flat':
        return _shape(
          id: 433,
          code: '4-3-3',
          slotDefinitions: _slots433Flat(),
          structuralTags: const {
            'natural_width': 0.80,
            'central_compactness': 0.65,
            'rest_defense_shape': 0.61,
            'press_front_line': 0.70,
          },
        );
      case '433defensive':
      case '433d':
        return _shape(
          id: 4331,
          code: '4-3-3-defensive',
          slotDefinitions: _slots433Defensive(),
          structuralTags: const {
            'natural_width': 0.78,
            'central_compactness': 0.69,
            'rest_defense_shape': 0.72,
            'press_front_line': 0.66,
          },
        );
      case '433attacking':
      case '433a':
        return _shape(
          id: 4332,
          code: '4-3-3-attacking',
          slotDefinitions: _slots433Attacking(),
          structuralTags: const {
            'natural_width': 0.83,
            'central_compactness': 0.60,
            'rest_defense_shape': 0.55,
            'press_front_line': 0.74,
          },
        );
      case '4231':
      case '4231wide':
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
      case '4231narrow':
      case '4231narrowfixed':
        return _shape(
          id: 4232,
          code: '4-2-3-1-narrow',
          slotDefinitions: _slots4231Narrow(),
          structuralTags: const {
            'natural_width': 0.48,
            'central_compactness': 0.86,
            'rest_defense_shape': 0.76,
            'press_front_line': 0.67,
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
      case '3142':
        return _shape(
          id: 3142,
          code: '3-1-4-2',
          slotDefinitions: _slots3142(),
          structuralTags: const {
            'natural_width': 0.76,
            'central_compactness': 0.80,
            'rest_defense_shape': 0.83,
            'press_front_line': 0.63,
          },
        );
      case '442':
      case '442wide':
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
      case '442defensive':
      case '442d':
      case '442def':
        return _shape(
          id: 4421,
          code: '4-4-2-defensive',
          slotDefinitions: _slots442Defensive(),
          structuralTags: const {
            'natural_width': 0.68,
            'central_compactness': 0.79,
            'rest_defense_shape': 0.82,
            'press_front_line': 0.57,
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
      case '41212narrow':
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
      case 'box':
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
      case '424wide':
      case '424widefixed':
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
      case '4411':
      case '4411balanced':
        return _shape(
          id: 4411,
          code: '4-4-1-1',
          slotDefinitions: _slots4411Balanced(),
          structuralTags: const {
            'natural_width': 0.70,
            'central_compactness': 0.72,
            'rest_defense_shape': 0.73,
            'press_front_line': 0.60,
          },
        );
      case '343':
      case '343wide':
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
      case '5212':
        return _shape(
          id: 5212,
          code: '5-2-1-2',
          slotDefinitions: _slots5212(),
          structuralTags: const {
            'natural_width': 0.67,
            'central_compactness': 0.77,
            'rest_defense_shape': 0.85,
            'press_front_line': 0.58,
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

  static List<FormationSlot> _slots433Flat() {
    // Order: GK, RB, CBs (R->L), LB, DMs (R->L), RM, CMs (R->L), LM, AMs (R->L), RW, LW, ST
    return [
      // GK
      _slot(
        1,
        'GK',
        PitchZone.cb,
        'goalkeeper',
        [Position.goalKeeper],
        adjacency: ['RCB', 'LCB'],
        support: ['RCB', 'LCB', 'CM'],
        lanes: ['central_build'],
        defensive: ['box'],
      ),
      // RB
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
      // CBs (right to left)
      _slot(
        3,
        'RCB',
        PitchZone.rcb,
        'defense',
        [Position.centerBack],
        adjacency: ['GK', 'RB', 'LCB', 'CM'],
        support: ['RB', 'CM'],
        lanes: ['central_build'],
        defensive: ['box', 'right_halfspace'],
      ),
      _slot(
        4,
        'LCB',
        PitchZone.lcb,
        'defense',
        [Position.centerBack],
        adjacency: ['GK', 'LB', 'RCB', 'CM'],
        support: ['LB', 'CM'],
        lanes: ['central_build'],
        defensive: ['box', 'left_halfspace'],
      ),
      // LB
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
      // CMs (right to left)
      _slot(
        6,
        'RCM',
        PitchZone.rcm,
        'midfield',
        [Position.centralMidfielder, Position.defensiveMidfielder],
        adjacency: ['RB', 'RCB', 'CM', 'RW', 'ST'],
        support: ['RB', 'CM', 'RW', 'ST'],
        lanes: ['right_halfspace'],
        defensive: ['right_halfspace'],
      ),
      _slot(
        7,
        'CM',
        PitchZone.cm,
        'midfield',
        [Position.centralMidfielder, Position.defensiveMidfielder],
        adjacency: ['RCB', 'LCB', 'RCM', 'LCM', 'ST'],
        support: ['RCM', 'LCM', 'ST'],
        lanes: ['central_build', 'halfspaces'],
        defensive: ['zone14', 'counter_rest'],
      ),
      _slot(
        8,
        'LCM',
        PitchZone.lcm,
        'midfield',
        [Position.centralMidfielder, Position.defensiveMidfielder],
        adjacency: ['LB', 'LCB', 'CM', 'ST', 'LW'],
        support: ['LB', 'CM', 'LW', 'ST'],
        lanes: ['left_halfspace'],
        defensive: ['left_halfspace'],
      ),
      // RW
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
      // LW
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
      // ST
      _slot(
        11,
        'ST',
        PitchZone.cf,
        'attack',
        [Position.striker],
        adjacency: ['RW', 'LW', 'RCM', 'CM', 'LCM'],
        support: ['RW', 'LW', 'RCM', 'CM', 'LCM'],
        lanes: ['box', 'central_channel'],
        defensive: ['first_press'],
      ),
    ];
  }

  static List<FormationSlot> _slots433Defensive() {
    return [
      ..._backFourBase(),
      _slot(6, 'DM', PitchZone.cm, 'midfield', [
        Position.defensiveMidfielder,
        Position.centralMidfielder,
      ]),
      _slot(7, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(8, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(9, 'RW', PitchZone.rw, 'attack', [Position.rightWinger]),
      _slot(10, 'ST', PitchZone.cf, 'attack', [Position.striker]),
      _slot(11, 'LW', PitchZone.lw, 'attack', [Position.leftWinger]),
    ];
  }

  static List<FormationSlot> _slots433Attacking() {
    return [
      ..._backFourBase(),
      _slot(6, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(7, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(8, 'CAM', PitchZone.cf, 'attack_mid', [
        Position.attackingMidfielder,
      ]),
      _slot(9, 'RW', PitchZone.rw, 'attack', [Position.rightWinger]),
      _slot(10, 'ST', PitchZone.cf, 'attack', [Position.striker]),
      _slot(11, 'LW', PitchZone.lw, 'attack', [Position.leftWinger]),
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
        support: ['RB', 'AM', 'RM'],
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
        support: ['LB', 'AM', 'LM'],
        lanes: ['left_halfspace'],
        defensive: ['counter_rest', 'zone14'],
      ),
      _slot(
        8,
        'AM',
        PitchZone.cf,
        'attack_mid',
        [Position.attackingMidfielder, Position.centralMidfielder],
        adjacency: ['RDM', 'LDM', 'RM', 'LM', 'ST'],
        support: ['RM', 'LM', 'ST'],
        lanes: ['halfspaces', 'central_channel'],
        defensive: ['press_shadow'],
      ),
      _slot(
        9,
        'RM',
        PitchZone.rm,
        'midfield',
        [Position.rightMidfielder, Position.centralMidfielder],
        adjacency: ['RB', 'RDM', 'AM', 'ST'],
        support: ['RB', 'RDM', 'AM', 'ST'],
        lanes: ['right_flank', 'right_halfspace'],
        defensive: ['right_flank'],
      ),
      _slot(
        10,
        'LM',
        PitchZone.lm,
        'midfield',
        [Position.leftMidfielder, Position.centralMidfielder],
        adjacency: ['LB', 'LDM', 'AM', 'ST'],
        support: ['LB', 'LDM', 'AM', 'ST'],
        lanes: ['left_flank', 'left_halfspace'],
        defensive: ['left_flank'],
      ),
      _slot(
        11,
        'ST',
        PitchZone.cf,
        'attack',
        [Position.striker],
        adjacency: ['RM', 'LM', 'AM'],
        support: ['RM', 'LM', 'AM'],
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
        'RM',
        PitchZone.rm,
        'midfield',
        [Position.rightMidfielder, Position.centralMidfielder],
        adjacency: ['RCB', 'RCM', 'RST'],
        support: ['RCM', 'RST'],
        lanes: ['right_flank'],
        defensive: ['right_flank', 'right_press_lane'],
      ),
      _slot(
        6,
        'LM',
        PitchZone.lm,
        'midfield',
        [Position.leftMidfielder, Position.centralMidfielder],
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
        adjacency: ['RM', 'DM', 'RST'],
        support: ['RM', 'RST'],
        lanes: ['right_halfspace'],
        defensive: ['right_halfspace'],
      ),
      _slot(
        9,
        'LCM',
        PitchZone.lcm,
        'midfield',
        [Position.centralMidfielder, Position.defensiveMidfielder],
        adjacency: ['LM', 'DM', 'LST'],
        support: ['LM', 'LST'],
        lanes: ['left_halfspace'],
        defensive: ['left_halfspace'],
      ),
      _slot(
        10,
        'RST',
        PitchZone.rhs,
        'attack',
        [Position.striker],
        adjacency: ['RM', 'RCM', 'LST'],
        support: ['RM', 'RCM', 'LST'],
        lanes: ['box', 'right_halfspace'],
        defensive: ['first_press'],
      ),
      _slot(
        11,
        'LST',
        PitchZone.lhs,
        'attack',
        [Position.striker],
        adjacency: ['LM', 'LCM', 'RST'],
        support: ['LM', 'LCM', 'RST'],
        lanes: ['box', 'left_halfspace'],
        defensive: ['first_press'],
      ),
    ];
  }

  static List<FormationSlot> _slots3142() {
    return [
      ..._backThreeBase(),
      _slot(5, 'DM', PitchZone.cm, 'midfield', [Position.defensiveMidfielder]),
      _slot(6, 'RM', PitchZone.rm, 'midfield', [Position.rightMidfielder]),
      _slot(7, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(8, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(9, 'LM', PitchZone.lm, 'midfield', [Position.leftMidfielder]),
      _slot(10, 'RST', PitchZone.rhs, 'attack', [Position.striker]),
      _slot(11, 'LST', PitchZone.lhs, 'attack', [Position.striker]),
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
        [Position.rightMidfielder, Position.centralMidfielder],
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
        [Position.leftMidfielder, Position.centralMidfielder],
        lanes: ['left_flank'],
        defensive: ['left_flank'],
      ),
      _slot(10, 'RST', PitchZone.rhs, 'attack', [Position.striker]),
      _slot(11, 'LST', PitchZone.lhs, 'attack', [Position.striker]),
    ];
  }

  static List<FormationSlot> _slots442Defensive() {
    return [
      ..._backFourBase(),
      _slot(6, 'RM', PitchZone.rm, 'midfield', [Position.rightMidfielder]),
      _slot(7, 'RDM', PitchZone.rcm, 'midfield', [
        Position.defensiveMidfielder,
      ]),
      _slot(8, 'LDM', PitchZone.lcm, 'midfield', [
        Position.defensiveMidfielder,
      ]),
      _slot(9, 'LM', PitchZone.lm, 'midfield', [Position.leftMidfielder]),
      _slot(10, 'RST', PitchZone.rhs, 'attack', [Position.striker]),
      _slot(11, 'LST', PitchZone.lhs, 'attack', [Position.striker]),
    ];
  }

  static List<FormationSlot> _slots451() {
    return [
      ..._backFourBase(),
      _slot(6, 'RM', PitchZone.rm, 'midfield', [
        Position.rightMidfielder,
        Position.centralMidfielder,
      ]),
      _slot(7, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(8, 'DM', PitchZone.cm, 'midfield', [Position.defensiveMidfielder]),
      _slot(9, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(10, 'LM', PitchZone.lm, 'midfield', [
        Position.leftMidfielder,
        Position.centralMidfielder,
      ]),
      _slot(11, 'ST', PitchZone.cf, 'attack', [Position.striker]),
    ];
  }

  static List<FormationSlot> _slots4141() {
    return [
      ..._backFourBase(),
      _slot(6, 'DM', PitchZone.cm, 'midfield', [Position.defensiveMidfielder]),
      _slot(7, 'RM', PitchZone.rm, 'midfield', [
        Position.rightMidfielder,
        Position.centralMidfielder,
      ]),
      _slot(8, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(9, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(10, 'LM', PitchZone.lm, 'midfield', [
        Position.leftMidfielder,
        Position.centralMidfielder,
      ]),
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

  static List<FormationSlot> _slots4231Narrow() {
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
      ]),
      _slot(9, 'CAM', PitchZone.cf, 'attack_mid', [
        Position.attackingMidfielder,
      ]),
      _slot(10, 'LAM', PitchZone.lhs, 'attack_mid', [
        Position.attackingMidfielder,
      ]),
      _slot(11, 'ST', PitchZone.cf, 'attack', [Position.striker]),
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
      _slot(6, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(7, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(8, 'RW', PitchZone.rw, 'attack', [Position.rightWinger]),
      _slot(9, 'RST', PitchZone.rhs, 'attack', [Position.striker]),
      _slot(10, 'LST', PitchZone.lhs, 'attack', [Position.striker]),
      _slot(11, 'LW', PitchZone.lw, 'attack', [Position.leftWinger]),
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
      _slot(5, 'RM', PitchZone.rm, 'wingback', [
        Position.rightMidfielder,
        Position.rightWinger,
        Position.centralMidfielder,
      ]),
      _slot(6, 'LM', PitchZone.lm, 'wingback', [
        Position.leftMidfielder,
        Position.leftWinger,
        Position.centralMidfielder,
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
      _slot(5, 'RM', PitchZone.rm, 'wingback', [
        Position.rightMidfielder,
        Position.rightWinger,
        Position.centralMidfielder,
      ]),
      _slot(6, 'LM', PitchZone.lm, 'wingback', [
        Position.leftMidfielder,
        Position.leftWinger,
        Position.centralMidfielder,
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
      _slot(5, 'RM', PitchZone.rm, 'wingback', [
        Position.rightMidfielder,
        Position.rightWinger,
        Position.centralMidfielder,
      ]),
      _slot(6, 'LM', PitchZone.lm, 'wingback', [
        Position.leftMidfielder,
        Position.leftWinger,
        Position.centralMidfielder,
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
      _slot(7, 'RM', PitchZone.rm, 'midfield', [
        Position.rightMidfielder,
        Position.centralMidfielder,
      ]),
      _slot(8, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(9, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(10, 'LM', PitchZone.lm, 'midfield', [
        Position.leftMidfielder,
        Position.centralMidfielder,
      ]),
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

  static List<FormationSlot> _slots5212() {
    return [
      _slot(1, 'GK', PitchZone.cb, 'goalkeeper', [Position.goalKeeper]),
      _slot(2, 'RB', PitchZone.rb, 'defense', [Position.rightBack]),
      _slot(3, 'RCB', PitchZone.rcb, 'defense', [Position.centerBack]),
      _slot(4, 'CB', PitchZone.cb, 'defense', [Position.centerBack]),
      _slot(5, 'LCB', PitchZone.lcb, 'defense', [Position.centerBack]),
      _slot(6, 'LB', PitchZone.lb, 'defense', [Position.leftBack]),
      _slot(7, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(8, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(9, 'CAM', PitchZone.cf, 'attack_mid', [
        Position.attackingMidfielder,
      ]),
      _slot(10, 'RST', PitchZone.rhs, 'attack', [Position.striker]),
      _slot(11, 'LST', PitchZone.lhs, 'attack', [Position.striker]),
    ];
  }

  static List<FormationSlot> _slots4411Balanced() {
    return [
      ..._backFourBase(),
      _slot(6, 'RM', PitchZone.rm, 'midfield', [Position.rightMidfielder]),
      _slot(7, 'RCM', PitchZone.rcm, 'midfield', [Position.centralMidfielder]),
      _slot(8, 'LCM', PitchZone.lcm, 'midfield', [Position.centralMidfielder]),
      _slot(9, 'LM', PitchZone.lm, 'midfield', [Position.leftMidfielder]),
      _slot(10, 'CAM', PitchZone.cf, 'attack_mid', [
        Position.attackingMidfielder,
      ]),
      _slot(11, 'ST', PitchZone.cf, 'attack', [Position.striker]),
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
