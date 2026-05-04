import 'package:go_router/go_router.dart';
import '../features/edit/presentation/screens/continent_detail_screen.dart';
import '../features/edit/presentation/screens/continent_list_screen.dart';
import '../features/edit/presentation/screens/country_detail_screen.dart';
import '../features/edit/presentation/screens/country_list_screen.dart';
import '../features/edit/presentation/screens/edit_home_screen.dart';
import '../features/edit/presentation/screens/player_continent_scope_screen.dart';
import '../features/edit/presentation/screens/player_country_scope_screen.dart';
import '../features/edit/presentation/screens/player_detail_screen.dart';
import '../features/edit/presentation/screens/player_list_screen.dart';
import '../features/edit/presentation/screens/team_detail_screen.dart';
import '../features/edit/presentation/screens/team_list_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/match/presentation/screens/live_match_screen.dart';
import '../features/match/presentation/screens/lineup_screen.dart';
import '../features/match/presentation/screens/pre_match_screen.dart';
import '../features/match/presentation/screens/setup_screen.dart';
import '../features/match/presentation/screens/match_rating_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/pre-match',
      builder: (context, state) => const PreMatchScreen(),
    ),
    GoRoute(
      path: '/setup',
      builder: (context, state) => const MatchConfigurationScreen(),
    ),
    GoRoute(path: '/lineup', builder: (context, state) => const LineupScreen()),
    GoRoute(
      path: '/match',
      builder: (context, state) => const LiveMatchScreen(),
    ),
    GoRoute(
      path: '/summary',
      builder: (context, state) => const MatchRatingScreen(),
    ),
    GoRoute(path: '/edit', builder: (context, state) => const EditHomeScreen()),
    GoRoute(
      path: '/edit/continents',
      builder: (context, state) => const ContinentListScreen(),
    ),
    GoRoute(
      path: '/edit/continents/:continentId',
      builder: (context, state) {
        final continentId = int.tryParse(
          state.pathParameters['continentId'] ?? '',
        );
        return ContinentDetailScreen(continentId: continentId ?? -1);
      },
    ),
    GoRoute(
      path: '/edit/countries',
      builder: (context, state) => const CountryListScreen(),
    ),
    GoRoute(
      path: '/edit/countries/:countryId',
      builder: (context, state) {
        final countryId = int.tryParse(state.pathParameters['countryId'] ?? '');
        return CountryDetailScreen(countryId: countryId ?? -1);
      },
    ),
    GoRoute(
      path: '/edit/teams',
      builder: (context, state) => const TeamListScreen(),
    ),
    GoRoute(
      path: '/edit/teams/:teamId',
      builder: (context, state) {
        final teamId = int.tryParse(state.pathParameters['teamId'] ?? '');
        return TeamDetailScreen(teamId: teamId ?? -1);
      },
    ),
    GoRoute(
      path: '/edit/players',
      builder: (context, state) => const PlayerContinentScopeScreen(),
    ),
    GoRoute(
      path: '/edit/players/continent/:continentId',
      builder: (context, state) {
        final continentId = int.tryParse(
          state.pathParameters['continentId'] ?? '',
        );
        return PlayerCountryScopeScreen(continentId: continentId ?? -1);
      },
    ),
    GoRoute(
      path: '/edit/players/country/:countryId',
      builder: (context, state) {
        final countryId = int.tryParse(state.pathParameters['countryId'] ?? '');
        return PlayerListScreen(countryId: countryId ?? -1);
      },
    ),
    GoRoute(
      path: '/edit/players/detail/:playerId',
      builder: (context, state) {
        final playerId = int.tryParse(state.pathParameters['playerId'] ?? '');
        return PlayerDetailScreen(playerId: playerId ?? -1);
      },
    ),
  ],
);
