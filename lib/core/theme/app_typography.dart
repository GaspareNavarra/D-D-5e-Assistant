/// Typography tokens.
///
/// PLACEHOLDER VALUE — `null` means "use the platform default font".
/// Once real design tokens land, set [fontFamily] (and add the font
/// files under a `fonts/` asset + `pubspec.yaml` entry if it's a custom
/// face); [AppTheme] already wires this into both light and dark themes,
/// so no other file needs to change.
abstract class AppTypography {
  static const String? fontFamily = null;
}
