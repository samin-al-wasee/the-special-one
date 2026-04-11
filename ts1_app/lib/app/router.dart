import 'package:go_router/go_router.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/match/presentation/screens/match_screen.dart';
import '../features/match/presentation/screens/pre_match_lineup_screen.dart';
import '../features/match/presentation/screens/match_setup_screen.dart';
import '../features/match/presentation/screens/match_summary_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/setup',
      builder: (context, state) => const MatchSetupScreen(),
    ),
    GoRoute(
      path: '/lineup',
      builder: (context, state) => const PreMatchLineupScreen(),
    ),
    GoRoute(
      path: '/match',
      builder: (context, state) => const MatchScreen(),
    ),
    GoRoute(
      path: '/summary',
      builder: (context, state) => const MatchSummaryScreen(),
    ),
  ],
);
