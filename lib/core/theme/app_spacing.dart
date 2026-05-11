abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;

  /// Horizontal padding at screen edges
  static const double screenH = 18;

  /// Vertical padding at screen top/bottom
  static const double screenV = 16;

  /// Gap between major sections — needs to clear the neu pillow shadow
  /// blur (~14px), so card stacks don't visually crowd each other.
  static const double sectionGap = 24;

  /// Padding inside bordered cards / sections
  static const double cardPad = 12;

  /// Gap between sibling raised cards in a vertical list. Slightly tighter
  /// than sectionGap so list rhythm stays denser than section rhythm.
  static const double cardGap = 22;

  /// Standard border stroke
  static const double borderWidth = 1.0;

  /// Focused / strong border stroke
  static const double borderWidthFocus = 2.0;

  /// Height of a section header bar
  static const double sectionHeaderH = 36;

  /// Standard list row height
  static const double rowH = 44;

  /// Larger list row (dream / OBE entries)
  static const double rowHLg = 72;
}
