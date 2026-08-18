import 'package:flutter/material.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

import '../../../core/theme/theme.dart';
import '../../../core/widgets/widgets.dart';

/// Real (if minimal) landing screen for a device that has completed
/// onboarding: an empty local library of characters and campaigns,
/// with the entry points that'll open the character-creation wizard and
/// campaign-creation flow once those exist.
///
/// This is deliberately not the full [ResponsiveScaffold] shell yet —
/// Scheda/Grimorio/Card don't have anything to navigate to until the
/// character-creation and spellbook features are built, and a nav bar
/// with dead destinations would be worse than no nav bar.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('D&D Assistant'),
        actions: const [Padding(padding: EdgeInsets.only(right: AppSpacing.md), child: SyncBadge(state: SyncState.localOnly))],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _EmptyStateCard(
                  icon: PhosphorIconsRegular.userCircle,
                  title: 'Nessun personaggio ancora',
                  description: 'Crea il tuo primo personaggio con la creazione guidata.',
                  actionLabel: 'Crea personaggio',
                  onAction: () => _showComingSoon(context, 'La creazione guidata del personaggio'),
                ),
                const SizedBox(height: AppSpacing.md),
                _EmptyStateCard(
                  icon: PhosphorIconsRegular.usersThree,
                  title: 'Nessuna campagna ancora',
                  description: 'Crea una campagna locale, o unisciti a quella di un DM con un codice invito.',
                  actionLabel: 'Crea campagna',
                  onAction: () => _showComingSoon(context, 'La creazione di una campagna'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context, String what) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$what arriva a breve.')));
  }
}

class _EmptyStateCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String actionLabel;
  final VoidCallback onAction;

  const _EmptyStateCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.actionLabel,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: AppIconSize.prominent, color: scheme.onSurface.withValues(alpha: 0.6)),
            const SizedBox(height: AppSpacing.sm),
            Text(title, style: textTheme.titleMedium),
            const SizedBox(height: AppSpacing.xs),
            Text(description, style: textTheme.bodyMedium?.copyWith(color: scheme.onSurface.withValues(alpha: 0.7))),
            const SizedBox(height: AppSpacing.md),
            Align(alignment: Alignment.centerLeft, child: AppPrimaryButton(label: actionLabel, onPressed: onAction)),
          ],
        ),
      ),
    );
  }
}
