import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ts1_core/ts1_core.dart';
import 'package:ts1_persistence/ts1_persistence.dart';

import '../../../app/persistence/persistence_providers.dart';

class ContinentOverview {
  ContinentOverview({
    required this.continent,
    required this.teamCount,
    required this.playerCount,
    required this.countryNames,
  });

  final ContinentRecord continent;
  final int teamCount;
  final int playerCount;
  final List<String> countryNames;
}

class CountryOverview {
  CountryOverview({
    required this.country,
    required this.team,
    required this.playerCount,
  });

  final CountryRecord country;
  final NationalTeamRecord? team;
  final int playerCount;
}

class PlayerContinentScope {
  PlayerContinentScope({required this.continent, required this.playerCount});

  final ContinentRecord continent;
  final int playerCount;
}

class PlayerCountryScope {
  PlayerCountryScope({required this.country, required this.playerCount});

  final CountryRecord country;
  final int playerCount;
}

final continentOverviewsProvider = FutureProvider<List<ContinentOverview>>((
  ref,
) async {
  final db = await ref.watch(appDatabaseProvider.future);
  final continents = await db.select(db.continents).get();
  final countries = await db.select(db.countries).get();
  final teams = await db.select(db.nationalTeams).get();
  final players = await db.select(db.players).get();

  final teamsByCountry = <int, int>{};
  for (final team in teams) {
    teamsByCountry.update(
      team.countryId,
      (count) => count + 1,
      ifAbsent: () => 1,
    );
  }

  final playersByCountry = <int, int>{};
  for (final player in players) {
    playersByCountry.update(
      player.countryId,
      (count) => count + 1,
      ifAbsent: () => 1,
    );
  }

  final result = <ContinentOverview>[];
  for (final continent in continents) {
    final countriesInContinent = countries
        .where((country) => country.continentId == continent.id)
        .toList();

    var teamCount = 0;
    var playerCount = 0;
    for (final country in countriesInContinent) {
      teamCount += teamsByCountry[country.id] ?? 0;
      playerCount += playersByCountry[country.id] ?? 0;
    }

    result.add(
      ContinentOverview(
        continent: continent,
        teamCount: teamCount,
        playerCount: playerCount,
        countryNames: countriesInContinent
            .map((country) => country.name)
            .toList(),
      ),
    );
  }

  result.sort((a, b) => a.continent.name.compareTo(b.continent.name));
  return result;
});

final continentOverviewProvider =
    FutureProvider.family<ContinentOverview?, int>((ref, continentId) async {
      final overviews = await ref.watch(continentOverviewsProvider.future);
      for (final overview in overviews) {
        if (overview.continent.id == continentId) {
          return overview;
        }
      }
      return null;
    });

final countryOverviewsProvider = FutureProvider<List<CountryOverview>>((
  ref,
) async {
  final db = await ref.watch(appDatabaseProvider.future);
  final countries = await db.select(db.countries).get();
  final teams = await db.select(db.nationalTeams).get();
  final players = await db.select(db.players).get();

  final teamByCountry = <int, NationalTeamRecord>{};
  for (final team in teams) {
    teamByCountry[team.countryId] = team;
  }

  final playersByCountry = <int, int>{};
  for (final player in players) {
    playersByCountry.update(
      player.countryId,
      (count) => count + 1,
      ifAbsent: () => 1,
    );
  }

  final result = [
    for (final country in countries)
      CountryOverview(
        country: country,
        team: teamByCountry[country.id],
        playerCount: playersByCountry[country.id] ?? 0,
      ),
  ];

  result.sort((a, b) => a.country.name.compareTo(b.country.name));
  return result;
});

final countryOverviewProvider = FutureProvider.family<CountryOverview?, int>((
  ref,
  countryId,
) async {
  final overviews = await ref.watch(countryOverviewsProvider.future);
  for (final overview in overviews) {
    if (overview.country.id == countryId) {
      return overview;
    }
  }
  return null;
});

final teamsProvider = FutureProvider<List<Team>>((ref) async {
  return ref.watch(availableNationalTeamsProvider.future);
});

final teamByIdProvider = FutureProvider.family<Team?, int>((ref, teamId) async {
  final repo = await ref.watch(nationalTeamRepositoryProvider.future);
  return repo.getTeamWithTactics(teamId);
});

final playerContinentScopesProvider =
    FutureProvider<List<PlayerContinentScope>>((ref) async {
      final db = await ref.watch(appDatabaseProvider.future);
      final continents = await db.select(db.continents).get();
      final countries = await db.select(db.countries).get();
      final players = await db.select(db.players).get();

      final playersByCountry = <int, int>{};
      for (final player in players) {
        playersByCountry.update(
          player.countryId,
          (count) => count + 1,
          ifAbsent: () => 1,
        );
      }

      final scopes = <PlayerContinentScope>[];
      for (final continent in continents) {
        final countriesInContinent = countries.where(
          (c) => c.continentId == continent.id,
        );
        var playerCount = 0;
        for (final country in countriesInContinent) {
          playerCount += playersByCountry[country.id] ?? 0;
        }
        scopes.add(
          PlayerContinentScope(continent: continent, playerCount: playerCount),
        );
      }

      scopes.sort((a, b) => a.continent.name.compareTo(b.continent.name));
      return scopes;
    });

final playerCountryScopesByContinentProvider =
    FutureProvider.family<List<PlayerCountryScope>, int>((
      ref,
      continentId,
    ) async {
      final db = await ref.watch(appDatabaseProvider.future);
      final countries = await (db.select(
        db.countries,
      )..where((country) => country.continentId.equals(continentId))).get();
      final players = await db.select(db.players).get();

      final playersByCountry = <int, int>{};
      for (final player in players) {
        playersByCountry.update(
          player.countryId,
          (count) => count + 1,
          ifAbsent: () => 1,
        );
      }

      final scopes = [
        for (final country in countries)
          PlayerCountryScope(
            country: country,
            playerCount: playersByCountry[country.id] ?? 0,
          ),
      ];

      scopes.sort((a, b) => a.country.name.compareTo(b.country.name));
      return scopes;
    });

final playersByCountryProvider = FutureProvider.family<List<Player>, int>(
  (ref, countryId) async {
    final repo = await ref.watch(playerRepositoryProvider.future);
    return repo.getPlayersByCountryId(countryId);
  },
);

final playerByIdProvider = FutureProvider.family<Player?, int>((
  ref,
  playerId,
) async {
  final repo = await ref.watch(playerRepositoryProvider.future);
  return repo.getById(playerId);
});

final countryByIdProvider = FutureProvider.family<CountryRecord?, int>((
  ref,
  countryId,
) async {
  final repo = await ref.watch(countryRepositoryProvider.future);
  try {
    return repo.getCountryById(countryId);
  } catch (_) {
    return null;
  }
});
