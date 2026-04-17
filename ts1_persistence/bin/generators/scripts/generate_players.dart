// generators/scripts/run_player_generation.dart
import 'package:ts1_persistence/src/db/database.dart';
import 'package:ts1_persistence/src/repositories/country_repository.dart';
import 'package:ts1_persistence/src/repositories/player_repository.dart';
import '../player_generator.dart';
import '../services/name_generator_service.dart';
import '../services/attribute_generator_service.dart';
import '../services/position_generator_service.dart';
import '../services/physical_generator_service.dart';
import '../data/country_profiles.dart';

class PlayerGenerationScript {
  final AppDatabase database;
  late final CountryRepository countryRepository;
  late final PlayerRepository playerRepository;
  late final PlayerGenerator playerGenerator;

  PlayerGenerationScript(this.database) {
    countryRepository = CountryRepository(database.countryDao);
    playerRepository = PlayerRepository(database.playerDao, countryRepository);
    playerGenerator = PlayerGenerator(
      nameGenerator: NameGeneratorService(),
      attributeGenerator: AttributeGeneratorService(),
      positionGenerator: PositionGeneratorService(),
      physicalGenerator: PhysicalGeneratorService(),
    );
  }

  Future<void> run({int playersPerCountry = 100}) async {
    print('🎮 Starting player generation script...');
    print('=' * 50);

    final countries = await countryRepository.getAllCountries();
    int totalGenerated = 0;
    final stats = <String, PlayerQualityDistribution>{};

    for (final country in countries) {
      print('\n📝 Generating players for ${country.name}...');

      final players = playerGenerator.generatePlayersForCountry(
        country: country,
        count: playersPerCountry,
      );

      // Save players to database
      for (final player in players) {
        await playerRepository.save(player);
      }

      // Calculate distribution for this country
      final cultureProfile = CountryProfiles.getProfileForCountry(country.name);
      final distribution = playerGenerator.getQualityDistribution(
        cultureProfile,
        playersPerCountry,
      );

      stats[country.name] = distribution;
      totalGenerated += players.length;

      print('   ✅ Generated ${players.length} players');
      print('   📊 Distribution: $distribution');
    }

    print('\n${'=' * 50}');
    print('🎉 Generation complete!');
    print('📈 Total players generated: $totalGenerated');
    print('\n📊 Summary by country:');
    for (final entry in stats.entries) {
      print('   ${entry.key}: ${entry.value}');
    }
  }
}

// Usage
void main() async {
  final database = AppDatabase();
  final script = PlayerGenerationScript(database);

  await script.run(playersPerCountry: 100);

  await database.close();
}
