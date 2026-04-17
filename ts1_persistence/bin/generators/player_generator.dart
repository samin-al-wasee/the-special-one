// generators/player_generator.dart
import 'dart:math';
import 'package:ts1_core/ts1_core.dart';
import 'models/player_quality.dart';
import 'models/country_culture_profile.dart';
import 'services/name_generator_service.dart';
import 'services/attribute_generator_service.dart';
import 'services/position_generator_service.dart';
import 'services/physical_generator_service.dart';
import 'data/country_profiles.dart';
import 'data/position_adjustments.dart';
import 'package:ts1_persistence/src/db/database.dart';

class PlayerGenerator {
  final Random _random = Random();
  final NameGeneratorService _nameGenerator;
  final AttributeGeneratorService _attributeGenerator;
  final PositionGeneratorService _positionGenerator;
  final PhysicalGeneratorService _physicalGenerator;

  PlayerGenerator({
    NameGeneratorService? nameGenerator,
    AttributeGeneratorService? attributeGenerator,
    PositionGeneratorService? positionGenerator,
    PhysicalGeneratorService? physicalGenerator,
  }) : _nameGenerator = nameGenerator ?? NameGeneratorService(),
       _attributeGenerator = attributeGenerator ?? AttributeGeneratorService(),
       _positionGenerator = positionGenerator ?? PositionGeneratorService(),
       _physicalGenerator = physicalGenerator ?? PhysicalGeneratorService();

  List<Player> generatePlayersForCountry({
    required CountryRecord country,
    required int count,
  }) {
    final players = <Player>[];
    final cultureProfile = CountryProfiles.getProfileForCountry(country.name);

    for (int i = 0; i < count; i++) {
      final player = _generateSinglePlayer(country, cultureProfile);
      players.add(player);
    }

    return players;
  }

  Player _generateSinglePlayer(
    CountryRecord country,
    CountryCultureProfile culture,
  ) {
    // Determine player quality
    final quality = _determineQuality(culture);

    // Generate basic info
    final age = _random.nextInt(20) + 16; // 16-35
    final dateOfBirth = DateTime(
      2024 - age,
      _random.nextInt(11) + 1,
      _random.nextInt(27) + 1,
    );
    final name = _nameGenerator.generateName(country.name);
    final position = _positionGenerator.generatePosition(culture);

    // Generate attributes
    var attributes = _attributeGenerator.generateAttributes(
      quality: quality,
      culture: culture,
      position: position,
    );

    // Apply position adjustments
    attributes = _applyPositionAdjustments(attributes, position);

    // Scale all attributes to 1-100
    Map<T, int> scaleTo100<T>(Map<T, int> attrs) => attrs.map((k, v) => MapEntry(k, ((v / 20) * 100).round().clamp(1, 100)));
    final technical100 = scaleTo100(attributes.technical);
    final mental100 = scaleTo100(attributes.mental);
    final physical100 = scaleTo100(attributes.physical);

    // Generate physical characteristics
    final height = _physicalGenerator.generateHeight(position, culture);
    final footedness = _physicalGenerator.generateFootedness();

    // Generate hidden and condition attributes
    final hidden = _attributeGenerator.generateHiddenAttributes(quality);
    final condition = _attributeGenerator.generateConditionAttributes();

    // Calculate weight based on height and physical attributes
    final weight = _physicalGenerator.calculateWeight(
      height,
      attributes.physical,
    );

    return Player(
      id: 0, // Placeholder ID, should be set by database
      name: name,
      dateOfBirth: dateOfBirth,
      country: country.name,
      heightCm: height,
      weightKg: weight,
      position: position,
      footedness: footedness,
      technical: technical100,
      mental: mental100,
      physical: physical100,
      hidden: hidden,
      condition: condition,
    );
  }

  PlayerQuality _determineQuality(CountryCultureProfile culture) {
    final rand = _random.nextDouble();

    if (rand < culture.worldClassProbability) {
      return PlayerQuality.worldClass;
    } else if (rand <
        culture.worldClassProbability + culture.goodPlayerProbability) {
      return PlayerQuality.good;
    } else if (rand <
        culture.worldClassProbability + culture.goodPlayerProbability + 0.40) {
      return PlayerQuality.average;
    } else {
      return PlayerQuality.poor;
    }
  }

  ({
    Map<TechnicalAttr, int> technical,
    Map<MentalAttr, int> mental,
    Map<PhysicalAttr, int> physical,
  })
  _applyPositionAdjustments(
    ({
      Map<TechnicalAttr, int> technical,
      Map<MentalAttr, int> mental,
      Map<PhysicalAttr, int> physical,
    })
    attributes,
    Position position,
  ) {
    final adjustments = PositionAdjustments.getAdjustments()[position] ?? [];

    for (final adj in adjustments) {
      switch (adj.attributeType) {
        case 'technical':
          final attr = adj.attribute as TechnicalAttr;
          if (attributes.technical.containsKey(attr)) {
            attributes.technical[attr] =
                (attributes.technical[attr]! + adj.bonus).clamp(1, 20);
          }
          break;
        case 'mental':
          final attr = adj.attribute as MentalAttr;
          if (attributes.mental.containsKey(attr)) {
            attributes.mental[attr] = (attributes.mental[attr]! + adj.bonus)
                .clamp(1, 20);
          }
          break;
        case 'physical':
          final attr = adj.attribute as PhysicalAttr;
          if (attributes.physical.containsKey(attr)) {
            attributes.physical[attr] = (attributes.physical[attr]! + adj.bonus)
                .clamp(1, 20);
          }
          break;
      }
    }

    return attributes;
  }

  PlayerQualityDistribution getQualityDistribution(
    CountryCultureProfile culture,
    int totalPlayers,
  ) {
    final worldClassCount = (totalPlayers * culture.worldClassProbability)
        .round();
    final goodCount = (totalPlayers * culture.goodPlayerProbability).round();
    final averageCount = (totalPlayers * 0.40).round();
    final poorCount =
        totalPlayers - (worldClassCount + goodCount + averageCount);

    return PlayerQualityDistribution(
      worldClass: worldClassCount,
      good: goodCount,
      average: averageCount,
      poor: poorCount,
    );
  }
}

class PlayerQualityDistribution {
  final int worldClass;
  final int good;
  final int average;
  final int poor;

  PlayerQualityDistribution({
    required this.worldClass,
    required this.good,
    required this.average,
    required this.poor,
  });

  @override
  String toString() {
    return '⭐ World Class: $worldClass, 🏆 Good: $good, 📈 Average: $average, 📉 Poor: $poor';
  }
}
