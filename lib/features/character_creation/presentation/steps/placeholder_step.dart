import 'package:flutter/material.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

import '../../../../core/theme/theme.dart';

/// Shared shell for wizard steps that aren't built yet (Incantesimi
/// depends on the spellbook feature/SRD import, Equipaggiamento on the
/// items catalog) — still navigable so the wizard doesn't dead-end, just
/// nothing to fill in yet.
class PlaceholderStep extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;

  const PlaceholderStep({super.key, required this.icon, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: scheme.onSurface.withValues(alpha: 0.4)),
            const SizedBox(height: AppSpacing.md),
            Text(title, style: textTheme.titleMedium, textAlign: TextAlign.center),
            const SizedBox(height: AppSpacing.xs),
            Text(
              message,
              style: textTheme.bodyMedium?.copyWith(color: scheme.onSurface.withValues(alpha: 0.6)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class SpellsPlaceholderStep extends StatelessWidget {
  const SpellsPlaceholderStep({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderStep(
      icon: PhosphorIconsRegular.magicWand,
      title: 'Incantesimi in arrivo',
      message: 'La scelta degli incantesimi arriverà con il grimorio. Per ora puoi proseguire e aggiungerli più avanti.',
    );
  }
}

class EquipmentPlaceholderStep extends StatelessWidget {
  const EquipmentPlaceholderStep({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderStep(
      icon: PhosphorIconsRegular.bagSimple,
      title: 'Equipaggiamento in arrivo',
      message: "L'inventario iniziale arriverà con il catalogo oggetti. Per ora puoi proseguire e aggiungerlo più avanti.",
    );
  }
}
