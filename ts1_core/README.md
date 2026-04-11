# ts1_core

`ts1_core` is the simulation core for The Special One. Add it to another Dart or Flutter project and import `package:ts1_core/ts1_core.dart` to access the match engine, models, factories, and enums.

## Install

For a local workspace dependency:

```yaml
dependencies:
  ts1_core:
    path: ../ts1_core
```

## Use

```dart
import 'package:ts1_core/ts1_core.dart';

void main() {
  final match = MatchEngine.bootstrapMatch(
    id: 1,
    homeTeam: homeTeam,
    awayTeam: awayTeam,
    kickoffAt: DateTime.now(),
  );

  final liveMatch = MatchEngine.kickoffMatch(match);
  final finishedMatch = MatchEngine.simulateMatch(liveMatch);
}
```

Build your teams with the exported `Team`, `Player`, `TeamLineup`, `TeamTactic`, `FormationFactory`, and `TacticalPresetFactory` types.
