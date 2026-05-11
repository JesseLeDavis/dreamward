import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_typography.dart';

abstract final class AppTheme {
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.backgroundBase,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.amber,
          onPrimary: AppColors.textInverse,
          secondary: AppColors.green,
          onSecondary: AppColors.textInverse,
          surface: AppColors.backgroundSurface,
          onSurface: AppColors.textPrimary,
          error: AppColors.statusAlert,
          onError: AppColors.textPrimary,
          outline: AppColors.borderNormal,
          outlineVariant: AppColors.borderSubtle,
        ),

        // Typography — all text inherits Share Tech Mono via textTheme
        textTheme: TextTheme(
          displayLarge: AppTypography.displayAmber,
          titleLarge: AppTypography.heading,
          titleMedium: AppTypography.body,
          bodyLarge: AppTypography.body,
          bodyMedium: AppTypography.bodyMuted,
          labelLarge: AppTypography.label,
          labelSmall: AppTypography.tag,
        ),

        // App bar
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundDeep,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: AppTypography.heading,
          centerTitle: false,
          toolbarHeight: 52,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
          ),
        ),

        // Bottom navigation bar — instrument housing style
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColors.backgroundDeep,
          surfaceTintColor: Colors.transparent,
          // Transparent indicator — active state shown via icon/label color only
          indicatorColor: Colors.transparent,
          indicatorShape: const RoundedRectangleBorder(),
          elevation: 0,
          height: 62,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: AppColors.amber, size: 18);
            }
            return const IconThemeData(color: AppColors.textMuted, size: 18);
          }),
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppTypography.navLabel.copyWith(
                color: AppColors.amber,
                letterSpacing: 1.5,
              );
            }
            return AppTypography.navLabel.copyWith(letterSpacing: 1.5);
          }),
        ),

        // Dividers
        dividerTheme: const DividerThemeData(
          color: AppColors.borderSubtle,
          thickness: 1,
          space: 0,
        ),

        // Cards
        cardTheme: const CardThemeData(
          color: AppColors.backgroundSurface,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: AppColors.borderNormal),
          ),
          surfaceTintColor: Colors.transparent,
        ),

        // Text inputs
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.backgroundSurface,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: AppColors.borderNormal),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: AppColors.borderNormal),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: AppColors.borderFocus, width: 2),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: AppColors.statusAlert),
          ),
          hintStyle: AppTypography.hint,
          labelStyle: AppTypography.label,
        ),

        // Icon defaults
        iconTheme: const IconThemeData(
          color: AppColors.textSecondary,
          size: 18,
        ),

        // Buttons — filled / elevated use amber
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.amber,
            foregroundColor: AppColors.textInverse,
            textStyle: AppTypography.label,
            shape: const RoundedRectangleBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.amber,
            textStyle: AppTypography.label,
            shape: const RoundedRectangleBorder(),
            side: const BorderSide(color: AppColors.amber),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.amber,
            textStyle: AppTypography.label,
            shape: const RoundedRectangleBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
        ),

        // Dialog defaults — square, void-black scrim, raised panel.
        // Bespoke chrome lives in TerminalDialog; this keeps stray
        // showDialog calls from looking like Material 3.
        dialogTheme: const DialogThemeData(
          backgroundColor: AppColors.backgroundRaised,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: AppColors.borderStrong),
          ),
          titleTextStyle: TextStyle(
            color: AppColors.amber,
            fontSize: 11,
            letterSpacing: 2.2,
            fontWeight: FontWeight.w700,
          ),
          contentTextStyle: TextStyle(
            color: AppColors.signalGreenDim,
            fontSize: 12,
            letterSpacing: 0.3,
            height: 1.6,
          ),
          barrierColor: AppColors.voidBlack,
        ),

        // SnackBar defaults — bordered strip, no rounded pill.
        // Real notifications go through TerminalToast.
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: AppColors.backgroundDeep,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: AppColors.borderStrong),
          ),
          contentTextStyle: TextStyle(
            color: AppColors.amber,
            fontSize: 11,
            letterSpacing: 1.8,
            fontWeight: FontWeight.w400,
          ),
        ),

        // No ripple — retro feel
        splashFactory: NoSplash.splashFactory,
        highlightColor: AppColors.amberMuted.withAlpha(60),
      );
}
