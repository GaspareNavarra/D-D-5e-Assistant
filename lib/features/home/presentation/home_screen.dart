import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

import '../../../core/services/catalog_providers.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgets/widgets.dart';
import '../../../data/repositories/character_repository.dart';

/// Real (if minimal) landing screen for a device that has completed
/// onboarding: the local library of characters (empty state until the
/// first one is saved) and campaigns (still a stub — campaign creation
/// isn't built yet).
///
/// Deliberately not the full [ResponsiveScaffold] shell yet —
/// Grimorio/Card don't have anything to navigate to until the spellbook
/// and cards features are built, and a nav bar with dead destinations
/// would be worse than no nav bar.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersAsync = ref.watch(charactersListProvider);

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
                charactersAsync.when(
                  data: (characters) => characters.isEmpty
                      ? _EmptyStateCard(
                          icon: PhosphorIconsRegular.userCircle,
                          title: 'Nessun personaggio ancora',
                          description: 'Crea il tuo primo personaggio con la creazione guidata.',
                          actionLabel: 'Crea personaggio',
                          onAction: () => context.go('/characters/new'),
                        )
                      : _CharacterList(characters: characters, onAddAnother: () => context.go('/characters/new')),
                  loading: () => const Padding(padding: EdgeInsets.all(AppSpacing.lg), child: LinearProgressIndicator()),
                  error: (e, _) => Text('Errore nel caricamento dei personaggi: $e'),
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

class _CharacterList extends StatelessWidget {
  final List<CharacterSummary> characters;
  final VoidCallback onAddAnother;

  const _CharacterList({required this.characters, required this.onAddAnother});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('I tuoi personaggi', style: textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            for (final c in characters)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                child: Row(
                  children: [
                    Icon(PhosphorIconsRegular.userCircle, size: AppIconSize.standard, color: scheme.primary),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(c.base.name, style: textTheme.bodyLarge),
                          Text(
                            '${c.raceName ?? '—'} · ${c.className ?? '—'} · Livello ${c.instance.level}',
                            style: textTheme.bodySmall?.copyWith(color: scheme.onSurface.withValues(alpha: 0.6)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: AppSpacing.sm),
            Align(alignment: Alignment.centerLeft, child: AppSecondaryButton(label: 'Nuovo personaggio', onPressed: onAddAnother)),
          ],
        ),
      ),
    );
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
