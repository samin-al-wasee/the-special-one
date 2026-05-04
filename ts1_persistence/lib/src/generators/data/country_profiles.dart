// generators/data/country_profiles.dart
import 'package:ts1_core/ts1_core.dart';
import '../models/country_culture_profile.dart';

class CountryProfiles {
  static final Map<String, CountryCultureProfile> profiles = {
    // South American Countries
    'Brazil': CountryCultureProfile(
      technicalQuality: 0.95,
      physicalQuality: 0.85,
      mentalQuality: 0.80,
      worldClassProbability: 0.08,
      goodPlayerProbability: 0.25,
      developmentFactor: 0.90,
      preferredPositions: [
        'Right Winger',
        'Left Winger',
        'Attacking Midfielder',
        'Striker',
        'Central Midfielder',
      ],
      strongTechnicalAttrs: [
        TechnicalAttr.dribbling,
        TechnicalAttr.ballControl,
        TechnicalAttr.flair,
      ],
      strongMentalAttrs: [
        MentalAttr.creativity,
        MentalAttr.vision,
        // MentalAttr.flair, // ❌ REMOVED - flair is Technical, not Mental
      ],
      strongPhysicalAttrs: [PhysicalAttr.agility, PhysicalAttr.acceleration],
      weakTechnicalAttrs: [TechnicalAttr.tackling, TechnicalAttr.marking],
      weakMentalAttrs: [MentalAttr.discipline, MentalAttr.positioning],
      weakPhysicalAttrs: [PhysicalAttr.strength],
    ),

    'Argentina': CountryCultureProfile(
      technicalQuality: 0.92,
      physicalQuality: 0.78,
      mentalQuality: 0.85,
      worldClassProbability: 0.07,
      goodPlayerProbability: 0.22,
      developmentFactor: 0.88,
      preferredPositions: [
        'Attacking Midfielder',
        'Striker',
        'Central Midfielder',
        'Right Winger',
        'Left Winger',
      ],
      strongTechnicalAttrs: [
        TechnicalAttr.shortPassing, // Changed from passing to shortPassing
        TechnicalAttr.finishing,
        TechnicalAttr.firstTouch,
      ],
      strongMentalAttrs: [
        MentalAttr.vision,
        MentalAttr.creativity,
        MentalAttr.composure,
      ],
      strongPhysicalAttrs: [PhysicalAttr.agility, PhysicalAttr.balance],
      weakTechnicalAttrs: [TechnicalAttr.crossing, TechnicalAttr.heading],
      weakMentalAttrs: [MentalAttr.discipline],
      weakPhysicalAttrs: [PhysicalAttr.stamina, PhysicalAttr.strength],
    ),

    // European Countries
    'Germany': CountryCultureProfile(
      technicalQuality: 0.88,
      physicalQuality: 0.90,
      mentalQuality: 0.92,
      worldClassProbability: 0.06,
      goodPlayerProbability: 0.28,
      developmentFactor: 0.92,
      preferredPositions: [
        'Central Midfielder',
        'Defensive Midfielder',
        'Center Back',
        'Goalkeeper',
        'Right Back',
      ],
      strongTechnicalAttrs: [
        TechnicalAttr.shortPassing, // Changed from passing to shortPassing
        TechnicalAttr.firstTouch,
        TechnicalAttr.technique,
      ],
      strongMentalAttrs: [
        MentalAttr.positioning,
        MentalAttr.decisions,
        MentalAttr.tacticalAwareness,
      ],
      strongPhysicalAttrs: [
        PhysicalAttr.stamina,
        PhysicalAttr.strength,
        PhysicalAttr.naturalFitness,
      ],
      weakTechnicalAttrs: [TechnicalAttr.flair, TechnicalAttr.crossing],
      weakMentalAttrs: [],
      weakPhysicalAttrs: [],
    ),

    'Spain': CountryCultureProfile(
      technicalQuality: 0.94,
      physicalQuality: 0.75,
      mentalQuality: 0.88,
      worldClassProbability: 0.07,
      goodPlayerProbability: 0.26,
      developmentFactor: 0.91,
      preferredPositions: [
        'Central Midfielder',
        'Attacking Midfielder',
        'Defensive Midfielder',
        'Left Back',
        'Right Back',
      ],
      strongTechnicalAttrs: [
        TechnicalAttr.shortPassing, // Changed from passing to shortPassing
        TechnicalAttr.ballControl,
        TechnicalAttr.firstTouch,
      ],
      strongMentalAttrs: [
        MentalAttr.vision,
        MentalAttr.tacticalAwareness,
        MentalAttr.decisions,
      ],
      strongPhysicalAttrs: [PhysicalAttr.agility, PhysicalAttr.balance],
      weakTechnicalAttrs: [TechnicalAttr.crossing, TechnicalAttr.heading],
      weakMentalAttrs: [],
      weakPhysicalAttrs: [PhysicalAttr.strength, PhysicalAttr.jumping],
    ),

    'France': CountryCultureProfile(
      technicalQuality: 0.90,
      physicalQuality: 0.92,
      mentalQuality: 0.85,
      worldClassProbability: 0.09,
      goodPlayerProbability: 0.30,
      developmentFactor: 0.93,
      preferredPositions: [
        'Striker',
        'Right Winger',
        'Left Winger',
        'Central Midfielder',
        'Center Back',
      ],
      strongTechnicalAttrs: [
        TechnicalAttr.dribbling,
        TechnicalAttr.finishing,
        TechnicalAttr.technique,
      ],
      strongMentalAttrs: [MentalAttr.composure, MentalAttr.determination],
      strongPhysicalAttrs: [
        PhysicalAttr.acceleration,
        PhysicalAttr.strength,
        PhysicalAttr.pace,
      ],
      weakTechnicalAttrs: [],
      weakMentalAttrs: [MentalAttr.discipline, MentalAttr.concentration],
      weakPhysicalAttrs: [],
    ),

    'England': CountryCultureProfile(
      technicalQuality: 0.82,
      physicalQuality: 0.90,
      mentalQuality: 0.86,
      worldClassProbability: 0.06,
      goodPlayerProbability: 0.24,
      developmentFactor: 0.89,
      preferredPositions: [
        'Striker',
        'Central Midfielder',
        'Center Back',
        'Right Winger',
        'Left Winger',
      ],
      strongTechnicalAttrs: [
        TechnicalAttr.crossing,
        TechnicalAttr.finishing,
        TechnicalAttr.heading,
      ],
      strongMentalAttrs: [MentalAttr.determination, MentalAttr.workRate],
      strongPhysicalAttrs: [
        PhysicalAttr.stamina,
        PhysicalAttr.strength,
        PhysicalAttr.pace,
      ],
      weakTechnicalAttrs: [TechnicalAttr.ballControl, TechnicalAttr.firstTouch],
      weakMentalAttrs: [MentalAttr.tacticalAwareness],
      weakPhysicalAttrs: [],
    ),

    'Italy': CountryCultureProfile(
      technicalQuality: 0.86,
      physicalQuality: 0.80,
      mentalQuality: 0.91,
      worldClassProbability: 0.05,
      goodPlayerProbability: 0.22,
      developmentFactor: 0.87,
      preferredPositions: [
        'Center Back',
        'Defensive Midfielder',
        'Central Midfielder',
        // 'Sweeper', // ❌ Not a valid position in your enum
        'Left Back',
      ],
      strongTechnicalAttrs: [
        TechnicalAttr.tackling,
        TechnicalAttr.marking,
        TechnicalAttr.intercepting,
      ],
      strongMentalAttrs: [
        MentalAttr.positioning,
        MentalAttr.tacticalAwareness,
        MentalAttr.composure,
      ],
      strongPhysicalAttrs: [PhysicalAttr.strength, PhysicalAttr.jumping],
      weakTechnicalAttrs: [TechnicalAttr.flair, TechnicalAttr.dribbling],
      weakMentalAttrs: [],
      weakPhysicalAttrs: [PhysicalAttr.acceleration, PhysicalAttr.agility],
    ),

    'Netherlands': CountryCultureProfile(
      technicalQuality: 0.91,
      physicalQuality: 0.82,
      mentalQuality: 0.88,
      worldClassProbability: 0.06,
      goodPlayerProbability: 0.24,
      developmentFactor: 0.90,
      preferredPositions: [
        'Central Midfielder',
        'Attacking Midfielder',
        'Right Winger',
        'Left Winger',
        'Right Back',
      ],
      strongTechnicalAttrs: [
        TechnicalAttr.shortPassing, // Changed from passing to shortPassing
        TechnicalAttr.technique,
        TechnicalAttr.ballControl,
      ],
      strongMentalAttrs: [
        MentalAttr.vision,
        MentalAttr.creativity,
        MentalAttr.decisions,
      ],
      strongPhysicalAttrs: [PhysicalAttr.stamina, PhysicalAttr.agility],
      weakTechnicalAttrs: [],
      weakMentalAttrs: [MentalAttr.aggression],
      weakPhysicalAttrs: [PhysicalAttr.strength],
    ),

    'Portugal': CountryCultureProfile(
      technicalQuality: 0.89,
      physicalQuality: 0.81,
      mentalQuality: 0.84,
      worldClassProbability: 0.06,
      goodPlayerProbability: 0.23,
      developmentFactor: 0.88,
      preferredPositions: [
        'Right Winger',
        'Left Winger',
        'Attacking Midfielder',
        'Striker',
        'Central Midfielder',
      ],
      strongTechnicalAttrs: [
        TechnicalAttr.dribbling,
        TechnicalAttr.flair,
        TechnicalAttr.crossing,
      ],
      strongMentalAttrs: [MentalAttr.determination], // Removed MentalAttr.flair
      strongPhysicalAttrs: [PhysicalAttr.acceleration, PhysicalAttr.agility],
      weakTechnicalAttrs: [TechnicalAttr.tackling, TechnicalAttr.marking],
      weakMentalAttrs: [MentalAttr.tacticalAwareness],
      weakPhysicalAttrs: [PhysicalAttr.strength],
    ),

    // African Countries
    'Morocco': CountryCultureProfile(
      technicalQuality: 0.85,
      physicalQuality: 0.88,
      mentalQuality: 0.82,
      worldClassProbability: 0.04,
      goodPlayerProbability: 0.18,
      developmentFactor: 0.80,
      preferredPositions: [
        'Central Midfielder',
        'Right Winger',
        'Left Winger',
        'Right Back',
        'Left Back',
      ],
      strongTechnicalAttrs: [
        TechnicalAttr.dribbling,
        TechnicalAttr.technique,
        TechnicalAttr.firstTouch,
      ],
      strongMentalAttrs: [MentalAttr.determination, MentalAttr.workRate],
      strongPhysicalAttrs: [
        PhysicalAttr.acceleration,
        PhysicalAttr.agility,
        PhysicalAttr.stamina,
      ],
      weakTechnicalAttrs: [TechnicalAttr.heading, TechnicalAttr.crossing],
      weakMentalAttrs: [MentalAttr.concentration, MentalAttr.positioning],
      weakPhysicalAttrs: [],
    ),

    'Japan': CountryCultureProfile(
      technicalQuality: 0.87,
      physicalQuality: 0.79,
      mentalQuality: 0.90,
      worldClassProbability: 0.03,
      goodPlayerProbability: 0.20,
      developmentFactor: 0.86,
      preferredPositions: [
        'Central Midfielder',
        'Attacking Midfielder',
        'Right Back',
        'Left Back',
        'Right Winger',
      ],
      strongTechnicalAttrs: [
        TechnicalAttr.firstTouch,
        TechnicalAttr.shortPassing, // Changed from passing to shortPassing
        TechnicalAttr.technique,
      ],
      strongMentalAttrs: [
        MentalAttr.discipline,
        MentalAttr.workRate,
        MentalAttr.teamwork,
      ],
      strongPhysicalAttrs: [PhysicalAttr.stamina, PhysicalAttr.agility],
      weakTechnicalAttrs: [TechnicalAttr.flair, TechnicalAttr.crossing],
      weakMentalAttrs: [],
      weakPhysicalAttrs: [PhysicalAttr.strength, PhysicalAttr.jumping],
    ),

    'USA': CountryCultureProfile(
      technicalQuality: 0.83,
      physicalQuality: 0.89,
      mentalQuality: 0.85,
      worldClassProbability: 0.05,
      goodPlayerProbability: 0.22,
      developmentFactor: 0.88,
      preferredPositions: [
        'Central Midfielder',
        'Right Winger',
        'Left Winger',
        'Striker',
        'Right Back',
      ],
      strongTechnicalAttrs: [
        TechnicalAttr.shortPassing, // Changed from passing to shortPassing
        TechnicalAttr.crossing,
        TechnicalAttr.technique,
      ],
      strongMentalAttrs: [
        MentalAttr.workRate,
        MentalAttr.determination,
        MentalAttr.teamwork,
      ],
      strongPhysicalAttrs: [
        PhysicalAttr.acceleration,
        PhysicalAttr.stamina,
        PhysicalAttr.pace,
      ],
      weakTechnicalAttrs: [TechnicalAttr.ballControl, TechnicalAttr.firstTouch],
      weakMentalAttrs: [MentalAttr.tacticalAwareness],
      weakPhysicalAttrs: [],
    ),
  };

  static CountryCultureProfile getDefault() {
    return CountryCultureProfile(
      technicalQuality: 0.75,
      physicalQuality: 0.78,
      mentalQuality: 0.76,
      worldClassProbability: 0.02,
      goodPlayerProbability: 0.12,
      developmentFactor: 0.70,
      preferredPositions: [
        'Central Midfielder',
        'Center Back',
        'Striker',
        'Defensive Midfielder',
        'Right Back',
      ],
      strongTechnicalAttrs: [
        TechnicalAttr.shortPassing,
        TechnicalAttr.firstTouch,
      ],
      strongMentalAttrs: [MentalAttr.determination, MentalAttr.workRate],
      strongPhysicalAttrs: [PhysicalAttr.stamina, PhysicalAttr.strength],
      weakTechnicalAttrs: [TechnicalAttr.flair, TechnicalAttr.technique],
      weakMentalAttrs: [],
      weakPhysicalAttrs: [],
    );
  }

  static CountryCultureProfile getProfileForCountry(String countryName) {
    return profiles[countryName] ?? getDefault();
  }
}
