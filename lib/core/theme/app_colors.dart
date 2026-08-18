import 'package:flutter/material.dart';

/// Color tokens for the app, as delivered by the Claude Design pass.
///
/// Two full palettes: **dark** is the default "at the table" theme
/// (ink-warm background, gold accent); **light** is the "pergamena"
/// (parchment) alternative (bordeaux accent). Values are exact hex from
/// the design brief — this is the only file that should need editing if
/// they change.
///
/// Nothing outside `core/theme/` should reference a raw [Color] from
/// here directly for anything semantic (role/status colors); use
/// [AppSemanticColors] via `Theme.of(context).extension<...>()` instead,
/// so light/dark stay in sync automatically.
abstract class AppColors {
  // --- Dark (default, "at the table") -----------------------------------
  static const Color darkBg = Color(0xFF17151B);
  static const Color darkSurface = Color(0xFF221F28);
  static const Color darkText = Color(0xFFECE5D7);

  /// General UI accent (primary buttons, active step, focus rings).
  static const Color darkAccent = Color(0xFFD8A95A);

  /// RoleBar / context tint when the current screen is Player-facing.
  static const Color darkPlayerRole = Color(0xFFB04A58);

  /// RoleBar / context tint when the current screen is DM-facing.
  static const Color darkDmRole = Color(0xFF9184D9);

  static const Color darkOk = Color(0xFF79B083);
  static const Color darkWarning = Color(0xFFD59B4A);

  /// HomebrewTag color. In dark mode this is the same value as the
  /// general accent — there's only one gold in this palette.
  static const Color darkGold = darkAccent;

  // --- Light ("pergamena") ------------------------------------------------
  static const Color lightBg = Color(0xFFEFE4CF);
  static const Color lightSurface = Color(0xFFFAF3E4);
  static const Color lightText = Color(0xFF26201A);

  /// General UI accent. Unlike dark mode, light mode's primary accent
  /// *is* bordeaux — so it also doubles as the Player-role tint below.
  static const Color lightAccent = Color(0xFF7B2233);

  /// RoleBar / context tint when the current screen is Player-facing.
  /// Same value as [lightAccent]: light mode has no separate Player hue.
  static const Color lightPlayerRole = lightAccent;

  /// RoleBar / context tint when the current screen is DM-facing.
  static const Color lightDmRole = Color(0xFF474584);

  static const Color lightOk = Color(0xFF3F6B45);
  static const Color lightWarning = Color(0xFF8A5A12);

  /// HomebrewTag color. Distinct from [lightAccent] — light mode has a
  /// separate oro that isn't the primary bordeaux accent.
  static const Color lightGold = Color(0xFF96681C);

  // --- Assembled Material 3 schemes --------------------------------------
  // M3 needs slots this brief doesn't specify (error, tertiary, outline,
  // ...); ColorScheme.fromSeed fills those in harmoniously, then the
  // tokens above override every slot the brief *does* pin down.
  static ColorScheme get lightScheme => ColorScheme.fromSeed(
    seedColor: lightAccent,
    brightness: Brightness.light,
  ).copyWith(surface: lightSurface, onSurface: lightText, primary: lightAccent, onPrimary: lightSurface);

  static ColorScheme get darkScheme => ColorScheme.fromSeed(
    seedColor: darkAccent,
    brightness: Brightness.dark,
  ).copyWith(surface: darkSurface, onSurface: darkText, primary: darkAccent, onPrimary: darkBg);

  /// Elevation in this design is never a shadow — see [AppSemanticColors]
  /// for the hairline-border + tinted-background recipe that replaces it.
  static Color elevatedSurface(Color base, Color textColor, {required double amount}) {
    return Color.alphaBlend(textColor.withValues(alpha: amount), base);
  }
}

