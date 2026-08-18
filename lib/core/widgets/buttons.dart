import 'package:flutter/material.dart';

import '../theme/theme.dart';

double _buttonHeight(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  return width < AppDimens.breakpointCompact ? AppDimens.buttonHeightMobile : AppDimens.buttonHeightDesktop;
}

Widget _labelWithIcon(String label, IconData? icon) {
  if (icon == null) return Text(label);
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [Icon(icon, size: AppIconSize.dense), const SizedBox(width: AppSpacing.xs), Text(label)],
  );
}

/// Primary action: outline on the accent color — never filled, never a
/// gradient. Height is 40 on phone widths, 36 from tablet up.
class AppPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  const AppPrimaryButton({super.key, required this.label, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: _buttonHeight(context),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: scheme.primary, width: 1.5),
          foregroundColor: scheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        ),
        child: _labelWithIcon(label, icon),
      ),
    );
  }
}

/// Secondary action: outline on the neutral hairline color (the theme's
/// default [OutlinedButtonThemeData]).
class AppSecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  const AppSecondaryButton({super.key, required this.label, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _buttonHeight(context),
      child: OutlinedButton(onPressed: onPressed, child: _labelWithIcon(label, icon)),
    );
  }
}

/// Tertiary action: plain colored text, no border.
class AppTertiaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  const AppTertiaryButton({super.key, required this.label, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _buttonHeight(context),
      child: TextButton(onPressed: onPressed, child: _labelWithIcon(label, icon)),
    );
  }
}
