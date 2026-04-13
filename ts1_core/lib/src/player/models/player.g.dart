// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Player _$PlayerFromJson(Map<String, dynamic> json) => _Player(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
  heightCm: (json['heightCm'] as num).toDouble(),
  weightKg: (json['weightKg'] as num).toDouble(),
  position: $enumDecode(_$PositionEnumMap, json['position']),
  footedness: $enumDecode(_$FootednessEnumMap, json['footedness']),
  technical:
      (json['technical'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
          $enumDecode(_$TechnicalAttrEnumMap, k),
          (e as num).toInt(),
        ),
      ) ??
      const {},
  mental:
      (json['mental'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry($enumDecode(_$MentalAttrEnumMap, k), (e as num).toInt()),
      ) ??
      const {},
  physical:
      (json['physical'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry($enumDecode(_$PhysicalAttrEnumMap, k), (e as num).toInt()),
      ) ??
      const {},
  hidden:
      (json['hidden'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry($enumDecode(_$HiddenAttrEnumMap, k), (e as num).toInt()),
      ) ??
      const {},
  condition:
      (json['condition'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
          $enumDecode(_$ConditionAttrEnumMap, k),
          (e as num).toInt(),
        ),
      ) ??
      const {},
);

Map<String, dynamic> _$PlayerToJson(_Player instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'dateOfBirth': instance.dateOfBirth.toIso8601String(),
  'heightCm': instance.heightCm,
  'weightKg': instance.weightKg,
  'position': _$PositionEnumMap[instance.position]!,
  'footedness': _$FootednessEnumMap[instance.footedness]!,
  'technical': instance.technical.map(
    (k, e) => MapEntry(_$TechnicalAttrEnumMap[k]!, e),
  ),
  'mental': instance.mental.map((k, e) => MapEntry(_$MentalAttrEnumMap[k]!, e)),
  'physical': instance.physical.map(
    (k, e) => MapEntry(_$PhysicalAttrEnumMap[k]!, e),
  ),
  'hidden': instance.hidden.map((k, e) => MapEntry(_$HiddenAttrEnumMap[k]!, e)),
  'condition': instance.condition.map(
    (k, e) => MapEntry(_$ConditionAttrEnumMap[k]!, e),
  ),
};

const _$PositionEnumMap = {
  Position.goalKeeper: 'goalKeeper',
  Position.rightBack: 'rightBack',
  Position.centerBack: 'centerBack',
  Position.leftBack: 'leftBack',
  Position.defensiveMidfielder: 'defensiveMidfielder',
  Position.centralMidfielder: 'centralMidfielder',
  Position.attackingMidfielder: 'attackingMidfielder',
  Position.rightMidfielder: 'rightMidfielder',
  Position.leftMidfielder: 'leftMidfielder',
  Position.rightWinger: 'rightWinger',
  Position.leftWinger: 'leftWinger',
  Position.striker: 'striker',
};

const _$FootednessEnumMap = {
  Footedness.left: 'left',
  Footedness.right: 'right',
};

const _$TechnicalAttrEnumMap = {
  TechnicalAttr.firstTouch: 'firstTouch',
  TechnicalAttr.technique: 'technique',
  TechnicalAttr.ballControl: 'ballControl',
  TechnicalAttr.dribbling: 'dribbling',
  TechnicalAttr.flair: 'flair',
  TechnicalAttr.shortPassing: 'shortPassing',
  TechnicalAttr.passing: 'passing',
  TechnicalAttr.crossing: 'crossing',
  TechnicalAttr.longPassing: 'longPassing',
  TechnicalAttr.setPieceDelivery: 'setPieceDelivery',
  TechnicalAttr.finishing: 'finishing',
  TechnicalAttr.longShots: 'longShots',
  TechnicalAttr.shotPower: 'shotPower',
  TechnicalAttr.heading: 'heading',
  TechnicalAttr.volleys: 'volleys',
  TechnicalAttr.weakFootAccuracy: 'weakFootAccuracy',
  TechnicalAttr.tackling: 'tackling',
  TechnicalAttr.marking: 'marking',
  TechnicalAttr.intercepting: 'intercepting',
  TechnicalAttr.gkHandling: 'gkHandling',
  TechnicalAttr.gkReflexes: 'gkReflexes',
  TechnicalAttr.gkOneOnOnes: 'gkOneOnOnes',
  TechnicalAttr.gkKicking: 'gkKicking',
  TechnicalAttr.gkCommandOfArea: 'gkCommandOfArea',
  TechnicalAttr.gkAerialReach: 'gkAerialReach',
  TechnicalAttr.gkThrowing: 'gkThrowing',
  TechnicalAttr.gkPositioning: 'gkPositioning',
  TechnicalAttr.gkCommunication: 'gkCommunication',
};

const _$MentalAttrEnumMap = {
  MentalAttr.composure: 'composure',
  MentalAttr.decisions: 'decisions',
  MentalAttr.anticipation: 'anticipation',
  MentalAttr.concentration: 'concentration',
  MentalAttr.vision: 'vision',
  MentalAttr.offBall: 'offBall',
  MentalAttr.creativity: 'creativity',
  MentalAttr.positioning: 'positioning',
  MentalAttr.teamwork: 'teamwork',
  MentalAttr.discipline: 'discipline',
  MentalAttr.tacticalAwareness: 'tacticalAwareness',
  MentalAttr.aggression: 'aggression',
  MentalAttr.workRate: 'workRate',
  MentalAttr.leadership: 'leadership',
  MentalAttr.bravery: 'bravery',
  MentalAttr.determination: 'determination',
  MentalAttr.pressResistance: 'pressResistance',
};

const _$PhysicalAttrEnumMap = {
  PhysicalAttr.pace: 'pace',
  PhysicalAttr.acceleration: 'acceleration',
  PhysicalAttr.agility: 'agility',
  PhysicalAttr.balance: 'balance',
  PhysicalAttr.stamina: 'stamina',
  PhysicalAttr.strength: 'strength',
  PhysicalAttr.jumping: 'jumping',
  PhysicalAttr.naturalFitness: 'naturalFitness',
  PhysicalAttr.injuryResistance: 'injuryResistance',
  PhysicalAttr.recovery: 'recovery',
};

const _$HiddenAttrEnumMap = {
  HiddenAttr.consistency: 'consistency',
  HiddenAttr.bigMatches: 'bigMatches',
  HiddenAttr.professionalism: 'professionalism',
  HiddenAttr.ambition: 'ambition',
  HiddenAttr.adaptability: 'adaptability',
  HiddenAttr.temperament: 'temperament',
  HiddenAttr.loyalty: 'loyalty',
  HiddenAttr.injuryProneness: 'injuryProneness',
  HiddenAttr.consistencyUnderPressure: 'consistencyUnderPressure',
  HiddenAttr.versatility: 'versatility',
};

const _$ConditionAttrEnumMap = {
  ConditionAttr.matchFitness: 'matchFitness',
  ConditionAttr.sharpness: 'sharpness',
  ConditionAttr.morale: 'morale',
  ConditionAttr.fatigue: 'fatigue',
  ConditionAttr.injuryRisk: 'injuryRisk',
  ConditionAttr.discipline: 'discipline',
  ConditionAttr.focus: 'focus',
};
