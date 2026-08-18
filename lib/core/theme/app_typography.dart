import 'package:flutter/material.dart';

/// Typography tokens.
///
/// Three families, three jobs — never mixed:
/// - [display] (Marcellus): headings, screen titles, and the *names* of
///   named things (characters, NPCs, spells, items). Narrative only —
///   never below 15px, never for a game number.
/// - [body] (IBM Plex Sans): body copy, labels, chips, buttons — the
///   general UI voice.
/// - [mono] (IBM Plex Mono): game numbers — ability scores, HP, AC,
///   saves, spell slots, dice — always via [numberStyle] so figures stay
///   tabular and columns of numbers line up.
///
/// All three ship as local assets (see pubspec.yaml) rather than through
/// the `google_fonts` package's runtime fetch, so the app reads fine
/// completely offline from first launch.
abstract class AppTypography {
  static const String display = 'Marcellus';
  static const String body = 'IBM Plex Sans';
  static const String mono = 'IBM Plex Mono';

  /// The one and only way game numbers should get a [TextStyle]: mono
  /// family + tabular figures baked in. Pick size/weight/color at the
  /// call site.
  static TextStyle numberStyle({double fontSize = 16, FontWeight fontWeight = FontWeight.w500, Color? color}) {
    return TextStyle(
      fontFamily: mono,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFeatures: const [FontFeature.tabularFigures()],
    );
  }

  /// Builds a full [TextTheme] for [scheme]: IBM Plex Sans everywhere by
  /// default, with the heading/title roles (screen titles + named-entity
  /// names, per the reference screens) switched to Marcellus.
  static TextTheme textTheme(ColorScheme scheme) {
    final base = Typography.material2021(platform: TargetPlatform.android).englishLike.merge(
      Typography.material2021(platform: TargetPlatform.android).black,
    );
    final sansBase = base.apply(fontFamily: body, bodyColor: scheme.onSurface, displayColor: scheme.onSurface);

    TextStyle? asDisplay(TextStyle? style) => style?.copyWith(fontFamily: display, color: scheme.onSurface);

    return sansBase.copyWith(
      displayLarge: asDisplay(sansBase.displayLarge),
      displayMedium: asDisplay(sansBase.displayMedium),
      displaySmall: asDisplay(sansBase.displaySmall),
      headlineLarge: asDisplay(sansBase.headlineLarge),
      headlineMedium: asDisplay(sansBase.headlineMedium),
      headlineSmall: asDisplay(sansBase.headlineSmall),
      titleLarge: asDisplay(sansBase.titleLarge),
      titleMedium: asDisplay(sansBase.titleMedium),
    );
  }
}
