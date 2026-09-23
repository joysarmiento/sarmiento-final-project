import 'package:flutter/material.dart';

/// Story Shelf's design tokens, converted straight from the project's
/// Design System document: the color palette, the type scale, and the
/// spacing rule (4px base unit).
///
/// Widgets reference these constants directly (AppTheme.primary, etc.)
/// rather than Theme.of(context).colorScheme.xyz, because a couple of the
/// named roles here (surfaceVariant in particular) don't map cleanly to a
/// single stable ColorScheme field name across Flutter versions.
class AppTheme {
  AppTheme._();

  // --- Color palette (Design System, section A) -----------------------
  static const Color primary = Color(0xFF943B41); // buttons, active states
  static const Color onPrimary = Color(0xFFFFFFFF); // text/icons on primary
  static const Color secondary = Color(0xFF9DC3D8); // nav bar, chips, cards
  static const Color surface = Color(0xFFFBF9EC); // scaffold background
  static const Color surfaceVariant = Color(0xFFD8E4E4); // cards, fields
  static const Color onSurface = Color(0xFF66769A); // body text
  static const Color error = Color(0xFFB02D35); // headings, tags, destructive

  // --- Spacing rule (Design System, section C) -------------------------
  static const double spaceXs = 4;
  static const double spaceSm = 8;
  static const double spaceMd = 16;
  static const double spaceLg = 24; // screen edge padding
  static const double spaceListGap = 12; // between list items / cards
  static const double spaceSectionGap = 32; // between sections

  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: surface,
      colorScheme: const ColorScheme.light(
        primary: primary,
        onPrimary: onPrimary,
        secondary: secondary,
        surface: surface,
        onSurface: onSurface,
        error: error,
        onError: onPrimary,
      ),
      // Type scale (Design System, section B). Only 4 styles are defined,
      // so screens should stick to these four slots rather than reaching
      // for other TextTheme members.
      textTheme: const TextTheme(
        displayMedium: TextStyle(
          fontSize: 56,
          fontWeight: FontWeight.bold,
          color: primary,
        ),
        headlineSmall: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.bold,
          color: primary,
        ),
        bodyMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: onSurface,
        ),
        labelSmall: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: onSurface,
        ),
      ),
    );
  }
}
