import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../database/app_database.dart';
import '../theme/app_colors.dart';
import '../../features/calendar/presentation/bloc/calendar_bloc.dart';
import '../../features/calendar/presentation/screens/calendar_day_screen.dart';
import '../../features/calendar/presentation/screens/calendar_screen.dart';
import '../../features/dream_journal/presentation/screens/character_new_screen.dart';
import '../../features/dream_journal/presentation/screens/dream_edit_screen.dart';
import '../../features/dream_journal/presentation/screens/dream_new_screen.dart';
import '../../features/dream_journal/presentation/screens/dreams_screen.dart';
import '../../features/obe_log/presentation/screens/obe_edit_screen.dart';
import '../../features/obe_log/presentation/screens/obe_new_screen.dart';
import '../../features/obe_log/presentation/screens/obe_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_gate.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/rundown/presentation/screens/today_screen.dart';
import '../../features/dream_journal/presentation/screens/dream_detail_screen.dart';
import '../../features/obe_log/presentation/screens/obe_detail_screen.dart';
import '../../features/settings/presentation/screens/field_guide_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import 'app_routes.dart';

/// Navigator keys — one per tab branch + root for modals/settings.
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final todayNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'today');
final dreamsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'dreams');
final obeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'obe');
final calendarNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'calendar');

