/// Whether the Google/Apple sign-in buttons on the onboarding screen are
/// enabled. Both default to `false`: real OAuth sign-in needs a paid
/// developer account (Google Play Console / Apple Developer Program),
/// which this project explicitly avoids — see the project brief's "solo
/// pacchetti gratuiti, nessuna dipendenza che richieda registrazione a
/// pagamento". The buttons stay visible either way (never hidden), just
/// disabled with a tooltip, per "disattivabili via flag".
abstract class AuthFeatureFlags {
  static const bool enableGoogleSignIn = false;
  static const bool enableAppleSignIn = false;
}
