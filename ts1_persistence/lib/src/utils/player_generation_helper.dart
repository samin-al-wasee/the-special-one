import 'package:ts1_persistence/src/db/database.dart';
import 'package:ts1_persistence/src/repositories/country_repository.dart';
import 'package:ts1_persistence/src/repositories/player_repository.dart';
import 'package:ts1_persistence/src/generators/player_generator.dart';
import 'package:ts1_persistence/src/generators/services/name_generator_service.dart';
import 'package:ts1_persistence/src/generators/services/attribute_generator_service.dart';
import 'package:ts1_persistence/src/generators/services/position_generator_service.dart';
import 'package:ts1_persistence/src/generators/services/physical_generator_service.dart';
import 'package:ts1_persistence/src/generators/data/country_profiles.dart';

class PlayerGenerationHelper {
  final AppDatabase database;
  late final CountryRepository countryRepository;
  late final PlayerRepository playerRepository;
  late final PlayerGenerator playerGenerator;

  PlayerGenerationHelper(this.database) {
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