GoRouter createAppRouter() {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    redirect: _topLevelRedirect,
    routes: [
      // ----------------------------------------------------------------
      // ROOT — OnboardingGate checks prefs and redirects accordingly
      // ----------------------------------------------------------------
      GoRoute(
        path: '/',
        builder: (context, state) => const OnboardingGate(),
      ),

      // ----------------------------------------------------------------
      // ONBOARDING — also reachable directly (e.g. from Settings)
      // ----------------------------------------------------------------
      GoRoute(
        path: '/onboarding',
        name: AppRoutes.onboarding,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const OnboardingScreen(),
      ),

      // ----------------------------------------------------------------
      // SETTINGS — root-level, covers the shell + bottom nav
      // ----------------------------------------------------------------
      GoRoute(
        path: '/settings',
        name: AppRoutes.settings,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) => const MaterialPage(
          fullscreenDialog: true,
          child: SettingsScreen(),
        ),
        routes: [
          GoRoute(
            path: 'notifications',
            name: AppRoutes.settingsNotifications,
            parentNavigatorKey: rootNavigatorKey,
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('Notification Settings'))),
          ),
        ],
      ),
      GoRoute(
        path: '/field-guide',
        name: AppRoutes.fieldGuide,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) => const MaterialPage(
          fullscreenDialog: true,
          child: FieldGuideScreen(),
        ),
      ),

      // ----------------------------------------------------------------
      // MODAL CREATION ROUTES — float above the shell
      // ----------------------------------------------------------------
      GoRoute(
        path: '/today/:date/new',
        name: AppRoutes.rundownNew,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) {
          final date = state.pathParameters['date']!;
          return MaterialPage(
            fullscreenDialog: true,
            child: Scaffold(
              body: Center(child: Text('New Rundown for $date')),
            ),
          );
        },
      ),
      GoRoute(
        path: '/journal/dreams/new',
        name: AppRoutes.dreamNew,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) {
          final prefillDate = state.uri.queryParameters['date'];
          return _voidFadePage(DreamNewScreen(prefillDate: prefillDate));
        },
      ),
      GoRoute(
        path: '/journal/obe/new',
        name: AppRoutes.obeNew,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) {
          final prefillDate = state.uri.queryParameters['date'];
          return _voidFadePage(ObeNewScreen(prefillDate: prefillDate));
        },
      ),
      GoRoute(
        path: '/journal/characters/new',
        name: AppRoutes.characterNew,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) =>
            _voidFadePage(const CharacterNewScreen()),
      ),
      GoRoute(
        path: '/journal/dreams/:dreamId/links/search',
        name: AppRoutes.dreamLinkSearch,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) {
          final dreamId = state.pathParameters['dreamId']!;
          return MaterialPage(
            fullscreenDialog: true,
            child: Scaffold(
              body: Center(child: Text('Link Search for dream $dreamId')),
            ),
          );
        },
      ),

      // ----------------------------------------------------------------
      // STATEFUL SHELL — 5-tab bottom nav
      // ----------------------------------------------------------------
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            _ScaffoldWithBottomNav(navigationShell: navigationShell),
        branches: [
          // --- TODAY TAB ---
          StatefulShellBranch(
            navigatorKey: todayNavigatorKey,
            routes: [
              GoRoute(
                path: '/today',
                name: AppRoutes.today,
                // Redirect handles /today → /today/:date before this renders
                builder: (context, state) => const SizedBox.shrink(),
                routes: [
                  GoRoute(
                    path: ':date',
                    name: AppRoutes.todayRundown,
                    builder: (context, state) {
                      final date = state.pathParameters['date']!;
                      return TodayScreen(date: date);
                    },
                    routes: [
                      GoRoute(
                        path: 'edit',
                        name: AppRoutes.rundownEdit,
                        builder: (context, state) {
                          final date = state.pathParameters['date']!;
                          return Scaffold(
                              body: Center(child: Text('Edit Rundown $date')));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          // --- DREAMS TAB ---
          StatefulShellBranch(
            navigatorKey: dreamsNavigatorKey,
            routes: [
              GoRoute(
                path: '/journal/dreams',
                name: AppRoutes.dreams,
                builder: (context, state) => const DreamsScreen(),
                routes: [
                  GoRoute(
                    path: ':dreamId',
                    name: AppRoutes.dreamDetail,
                    builder: (context, state) {
                      final id = int.parse(state.pathParameters['dreamId']!);
                      return DreamDetailScreen(dreamId: id);
                    },
                    routes: [
                      GoRoute(
                        path: 'edit',
                        name: AppRoutes.dreamEdit,
                        builder: (context, state) {
                          final id = int.parse(state.pathParameters['dreamId']!);
                          return DreamEditScreen(dreamId: id);
                        },
                      ),
                      GoRoute(
                        path: 'links',
                        name: AppRoutes.dreamLinks,
                        builder: (context, state) {
                          final id = state.pathParameters['dreamId']!;
                          return Scaffold(
                              body: Center(child: Text('Dream Links $id')));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          // --- OBE TAB ---
          StatefulShellBranch(
            navigatorKey: obeNavigatorKey,
            routes: [
              GoRoute(
                path: '/journal/obe',
                name: AppRoutes.obe,
                builder: (context, state) => const ObeScreen(),
                routes: [
                  GoRoute(
                    path: ':obeId',
                    name: AppRoutes.obeDetail,
                    builder: (context, state) {
                      final id = int.parse(state.pathParameters['obeId']!);
                      return ObeDetailScreen(obeId: id);
                    },
                    routes: [
                      GoRoute(
                        path: 'edit',
                        name: AppRoutes.obeEdit,
                        builder: (context, state) {
                          final id = int.parse(state.pathParameters['obeId']!);
                          return ObeEditScreen(obeId: id);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          // --- CALENDAR TAB ---
          StatefulShellBranch(
            navigatorKey: calendarNavigatorKey,
            routes: [
              GoRoute(
                path: '/calendar',
                name: AppRoutes.calendarMonth,
                builder: (context, state) => BlocProvider(
                  create: (_) => CalendarBloc(GetIt.instance<AppDatabase>())
                    ..add(LoadCalendarMonth(
                        DateTime.now().year, DateTime.now().month)),
                  child: const CalendarScreen(),
                ),
                routes: [
                  GoRoute(
                    path: ':date',
                    name: AppRoutes.calendarDay,
                    builder: (context, state) {
                      final date = state.pathParameters['date']!;
                      return CalendarDayScreen(date: date);
                    },
                    routes: [
                      GoRoute(
                        path: 'dreams/:dreamId',
                        name: AppRoutes.calendarDreamDetail,
                        builder: (context, state) {
                          final id = int.parse(state.pathParameters['dreamId']!);
                          return DreamDetailScreen(dreamId: id);
                        },
                      ),
                      GoRoute(
                        path: 'obe/:obeId',
                        name: AppRoutes.calendarObeDetail,
                        builder: (context, state) {
                          final id = int.parse(state.pathParameters['obeId']!);
                          return ObeDetailScreen(obeId: id);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

/// Fade-to-void transition: fades through voidBlack when pushing/popping modals.
/// Mimics a CRT switching inputs — 80ms out, 100ms in, total ~180ms.
CustomTransitionPage<void> _voidFadePage(Widget child) {
  return CustomTransitionPage<void>(
    child: child,
    transitionDuration: const Duration(milliseconds: 180),
    reverseTransitionDuration: const Duration(milliseconds: 160),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ColoredBox(
        color: AppColors.voidBlack,
        child: FadeTransition(opacity: animation, child: child),
      );
    },
  );
}

String? _topLevelRedirect(BuildContext context, GoRouterState state) {
  if (state.matchedLocation == '/today') {
    return '/today/${_todayDateString()}';
  }
  return null;
}

String _todayDateString() {
  final now = DateTime.now();
  return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
}

// ---------------------------------------------------------------------------
// Shell scaffold with bottom nav
// ---------------------------------------------------------------------------

class _ScaffoldWithBottomNav extends StatelessWidget {
  const _ScaffoldWithBottomNav({required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top border on the nav bar — retro terminal feel
          Container(height: 1, color: AppColors.borderNormal),
          NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: (index) {
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            },
            destinations: [
              _navDest(
                label: 'TODAY',
                icon: Icons.wb_sunny_outlined,
                selectedIcon: Icons.wb_sunny,
              ),
              _navDest(
                label: 'DREAMS',
                icon: Icons.nights_stay_outlined,
                selectedIcon: Icons.nights_stay,
              ),
              _navDest(
                label: 'OBE',
                icon: Icons.blur_on_outlined,
                selectedIcon: Icons.blur_on,
              ),
              _navDest(
                label: 'LOG',
                icon: Icons.calendar_month_outlined,
                selectedIcon: Icons.calendar_month,
              ),
            ],
          ),
        ],
      ),
    );
  }

  NavigationDestination _navDest({
    required String label,
    required IconData icon,
    required IconData selectedIcon,
  }) {
    return NavigationDestination(
      icon: Icon(icon),
      selectedIcon: Icon(selectedIcon),
      label: label,
    );
  }
}
