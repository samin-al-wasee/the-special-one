// generators/services/attribute_generator_service.dart
import 'dart:math';
import 'package:ts1_core/ts1_core.dart';
import '../models/player_quality.dart';
import '../models/attribute_range.dart';
import '../models/country_culture_profile.dart';

class AttributeGeneratorService {
  final Random _random = Random();

  ({
    Map<TechnicalAttr, int> technical,
    Map<MentalAttr, int> mental,
    Map<PhysicalAttr, int> physical,
  })
  generateAttributes({
    required PlayerQuality quality,
    required CountryCultureProfile culture,
    required Position position,
  }) {
    final baseRange = _getBaseRangeForQuality(quality);

    return (
      technical: _generateTechnicalAttributes(baseRange, culture),
      mental: _generateMentalAttributes(baseRange, culture),
      physical: _generatePhysicalAttributes(baseRange, culture),
    );
  }

  AttributeRange _getBaseRangeForQuality(PlayerQuality quality) {
    switch (quality) {
      case PlayerQuality.worldClass:
        return const AttributeRange(
          minStrong: 16,
          maxStrong: 20,
          minNormal: 14,
          maxNormal: 18,
          minWeak: 12,
          maxWeak: 16,
        );
      case PlayerQuality.good:
        return const AttributeRange(
          minStrong: 14,
          maxStrong: 18,
          minNormal: 12,
          maxNormal: 16,
          minWeak: 10,
          maxWeak: 14,
        );
      case PlayerQuality.average:
        return const AttributeRange(
          minStrong: 11,
          maxStrong: 15,
          minNormal: 9,
          maxNormal: 13,
          minWeak: 7,
          maxWeak: 11,
        );
      case PlayerQuality.poor:
        return const AttributeRange(
          minStrong: 7,
          maxStrong: 11,
          minNormal: 5,
          maxNormal: 9,
          minWeak: 3,
          maxWeak: 7,
        );
    }
  }

  Map<TechnicalAttr, int> _generateTechnicalAttributes(
    AttributeRange range,
    CountryCultureProfile culture,
  ) {
    final attributes = <TechnicalAttr, int>{};

    for (final attr in TechnicalAttr.values) {
      int value;
      if (culture.isStrongTechnical(attr)) {
        value =
            range.minStrong +
            _random.nextInt(range.maxStrong - range.minStrong + 1);
      } else if (culture.isWeakTechnical(attr)) {
        value =
            range.minWeak + _random.nextInt(range.maxWeak - range.minWeak + 1);
      } else {
        value =
            range.minNormal +
            _random.nextInt(range.maxNormal - range.minNormal + 1);
      }
      attributes[attr] = value.clamp(1, 20);
    }

    return attributes;
  }

  Map<MentalAttr, int> _generateMentalAttributes(
    AttributeRange range,
    CountryCultureProfile culture,
  ) {
    final attributes = <MentalAttr, int>{};

    for (final attr in MentalAttr.values) {
      int value;
      if (culture.isStrongMental(attr)) {
        value =
            range.minStrong +
            _random.nextInt(range.maxStrong - range.minStrong + 1);
      } else if (culture.isWeakMental(attr)) {
        value =
            range.minWeak + _random.nextInt(range.maxWeak - range.minWeak + 1);
      } else {
        value =
            range.minNormal +
            _random.nextInt(range.maxNormal - range.minNormal + 1);
      }
      attributes[attr] = value.clamp(1, 20);
    }

    return attributes;
  }

  Map<PhysicalAttr, int> _generatePhysicalAttributes(
    AttributeRange range,
    CountryCultureProfile culture,
  ) {
    final attributes = <PhysicalAttr, int>{};

    for (final attr in PhysicalAttr.values) {
      int value;
      if (culture.isStrongPhysical(attr)) {
        value =
            range.minStrong +
            _random.nextInt(range.maxStrong - range.minStrong + 1);
      } else if (culture.isWeakPhysical(attr)) {
        value =
            range.minWeak + _random.nextInt(range.maxWeak - range.minWeak + 1);
      } else {
        value =
            range.minNormal +
            _random.nextInt(range.maxNormal - range.minNormal + 1);
      }
      attributes[attr] = value.clamp(1, 20);
    }

    return attributes;
  }

  Map<HiddenAttr, int> generateHiddenAttributes(PlayerQuality quality) {
    final hidden = <HiddenAttr, int>{};
    final baseValue = quality == PlayerQuality.worldClass
        ? 15
        : quality == PlayerQuality.good
        ? 12
        : quality == PlayerQuality.average
        ? 9
        : 6;

    for (final attr in HiddenAttr.values) {
      int value = baseValue + _random.nextInt(5) - 2;
      hidden[attr] = value.clamp(1, 20);
    }

    return hidden;
  }

  Map<ConditionAttr, int> generateConditionAttributes() {
    return {
      ConditionAttr.matchFitness: 100,
      ConditionAttr.sharpness: _random.nextInt(40) + 60,
      ConditionAttr.morale: _random.nextInt(40) + 60,
      ConditionAttr.fatigue: 0,
      ConditionAttr.injuryRisk: _random.nextInt(20),
      ConditionAttr.discipline: 100,
      ConditionAttr.focus: _random.nextInt(30) + 70,
    };
  }
}
