import 'package:flutter/material.dart';

/// Source-of-truth color tokens. Aligned to the neumorphic surface system
/// (see neu_surface.dart) so that scaffold/cards/app bar share one base
/// color and depth comes from light/dark shadows, not flat fill tiers.
abstract final class AppColors {
  // --- Backgrounds ---
  // In the neu system everything is the same surface color; depth is
  // shadow-driven. These tiers are kept for backwards compatibility but
  // all point at the same color now.
  static const Color backgroundDeep    = Color(0xFF1B1E16);
  static const Color backgroundBase    = Color(0xFF1B1E16);
  static const Color backgroundSurface = Color(0xFF1B1E16);
  static const Color backgroundRaised  = Color(0xFF1B1E16);

  // --- Borders ---
  // Borders are now mostly invisible — shadows carry the work. These exist
  // for dividers and subtle hairlines only.
  static const Color borderSubtle  = Color(0xFF13150F); // hairline divider
  static const Color borderNormal  = Color(0xFF0E1009); // card edge
  static const Color borderStrong  = Color(0xFF06070A); // shadow-dark edge
  static const Color borderFocus   = Color(0xFFB8860B); // focused input

  // --- Amber accent (primary) ---
  static const Color amber      = Color(0xFFE8A020);
  static const Color amberDim   = Color(0xFFB87818);
  static const Color amberGlow  = Color(0xFFF5C050);
  static const Color amberMuted = Color(0xFF3D2E08);

  // --- Green accent (secondary) ---
  static const Color green      = Color(0xFF7AB648);
  static const Color greenDim   = Color(0xFF4E7430);
  static const Color greenMuted = Color(0xFF1E2E12);

  // --- Phosphor signal green (received data / onset / contact states) ---
  static const Color signalGreen      = Color(0xFF39FF14);
  static const Color signalGreenDim   = Color(0xFF1A7A0A);
  static const Color signalGreenMuted = Color(0xFF0D2A08);

  // --- Void / atmospheric ---
  static const Color voidBlack    = Color(0xFF06070A);
  static const Color amberCarrier = Color(0xFF1A1208);

  // --- Text ---
  static const Color textPrimary   = Color(0xFFD4C89A);
  static const Color textSecondary = Color(0xFF8A8468);
  static const Color textMuted     = Color(0xFF545040);
  static const Color textInverse   = Color(0xFF1B1E16);

  // --- Status ---
  static const Color statusAlert   = Color(0xFFD45020);
  static const Color statusSleep   = Color(0xFF6070A8);
  static const Color statusWarning = Color(0xFFE8A020);

  // --- Dream type tag colors ---
  static const Color tagLucid      = Color(0xFFE8A020);
  static const Color tagNightmare  = Color(0xFFD45020);
  static const Color tagRecurring  = Color(0xFF6070A8);
  static const Color tagVivid      = Color(0xFFF5C050);
  static const Color tagFragmented = Color(0xFF545040);
}
