# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Dreamward** is a Flutter app for personal consciousness and dream journaling. It is non-extractive: flat-rate, no ads, no engagement hooks. All data is local-only (no cloud sync).

**Core features:** Daily rundown (prompted day recall), Dream journal (with character/place entity linking and continuation chains), OBE travel log, Content library (techniques, affirmations, meditations, visualizations), Calendar view, Local notifications.

## Commands

```bash
# Get dependencies
flutter pub get

# Run code generation (required after any change to @freezed, @injectable, or drift tables)
dart run build_runner build --delete-conflicting-outputs

# Run app
flutter run

# Run all tests
flutter test

# Run a single test file
flutter test test/core/database/daos/dream_dao_test.dart

# Run tests matching a name pattern
flutter test --name "DreamDao"

# Analyze for lint errors
flutter analyze

# Check dependency versions
flutter pub outdated
```

**Code generation must be re-run whenever you:**
- Add or modify a `@freezed` class
- Add or modify a drift `Table` or `DAO`
- Add or modify an `@injectable` / `@singleton` class

## Tech Stack

| Concern | Package |
|---|---|
| State management | `flutter_bloc` — BLoC + Cubit |
| Navigation | `go_router` — `StatefulShellRoute` for tabs |
| Data models | `freezed` + `json_serializable` |
| Local database | `drift` (SQLite) |
| Dependency injection | `get_it` + `injectable` |
| Local notifications | `flutter_local_notifications` |
| Audio | `just_audio` |

## Architecture

### Folder Structure

```
lib/
├── main.dart                    # Entry point: configureDependencies() → runApp()
├── core/
│   ├── database/                # ALL drift tables and DAOs (centralized, not per-feature)
│   │   ├── app_database.dart    # @DriftDatabase root — the single source of truth for schema
│   │   ├── tables/              # 13 table definitions
│   │   ├── daos/                # 6 DAOs: DailyRundownDao, DreamDao, DreamEntityDao, ObeDao, ContentDao, CalendarDao
│   │   └── seeds/               # built_in_content_seeder.dart (runs on first install)
│   ├── di/                      # injection.dart + database_module.dart
│   ├── router/                  # app_router.dart + app_routes.dart (AppRoutes constants)
│   ├── theme/                   # AppTheme, AppColors, AppTextStyles, AppSpacing
│   ├── notifications/           # NotificationService singleton
│   ├── models/                  # Cross-feature freezed models (DreamEntry, ObeEntry, RundownEntry, Tag)
│   ├── extensions/              # BuildContext, DateTime, String extensions
│   ├── constants/               # app_constants.dart, asset_paths.dart
│   └── widgets/                 # Globally reusable widgets
└── features/
    ├── rundown/                 # Daily prompted recall
    ├── dream_journal/           # Dream log + entity linking
    ├── obe_log/                 # OBE session log
    ├── content/                 # Techniques / affirmations / meditations / visualizations
    ├── calendar/                # Month calendar + day detail view
    └── settings/                # Reminders + preferences
```

Each feature follows: `data/repositories/` → `domain/{models,use_cases}/` → `presentation/{bloc,screens,widgets}/`

### Why Drift Tables Are in `core/`, Not in Features

Drift's `@DriftDatabase` requires a single class listing all tables at compile time. Scattering tables into features would create a dependency inversion (core imports from features). All tables and DAOs live in `core/database/`, organized by domain within that folder.

### Database Key Design Decisions

- **`DailyRundowns` uses date string `'YYYY-MM-DD'` as primary key** — enforces one-per-day, enables efficient range queries without extra indexes.
- **Continuation chains use two fields**: `continuationOfId` (direct parent FK) + `continuationChainId` (UUID shared across a chain). This allows fetching a full chain with a simple `WHERE` — no recursive CTEs needed.
- **Dream emotions and OBE sensations are JSON arrays in TEXT columns** — these are display metadata, never queried as predicates. A junction table would add complexity for no gain.
- **`PRAGMA foreign_keys = ON`** and **`PRAGMA journal_mode = WAL`** are set in `beforeOpen` — drift does not enable foreign key enforcement by default.
- Built-in content (techniques, affirmations, etc.) is seeded via `BuiltInContentSeeder` using `insertOnConflictUpdate`, making it safe to re-run on upgrade.

### Navigation Structure

Uses `StatefulShellRoute.indexedStack` with 5 independent tab branches (each with its own `GlobalKey<NavigatorState>`):

| Tab | Root path |
|---|---|
| Today | `/today` → redirects to `/today/:date` |
| Dreams | `/journal/dreams` |
| OBE | `/journal/obe` |
| Explore | `/explore` |
| Calendar | `/calendar` |

**Modal creation routes** (new dream, new OBE, new rundown) are registered at the **root navigator level** (`parentNavigatorKey: rootNavigatorKey`) so they float above the bottom nav bar and can be triggered from any tab.

**Settings** is also root-level with `fullscreenDialog: true`.

**Calendar → detail navigation** pushes dream/OBE detail routes within the Calendar tab's own stack (`/calendar/:date/dreams/:dreamId`) to preserve the back-stack context.

All route names are constants in `AppRoutes`. Never use raw path strings in feature code.

### BLoC Architecture

**App-level singletons** (provided at root, never disposed):

| BLoC/Cubit | Responsibility |
|---|---|
| `AppBloc` | Init, theme, onboarding gate |
| `DreamJournalBloc` | Master dream list; other BLoCs listen to its stream |
| `CalendarBloc` | Month summary grid with in-memory cache |
| `SettingsBloc` | Preferences + notification scheduling |
| `NotificationCubit` | Plugin wrapper for `flutter_local_notifications` |

**Page-scoped** (created per navigation push, disposed on pop):

| BLoC/Cubit | Responsibility |
|---|---|
| `TodayBloc` | Today's rundown + today's dreams composite |
| `RundownCubit` | Rundown form draft state |
| `DreamEntryBloc` | Create/edit a single dream; calls `DreamJournalBloc.add()` on save |
| `DreamLinkCubit` | Entity search and dream link suggestions |
| `ObeLogBloc` | OBE session list |
| `ObeEntryBloc` | Create/edit a single OBE session |
| `ContentBloc` | Browse/filter content library |

**Cross-BLoC communication**: BLoCs never hold widget references. `TodayBloc` and `CalendarBloc` hold `StreamSubscription`s on `DreamJournalBloc.stream` to auto-refresh when a dream is saved. `DreamEntryBloc` calls `.add()` on `DreamJournalBloc` after a successful save. `SettingsBloc` calls methods directly on `NotificationCubit` (Cubit is command-style, not event-driven).

### Dependency Injection

- `AppDatabase` is a `@singleton` (one DB connection for WAL correctness).
- Repository implementations are `@Injectable(as: AbstractRepository)` — BLoCs depend on the interface.
- Page-scoped BLoCs use `@injectable` (factory); app-level BLoCs use `@singleton`.
- All BLoCs are provided via `MultiBlocProvider` at the appropriate scope (root for singletons, route builder for page-scoped).

## Content Library

Built-in content (OBE techniques, affirmations, meditations, visualizations) is defined in `lib/core/database/seeds/built_in_content_seeder.dart` and seeded on first install. Content type is stored as an integer: `0=technique, 1=affirmation, 2=meditation, 3=visualization, 4=breathwork`. The `ExploreCategory` enum in `app_routes.dart` maps slugs to these integers.
