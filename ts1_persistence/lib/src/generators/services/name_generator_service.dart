// generators/services/name_generator_service.dart
import 'dart:math';
import '../data/name_pools.dart';

class NameGeneratorService {
  final Random _random = Random();

  String generateName(String countryName) {
    final region = NamePools.getRegionForCountry(countryName);
    final firstNames =
        NamePools.firstNames[region] ?? NamePools.firstNames['europe']!;
    final lastNames =
        NamePools.lastNames[region] ?? NamePools.lastNames['europe']!;

    final firstName = firstNames[_random.nextInt(firstNames.length)];
    final lastName = lastNames[_random.nextInt(lastNames.length)];

    return '$firstName $lastName';
  }
}