/// Semantic tokens the base [ColorScheme] has no vocabulary for: the
/// Player/DM role tint, ok/warning/homebrew status colors, and the
/// hairline-elevation recipe ("bordo 1px a ~15% + sfondo mixato
/// nero/testo 6–28%", never a shadow).
///
/// Read via `Theme.of(context).extension<AppSemanticColors>()!`.
@immutable
class AppSemanticColors extends ThemeExtension<AppSemanticColors> {
  final Color background;
  final Color playerRole;
  final Color dmRole;
  final Color ok;
  final Color warning;
  final Color gold;
  final Color hairline;

  /// Background for a card/sheet raised one step off [background].
  final Color surfaceRaised1;

  /// Background for something raised two steps (e.g. a dialog over a
  /// card), when [surfaceRaised1] alone doesn't read as elevated enough.
  final Color surfaceRaised2;

  const AppSemanticColors({
    required this.background,
    required this.playerRole,
    required this.dmRole,
    required this.ok,
    required this.warning,
    required this.gold,
    required this.hairline,
    required this.surfaceRaised1,
    required this.surfaceRaised2,
  });

  factory AppSemanticColors.dark() {
    const text = AppColors.darkText;
    return AppSemanticColors(
      background: AppColors.darkBg,
      playerRole: AppColors.darkPlayerRole,
      dmRole: AppColors.darkDmRole,
      ok: AppColors.darkOk,
      warning: AppColors.darkWarning,
      gold: AppColors.darkGold,
      hairline: text.withValues(alpha: 0.15),
      surfaceRaised1: AppColors.darkSurface,
      surfaceRaised2: AppColors.elevatedSurface(AppColors.darkSurface, text, amount: 0.14),
    );
  }

  factory AppSemanticColors.light() {
    const text = AppColors.lightText;
    return AppSemanticColors(
      background: AppColors.lightBg,
      playerRole: AppColors.lightPlayerRole,
      dmRole: AppColors.lightDmRole,
      ok: AppColors.lightOk,
      warning: AppColors.lightWarning,
      gold: AppColors.lightGold,
      hairline: text.withValues(alpha: 0.15),
      surfaceRaised1: AppColors.lightSurface,
      surfaceRaised2: AppColors.elevatedSurface(AppColors.lightSurface, text, amount: 0.14),
    );
  }

  /// The role tint for [isDm]: [dmRole] or [playerRole].
  Color roleColor(bool isDm) => isDm ? dmRole : playerRole;

  @override
  AppSemanticColors copyWith({
    Color? background,
    Color? playerRole,
    Color? dmRole,
    Color? ok,
    Color? warning,
    Color? gold,
    Color? hairline,
    Color? surfaceRaised1,
    Color? surfaceRaised2,
  }) {
    return AppSemanticColors(
      background: background ?? this.background,
      playerRole: playerRole ?? this.playerRole,
      dmRole: dmRole ?? this.dmRole,
      ok: ok ?? this.ok,
      warning: warning ?? this.warning,
      gold: gold ?? this.gold,
      hairline: hairline ?? this.hairline,
      surfaceRaised1: surfaceRaised1 ?? this.surfaceRaised1,
      surfaceRaised2: surfaceRaised2 ?? this.surfaceRaised2,
    );
  }

  @override
  AppSemanticColors lerp(ThemeExtension<AppSemanticColors>? other, double t) {
    if (other is! AppSemanticColors) return this;
    return AppSemanticColors(
      background: Color.lerp(background, other.background, t)!,
      playerRole: Color.lerp(playerRole, other.playerRole, t)!,
      dmRole: Color.lerp(dmRole, other.dmRole, t)!,
      ok: Color.lerp(ok, other.ok, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      gold: Color.lerp(gold, other.gold, t)!,
      hairline: Color.lerp(hairline, other.hairline, t)!,
      surfaceRaised1: Color.lerp(surfaceRaised1, other.surfaceRaised1, t)!,
      surfaceRaised2: Color.lerp(surfaceRaised2, other.surfaceRaised2, t)!,
    );
  }
}
