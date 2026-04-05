import 'package:flutter/material.dart';

abstract final class AppColors {
  // --- Backgrounds ---
  static const Color backgroundDeep    = Color(0xFF0E0F0B); // app bar / device housing
  static const Color backgroundBase    = Color(0xFF13140F); // scaffold
  static const Color backgroundSurface = Color(0xFF1A1C15); // cards, tiles
  static const Color backgroundRaised  = Color(0xFF21241A); // modals, elevated panels

  // --- Borders ---
  static const Color borderSubtle  = Color(0xFF2A2E21); // hairline dividers
  static const Color borderNormal  = Color(0xFF363B2A); // card borders
  static const Color borderStrong  = Color(0xFF4A5038); // section separators
  static const Color borderFocus   = Color(0xFFB8860B); // focused input

  // --- Amber accent (primary) ---
  static const Color amber      = Color(0xFFE8A020); // primary interactive / active
  static const Color amberDim   = Color(0xFFB87818); // pressed / inactive
  static const Color amberGlow  = Color(0xFFF5C050); // highlight / selected
  static const Color amberMuted = Color(0xFF3D2E08); // amber tint on surface

  // --- Green accent (secondary) ---
  static const Color green      = Color(0xFF7AB648); // success / "logged"
  static const Color greenDim   = Color(0xFF4E7430); // inactive green
  static const Color greenMuted = Color(0xFF1E2E12); // green tint on surface

  // --- Phosphor signal green (received data / onset / contact states) ---
  static const Color signalGreen      = Color(0xFF39FF14); // raw phosphor — use sparingly
  static const Color signalGreenDim   = Color(0xFF1A7A0A); // dimmed signal / inactive
  static const Color signalGreenMuted = Color(0xFF0D2A08); // tinted background

  // --- Void / atmospheric ---
  static const Color voidBlack    = Color(0xFF090A07); // deeper than backgroundDeep
  static const Color amberCarrier = Color(0xFF1A1208); // barely-there amber tint for section headers

  // --- Text ---
  static const Color textPrimary   = Color(0xFFD4C89A); // warm off-white
  static const Color textSecondary = Color(0xFF8A8468); // secondary info
  static const Color textMuted     = Color(0xFF545040); // hints / placeholders
  static const Color textInverse   = Color(0xFF0E0F0B); // text on amber fill

  // --- Status ---
  static const Color statusAlert   = Color(0xFFD45020); // nightmare / missed
  static const Color statusSleep   = Color(0xFF6070A8); // REM / sleep science only
  static const Color statusWarning = Color(0xFFE8A020); // same as amber

  // --- Dream type tag colors ---
  static const Color tagLucid      = Color(0xFFE8A020);
  static const Color tagNightmare  = Color(0xFFD45020);
  static const Color tagRecurring  = Color(0xFF9060C8);
  static const Color tagVivid      = Color(0xFF7AB648);
  static const Color tagFragmented = Color(0xFF545040);
}
