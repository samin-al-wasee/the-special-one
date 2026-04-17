// generators/models/country_culture_profile.dart
import 'package:ts1_core/ts1_core.dart';

class CountryCultureProfile {
  final double technicalQuality;
  final double physicalQuality;
  final double mentalQuality;
  final double worldClassProbability;
  final double goodPlayerProbability;
  final double developmentFactor;
  final List<String> preferredPositions;
  final List<TechnicalAttr> strongTechnicalAttrs;
  final List<MentalAttr> strongMentalAttrs;
  final List<PhysicalAttr> strongPhysicalAttrs;
  final List<TechnicalAttr> weakTechnicalAttrs;
  final List<MentalAttr> weakMentalAttrs;
  final List<PhysicalAttr> weakPhysicalAttrs;

  const CountryCultureProfile({
    required this.technicalQuality,
    required this.physicalQuality,
    required this.mentalQuality,
    required this.worldClassProbability,
    required this.goodPlayerProbability,
    required this.developmentFactor,
    required this.preferredPositions,
    required this.strongTechnicalAttrs,
    required this.strongMentalAttrs,
    required this.strongPhysicalAttrs,
    required this.weakTechnicalAttrs,
    required this.weakMentalAttrs,
    required this.weakPhysicalAttrs,
  });

  double get averageQuality =>
      (technicalQuality + physicalQuality + mentalQuality) / 3;

  bool isStrongTechnical(TechnicalAttr attr) =>
      strongTechnicalAttrs.contains(attr);
  bool isStrongMental(MentalAttr attr) => strongMentalAttrs.contains(attr);
  bool isStrongPhysical(PhysicalAttr attr) =>
      strongPhysicalAttrs.contains(attr);

  bool isWeakTechnical(TechnicalAttr attr) => weakTechnicalAttrs.contains(attr);
  bool isWeakMental(MentalAttr attr) => weakMentalAttrs.contains(attr);
  bool isWeakPhysical(PhysicalAttr attr) => weakPhysicalAttrs.contains(attr);
}
