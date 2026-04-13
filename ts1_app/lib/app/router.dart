import 'package:go_router/go_router.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/match/presentation/screens/live_match_screen.dart';
import '../features/match/presentation/screens/lineup_screen.dart';
import '../features/match/presentation/screens/setup_screen.dart';
import '../features/match/presentation/screens/match_rating_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
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
  ],
);
