import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../database/app_database.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/neu_surface.dart';
import '../widgets/terminal_glyph.dart';
import '../../features/calendar/presentation/bloc/calendar_bloc.dart';
import '../../features/calendar/presentation/screens/calendar_day_screen.dart';
import '../../features/calendar/presentation/screens/calendar_screen.dart';
import '../../features/content/presentation/screens/affirmation_edit_screen.dart';
import '../../features/content/presentation/screens/affirmations_manage_screen.dart';
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
        path: '/affirmations',
        name: AppRoutes.affirmationsManage,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) =>
            _voidFadePage(const AffirmationsManageScreen()),
        routes: [
          GoRoute(
            path: 'new',
            name: AppRoutes.affirmationNew,
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) =>
                _voidFadePage(const AffirmationEditScreen()),
          ),
          GoRoute(
            path: ':id/edit',
            name: AppRoutes.affirmationEdit,
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return _voidFadePage(AffirmationEditScreen(itemId: id));
            },
          ),
        ],
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
          // Hairline separator above the bottom nav.
          Container(
            height: 1,
            color: AppColors.borderSubtle,
          ),
          _NeuBottomNav(
            currentIndex: navigationShell.currentIndex,
            onSelected: (index) {
              if (index != navigationShell.currentIndex) {
                HapticFeedback.selectionClick();
              }
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            },
            items: const [
              _NavItem(label: 'TODAY', glyph: Glyphs.tabToday),
              _NavItem(label: 'DREAMS', glyph: Glyphs.tabDreams),
              _NavItem(
                label: 'OBE',
                glyph: Glyphs.tabObe,
                selectedGlyph: Glyphs.tabObeActive,
              ),
              _NavItem(label: 'LOG', glyph: Glyphs.tabLog),
            ],
          ),
        ],
      ),
    );
  }

}

class _NavItem {
  const _NavItem({
    required this.label,
    required this.glyph,
    this.selectedGlyph,
  });

  final String label;
  final String glyph;
  final String? selectedGlyph;
}

/// Custom bottom nav. Inactive tabs render exactly like the prior
/// NavigationBar destinations (muted glyph + label). Active tab wraps
/// its contents in a NeuInset pillow so it reads as a pressed-in button.
class _NeuBottomNav extends StatelessWidget {
  const _NeuBottomNav({
    required this.currentIndex,
    required this.onSelected,
    required this.items,
  });

  final int currentIndex;
  final ValueChanged<int> onSelected;
  final List<_NavItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundBase,
      padding: EdgeInsets.only(
        top: 4,
        // Pull the nav closer to the home indicator. Keep ~6px so the
        // active inset pillow doesn't clip into the indicator zone.
        bottom: (MediaQuery.paddingOf(context).bottom * 0.55).clamp(10, 24),
        left: 8,
        right: 8,
      ),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            for (int i = 0; i < items.length; i++)
              Expanded(
                child: _NavCell(
                  item: items[i],
                  selected: i == currentIndex,
                  onTap: () => onSelected(i),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _NavCell extends StatelessWidget {
  const _NavCell({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final _NavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.amber : AppColors.textMuted;
    final glyph = selected ? (item.selectedGlyph ?? item.glyph) : item.glyph;

    final content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        TerminalGlyph(glyph, size: 18, color: color),
        const SizedBox(height: 4),
        Text(
          item.label,
          style: AppTypography.navLabel.copyWith(
            color: color,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: selected
            ? NeuInset(
                radius: 10,
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Center(child: content),
              )
            : Center(child: content),
      ),
    );
  }
}
