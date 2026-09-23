import 'package:flutter/material.dart';

/// Centralized theme definitions for the app.
///
/// Usage:
/// ```dart
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
///   themeMode: ThemeMode.system,
///   ...
/// )
/// ```
class AppTheme {
  AppTheme._();

  // ---------------------------------------------------------------------
  // Brand colors
  // ---------------------------------------------------------------------
  static const Color primary = Color(0xFF2E7D32);
  static const Color primaryDark = Color(0xFF1B5E20);
  static const Color primaryLight = Color(0xFF66BB6A);
  static const Color primaryContainerLight = Color(0xFFD9F0DB);
  static const Color primaryContainerDark = Color(0xFF1F4A22);

  // ---------------------------------------------------------------------
  // Light-mode neutrals
  // ---------------------------------------------------------------------
  static const Color background = Color(0xFFF7F9F7);
  static const Color surface = Colors.white;
  static const Color surfaceVariant = Color(0xFFEFF3EF);
  static const Color outline = Color(0xFFE1E6E1);
  static const Color divider = Color(0xFFE4E8E4);
  static const Color textPrimary = Color(0xFF172117);
  static const Color textSecondary = Color(0xFF667066);

  // ---------------------------------------------------------------------
  // Dark-mode neutrals
  // ---------------------------------------------------------------------
  static const Color backgroundDark = Color(0xFF10140F);
  static const Color surfaceDark = Color(0xFF1A211A);
  static const Color surfaceVariantDark = Color(0xFF242C24);
  static const Color outlineDark = Color(0xFF3A443A);
  static const Color textPrimaryDarkMode = Color(0xFFE7EDE7);
  static const Color textSecondaryDarkMode = Color(0xFFA6B2A6);

  // Shared shape constants so every component agrees on rounding.
  static const double _radiusSm = 10;
  static const double _radiusMd = 14;
  static const double _radiusLg = 18;
  static const double _fieldHeight = 52;

  static const String _fontFamily = 'Inter'; // declare in pubspec.yaml -> fonts:

  // ---------------------------------------------------------------------
  // Light theme
  // ---------------------------------------------------------------------
  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.light,
    ).copyWith(
      primary: primary,
      onPrimary: Colors.white,
      primaryContainer: primaryContainerLight,
      onPrimaryContainer: primaryDark,
      surface: surface,
      onSurface: textPrimary,
      surfaceContainerHighest: surfaceVariant,
      outline: outline,
      error: const Color(0xFFB3261E),
    );

    return _base(colorScheme, background, textPrimary, textSecondary, outline, divider);
  }

  // ---------------------------------------------------------------------
  // Dark theme
  // ---------------------------------------------------------------------
  static ThemeData get dark {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.dark,
    ).copyWith(
      primary: primaryLight,
      onPrimary: const Color(0xFF0B3512),
      primaryContainer: primaryContainerDark,
      onPrimaryContainer: primaryContainerLight,
      surface: surfaceDark,
      onSurface: textPrimaryDarkMode,
      surfaceContainerHighest: surfaceVariantDark,
      outline: outlineDark,
      error: const Color(0xFFF2B8B5),
    );

    return _base(
      colorScheme,
      backgroundDark,
      textPrimaryDarkMode,
      textSecondaryDarkMode,
      outlineDark,
      outlineDark,
    );
  }

  // ---------------------------------------------------------------------
  // Shared builder — keeps light/dark in lockstep so they never drift.
  // ---------------------------------------------------------------------
  static ThemeData _base(
    ColorScheme colorScheme,
    Color scaffoldBackground,
    Color onBackground,
    Color secondaryText,
    Color outlineColor,
    Color dividerColor,
  ) {
    final textTheme = _textTheme(onBackground, secondaryText);

    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackground,
      fontFamily: _fontFamily,
      textTheme: textTheme,
      splashFactory: InkSparkle.splashFactory,

      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldBackground,
        foregroundColor: onBackground,
        elevation: 0,
        scrolledUnderElevation: 1,
        surfaceTintColor: colorScheme.surface,
        centerTitle: false,
        titleTextStyle: textTheme.headlineSmall,
        iconTheme: IconThemeData(color: onBackground),
      ),

      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radiusLg),
          side: BorderSide(color: outlineColor),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledBackgroundColor: colorScheme.onSurface.withValues(alpha: 0.12),
          disabledForegroundColor: colorScheme.onSurface.withValues(alpha: 0.38),
          minimumSize: const Size(0, _fieldHeight),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radiusMd)),
          textStyle: textTheme.labelLarge,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primaryContainer,
          foregroundColor: colorScheme.onPrimaryContainer,
          elevation: 0,
          minimumSize: const Size(0, _fieldHeight),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radiusMd)),
          textStyle: textTheme.labelLarge,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          minimumSize: const Size(0, _fieldHeight),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          side: BorderSide(color: colorScheme.primary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radiusMd)),
          textStyle: textTheme.labelLarge,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          minimumSize: const Size(0, _fieldHeight),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radiusSm)),
          textStyle: textTheme.labelLarge,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: textTheme.bodyMedium?.copyWith(color: secondaryText),
        labelStyle: textTheme.bodyMedium?.copyWith(color: secondaryText),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_radiusMd),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_radiusMd),
          borderSide: BorderSide(color: outlineColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_radiusMd),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_radiusMd),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_radiusMd),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceContainerHighest,
        selectedColor: colorScheme.primaryContainer,
        labelStyle: textTheme.labelMedium,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radiusSm)),
        side: BorderSide.none,
      ),

      dividerTheme: DividerThemeData(
        color: dividerColor,
        thickness: 1,
        space: 1,
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.onInverseSurface),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radiusSm)),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radiusLg)),
        titleTextStyle: textTheme.titleLarge,
        contentTextStyle: textTheme.bodyMedium,
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(_radiusLg)),
        ),
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        indicatorColor: colorScheme.primaryContainer,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return textTheme.labelSmall?.copyWith(
            fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
            color: selected ? colorScheme.onSurface : secondaryText,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? colorScheme.onPrimaryContainer : secondaryText,
          );
        }),
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearTrackColor: colorScheme.primaryContainer,
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected) ? colorScheme.primary : null,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) =>
              states.contains(WidgetState.selected) ? colorScheme.primaryContainer : null,
        ),
      ),
    );
  }

  static TextTheme _textTheme(Color primaryText, Color secondaryText) {
    return TextTheme(
      headlineSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: primaryText,
        height: 1.25,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: primaryText,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: primaryText,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: primaryText,
        height: 1.4,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: primaryText,
        height: 1.4,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: secondaryText,
      ),
      labelLarge: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: primaryText,
      ),
      labelSmall: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}