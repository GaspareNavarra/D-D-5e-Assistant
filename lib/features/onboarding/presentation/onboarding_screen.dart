import 'package:flutter/material.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

import '../../../core/theme/theme.dart';
import '../../../core/widgets/widgets.dart';
import '../application/auth_feature_flags.dart';

/// Entry point of the app: pick how to sign in, or skip straight into
/// offline-first local use.
///
/// There's no auth backend yet — the email/password step below is a
/// local stand-in that just calls [onContinue] once both fields are
/// filled in, ready to be wired to a real one later. Google/Apple are
/// visible per [AuthFeatureFlags] but inert until that's worth the
/// developer-account cost (see that file).
class OnboardingScreen extends StatefulWidget {
  final VoidCallback onContinue;

  const OnboardingScreen({super.key, required this.onContinue});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool _showEmailForm = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _canSubmitEmail = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_recomputeCanSubmit);
    _passwordController.addListener(_recomputeCanSubmit);
  }

  void _recomputeCanSubmit() {
    final canSubmit = _emailController.text.trim().isNotEmpty && _passwordController.text.isNotEmpty;
    if (canSubmit != _canSubmitEmail) setState(() => _canSubmitEmail = canSubmit);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: AppSpacing.xxl),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: scheme.primary,
                      borderRadius: BorderRadius.circular(AppSpacing.sm),
                    ),
                    child: Icon(PhosphorIconsRegular.diceSix, color: scheme.onPrimary, size: 28),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text('D&D Assistant', style: textTheme.headlineMedium, textAlign: TextAlign.center),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Personaggi, incantesimi e campagne D&D 5e, sempre a portata di mano — anche offline.',
                    style: textTheme.bodyMedium?.copyWith(color: scheme.onSurface.withValues(alpha: 0.7)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  AnimatedSwitcher(
                    duration: Durations.short4,
                    child: _showEmailForm
                        ? _EmailForm(
                            key: const ValueKey('form'),
                            emailController: _emailController,
                            passwordController: _passwordController,
                            canSubmit: _canSubmitEmail,
                            onSubmit: widget.onContinue,
                            onBack: () => setState(() => _showEmailForm = false),
                          )
                        : _ChoiceButtons(
                            key: const ValueKey('choice'),
                            onEmail: () => setState(() => _showEmailForm = true),
                            onContinue: widget.onContinue,
                          ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    "Hai un codice campagna? Inseriscilo dopo l'accesso.",
                    style: textTheme.bodySmall?.copyWith(color: scheme.onSurface.withValues(alpha: 0.5)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChoiceButtons extends StatelessWidget {
  final VoidCallback onEmail;
  final VoidCallback onContinue;

  const _ChoiceButtons({super.key, required this.onEmail, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    final semantic = Theme.of(context).extension<AppSemanticColors>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppPrimaryButton(label: 'Continua con email', icon: PhosphorIconsRegular.envelopeSimple, onPressed: onEmail),
        const SizedBox(height: AppSpacing.sm),
        Tooltip(
          message: AuthFeatureFlags.enableGoogleSignIn ? '' : 'Non ancora disponibile in questa build.',
          child: AppSecondaryButton(
            label: 'Continua con Google',
            icon: PhosphorIconsRegular.googleLogo,
            onPressed: AuthFeatureFlags.enableGoogleSignIn ? () {} : null,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Tooltip(
          message: AuthFeatureFlags.enableAppleSignIn ? '' : 'Non ancora disponibile in questa build.',
          child: AppSecondaryButton(
            label: 'Continua con Apple',
            icon: PhosphorIconsRegular.appleLogo,
            onPressed: AuthFeatureFlags.enableAppleSignIn ? () {} : null,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Divider(color: semantic.hairline),
        const SizedBox(height: AppSpacing.lg),
        Center(
          child: AppTertiaryButton(
            label: 'Usa senza account',
            icon: PhosphorIconsRegular.cloudSlash,
            onPressed: onContinue,
          ),
        ),
      ],
    );
  }
}

class _EmailForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool canSubmit;
  final VoidCallback onSubmit;
  final VoidCallback onBack;

  const _EmailForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.canSubmit,
    required this.onSubmit,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        const SizedBox(height: AppSpacing.sm),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(labelText: 'Password'),
          onSubmitted: (_) {
            if (canSubmit) onSubmit();
          },
        ),
        const SizedBox(height: AppSpacing.md),
        AppPrimaryButton(label: 'Accedi', onPressed: canSubmit ? onSubmit : null),
        const SizedBox(height: AppSpacing.sm),
        Center(child: AppTertiaryButton(label: 'Indietro', onPressed: onBack)),
      ],
    );
  }
}
