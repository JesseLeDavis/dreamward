/// Named route constants. All navigation uses these names — never raw path strings.
abstract final class AppRoutes {
  // --- Top-level ---
  static const splash = 'splash';
  static const onboarding = 'onboarding';

  // --- Today / Rundown tab ---
  static const today = 'today';
  static const todayRundown = 'today-rundown'; // /today/:date
  static const rundownEdit = 'rundown-edit'; // /today/:date/edit
  static const rundownNew = 'rundown-new'; // modal: /today/:date/new

  // --- Dreams tab ---
  static const dreams = 'dreams';
  static const dreamNew = 'dream-new'; // modal: /journal/dreams/new
  static const dreamDetail = 'dream-detail'; // /journal/dreams/:dreamId
  static const dreamEdit = 'dream-edit'; // /journal/dreams/:dreamId/edit
  static const dreamLinks = 'dream-links'; // /journal/dreams/:dreamId/links
  static const dreamLinkSearch =
      'dream-link-search'; // modal: /journal/dreams/:dreamId/links/search
  static const characterNew = 'character-new'; // modal: /journal/characters/new

  // --- OBE tab ---
  static const obe = 'obe';
  static const obeNew = 'obe-new'; // modal: /journal/obe/new
  static const obeDetail = 'obe-detail'; // /journal/obe/:obeId
  static const obeEdit = 'obe-edit'; // /journal/obe/:obeId/edit

  // --- Explore / Content tab ---
  static const explore = 'explore';
  static const exploreCategory = 'explore-category'; // /explore/:category
  static const contentItem = 'content-item'; // /explore/:category/:itemId

  // --- Calendar tab ---
  static const calendarMonth = 'calendar-month';
  static const calendarDay = 'calendar-day'; // /calendar/:date
  static const calendarDreamDetail =
      'calendar-dream-detail'; // /calendar/:date/dreams/:dreamId
  static const calendarObeDetail =
      'calendar-obe-detail'; // /calendar/:date/obe/:obeId

  // --- Settings (root-level, above shell) ---
  static const settings = 'settings';
  static const settingsNotifications = 'settings-notifications';
  static const fieldGuide = 'field-guide';
}

/// Explore section categories. Slugs are used as route path parameters.
enum ExploreCategory {
  techniques(slug: 'techniques', label: 'OBE Techniques', contentType: 0),
  affirmations(slug: 'affirmations', label: 'Affirmations', contentType: 1),
  meditations(slug: 'meditations', label: 'Meditations', contentType: 2),
  visualizations(
      slug: 'visualizations', label: 'Visualizations', contentType: 3),
  breathwork(slug: 'breathwork', label: 'Breathwork', contentType: 4);

  const ExploreCategory(
      {required this.slug,
      required this.label,
      required this.contentType});

  final String slug;
  final String label;

  /// Maps to ContentType int stored in the database.
  final int contentType;

  static ExploreCategory? fromSlug(String slug) {
    for (final cat in values) {
      if (cat.slug == slug) return cat;
    }
    return null;
  }
}
