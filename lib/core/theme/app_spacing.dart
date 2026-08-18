/// Spacing scale (logical pixels), 8pt-ish. Generic layout gaps/padding —
/// for named component dimensions (button height, hairline width, ...)
/// see [AppDimens] below.
abstract class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
}

/// Named component dimensions from the design brief. Kept separate from
/// [AppSpacing] because these aren't a scale — they're specific values
/// tied to a specific component.
abstract class AppDimens {
  /// Primary/secondary button height on phone-width layouts (<600px).
  static const double buttonHeightMobile = 40;

  /// Primary/secondary button height at >=600px (tablet/desktop).
  static const double buttonHeightDesktop = 36;

  /// Width of the [RoleBar] strip at the top of role-scoped screens/cards.
  static const double roleBarHeight = 3;

  /// Hairline border width used everywhere elevation would otherwise be a
  /// shadow (cards, app bars, raised surfaces).
  static const double hairlineWidth = 1;

  /// Visual size of a [SpellSlotPip] diamond.
  static const double spellSlotPipSize = 15;

  /// Minimum hit-test target for any small control (spell slot pips
  /// included) even when the visible mark is smaller.
  static const double minTapTarget = 44;

  /// Border width on a print-ready card (PrintCardWidget) — bold enough
  /// to survive a cheap laser printer and read in grayscale.
  static const double printCardBorderWidth = 2;

  /// Physical size of a generated spell/item card: poker card format.
  static const double printCardWidthMm = 63;
  static const double printCardHeightMm = 88;

  /// Responsive breakpoints shared by [ResponsiveScaffold] and any screen
  /// that needs to branch layout without going through it.
  static const double breakpointCompact = 600;
  static const double breakpointMedium = 1100;
}
