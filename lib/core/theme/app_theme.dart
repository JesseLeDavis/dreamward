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

        textTheme: TextTheme(
          displayLarge: AppTypography.displayAmber,
          titleLarge: AppTypography.heading,
          titleMedium: AppTypography.body,
          bodyLarge: AppTypography.body,
          bodyMedium: AppTypography.bodyMuted,
          labelLarge: AppTypography.label,
          labelSmall: AppTypography.tag,
        ),

        // App bar — shares surface color, no separate device-housing tier.
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundBase,
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

        // Bottom navigation — same surface color, thin top hairline.
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColors.backgroundBase,
          surfaceTintColor: Colors.transparent,
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

        // Cards — soft pillow corners.
        cardTheme: const CardThemeData(
          color: AppColors.backgroundSurface,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            side: BorderSide(color: AppColors.borderNormal),
          ),
          surfaceTintColor: Colors.transparent,
        ),

        // Text inputs — inset well style with soft corners.
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.borderNormal,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.borderStrong),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.borderStrong),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.borderFocus, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.statusAlert),
          ),
          hintStyle: AppTypography.hint,
          labelStyle: AppTypography.label,
        ),

        iconTheme: const IconThemeData(
          color: AppColors.textSecondary,
          size: 18,
        ),

        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.amber,
            foregroundColor: AppColors.textInverse,
            textStyle: AppTypography.label,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.amber,
            textStyle: AppTypography.label,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            side: const BorderSide(color: AppColors.amber),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.amber,
            textStyle: AppTypography.label,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
        ),

        // Dialog defaults — rounded pillow on the same surface.
        dialogTheme: DialogThemeData(
          backgroundColor: AppColors.backgroundRaised,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.borderStrong),
          ),
          titleTextStyle: const TextStyle(
            color: AppColors.amber,
            fontSize: 11,
            letterSpacing: 2.2,
            fontWeight: FontWeight.w700,
          ),
          contentTextStyle: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 13,
            letterSpacing: 0.2,
            height: 1.55,
          ),
          barrierColor: AppColors.voidBlack,
        ),

        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColors.backgroundRaised,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: AppColors.borderStrong),
          ),
          contentTextStyle: const TextStyle(
            color: AppColors.amber,
            fontSize: 11,
            letterSpacing: 1.8,
            fontWeight: FontWeight.w400,
          ),
        ),

        splashFactory: NoSplash.splashFactory,
        highlightColor: AppColors.amberMuted.withAlpha(60),
      );
}
