/// Icon usage convention (enforced by callers, not by a wrapper widget):
/// every icon in the app is Phosphor, **regular** weight only —
/// `PhosphorIconsStyle.fill` is reserved for active/selected states, and
/// icons are never shown alone without a paired label/number.
abstract class AppIconSize {
  static const double dense = 16;
  static const double standard = 20;
  static const double prominent = 24;
}
