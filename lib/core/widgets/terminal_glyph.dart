import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

/// A monospace Unicode glyph rendered as a Text widget — replaces Material
/// `Icon`s across the app so the visual language stays on the field-gear grid
/// (square, sharp, drawn on the same letterforms as the rest of the UI)
/// instead of Google's rounded outlined system.
class TerminalGlyph extends StatelessWidget {
  const TerminalGlyph(
    this.glyph, {
    super.key,
    this.size = 14,
    this.color,
    this.weight = FontWeight.w400,
  });

  final String glyph;
  final double size;
  final Color? color;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.textSecondary;
    return SizedBox(
      width: size + 4,
      height: size + 4,
      child: Center(
        child: Text(
          glyph,
          style: GoogleFonts.shareTechMono(
            fontSize: size,
            color: c,
            fontWeight: weight,
            height: 1.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

/// Centralised glyph constants. One place to retune the visual grammar.
abstract final class Glyphs {
  // Operations
  static const String add = '+';
  static const String close = '×';
  static const String check = '✓';
  static const String edit = '▤';
  static const String delete = '⊠';
  static const String lock = '⌬';
  static const String search = '⌕';
  static const String chevronLeft = '‹';
  static const String chevronRight = '›';
  static const String help = '?';
  static const String settings = '※';

  // Favorites / state
  static const String starFilled = '●';
  static const String starEmpty = '○';

  // Field markers
  static const String calendar = '▦';
  static const String tag = '▣';
  static const String character = '◉';
  static const String bolt = '↯'; // lucid / onset

  // Content categories
  static const String techniques = '◈';
  static const String quote = '❝';
  static const String meditate = '⊛';
  static const String visualize = '⊙';
  static const String breath = '≋';

  // Tab bar
  static const String tabToday = '☼';
  static const String tabDreams = '◐';
  static const String tabObe = '◌';
  static const String tabObeActive = '◉';
  static const String tabLog = '▦';
}
