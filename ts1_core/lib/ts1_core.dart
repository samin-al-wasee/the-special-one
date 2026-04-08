/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'src/enums/player_attributes.dart';
import 'src/enums/position.dart';
import 'src/models/player.dart';

export 'src/ts1_core_base.dart';
export 'src/enums/player_attributes.dart';
export 'src/enums/position.dart';
export 'src/enums/role.dart';
export 'src/enums/duty.dart';
export 'src/models/player.dart';

/// Creates a few sample players and prints them to stdout.
void printSamplePlayers() {
  final players = <Player>[
    Player(
      id: 7,
      name: 'Cristiano Ronaldo',
      dateOfBirth: DateTime(1985, 2, 5),
      heightCm: 187,
      weightKg: 83,
      position: Position.striker,
      footedness: Footedness.right,
      technical: const {TechnicalAttr.finishing: 95, TechnicalAttr.heading: 92},
      mental: const {MentalAttr.composure: 94, MentalAttr.determination: 97},
      physical: const {PhysicalAttr.pace: 89, PhysicalAttr.strength: 90},
    ),
    Player(
      id: 10,
      name: 'Lionel Messi',
      dateOfBirth: DateTime(1987, 6, 24),
      heightCm: 170,
      weightKg: 72,
      position: Position.rightWinger,
      footedness: Footedness.left,
      technical: const {TechnicalAttr.dribbling: 97, TechnicalAttr.passing: 95},
      mental: const {MentalAttr.vision: 96, MentalAttr.decisions: 94},
      physical: const {PhysicalAttr.balance: 95, PhysicalAttr.agility: 93},
    ),
    Player(
      id: 8,
      name: 'Kevin De Bruyne',
      dateOfBirth: DateTime(1991, 6, 28),
      heightCm: 181,
      weightKg: 70,
      position: Position.attackingMidfielder,
      footedness: Footedness.right,
      technical: const {
        TechnicalAttr.longPassing: 96,
        TechnicalAttr.setPieceDelivery: 93,
      },
      mental: const {MentalAttr.vision: 97, MentalAttr.creativity: 95},
      physical: const {
        PhysicalAttr.stamina: 90,
        PhysicalAttr.naturalFitness: 89,
      },
    ),
  ];

  for (final player in players) {
    print(player);
  }
}

void main() {
  printSamplePlayers();
}
