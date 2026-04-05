import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTypography {
  static TextStyle _mono({
    double fontSize = 13,
    FontWeight weight = FontWeight.w400,
    Color? color,
    double letterSpacing = 0.5,
    double? height,
  }) =>
      GoogleFonts.shareTechMono(
        fontSize: fontSize,
        fontWeight: weight,
        color: color ?? AppColors.textPrimary,
        letterSpacing: letterSpacing,
        height: height,
      );

  /// Large amber data readout — stat boxes, timestamps
  static TextStyle get displayAmber => _mono(
        fontSize: 20,
        color: AppColors.amber,
        letterSpacing: 0.5,
      );

  /// Screen heading — app bar titles, section names
  static TextStyle get heading => _mono(
        fontSize: 13,
        weight: FontWeight.w700,
        letterSpacing: 3.5,
      );

  /// Body text — dream entries, descriptions
  static TextStyle get body => _mono(fontSize: 14, letterSpacing: 0.3);

  /// Secondary / muted body text
  static TextStyle get bodyMuted => _mono(
        fontSize: 13,
        color: AppColors.textSecondary,
        letterSpacing: 0.3,
      );

  /// Uppercase data label — MOOD, ENERGY, SLEEP, etc.
  static TextStyle get label => _mono(
        fontSize: 11,
        letterSpacing: 2.2,
        color: AppColors.textSecondary,
      );

  /// Amber variant of label — active/selected labels
  static TextStyle get labelAmber => _mono(
        fontSize: 11,
        letterSpacing: 2.2,
        color: AppColors.amber,
      );

  /// Timestamps, meta info
  static TextStyle get timestamp => _mono(
        fontSize: 12,
        color: AppColors.textSecondary,
        letterSpacing: 0.2,
      );

  /// Bottom nav labels
  static TextStyle get navLabel => _mono(
        fontSize: 10,
        letterSpacing: 1.0,
        color: AppColors.textSecondary,
      );

  /// Tag chip text
  static TextStyle get tag => _mono(
        fontSize: 11,
        letterSpacing: 0.8,
      );

  /// Hint / placeholder text in fields
  static TextStyle get hint => _mono(
        fontSize: 13,
        color: AppColors.textMuted,
        letterSpacing: 0.3,
      );

  /// Received signal / data output — dream and OBE narrative content.
  /// Tighter tracking than body; implies the text came from somewhere else.
  static TextStyle get dataOutput => _mono(
        fontSize: 13,
        color: AppColors.textPrimary,
        letterSpacing: 0.1,
        height: 1.5,
      );

  /// Device voice — carrier status, transmission headers, instrument readouts.
  /// Rendered in dim signal green; the machine speaking, not the operator.
  static TextStyle get signalText => _mono(
        fontSize: 12,
        color: AppColors.signalGreenDim,
        letterSpacing: 0.3,
        height: 1.6,
      );
}
